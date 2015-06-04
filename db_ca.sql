-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 26, 2015 at 10:40 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_ca`
--
CREATE DATABASE IF NOT EXISTS `db_ca` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_ca`;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `loginid` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`loginid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`loginid`, `password`) VALUES
('prof00', '1234'),
('prof01', '1234'),
('stu00', '1234'),
('stu01', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `notice_board`
--

DROP TABLE IF EXISTS `notice_board`;
CREATE TABLE IF NOT EXISTS `notice_board` (
  `notice_id` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seed`
--

DROP TABLE IF EXISTS `seed`;
CREATE TABLE IF NOT EXISTS `seed` (
  `stu` int(20) NOT NULL,
  `prof` int(20) NOT NULL,
  `notice` int(11) NOT NULL,
  PRIMARY KEY (`stu`),
  UNIQUE KEY `prof` (`prof`),
  UNIQUE KEY `notice` (`notice`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seed`
--

INSERT INTO `seed` (`stu`, `prof`, `notice`) VALUES
(2, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

DROP TABLE IF EXISTS `tbl_profile`;
CREATE TABLE IF NOT EXISTS `tbl_profile` (
  `roll` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(65) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `edu_level` varchar(15) NOT NULL,
  `school` varchar(70) NOT NULL,
  `country` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`roll`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_profile`
--

INSERT INTO `tbl_profile` (`roll`, `fname`, `lname`, `dob`, `email`, `gender`, `edu_level`, `school`, `country`, `city`, `mobile`, `photo`) VALUES
('stu00', 'Hari', 'Dahal', '1993-08-05', 'haridahal@gmail.com', 'M', 'Bachelor Degree', 'KEC', 'Nepal', 'Udayapur', '9876543210', ''),
('stu01', 'Sanjay', 'Maharjan', '1992-02-04', 'snjmhj@gmail.com', 'M', 'Bachelor Degree', 'KEC', 'Nepal', 'Lalitpur', '1234567890', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile_prof`
--

DROP TABLE IF EXISTS `tbl_profile_prof`;
CREATE TABLE IF NOT EXISTS `tbl_profile_prof` (
  `id` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `gender` varchar(2) NOT NULL,
  `edu_level` varchar(15) NOT NULL,
  `school` varchar(70) NOT NULL,
  `country` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `photo` mediumblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_profile_prof`
--

INSERT INTO `tbl_profile_prof` (`id`, `fname`, `lname`, `dob`, `email`, `gender`, `edu_level`, `school`, `country`, `city`, `mobile`, `photo`) VALUES
('prof00', 'Partha', 'Chudal', '1993-02-10', 'chudal.partha018@gmail.com', 'M', 'Masters Degree', 'Harvard University', 'Nepal', 'Jhapa', '9841567175', ''),
('prof01', 'Prakash', 'Kafle', '1992-02-03', 'pkafle@gmail.com', 'M', 'Masters Degree', 'MIT', 'Nepal', 'Dhankuta', '5678904321', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
