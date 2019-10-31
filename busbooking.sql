-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2018 at 09:01 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `busbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `id` int(10) UNSIGNED NOT NULL,
  `bus` int(10) UNSIGNED DEFAULT NULL,
  `route` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `availability`
--

INSERT INTO `availability` (`id`, `bus`, `route`, `date`, `time`, `amount`, `status`) VALUES
(1, 1, 1, '2018-05-20', '13:00:00', '1', 'available'),
(2, 1, 2, '2018-05-22', '20:00:00', '2', 'not available'),
(3, 2, 1, '2018-06-05', '13:00:00', '1', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_number` int(10) UNSIGNED DEFAULT NULL,
  `fullname` int(10) UNSIGNED DEFAULT NULL,
  `phone` int(10) UNSIGNED DEFAULT NULL,
  `bus` int(10) UNSIGNED DEFAULT NULL,
  `seat` int(10) UNSIGNED DEFAULT NULL,
  `date` int(10) UNSIGNED DEFAULT '1',
  `time` int(10) UNSIGNED DEFAULT NULL,
  `luggage` varchar(40) DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL,
  `date_booked` date DEFAULT NULL,
  `field11` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `id_number`, `fullname`, `phone`, `bus`, `seat`, `date`, `time`, `luggage`, `amount`, `date_booked`, `field11`) VALUES
(1, 1, 1, 1, 2, 1, 2, 2, '1', '2', NULL, NULL),
(2, 1, 1, 1, 1, 10, 1, 1, NULL, '1', NULL, NULL),
(3, 1, 1, 1, 1, 5, 1, 1, NULL, '1', NULL, NULL),
(4, 1, 1, 1, 3, 9, 3, 3, '1', '3', NULL, NULL),
(5, 2, 2, 2, 3, 1, 3, 3, NULL, '3', '2018-05-20', NULL),
(6, 3, 3, 3, 3, 5, 3, 3, NULL, '3', '2018-05-20', NULL),
(7, 2, 2, 2, 1, 10, 1, 1, NULL, '1', '2018-05-21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `number`) VALUES
(1, 'KBX 1234'),
(2, 'KBZ 8283');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `id_number` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `phone`, `id_number`) VALUES
(1, 'Davin Louis', '0712345678', '4410109291020'),
(2, 'Kelvin Kevoh', '0792323200', '33767192'),
(3, 'mukangara wenyagauri', '0734123453', '552211133445');

-- --------------------------------------------------------

--
-- Table structure for table `membership_grouppermissions`
--

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'buses', 1, 3, 3, 3),
(2, 2, 'seats', 1, 3, 3, 3),
(3, 2, 'availability', 1, 3, 3, 3),
(4, 2, 'bookings', 1, 3, 3, 3),
(5, 2, 'routes', 1, 3, 3, 3),
(6, 2, 'customers', 1, 3, 3, 3),
(19, 3, 'buses', 0, 3, 0, 0),
(20, 3, 'seats', 0, 3, 0, 0),
(21, 3, 'availability', 0, 3, 0, 0),
(22, 3, 'bookings', 1, 1, 1, 1),
(23, 3, 'routes', 0, 3, 0, 0),
(24, 3, 'customers', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_groups`
--

CREATE TABLE `membership_groups` (
  `groupID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(1, 'anonymous', 'Anonymous group created automatically on 2018-05-20', 0, 0),
(2, 'Admins', 'Admin group created automatically on 2018-05-20', 0, 1),
(3, 'customers', 'contains all customers', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `membership_userpermissions`
--

CREATE TABLE `membership_userpermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `membership_userrecords`
--

CREATE TABLE `membership_userrecords` (
  `recID` bigint(20) UNSIGNED NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) UNSIGNED DEFAULT NULL,
  `dateUpdated` bigint(20) UNSIGNED DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'buses', '1', 'admin', 1526809520, 1526809520, 2),
(2, 'seats', '1', 'admin', 1526809541, 1526809541, 2),
(3, 'seats', '2', 'admin', 1526809550, 1526809550, 2),
(4, 'seats', '3', 'admin', 1526809559, 1526809559, 2),
(5, 'seats', '4', 'admin', 1526809568, 1526809568, 2),
(6, 'seats', '5', 'admin', 1526809577, 1526809577, 2),
(7, 'seats', '6', 'admin', 1526809587, 1526809587, 2),
(8, 'seats', '7', 'admin', 1526809597, 1526809597, 2),
(9, 'seats', '8', 'admin', 1526809605, 1526809605, 2),
(10, 'seats', '9', 'admin', 1526809615, 1526809615, 2),
(11, 'seats', '10', 'admin', 1526809623, 1526809623, 2),
(12, 'routes', '1', 'admin', 1526809669, 1526809669, 2),
(13, 'routes', '2', 'admin', 1526809686, 1526809686, 2),
(14, 'availability', '1', 'admin', 1526809809, 1526810984, 2),
(15, 'availability', '2', 'admin', 1526809852, 1526810962, 2),
(16, 'customers', '1', 'admin', 1526810032, 1526810032, 2),
(17, 'bookings', '1', 'admin', 1526810611, 1526810611, 2),
(18, 'bookings', '2', 'admin', 1526812595, 1526812595, 2),
(19, 'bookings', '3', 'admin', 1526812704, 1526812704, 2),
(20, 'buses', '2', 'admin', 1526820828, 1526820828, 2),
(21, 'availability', '3', 'admin', 1526820876, 1526820876, 2),
(22, 'bookings', '4', 'admin', 1526820948, 1526820948, 2),
(23, 'customers', '2', 'kevoh', 1526822459, 1526822459, 3),
(24, 'bookings', '5', 'kevoh', 1526824428, 1526824428, 3),
(25, 'customers', '3', 'admin', 1526845211, 1526845211, 2),
(26, 'bookings', '6', 'admin', 1526845238, 1526845238, 2),
(27, 'bookings', '7', 'admin', 1526885955, 1526885955, 2);

-- --------------------------------------------------------

--
-- Table structure for table `membership_users`
--

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) UNSIGNED DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', '2018-05-20', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2018-05-20\nRecord updated automatically on 2018-05-20', NULL, NULL),
('guest', NULL, NULL, '2018-05-20', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2018-05-20', NULL, NULL),
('kaddy', '827ccb0eea8a706c4c34a16891f84e7b', 'kaddy@gmail.com', '2018-05-21', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('kevoh', '827ccb0eea8a706c4c34a16891f84e7b', 'kevo@gmail.com', '2018-05-20', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `time` varchar(40) DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `name`, `time`, `amount`) VALUES
(1, 'Chavakali-Nairobi', 'day', '1000'),
(2, 'Chavakali-Nairobi', 'night', '500');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `name`) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'A3'),
(4, 'A4'),
(5, 'A5'),
(6, 'A6'),
(7, 'A7'),
(8, 'A8'),
(9, 'A9'),
(10, 'A10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus` (`bus`),
  ADD KEY `route` (`route`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_number` (`id_number`),
  ADD KEY `bus` (`bus`),
  ADD KEY `seat` (`seat`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_groups`
--
ALTER TABLE `membership_groups`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indexes for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  ADD PRIMARY KEY (`recID`),
  ADD UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  ADD KEY `pkValue` (`pkValue`),
  ADD KEY `tableName` (`tableName`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `membership_users`
--
ALTER TABLE `membership_users`
  ADD PRIMARY KEY (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `availability`
--
ALTER TABLE `availability`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `membership_groups`
--
ALTER TABLE `membership_groups`
  MODIFY `groupID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  MODIFY `recID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
