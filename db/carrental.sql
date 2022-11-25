-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2022 at 08:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2022-04-20 12:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`) VALUES
(4, 'muchira@gmail.com', 10, '31-Mar-2010', '18-Dec-1978', 'Ut laboriosam minim', 1, '2022-04-16 03:08:37'),
(5, 'muchira@gmail.com', 6, '29-Nov-1983', '03-Apr-1974', 'A voluptatem sit id ', 1, '2022-04-16 03:09:29'),
(6, 'sheikh@gmail.com', 10, '25-Sep-2011', '24-Mar-1981', 'Enim facere accusant', 0, '2022-04-16 07:19:12'),
(7, 'sheikh@gmail.com', 10, '05-Oct-2006', '15-Jun-1999', 'Officiis molestias n', 2, '2022-04-16 11:14:04'),
(8, 'ali@gmail.com', 14, '07/06/2022', '08/06/2022', 'lorem ipsum', 1, '2022-06-23 14:27:31'),
(9, 'ali@gmail.com', 18, '07/06/2022', '09/06/2022', 'i love this car', 1, '2022-06-23 14:59:10'),
(10, 'ali@gmail.com', 18, '07/06/2022', '09/06/2022', 'i love this car', 1, '2022-06-23 14:59:23'),
(11, 'xijeq@mailinator.com', 14, '17-Apr-1978', '28-Dec-2014', 'Perferendis alias ma', 1, '2022-06-25 14:57:15'),
(12, 'ali@gmail.com', 21, '30-Jul-2013', '03-Dec-1990', 'Eum quo sapiente vol', 0, '2022-06-25 19:13:31');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Porsche ', '2022-04-22 11:50:53', '2022-06-25 18:41:00'),
(2, 'BMW', '2022-04-28 16:24:50', '2022-04-15 23:00:02'),
(3, 'Audi', '2022-04-27 16:25:03', '2022-04-15 23:00:32'),
(4, 'Nissan', '2022-04-14 16:25:13', '2022-04-15 23:01:11'),
(5, 'Toyota', '2022-04-28 16:25:24', '2022-04-15 23:01:28'),
(7, 'Marutiu', '2022-06-16 06:22:13', '2022-04-15 23:01:45'),
(8, 'lamborgini', '2022-04-15 23:20:40', '2022-06-23 14:09:39'),
(9, 'Aston Martin', '2022-04-22 09:55:11', NULL),
(10, 'Bentley', '2022-04-22 10:01:01', NULL),
(11, 'Cadillac', '2022-04-22 11:11:03', '2022-06-23 14:53:58'),
(16, 'Tesla', '2022-06-26 06:34:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Kanairo\r\n																							', 'HCIgroup@gmail.com', '0707070708');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(2, 'Testor', 'test@gmail.com', '0707070707', 'lorem', '2022-04-15 21:17:07', 1),
(3, 'Ali', 'ali@gmail.com', '0707070708', 'i got an issue', '2022-06-23 15:26:24', 1),
(4, 'Ali', 'ali@gmail.com', '0707070708', 'i got an issue', '2022-06-23 15:26:48', NULL),
(5, 'Justin Nichols', 'xylyh@mailinator.com', '0707070708', 'Fugiat cupidatat ex', '2022-06-25 14:59:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '																														<p align=\"justify\"><font size=\"2\"><strong><font color=\"#990000\">(1) ACCEPTANCE OF TERMS</font></strong></font></p><p align=\"justify\"><span style=\"color: rgb(20, 20, 20); font-family: &quot;Noto Sans&quot;, sans-serif; font-size: 18px; text-align: left;\">The Company may refuse to conclude the Rental Agreement when any of the following items applies to the Renter or the Driver:</span></p><ol class=\"list-number--brackets\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-size: 18px; vertical-align: baseline; list-style: none; color: rgb(20, 20, 20); font-family: &quot;Noto Sans&quot;, sans-serif;\"><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When the driver’s license necessary to drive the Rental Car has not been presented;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When deemed to be under the influence of alcohol;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When deemed to be intoxicated by substances such as drugs, stimulants, and thinners;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When traveling with a child under the age of six without a toddler seat;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When he or she has been determined to be a member of or involved with a crime syndicate or organization affiliated with a crime syndicate, or a member of some other antisocial organization (\"organized crime etc.\" hereinafter), or facts have been identified that show that he or she has cooperated or been involved in maintenance and management of a crime syndicate or organization affiliated with a crime syndicate or has interacted with organized crime etc;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When the Driver specified at the time of reservation differs from the Driver at the time of concluding the Rental Agreement;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When there is evidence of belated payment of debt to the Company in past rental transactions;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When any of the acts provided for in Article 22 were committed in past rental transactions;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When any of the acts provided for in paragraph 6 of Article 26 or paragraph 1 of Article 35 were committed in past rental transactions (including past transactions with other car rental companies);</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When there is evidence that automobile insurance was not applied in past rental transactions due to a violation of the Times CAR RENTAL Terms and Conditions or insurance terms and conditions;</li><li style=\"margin-top: 10px; margin-bottom: 10px; margin-left: -1em; padding-left: 3em; border: 0px; vertical-align: baseline; counter-increment: brackets 1; text-indent: -2.5em;\">When Rental Conditions prescribed separately by the Company have not been fulfilled;</li></ol>\r\n										\r\n										\r\n										'),
(2, 'Privacy Policy', 'privacy', '<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">privacy policy</span></div>'),
(3, 'About Us ', 'aboutus', '																														<h1><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;GROUP MEMBERS<br></span><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">1.Evans okania<br></span><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">2.Sheikh Ali<br></span><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">3.Hellen Ndathi<br></span><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">4.Muchira munene<br></span><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">5.Mbuthia Moko<br></span><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">6.Jeff Kioko<br></span><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">7.Wamaitha<br></span><span style=\"font-weight: bold; font-size: xx-large; font-family: impact;\">8.Joy</span></h1><div><span style=\"font-weight: bold;\"><br></span></div><div><span style=\"font-weight: bold;\"><br></span></div><div><span style=\"font-weight: bold;\"><br></span></div><div><span style=\"font-weight: bold;\"><br></span></div><div><span style=\"font-weight: bold;\"><br></span></div><div><span style=\"font-weight: bold;\"><br></span></div><div><span style=\"font-weight: bold;\"><br></span></div><div><br></div>\r\n										\r\n										\r\n										'),
(11, 'FAQs', 'faqs', '																														<p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/vehicle-warranty-covered-by-non-dealer-auto-shop/\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">Do I need to take my vehicle to the dealer to be covered under warranty?</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/difference-between-regular-oil-and-eco-power-oil/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“What is the difference between regular oil and your Eco Power oil?</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/how-often-do-i-need-an-oil-change-in-victoria-bc/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“How often do I need an oil change?”</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/can-i-drop-off-my-car-before-work/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“Can I drop off my car before work?”</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/fleet-maintenance-packages/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“Do you offer fleet maintenance packages?”</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/manual-and-automatic-transmissions-servicing-needs/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“Do manual and automatic transmissions have different servicing needs?”</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/how-many-kms-before-transmission-replacement/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“How many kilometres can a transmission take before needing replacement?”</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/what-is-the-biggest-problem-with-transmissions/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“What is the biggest problem with transmissions?”</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/transmission-fluid-flush-cost/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(243, 130, 56); cursor: pointer; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“What would it cost to flush out my old transmission fluid and fill with new fluid?”</a></p><p style=\"box-sizing: inherit; margin-bottom: 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: rgb(10, 10, 10); font-family: Lato, sans-serif; background-color: rgb(254, 254, 254);\"><a href=\"https://victrans.com/how-often-should-i-replace-my-windshield-wiper-blades/\" target=\"_blank\" rel=\"noopener noreferrer\" style=\"box-sizing: inherit; line-height: inherit; color: rgb(20, 104, 160); cursor: pointer; outline-width: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.3); font-weight: bold; font-size: large;\">“How often should I replace my windshield wiper blades?”</a></p><div><br></div>\r\n										\r\n										\r\n										');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(3, 'test@gmail.com', 'Provident eveniet ', '2022-04-16 00:20:46', 1),
(4, 'test@gmail.com', 'Ipsa dicta tenetur ', '2022-04-16 00:28:20', 1),
(5, 'sheikh@gmail.com', 'Tempora incididunt q', '2022-04-16 07:21:12', 1),
(6, 'ali@gmail.com', 'this is a good testimonial', '2022-06-23 14:38:47', 1),
(7, 'xijeq@mailinator.com', 'Ipsum est id nulla ', '2022-06-25 14:59:53', 1),
(8, 'evans@gmail.com', 'great cars ', '2022-06-25 15:12:16', 1),
(9, 'ali@gmail.com', 'Nice Cars lorem ipsum ...', '2022-06-25 18:25:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(4, 'Testor', 'test@gmail.com', '5c428d8875d2948607f3e3fe134d71b4', '9999857868', '03/07/2001', 'madaraka', 'Nairobi', 'Kenya', '2022-06-13 20:03:36', '2022-04-15 23:03:29'),
(5, 'muchira', 'muchira@gmail.com', '5c428d8875d2948607f3e3fe134d71b4', '0709080609', NULL, NULL, NULL, NULL, '2022-04-16 00:29:39', NULL),
(6, 'jeff', 'jeff@gmail.com', '5c428d8875d2948607f3e3fe134d71b4', '0709080609', NULL, NULL, NULL, NULL, '2022-04-16 00:30:22', NULL),
(7, 'Melanie Ratliff', 'rykysunuc@mailinator.com', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', 'Culpa dol', NULL, NULL, NULL, NULL, '2022-04-16 00:56:34', NULL),
(8, 'Kaitlin Irwin', 'qykabelek@mailinator.com', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', 'Eos labor', NULL, NULL, NULL, NULL, '2022-04-16 00:56:51', NULL),
(9, 'Xandra Serrano', 'cusyxe@mailinator.com', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', 'Maiores de', NULL, NULL, NULL, NULL, '2022-04-16 00:57:10', NULL),
(10, 'sheikh', 'sheikh@gmail.com', '5c428d8875d2948607f3e3fe134d71b4', '0755676875', NULL, NULL, NULL, NULL, '2022-04-16 07:15:38', NULL),
(11, 'Ali', 'ali@gmail.com', '67d31e87dabed1e6658f530b57bbc936', '0708080808', '', 'kanairo', 'Nairobi', 'kenya', '2022-06-23 14:01:34', '2022-06-26 06:52:41'),
(12, 'Clinton Parrish', 'xijeq@mailinator.com', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', '+1 (822) 22', '22-Apr-2019', 'Quia non animi eum ', 'Ut incididunt aut mo', 'Temporibus ad magna ', '2022-06-25 14:55:33', '2022-06-25 14:56:50'),
(13, 'Celeste Rice', 'nebiq@mailinator.com', 'f3ed11bbdb94fd9ebdefbaf646ab94d3', 'Impedit c', NULL, NULL, NULL, NULL, '2022-06-25 15:00:31', NULL),
(14, 'evans', 'evans@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '0708080808', NULL, NULL, NULL, NULL, '2022-06-25 15:11:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(1, 'Aston Martin', 9, 'The Aston Martin is a high-performance grand tourer based on the DB9 and manufactured by the British luxury automobile manufacturer Aston Martin. Aston Martin has used the DBS name once before on their 1967–72 grand tourer coupé.', 1500, 'Petrol', 2020, 2, 'Aston Martin DB113.jpg', 'Aston Martin DB111.jpg', 'Aston Martin DB112.jpg', 'Aston Martin DB114.jpg', 'Aston Martin DB115.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, '2022-04-22 10:01:11', '2022-06-25 18:39:38'),
(3, ' Flying Spur', 10, 'Overview\r\nEven though it\'s built from the ground up to pamper its passengers, the 2022 Bentley Flying Spur also has an athletic chassis to entertain the driver. A trio of engine choices—including a new plug-in hybrid—provide seemingly endless power, and its adept handling turns lazy weekend cruises into joyful driving experiences. The cabin delights the senses with high-end leathers, woods, and metal accents intermingled with modern-day technology and conveniences. The rear seat is particularly relaxing, especially when equipped with luxury features such as rear bucket seats, which offer power adjustments and heated armrests. However, the Flying Spur\'s unbeatable blend of luxury and performance comes with an eye-watering six-figure price tag, and that\'s before you start tacking on customization options from Bentley\'s Mulliner line of personalization features.\r\n\r\n', 3000, 'Petrol', 2022, 4, 'Bentley Flying Spur1.jpg', 'Bentley Flying Spur2.jpg', 'Bentley Flying Spur3.jpg', 'Bentley Flying Spur4.jpg', 'Bentley Flying Spur5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2022-04-22 10:56:28', '2022-06-25 19:02:09'),
(4, ' Aventador', 8, 'The Lamborghini Aventador  is a mid-engine sportscar produced by the Italian automotive manufacturer Lamborghini. In keeping with Lamborghini tradition, the Aventador is named after a Spanish fighting bull that fought in Zaragoza, Aragon in 1993', 3000, 'Petrol', 2022, 2, 'lamborgini aventador1.jpg', 'lamborgini aventador2.jpg', 'lamborgini aventador3.jpg', 'lamborgini aventador4.jpg', 'lamborgini aventador5.jpg', 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-04-22 11:06:59', '2022-06-25 18:40:05'),
(5, 'Cadillac Escallade', 11, 'The Cadillac Escalade is a full-size luxury SUV engineered and manufactured by General Motors. It was Cadillac\'s first major entry into the SUV market. The Escalade was introduced for the 1999 model year in response to competition from the Mercedes-Benz G-Class, Range Rover and Lexus LX as well as Ford\'s 1998 release of the Lincoln Navigator. The Escalade project went into production only ten months after it was approved. The Escalade is built in Arlington, Texas. The word \"escalade\" refers to a siege warfare tactic of scaling defensive walls or ramparts with the aid of ladders or siege towers.\r\n\r\nThe Escalade is currently sold in North America and select international markets (Europe and Asia) where Cadillac has official sales channels.[1] The Escalade ESV (Escalade Stretch Vehicle) is sold in North America, Russia, and Middle East but is available by special order only in some international markets. The right-hand-drive Escalade and Escalade ESV are available through the third-party conversion specialists without official agreement with Cadillac in Australian, Oceanic, and Japanese markets.', 2300, 'Diesel', 2019, 4, 'Cadillac Escallade.jpg', 'Cadillac Escallade0.jpg', 'Cadillac Escallade1.jpg', 'Cadillac Escallade2.jpg', 'Cadillac Escallade3.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, '2022-04-22 11:13:10', '2022-06-25 18:40:11'),
(6, 'GT-R', 4, 'The GT-R is an entirely new model sharing little with the Skyline GT-R save its signature four round tail lights. Like some later generations of the Skyline GT-R, the GT-R has the ATTESA E-TS all-wheel drive system with a twin-turbocharged 6-cylinder engine. But the four-wheel-steering HICAS system has been removed and the former straight-6 RB26DETT engine has been replaced with a new VR38DETT V6 engine.[11] Because of the GT-R\'s heritage, the chassis code for the all-new version has been called CBA-R35 and for later model years as DBA-R35 and 4BA-R35,[12] or R35 for short (where CBA, DBA and 4BA stands for the emissions standard prefix), carrying on the naming trend from previous Skyline GT-R generations.\r\n\r\nThe GT-R has also retained its Skyline predecessor\'s nickname, Godzilla,[13] originally given to it by the Australian motoring publication Wheels in 1989 for its R32 generation model.', 3000, 'Petrol', 2020, 4, 'GTR1.jpg', 'GTR2.jpg', 'GTR3.jpg', 'GTR4.jpg', 'GTR5.jpg', 1, 1, 1, NULL, 1, 1, 1, 1, NULL, 1, 1, 1, '2022-04-22 11:22:07', '2022-06-25 18:40:19'),
(7, 'Porsche Cayenne', 12, 'The Porsche Cayenne is a series of mid-size luxury crossover sport utility vehicles manufactured by the German automaker Porsche since 2002, with North American sales beginning in 2003. It is the first V8-engined vehicle built by Porsche since 1995, when the Porsche 928 was discontinued. It is also Porsche\'s first off-road variant vehicle since its Super and Junior tractors of the 1950s, and the first Porsche with four doors.\r\n\r\nThe second-generation Cayenne (Type 92A) was unveiled at the 2010 Geneva Motor Show in March following an online reveal. The Cayenne shares its platform, body frame, doors and electronics with the similar Volkswagen Touareg and Audi Q7. The third generation received a facelift in 2014 with minor external changes, and introduced a new plug-in E-Hybrid version, with its public launch at the Paris Motor Show.[2] Since 2008, all engines have featured direct injection technology.', 3000, 'Petrol', 2022, 4, 'Porshe Cayenen 1.jpg', 'Porshe Cayenen 3.jpg', 'Porshe Cayenen 5.jpg', 'Porshe Cayenen 4.jpg', 'Porshe cayenne 2.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2022-04-22 11:52:59', '2022-06-25 18:40:25'),
(21, ' Huracan', 8, 'The Huracan EVO is the evolution of the most successful V10-powered Lamborghini ever. The result of fine-tuning and refining existing features', 3500, 'Petrol', 2020, 2, 'Huracan2 (1).jpg', 'Huracan2 (2).jpg', 'Huracan2 (3).jpg', 'Huracan2 (4).jpg', 'Huracan2 (5).jpg', 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, '2022-06-25 18:55:23', NULL),
(22, 'Cayenne', 1, 'The Porsche Cayenne is a series of mid-size luxury crossover sport utility vehicles manufactured by the German automaker Porsche since 2002 (Type 9PA), with North American sales beginning in 2003. It is the first V8-engined vehicle built by Porsche since 1995, when the Porsche 928 was discontinued. It is also Porsche\'s first off-road variant vehicle since its Super and Junior tractors of the 1950s, and the first Porsche with four doors', 3500, 'Petrol', 2020, 4, 'Porshe Cayenen 1.jpg', 'Porshe cayenne 2.jpg', 'Porshe Cayenen 3.jpg', 'Porshe Cayenen 5.jpg', 'Porshe Cayenen 4.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2022-06-25 19:11:45', NULL),
(23, 'model 3', 16, 'Tesla All-Wheel Drive has two independent motors for improved redundancy, each with only one moving part for minimal maintenance and maximum durability. Unlike traditional all-wheel drive systems, they digitally control torque to the front and rear wheels for far better handling and traction control.', 3500, 'electric', 2017, 4, 'TESLA MODEL 3 (1).jpg', 'TESLA MODEL 3 (2).jpg', 'TESLA MODEL 3 (3).jpg', 'TESLA MODEL 3 (4).jpg', 'TESLA MODEL 3 (5).jpg', 1, 1, 1, 1, NULL, 1, 1, NULL, 1, 1, 1, 1, '2022-06-26 06:39:19', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
