<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Main extends CI_Controller
{
	function __construct()
	{
		parent::__construct();
		$this->load->model('My_model');
        $this->load->library('pagination');
		$this->load->library('email');

	}

	public function index($page=0)
	{
		$where = ' 1 ';
		if(isset($_GET['key']) AND !empty($_GET['key'])){
			$where .= ' AND (name LIKE "%'.$_GET['key'].'%" OR family LIKE "%'.$_GET['key'].'%") ';
		}
		if(isset($_GET['only_favourites']) AND $_GET['only_favourites']==1){
			$where .= ' AND favourite=1 ';
		}
		$this->info = $this->My_model->select('fruits', false, []);
		$this->info = $this->My_model->get_query('SELECT SQL_CALC_FOUND_ROWS * FROM fruits  WHERE '.$where.' ORDER BY id ASC LIMIT '.$page.',10');
		$this->total = $this->My_model->get_query('SELECT FOUND_ROWS() as total')[0]['total'];
		$this->nutritions_sum = $this->My_model->get_query('SELECT SUM(carbohydrates) AS carbohydrates, SUM(protein) AS protein, SUM(fat) AS fat, SUM(calories) AS calories, SUM(sugar) AS sugar FROM `fruit_nutritions`')[0];
		$config['base_url'] = base_url().'main/index';
		$config['total_rows'] = $this->total;
		$config['per_page'] = 10;
		$config['uri_segment'] = 3;
		$this->pagination->initialize($config);
		$this->load->view('main/index');
	}

	public function get_products()
	{
		$curl = curl_init();
		curl_setopt_array($curl, array(
			CURLOPT_URL => 'https://fruityvice.com/api/fruit/all',
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => '',
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 0,
			CURLOPT_FOLLOWLOCATION => true,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => 'GET',
		));

		$response = curl_exec($curl);
		curl_close($curl);

		$data = json_decode($response, true);
		$email_text = '';
		foreach($data as $key){
			$fruit_insert = array(
				'id'=>$key['id'],
				'name'=>$key['name'],
				'genus'=>$key['genus'],
				'family'=>$key['family'],
				'order'=>$key['order'],
			);
			$fruit_id = $key['id'];
			$info = $this->My_model->select('fruits', false, array('id'=>$fruit_id));
			if(empty($info)){
				$fruit_id = $this->My_model->insert('fruits', $fruit_insert);
				$email_text .= $fruit_insert['name'].' added to dabtabase <br>';
			}else{
				$this->My_model->update('fruits', $fruit_insert, array('id'=>$fruit_id));
			}
			$nutritions = $key['nutritions'];
			$nutritions['fruit_id'] = $fruit_id;
			$nutritions_info = $this->My_model->select('fruit_nutritions', false, array('fruit_id'=>$fruit_id));
			if(empty($nutritions_info)){
				$this->My_model->insert('fruit_nutritions', $nutritions);
			}else{
				$this->My_model->update('fruit_nutritions', $nutritions, array('fruit_id'=>$fruit_id));
			}
			
		}
		$this->send_mail('test@gmail.com', $email_text);
		header('Location:'.base_url());
	}

	function changeFavourite(){
		if(!isset($_POST['fruit_id']) OR !isset($_POST['favourite'])){
			echo 0;
			exit;
		}
		if($_POST['favourite']==1){
			$totalFavouriteCount = $this->My_model->get_query('SELECT count(1) AS totalCount FROM fruits WHERE favourite=1');
			if(!empty($totalFavouriteCount)){
				if($totalFavouriteCount[0]['totalCount']>=10){
					echo 2;
					exit;
				}
			}
		}
		$this->My_model->update('fruits', array('favourite'=>$_POST['favourite']), array('id'=>$_POST['fruit_id']));
		echo 1;
	}
	public function remove_products(){
		$this->My_model->delete('fruits', 'id>0');
		$this->My_model->delete('fruit_nutritions', 'id>0');
		header('Location:'.base_url());
	}

	function send_mail($to,$message, $subject ='Fruits test project') {
		$config = Array(
			'protocol'  => 'smtp',
			'smtp_host' => 'ssl://smtp.googlemail.com',
			'smtp_port' => 465,
			'smtp_user' => 'getaccessto33@gmail.com',
			'smtp_pass' => 'etstaccount2018',
			'mailtype'  => 'html', 
			'charset'   => 'iso-8859-1'
		);
		$this->load->library('email',$config);
		$this->email->set_newline("\r\n");
	
		$this->email->from($config['smtp_user'],"Your name");
		$this->email->to($to);
		$this->email->subject($subject);  
		$this->email->message($message);
		$result = $this->email->send();
		return $result;
	}
}
