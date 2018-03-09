-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 09, 2018 at 11:47 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr11_atra_naseri_php_car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `manufacture` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_id`, `manufacture`, `model`, `color`) VALUES
(1, 'FIAT', 'TIPO EASY SEDUN 2016', 'ONYX BROWNLIGHT'),
(2, 'FORD', 'EXPEDITION LIMITED EL SUV 2014', 'white'),
(3, 'HYUNDAI', 'VELOSTER TURBE HATCHBACK 2015', 'dark grey'),
(4, 'HYUNDAI', 'SANTAFE SPORT SUV2013', 'navy blue'),
(5, 'HONDA', 'CIVIC LX COUPE 2016', 'black'),
(6, 'HONDA', 'CR_V EX SUV 2010', 'red'),
(7, 'KIA', 'SOUL HATCHBACK2014', 'teal'),
(8, 'KIA', 'K900 SEDON 2015', 'satin Aluminum'),
(9, 'MAZDA', 'CX_3 GRAUND TOARING SUV 2017', 'white'),
(10, 'MAZDA', 'MAZDAS ACTIVE WAGEN 2014', 'black'),
(11, 'NISSAN', '3702 NISMO COUPE 2013', 'burgundy'),
(12, 'BMW', '2_SERIES 228I CONVERTIBLE 2015', 'intenseblue');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `fk_offices_id` int(11) NOT NULL,
  `fk_car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `fk_offices_id`, `fk_car_id`) VALUES
(1, 1, 1),
(2, 1, 6),
(3, 1, 7),
(4, 1, 8),
(5, 1, 9),
(6, 2, 2),
(7, 2, 9),
(8, 2, 10),
(9, 2, 11),
(10, 2, 12),
(11, 2, 1),
(12, 3, 3),
(13, 3, 2),
(14, 3, 4),
(15, 4, 4),
(16, 4, 12),
(17, 4, 11),
(18, 5, 8),
(19, 5, 5),
(20, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `offices_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `code` int(11) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offices`
--

INSERT INTO `offices` (`offices_id`, `name`, `address`, `code`, `fk_location_id`) VALUES
(1, 'Great Deal Rental Car', 'Himmelstrasse56/1190 Wien', 1190, NULL),
(2, 'Great Deal Rental Car', 'Haberlandtgasse72/1220 Wien ', 1220, NULL),
(3, 'Great Deal Rental Car', 'Laxenburgstrasse100/ 1100 Wien', 1100, NULL),
(4, 'Great Deal Rental Car', 'Sant-veit-gasse 67/1130 Wien', 1130, NULL),
(5, 'Great Deal Rental Car', 'Wallgasee13/1060 Wien', 1060, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usermanagement`
--

CREATE TABLE `usermanagement` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usermanagement`
--

INSERT INTO `usermanagement` (`id`, `username`, `email`, `password`, `active`) VALUES
(1, 'blabla', 'blabla', 'password', 0),
(2, 'asdasdas', 'atra.naseri@yahoo.com', '123456', 0),
(4, 'eded', 'wdw@ede.er', '123123', 0),
(5, 'refe', 'wed@cec.efef', 'efefe', 0),
(9, 'ati', 'atra.naseri@gmail.com', '123456', 0),
(10, 'sara', 'sara@yahoo.com', '79737ac46dad121166483e084a0727e5d6769fb47fa9b0b627eba4107e696078', 0),
(11, 'atra', 'mehdi@yahoo.com', '2a8610aefdd0028c6bf074dd18721c0ef8bc43241cc7a653d7aedf2036bdf6b3', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_offices_id` (`fk_offices_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`offices_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `usermanagement`
--
ALTER TABLE `usermanagement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `offices_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usermanagement`
--
ALTER TABLE `usermanagement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_offices_id`) REFERENCES `offices` (`offices_id`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `car` (`car_id`);

--
-- Constraints for table `offices`
--
ALTER TABLE `offices`
  ADD CONSTRAINT `offices_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
