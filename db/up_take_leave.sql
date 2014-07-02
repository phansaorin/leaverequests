-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2014 at 05:40 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `up_take_leave`
--

-- --------------------------------------------------------

--
-- Table structure for table `up_approvals`
--

CREATE TABLE IF NOT EXISTS `up_approvals` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `take_id` int(11) NOT NULL,
  `content` text,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`app_id`,`take_id`),
  KEY `fk_up_approvals_up_users1_idx` (`employee_id`),
  KEY `fk_up_approvals_up_users2_idx` (`approved_by`),
  KEY `fk_up_approvals_up_leave_requests1_idx` (`take_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `up_departments`
--

CREATE TABLE IF NOT EXISTS `up_departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`department_id`,`department_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `up_departments`
--

INSERT INTO `up_departments` (`department_id`, `department_name`, `description`) VALUES
(1, 'IT', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_leave_requests`
--

CREATE TABLE IF NOT EXISTS `up_leave_requests` (
  `take_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `number_of_leave` int(11) DEFAULT NULL,
  `approved_by` varchar(150) DEFAULT NULL COMMENT 'Get name of approver who approved on that leave request ID',
  PRIMARY KEY (`take_id`,`start_date`,`end_date`),
  KEY `fk_up_leave_requests_up_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `up_leave_requests`
--

INSERT INTO `up_leave_requests` (`take_id`, `content`, `user_id`, `start_date`, `end_date`, `number_of_leave`, `approved_by`) VALUES
(1, 'Go to homeland', 4, '2014-06-29', '2014-06-29', 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `up_managers`
--

CREATE TABLE IF NOT EXISTS `up_managers` (
  `manager_id` int(11) NOT NULL,
  `subdonate_id` int(11) NOT NULL,
  PRIMARY KEY (`manager_id`,`subdonate_id`),
  KEY `fk_up_managers_up_users2_idx` (`subdonate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `up_positions`
--

CREATE TABLE IF NOT EXISTS `up_positions` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `up_positions`
--

INSERT INTO `up_positions` (`position_id`, `position_name`, `description`) VALUES
(1, 'Admin', NULL),
(2, 'Manager', NULL),
(3, 'Subordinate', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `up_users`
--

CREATE TABLE IF NOT EXISTS `up_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `position_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `usertype_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_up_users_up_departments1_idx` (`department_id`),
  KEY `fk_up_users_up_user_types1_idx` (`usertype_id`),
  KEY `fk_up_users_up_positions1_idx` (`position_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `up_users`
--

INSERT INTO `up_users` (`user_id`, `username`, `password`, `position_id`, `department_id`, `usertype_id`) VALUES
(1, 'chhing99@gmail.com', '202cb962ac59075b964b07152d234b70', 1, 1, 1),
(2, 'manger@gmail.com', '202cb962ac59075b964b07152d234b70', 2, 1, 3),
(3, 'sopheak.ea9@gmail.com', '202cb962ac59075b964b07152d234b70', 3, 1, 4),
(4, 'saorinphan.com', '202cb962ac59075b964b07152d234b70', 1, 1, 4),
(5, 'sina1.ea9@gmail.com', '202cb962ac59075b964b07152d234b70', 3, 1, 4),
(6, 'sina2.ea9@gmail.com', '202cb962ac59075b964b07152d234b70', 3, 1, 4),
(7, 'sina3.ea9@gmail.com', '202cb962ac59075b964b07152d234b70', 3, 1, 4),
(8, 'sina3.ea9@gmail.com', '202cb962ac59075b964b07152d234b70', 3, 1, 4),
(9, 'sina3.ea9@gmail.com', '202cb962ac59075b964b07152d234b70', 3, 1, 4),
(11, 'nak.chet@gmail.com', '202cb962ac59075b964b07152d234b70', 2, 1, 3),
(12, 'nak.chet@gmail.com', '202cb962ac59075b964b07152d234b70', 2, 1, 3),
(13, 'nak.chet@gmail.com', '', 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `up_user_profile`
--

CREATE TABLE IF NOT EXISTS `up_user_profile` (
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone1` varchar(20) DEFAULT NULL,
  `phone2` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_up_user_profile_up_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `up_user_profile`
--

INSERT INTO `up_user_profile` (`first_name`, `last_name`, `email`, `gender`, `address`, `phone1`, `phone2`, `dob`, `user_id`) VALUES
('chhingchhing', 'HEM', 'chhing99@gmail.com', 'Female', 'Takeo Province', '0972792217', '', '2014-05-25', 1),
('F_manger', 'L_manager', 'manger@gmail.com', 'Male', 'PP', '098989897', '', '2014-05-25', 2),
('sopheak', 'ea', 'sopheak.ea9@gmail.com', 'Female', 'Takeo Province', '0987878784', '', '0000-00-00', 3),
('sina', 'ea', 'sina.ea9@gmail.com', 'Female', 'Takeo Province', '0987878784', '', '0000-00-00', 4),
('sina1', 'ea1', 'sina1.ea9@gmail.com', 'Female', 'Takeo Province, Cambodai', '0987878783', '', '0000-00-00', 5),
('sina2', 'ea2', 'sina2.ea9@gmail.com', 'Female', 'Takeo Province, Cambodai', '0987878733', '', '0000-00-00', 6),
('sina3', 'ea3', 'sina3.ea9@gmail.com', 'Female', 'Takeo Province, Cambodai', '0987378733', '', '0000-00-00', 7),
('sina3', 'ea3', 'sina3.ea9@gmail.com', 'Female', 'Takeo Province, Cambodai', '0987378733', '', '0000-00-00', 8),
('sina3', 'ea3', 'sina3.ea9@gmail.com', 'Female', 'Takeo Province, Cambodai', '0987378733', '', '0000-00-00', 9),
('nak', 'chet', 'nak.chet@gmail.com', 'Female', 'ssd', '0987378733', '', '0000-00-00', 11),
('nak', 'chet', 'nak.chet@gmail.com', 'Female', 'ssd', '0987378733', '', '0000-00-00', 12),
('nak', 'chet', 'nak.chet@gmail.com', 'Female', 'ssd', '0987378733', '', '0000-00-00', 13);

-- --------------------------------------------------------

--
-- Table structure for table `up_user_types`
--

CREATE TABLE IF NOT EXISTS `up_user_types` (
  `usertype_id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype_name` varchar(150) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`usertype_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `up_user_types`
--

INSERT INTO `up_user_types` (`usertype_id`, `usertype_name`, `description`) VALUES
(1, 'Admiin', NULL),
(2, 'Vice-President', NULL),
(3, 'Manager', NULL),
(4, 'Staff', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `up_approvals`
--
ALTER TABLE `up_approvals`
  ADD CONSTRAINT `fk_up_approvals_up_leave_requests1` FOREIGN KEY (`take_id`) REFERENCES `up_leave_requests` (`take_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_up_approvals_up_users1` FOREIGN KEY (`employee_id`) REFERENCES `up_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_up_approvals_up_users2` FOREIGN KEY (`approved_by`) REFERENCES `up_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `up_leave_requests`
--
ALTER TABLE `up_leave_requests`
  ADD CONSTRAINT `fk_up_leave_requests_up_users1` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `up_managers`
--
ALTER TABLE `up_managers`
  ADD CONSTRAINT `fk_manager_manager_id_with_users` FOREIGN KEY (`manager_id`) REFERENCES `up_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_manager_subdonate_id_with_users` FOREIGN KEY (`subdonate_id`) REFERENCES `up_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `up_users`
--
ALTER TABLE `up_users`
  ADD CONSTRAINT `fk_up_users_up_departments1` FOREIGN KEY (`department_id`) REFERENCES `up_departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_up_users_up_positions1` FOREIGN KEY (`position_id`) REFERENCES `up_positions` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_up_users_up_user_types1` FOREIGN KEY (`usertype_id`) REFERENCES `up_user_types` (`usertype_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `up_user_profile`
--
ALTER TABLE `up_user_profile`
  ADD CONSTRAINT `fk_up_user_profile_up_users1` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
