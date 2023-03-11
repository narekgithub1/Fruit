-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 11 2023 г., 08:07
-- Версия сервера: 5.7.24
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `fruits`
--

-- --------------------------------------------------------

--
-- Структура таблицы `fruits`
--

DROP TABLE IF EXISTS `fruits`;
CREATE TABLE IF NOT EXISTS `fruits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `genus` varchar(1000) NOT NULL,
  `family` varchar(1000) NOT NULL,
  `order` varchar(1000) NOT NULL,
  `favourite` int(11) NOT NULL,
  `insert_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fruits`
--

INSERT INTO `fruits` (`id`, `name`, `genus`, `family`, `order`, `favourite`, `insert_date`) VALUES
(1, 'Banana', 'Musa', 'Musaceae', 'Zingiberales', 0, 0),
(2, 'Orange', 'Citrus', 'Rutaceae', 'Sapindales', 1, 0),
(3, 'Strawberry', 'Fragaria', 'Rosaceae', 'Rosales', 1, 0),
(4, 'Pear', 'Pyrus', 'Rosaceae', 'Rosales', 0, 0),
(5, 'Tomato', 'Solanum', 'Solanaceae', 'Solanales', 0, 0),
(6, 'Apple', 'Malus', 'Rosaceae', 'Rosales', 0, 0),
(9, 'Cherry', 'Prunus', 'Rosaceae', 'Rosales', 0, 0),
(10, 'Pineapple', 'Ananas', 'Bromeliaceae', 'Poales', 0, 0),
(23, 'Raspberry', 'Rubus', 'Rosaceae', 'Rosales', 0, 0),
(25, 'Watermelon', 'Citrullus', 'Cucurbitaceae', 'Cucurbitales', 0, 0),
(26, 'Lemon', 'Citrus', 'Rutaceae', 'Sapindales', 0, 0),
(27, 'Mango', 'Mangifera', 'Anacardiaceae', 'Sapindales', 0, 0),
(33, 'Blueberry', 'Fragaria', 'Rosaceae', 'Rosales', 0, 0),
(35, 'Apricot', 'Prunus', 'Rosaceae', 'Rosales', 0, 0),
(37, 'Guava', 'Psidium', 'Myrtaceae', 'Myrtales', 0, 0),
(41, 'Melon', 'Cucumis', 'Cucurbitaceae', 'Cucurbitaceae', 0, 0),
(42, 'Papaya', 'Carica', 'Caricaceae', 'Caricacea', 0, 0),
(44, 'Lime', 'Citrus', 'Rutaceae', 'Sapindales', 0, 0),
(52, 'Persimmon', 'Diospyros', 'Ebenaceae', 'Rosales', 0, 0),
(60, 'Durian', 'Durio', 'Malvaceae', 'Malvales', 0, 0),
(64, 'Blackberry', 'Rubus', 'Rosaceae', 'Rosales', 0, 0),
(65, 'Lingonberry', 'Vaccinium', 'Ericaceae', 'Ericales', 0, 0),
(66, 'Kiwi', 'Apteryx', 'Actinidiaceae', 'Struthioniformes', 0, 0),
(67, 'Lychee', 'Litchi', 'Sapindaceae', 'Sapindales', 0, 0),
(68, 'Fig', 'Ficus', 'Moraceae', 'Rosales', 0, 0),
(69, 'Gooseberry', 'Ribes', 'Grossulariaceae', 'Saxifragales', 0, 0),
(70, 'Passionfruit', 'Passiflora', 'Passifloraceae', 'Malpighiales', 0, 0),
(71, 'Plum', 'Prunus', 'Rosaceae', 'Rosales', 0, 0),
(72, 'GreenApple', 'Malus', 'Rosaceae', 'Rosales', 0, 0),
(76, 'Feijoa', 'Sellowiana', 'Myrtaceae', 'Myrtoideae', 0, 0),
(77, 'Tangerine', 'Citrus', 'Rutaceae', 'Sapindales', 0, 0),
(78, 'Pitahaya', 'Cactaceae', 'Cactaceae', 'Caryophyllales', 0, 0),
(79, 'Pomegranate', 'Punica', 'Lythraceae', 'Myrtales', 0, 0),
(80, 'Dragonfruit', 'Selenicereus', 'Cactaceae', 'Caryophyllales', 0, 0),
(81, 'Grape', 'Vitis', 'Vitaceae', 'Vitales', 0, 0),
(82, 'Morus', 'Morus', 'Moraceae', 'Rosales', 0, 0),
(84, 'Avocado', 'Persea', 'Lauraceae', 'Laurales', 0, 0),
(85, 'Kiwifruit', 'Actinidia', 'Actinidiaceae', 'Ericales', 0, 0),
(86, 'Peach', 'Prunus', 'Rosaceae', 'Rosales', 0, 0),
(87, 'Cranberry', 'Vaccinium', 'Ericaceae', 'Ericales', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `fruit_nutritions`
--

DROP TABLE IF EXISTS `fruit_nutritions`;
CREATE TABLE IF NOT EXISTS `fruit_nutritions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fruit_id` int(11) NOT NULL,
  `carbohydrates` float NOT NULL,
  `protein` float NOT NULL,
  `fat` float NOT NULL,
  `calories` float NOT NULL,
  `sugar` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `fruit_nutritions`
--

INSERT INTO `fruit_nutritions` (`id`, `fruit_id`, `carbohydrates`, `protein`, `fat`, `calories`, `sugar`) VALUES
(41, 6, 11.4, 0.3, 0.4, 52, 10.3),
(42, 35, 3.9, 0.5, 0.1, 15, 3.2),
(43, 84, 8.53, 2, 14.66, 160, 0.66),
(44, 1, 22, 1, 0.2, 96, 17.2),
(45, 64, 9, 1.3, 0.4, 40, 4.5),
(46, 33, 5.5, 0, 0.4, 29, 5.4),
(47, 9, 12, 1, 0.3, 50, 8),
(48, 87, 12.2, 0.4, 0.1, 46, 4),
(49, 80, 9, 9, 1.5, 60, 8),
(50, 60, 27.1, 1.5, 5.3, 147, 6.75),
(51, 76, 8, 0.6, 0.4, 44, 3),
(52, 68, 19, 0.8, 0.3, 74, 16),
(53, 69, 10, 0.9, 0.6, 44, 0),
(54, 81, 18.1, 0.72, 0.16, 69, 16),
(55, 72, 3.1, 0.4, 0.1, 21, 6.4),
(56, 37, 14, 2.6, 1, 68, 9),
(57, 66, 15, 1.1, 0.5, 61, 9),
(58, 85, 14.6, 1.14, 0.5, 61, 8.9),
(59, 26, 9, 1.1, 0.3, 29, 2.5),
(60, 44, 8.4, 0.3, 0.1, 25, 1.7),
(61, 65, 11.3, 0.75, 0.34, 50, 5.74),
(62, 67, 17, 0.8, 0.44, 66, 15),
(63, 27, 15, 0.82, 0.38, 60, 13.7),
(64, 41, 8, 0, 0, 34, 8),
(65, 82, 9.8, 1.44, 0.39, 43, 8.1),
(66, 2, 8.3, 1, 0.2, 43, 8.2),
(67, 42, 11, 0, 0.4, 43, 1),
(68, 70, 22.4, 2.2, 0.7, 97, 11.2),
(69, 86, 9.5, 0.9, 0.25, 39, 8.4),
(70, 4, 15, 0.4, 0.1, 57, 10),
(71, 52, 18, 0, 0, 81, 18),
(72, 10, 13.12, 0.54, 0.12, 50, 9.85),
(73, 78, 7, 1, 0.4, 36, 3),
(74, 71, 11.4, 0.7, 0.28, 46, 9.92),
(75, 79, 18.7, 1.7, 1.2, 83, 13.7),
(76, 23, 12, 1.2, 0.7, 53, 4.4),
(77, 3, 5.5, 0.8, 0.4, 29, 5.4),
(78, 77, 8.3, 0, 0.4, 45, 9.1),
(79, 5, 3.9, 0.9, 0.2, 74, 2.6),
(80, 25, 8, 0.6, 0.2, 30, 6);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
