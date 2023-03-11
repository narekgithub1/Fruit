<?php
if(!defined('BASEPATH')) exit('No direct script access allowed');

class My_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }
    

    function select($table, $select = array(), $where = array(), $limit = FALSE) {
        if (!empty($select)) {
            $this->db->select($select);
        }
        $query = $this->db->get_where($table, $where, $limit);
        $result = $query->result_array();
        return $result;
    }

    function insert($table, $date) {

        $this->db->insert($table, $date);
        return $this->db->insert_id();
    }

    function update($table, $date, $where) {
        $this->db->where($where);
        $this->db->update($table, $date);
        return TRUE;
    }

    function get_query($sql){
        $query = $this->db->query($sql);
        $array = $query->result_array();
        return $array;
    }
    function delete($table, $where) {
        $this->db->delete($table, $where);
        return TRUE;
    }
}