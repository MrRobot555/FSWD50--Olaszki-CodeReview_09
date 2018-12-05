-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2018 at 06:03 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--
CREATE DATABASE IF NOT EXISTS `car_rental` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `car_rental`;

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `number_plate` varchar(15) NOT NULL,
  `category` tinyint(4) NOT NULL,
  `fleet_manager` varchar(30) NOT NULL,
  `car_type` smallint(6) NOT NULL,
  `color` varchar(10) NOT NULL,
  `year_of_production` smallint(6) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `reservation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `car_types`
--

CREATE TABLE `car_types` (
  `car_type_id` smallint(11) NOT NULL,
  `manufacturer` varchar(30) NOT NULL,
  `model` varchar(30) NOT NULL,
  `cabrio` tinyint(1) NOT NULL,
  `number_of_doors` tinyint(4) NOT NULL,
  `number_of_pass` tinyint(4) NOT NULL,
  `weight` smallint(6) NOT NULL,
  `manual_trans` tinyint(1) NOT NULL,
  `horsepower` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `zip` varchar(10) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `email_address` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `street` varchar(30) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `birthday` date NOT NULL,
  `sex` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_credit_card`
--

CREATE TABLE `client_credit_card` (
  `credit_card_number` varchar(255) NOT NULL,
  `CCV` varchar(255) NOT NULL,
  `expiry` varchar(255) NOT NULL,
  `name_on_card` varchar(255) NOT NULL,
  `client_email_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_dlicense_doc`
--

CREATE TABLE `client_dlicense_doc` (
  `dlicense_number` varchar(30) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `checked` tinyint(1) NOT NULL,
  `client_email_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_id_doc`
--

CREATE TABLE `client_id_doc` (
  `ID_doc_number` varchar(20) NOT NULL,
  `image_link` varchar(255) NOT NULL,
  `checked` tinyint(1) NOT NULL,
  `client_email_address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client_referents`
--

CREATE TABLE `client_referents` (
  `email_address` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `street` varchar(40) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fleet_manager`
--

CREATE TABLE `fleet_manager` (
  `fleet_email` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `zip` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `ZIP` varchar(10) NOT NULL,
  `only_return` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `cl_email_address` varchar(50) NOT NULL,
  `pick_up_location` int(11) NOT NULL,
  `return_location` int(11) NOT NULL,
  `pickup_datetime` datetime NOT NULL,
  `return_datetime` datetime NOT NULL,
  `ref_email_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`number_plate`),
  ADD KEY `fleet_manager` (`fleet_manager`),
  ADD KEY `car type` (`car_type`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indexes for table `car_types`
--
ALTER TABLE `car_types`
  ADD PRIMARY KEY (`car_type_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`zip`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`email_address`),
  ADD KEY `zip` (`zip`);

--
-- Indexes for table `client_credit_card`
--
ALTER TABLE `client_credit_card`
  ADD PRIMARY KEY (`credit_card_number`),
  ADD KEY `client_email_address` (`client_email_address`);

--
-- Indexes for table `client_dlicense_doc`
--
ALTER TABLE `client_dlicense_doc`
  ADD PRIMARY KEY (`dlicense_number`),
  ADD KEY `client_email_address` (`client_email_address`);

--
-- Indexes for table `client_id_doc`
--
ALTER TABLE `client_id_doc`
  ADD PRIMARY KEY (`ID_doc_number`),
  ADD KEY `client_email_address` (`client_email_address`);

--
-- Indexes for table `client_referents`
--
ALTER TABLE `client_referents`
  ADD PRIMARY KEY (`email_address`),
  ADD KEY `zip` (`zip`);

--
-- Indexes for table `fleet_manager`
--
ALTER TABLE `fleet_manager`
  ADD PRIMARY KEY (`fleet_email`),
  ADD KEY `zip` (`zip`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `ZIP` (`ZIP`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `cl_email_address` (`cl_email_address`),
  ADD KEY `pick_up_location` (`pick_up_location`),
  ADD KEY `return_location` (`return_location`),
  ADD KEY `ref_email_address` (`ref_email_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_types`
--
ALTER TABLE `car_types`
  MODIFY `car_type_id` smallint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_type`) REFERENCES `car_types` (`car_type_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`car_type`) REFERENCES `car_types` (`car_type_id`),
  ADD CONSTRAINT `car_ibfk_3` FOREIGN KEY (`fleet_manager`) REFERENCES `fleet_manager` (`fleet_email`),
  ADD CONSTRAINT `car_ibfk_4` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints for table `car_types`
--
ALTER TABLE `car_types`
  ADD CONSTRAINT `car_types_ibfk_1` FOREIGN KEY (`car_type_id`) REFERENCES `car` (`car_type`);

--
-- Constraints for table `client_credit_card`
--
ALTER TABLE `client_credit_card`
  ADD CONSTRAINT `client_credit_card_ibfk_1` FOREIGN KEY (`client_email_address`) REFERENCES `client` (`email_address`);

--
-- Constraints for table `client_dlicense_doc`
--
ALTER TABLE `client_dlicense_doc`
  ADD CONSTRAINT `client_dlicense_doc_ibfk_1` FOREIGN KEY (`client_email_address`) REFERENCES `client` (`email_address`);

--
-- Constraints for table `client_id_doc`
--
ALTER TABLE `client_id_doc`
  ADD CONSTRAINT `client_id_doc_ibfk_1` FOREIGN KEY (`client_email_address`) REFERENCES `client` (`email_address`);

--
-- Constraints for table `client_referents`
--
ALTER TABLE `client_referents`
  ADD CONSTRAINT `client_referents_ibfk_1` FOREIGN KEY (`zip`) REFERENCES `cities` (`zip`),
  ADD CONSTRAINT `client_referents_ibfk_2` FOREIGN KEY (`zip`) REFERENCES `cities` (`zip`);

--
-- Constraints for table `fleet_manager`
--
ALTER TABLE `fleet_manager`
  ADD CONSTRAINT `fleet_manager_ibfk_2` FOREIGN KEY (`zip`) REFERENCES `cities` (`zip`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`ZIP`) REFERENCES `cities` (`zip`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`pick_up_location`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`return_location`) REFERENCES `locations` (`location_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`ref_email_address`) REFERENCES `client_referents` (`email_address`),
  ADD CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`cl_email_address`) REFERENCES `client` (`email_address`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
