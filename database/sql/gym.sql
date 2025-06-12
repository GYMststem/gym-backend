-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 31, 2025 at 11:13 AM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ctpormmb_gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_first` text COLLATE utf8mb4_unicode_ci,
  `address_second` text COLLATE utf8mb4_unicode_ci,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address_first`, `address_second`, `city_id`, `state_id`, `pincode`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(6, 395, 'TEST DATA', NULL, 'Bikaner', 'Rajasthan', '334001', '2024-10-29 03:33:44', NULL, '2024-10-29 03:30:23', '2024-10-29 03:33:44'),
(7, 396, 'J.N.V', NULL, 'Bikaner', 'Rajasthan', '334001', '2024-11-07 06:27:10', NULL, '2024-10-29 03:36:10', '2024-11-07 06:27:10'),
(8, 397, 'TEST DATA', NULL, 'Bikaner', 'Rajsthan', '334001', '2024-11-07 06:27:15', NULL, '2024-10-29 03:37:46', '2024-11-07 06:27:15'),
(9, 398, 'tes', NULL, 'yok', '34567', '3522', '2024-11-04 07:46:33', NULL, '2024-10-29 12:01:34', '2024-11-04 07:46:33'),
(25, 414, 'new york', NULL, 'new york', 'new york', '10101010101', '2024-11-07 06:27:12', NULL, '2024-11-05 06:32:24', '2024-11-07 06:27:12'),
(34, 423, 'new line', NULL, 'city', 'state', '334001', '2024-11-08 03:18:17', NULL, '2024-11-07 07:15:04', '2024-11-08 03:18:17'),
(35, 424, 'add', NULL, 'city', 'statecity', 'city', '2024-11-18 01:41:46', NULL, '2024-11-07 07:16:56', '2024-11-18 01:41:46'),
(36, 425, 'fcftcct', NULL, 'ytft', 'yty', 'ddggd', '2024-11-08 05:25:26', NULL, '2024-11-07 07:28:15', '2024-11-08 05:25:26'),
(37, 426, 'dsfsdf', NULL, 'dfsdff', 'sdfs', '2222', '2024-11-08 04:32:57', NULL, '2024-11-08 04:29:46', '2024-11-08 04:32:57'),
(38, 427, 'eee', NULL, 'ooo', 'qqq', '8888', '2024-11-08 04:37:22', NULL, '2024-11-08 04:36:23', '2024-11-08 04:37:22'),
(39, 428, 'iii', NULL, 'ppp', 'ooo', '899', '2024-11-08 04:40:13', NULL, '2024-11-08 04:38:41', '2024-11-08 04:40:13'),
(40, 429, 'qqq', NULL, 'eeee', 'www', '989u', '2024-11-18 01:41:41', NULL, '2024-11-08 04:42:15', '2024-11-18 01:41:41'),
(41, 430, 'address', NULL, 'city', 'state', '334001', '2024-11-08 05:19:39', NULL, '2024-11-08 05:06:27', '2024-11-08 05:19:39'),
(42, 431, 'new addres line', NULL, 'city', 'state', '3344001', '2024-11-08 05:19:45', NULL, '2024-11-08 05:12:03', '2024-11-08 05:19:45'),
(43, 432, 'test', NULL, 'test', 'test', 'test', '2024-11-08 05:19:50', NULL, '2024-11-08 05:13:40', '2024-11-08 05:19:50'),
(44, 433, 'test', NULL, 'test', 'test', 'test', '2024-11-08 05:19:54', NULL, '2024-11-08 05:15:49', '2024-11-08 05:19:54'),
(45, 434, 'tetstts', NULL, 'ttetts', 'ydyed', 'djksdk', '2024-11-08 05:19:58', NULL, '2024-11-08 05:18:19', '2024-11-08 05:19:58'),
(47, 436, 'test', NULL, 'test', 'test', 'test', NULL, NULL, '2024-11-08 06:12:43', '2024-11-08 06:12:43'),
(52, 441, 'test', NULL, 'tr', 'ss', '2345', '2024-11-20 13:17:47', NULL, '2024-11-19 14:59:10', '2024-11-20 13:17:47'),
(57, 446, 'J.N.V Colony', NULL, 'Bikaner', 'Rajasthan', '334001', '2024-11-21 13:16:27', NULL, '2024-11-20 23:50:57', '2024-11-21 13:16:27'),
(61, 450, '12345', NULL, '9876', '568', '34567', '2024-11-21 13:16:30', NULL, '2024-11-21 08:26:50', '2024-11-21 13:16:30'),
(62, 451, 'GF, WorkWings', NULL, 'Noida 63', 'Uttar Pradesh', '201301', '2024-11-21 13:16:33', NULL, '2024-11-21 08:29:21', '2024-11-21 13:16:33'),
(64, 453, '456', NULL, '4567', '5678', '456', NULL, NULL, '2024-11-21 13:18:12', '2024-11-21 13:18:12'),
(65, 454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 13:19:21', '2024-11-21 13:19:21'),
(66, 455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-21 13:24:12', '2024-11-21 13:24:12'),
(67, 456, '6745', NULL, '6789', '56', '4567', NULL, NULL, '2024-11-21 13:40:38', '2024-11-21 13:40:38'),
(68, 457, 'GF, WorkWings', NULL, 'Noida 63', 'Uttar Pradesh', '201301', NULL, NULL, '2024-11-21 23:43:17', '2024-11-21 23:43:17'),
(69, 458, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-22 03:37:03', '2024-11-22 03:37:03'),
(70, 459, NULL, NULL, NULL, NULL, NULL, '2024-11-22 04:12:13', NULL, '2024-11-22 04:12:01', '2024-11-22 04:12:13'),
(71, 460, NULL, NULL, NULL, NULL, NULL, '2024-11-22 04:13:34', NULL, '2024-11-22 04:12:52', '2024-11-22 04:13:34'),
(72, 461, 'GF, WorkWings', NULL, 'Noida 63', 'Uttar Pradesh', '201301', NULL, NULL, '2024-11-26 00:36:37', '2024-11-26 00:36:37'),
(73, 462, 'GF, WorkWings', NULL, 'Noida 63', 'Uttar Pradesh', '201301', NULL, NULL, '2024-11-26 00:38:31', '2024-11-26 00:38:31'),
(75, 464, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-26 10:37:44', '2024-11-26 10:37:44'),
(76, 465, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-29 05:42:59', '2024-11-29 05:42:59'),
(77, 466, NULL, NULL, NULL, NULL, NULL, '2024-12-18 05:15:22', 1, '2024-11-29 05:57:08', '2024-11-29 05:57:08'),
(78, 467, NULL, NULL, NULL, NULL, NULL, '2024-11-29 07:14:49', 1, '2024-11-29 07:14:44', '2024-11-29 07:14:44'),
(79, 468, 'GF, WorkWings', NULL, 'Noida 63', 'Uttar Pradesh', '201301', NULL, NULL, '2024-12-04 03:00:34', '2024-12-04 03:00:34'),
(80, 469, NULL, NULL, NULL, NULL, NULL, '2024-12-18 05:15:10', 1, '2024-12-17 06:10:41', '2024-12-17 06:10:41'),
(81, 470, 'GF, WorkWings', NULL, 'Noida 63', 'Uttar Pradesh', '201301', NULL, NULL, '2024-12-18 23:52:47', '2024-12-18 23:52:47'),
(84, 473, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-01 08:06:30', '2025-01-01 08:06:30'),
(85, 474, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-02 05:54:39', '2025-01-02 05:54:39'),
(86, 475, NULL, NULL, NULL, NULL, NULL, '2025-01-06 15:02:06', 1, '2025-01-06 07:38:47', '2025-01-06 07:38:47'),
(87, 476, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 12:13:09', '2025-01-16 12:13:09'),
(88, 477, '12', NULL, 'Test City', 'Test', '11111', NULL, NULL, '2025-01-16 12:36:19', '2025-01-16 12:36:19'),
(89, 478, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 12:50:26', '2025-01-16 12:50:26'),
(90, 479, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 12:53:41', '2025-01-16 12:53:41'),
(91, 480, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-16 13:05:35', '2025-01-16 13:05:35'),
(92, 481, '2', NULL, '2', '2', NULL, NULL, NULL, '2025-01-18 05:56:24', '2025-01-18 05:56:24'),
(93, 482, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 10:19:27', '2025-01-21 10:19:27'),
(94, 483, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-01-21 10:23:02', '2025-01-21 10:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `apply_coupons`
--

CREATE TABLE `apply_coupons` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `coupon_id` varchar(255) DEFAULT NULL,
  `package_id` varchar(255) DEFAULT NULL,
  `billing_id` int(11) DEFAULT NULL,
  `discount_price` decimal(10,0) DEFAULT NULL,
  `final_price` decimal(10,0) DEFAULT NULL,
  `paid_amount` decimal(10,0) DEFAULT NULL,
  `applied_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `apply_coupons`
--

INSERT INTO `apply_coupons` (`id`, `user_id`, `coupon_id`, `package_id`, `billing_id`, `discount_price`, `final_price`, `paid_amount`, `applied_at`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, '477', '2', '41', 69, 3750, 21250, 15000, '2025-01-16 12:35:37', NULL, NULL, '2025-01-16 12:35:37', '2025-01-16 12:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

CREATE TABLE `billings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_price` decimal(8,2) NOT NULL,
  `final_price` decimal(8,2) NOT NULL,
  `paid_amount` decimal(8,2) NOT NULL,
  `payable_amount` decimal(8,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

CREATE TABLE `centers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`id`, `user_id`, `name`, `address_line_1`, `address_line_2`, `city_id`, `state_id`, `latitude`, `longitude`, `pincode`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Kampala Citi Gym', 'Near Rani Bazar', 'Near Rani Bazar 2', '433', '19', NULL, NULL, 334001, '2024-07-10 02:43:00', '2024-07-10 02:43:00');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 32, 'North and Middle Andaman', NULL, NULL),
(2, 32, 'South Andaman', NULL, NULL),
(3, 32, 'Nicobar', NULL, NULL),
(4, 1, 'Adilabad', NULL, NULL),
(5, 1, 'Anantapur', NULL, NULL),
(6, 1, 'Chittoor', NULL, NULL),
(7, 1, 'East Godavari', NULL, NULL),
(8, 1, 'Guntur', NULL, NULL),
(9, 1, 'Hyderabad', NULL, NULL),
(10, 1, 'Kadapa', NULL, NULL),
(11, 1, 'Karimnagar', NULL, NULL),
(12, 1, 'Khammam', NULL, NULL),
(13, 1, 'Krishna', NULL, NULL),
(14, 1, 'Kurnool', NULL, NULL),
(15, 1, 'Mahbubnagar', NULL, NULL),
(16, 1, 'Medak', NULL, NULL),
(17, 1, 'Nalgonda', NULL, NULL),
(18, 1, 'Nellore', NULL, NULL),
(19, 1, 'Nizamabad', NULL, NULL),
(20, 1, 'Prakasam', NULL, NULL),
(21, 1, 'Rangareddi', NULL, NULL),
(22, 1, 'Srikakulam', NULL, NULL),
(23, 1, 'Vishakhapatnam', NULL, NULL),
(24, 1, 'Vizianagaram', NULL, NULL),
(25, 1, 'Warangal', NULL, NULL),
(26, 1, 'West Godavari', NULL, NULL),
(27, 3, 'Anjaw', NULL, NULL),
(28, 3, 'Changlang', NULL, NULL),
(29, 3, 'East Kameng', NULL, NULL),
(30, 3, 'Lohit', NULL, NULL),
(31, 3, 'Lower Subansiri', NULL, NULL),
(32, 3, 'Papum Pare', NULL, NULL),
(33, 3, 'Tirap', NULL, NULL),
(34, 3, 'Dibang Valley', NULL, NULL),
(35, 3, 'Upper Subansiri', NULL, NULL),
(36, 3, 'West Kameng', NULL, NULL),
(37, 2, 'Barpeta', NULL, NULL),
(38, 2, 'Bongaigaon', NULL, NULL),
(39, 2, 'Cachar', NULL, NULL),
(40, 2, 'Darrang', NULL, NULL),
(41, 2, 'Dhemaji', NULL, NULL),
(42, 2, 'Dhubri', NULL, NULL),
(43, 2, 'Dibrugarh', NULL, NULL),
(44, 2, 'Goalpara', NULL, NULL),
(45, 2, 'Golaghat', NULL, NULL),
(46, 2, 'Hailakandi', NULL, NULL),
(47, 2, 'Jorhat', NULL, NULL),
(48, 2, 'Karbi Anglong', NULL, NULL),
(49, 2, 'Karimganj', NULL, NULL),
(50, 2, 'Kokrajhar', NULL, NULL),
(51, 2, 'Lakhimpur', NULL, NULL),
(52, 2, 'Marigaon', NULL, NULL),
(53, 2, 'Nagaon', NULL, NULL),
(54, 2, 'Nalbari', NULL, NULL),
(55, 2, 'North Cachar Hills', NULL, NULL),
(56, 2, 'Sibsagar', NULL, NULL),
(57, 2, 'Sonitpur', NULL, NULL),
(58, 2, 'Tinsukia', NULL, NULL),
(59, 4, 'Araria', NULL, NULL),
(60, 4, 'Aurangabad', NULL, NULL),
(61, 4, 'Banka', NULL, NULL),
(62, 4, 'Begusarai', NULL, NULL),
(63, 4, 'Bhagalpur', NULL, NULL),
(64, 4, 'Bhojpur', NULL, NULL),
(65, 4, 'Buxar', NULL, NULL),
(66, 4, 'Darbhanga', NULL, NULL),
(67, 4, 'Purba Champaran', NULL, NULL),
(68, 4, 'Gaya', NULL, NULL),
(69, 4, 'Gopalganj', NULL, NULL),
(70, 4, 'Jamui', NULL, NULL),
(71, 4, 'Jehanabad', NULL, NULL),
(72, 4, 'Khagaria', NULL, NULL),
(73, 4, 'Kishanganj', NULL, NULL),
(74, 4, 'Kaimur', NULL, NULL),
(75, 4, 'Katihar', NULL, NULL),
(76, 4, 'Lakhisarai', NULL, NULL),
(77, 4, 'Madhubani', NULL, NULL),
(78, 4, 'Munger', NULL, NULL),
(79, 4, 'Madhepura', NULL, NULL),
(80, 4, 'Muzaffarpur', NULL, NULL),
(81, 4, 'Nalanda', NULL, NULL),
(82, 4, 'Nawada', NULL, NULL),
(83, 4, 'Patna', NULL, NULL),
(84, 4, 'Purnia', NULL, NULL),
(85, 4, 'Rohtas', NULL, NULL),
(86, 4, 'Saharsa', NULL, NULL),
(87, 4, 'Samastipur', NULL, NULL),
(88, 4, 'Sheohar', NULL, NULL),
(89, 4, 'Sheikhpura', NULL, NULL),
(90, 4, 'Saran', NULL, NULL),
(91, 4, 'Sitamarhi', NULL, NULL),
(92, 4, 'Supaul', NULL, NULL),
(93, 4, 'Siwan', NULL, NULL),
(94, 4, 'Vaishali', NULL, NULL),
(95, 4, 'Pashchim Champaran', NULL, NULL),
(96, 36, 'Bastar', NULL, NULL),
(97, 36, 'Bilaspur', NULL, NULL),
(98, 36, 'Dantewada', NULL, NULL),
(99, 36, 'Dhamtari', NULL, NULL),
(100, 36, 'Durg', NULL, NULL),
(101, 36, 'Jashpur', NULL, NULL),
(102, 36, 'Janjgir-Champa', NULL, NULL),
(103, 36, 'Korba', NULL, NULL),
(104, 36, 'Koriya', NULL, NULL),
(105, 36, 'Kanker', NULL, NULL),
(106, 36, 'Kawardha', NULL, NULL),
(107, 36, 'Mahasamund', NULL, NULL),
(108, 36, 'Raigarh', NULL, NULL),
(109, 36, 'Rajnandgaon', NULL, NULL),
(110, 36, 'Raipur', NULL, NULL),
(111, 36, 'Surguja', NULL, NULL),
(112, 29, 'Diu', NULL, NULL),
(113, 29, 'Daman', NULL, NULL),
(114, 25, 'Central Delhi', NULL, NULL),
(115, 25, 'East Delhi', NULL, NULL),
(116, 25, 'New Delhi', NULL, NULL),
(117, 25, 'North Delhi', NULL, NULL),
(118, 25, 'North East Delhi', NULL, NULL),
(119, 25, 'North West Delhi', NULL, NULL),
(120, 25, 'South Delhi', NULL, NULL),
(121, 25, 'South West Delhi', NULL, NULL),
(122, 25, 'West Delhi', NULL, NULL),
(123, 26, 'North Goa', NULL, NULL),
(124, 26, 'South Goa', NULL, NULL),
(125, 5, 'Ahmedabad', NULL, NULL),
(126, 5, 'Amreli District', NULL, NULL),
(127, 5, 'Anand', NULL, NULL),
(128, 5, 'Banaskantha', NULL, NULL),
(129, 5, 'Bharuch', NULL, NULL),
(130, 5, 'Bhavnagar', NULL, NULL),
(131, 5, 'Dahod', NULL, NULL),
(132, 5, 'The Dangs', NULL, NULL),
(133, 5, 'Gandhinagar', NULL, NULL),
(134, 5, 'Jamnagar', NULL, NULL),
(135, 5, 'Junagadh', NULL, NULL),
(136, 5, 'Kutch', NULL, NULL),
(137, 5, 'Kheda', NULL, NULL),
(138, 5, 'Mehsana', NULL, NULL),
(139, 5, 'Narmada', NULL, NULL),
(140, 5, 'Navsari', NULL, NULL),
(141, 5, 'Patan', NULL, NULL),
(142, 5, 'Panchmahal', NULL, NULL),
(143, 5, 'Porbandar', NULL, NULL),
(144, 5, 'Rajkot', NULL, NULL),
(145, 5, 'Sabarkantha', NULL, NULL),
(146, 5, 'Surendranagar', NULL, NULL),
(147, 5, 'Surat', NULL, NULL),
(148, 5, 'Vadodara', NULL, NULL),
(149, 5, 'Valsad', NULL, NULL),
(150, 6, 'Ambala', NULL, NULL),
(151, 6, 'Bhiwani', NULL, NULL),
(152, 6, 'Faridabad', NULL, NULL),
(153, 6, 'Fatehabad', NULL, NULL),
(154, 6, 'Gurgaon', NULL, NULL),
(155, 6, 'Hissar', NULL, NULL),
(156, 6, 'Jhajjar', NULL, NULL),
(157, 6, 'Jind', NULL, NULL),
(158, 6, 'Karnal', NULL, NULL),
(159, 6, 'Kaithal', NULL, NULL),
(160, 6, 'Kurukshetra', NULL, NULL),
(161, 6, 'Mahendragarh', NULL, NULL),
(162, 6, 'Mewat', NULL, NULL),
(163, 6, 'Panchkula', NULL, NULL),
(164, 6, 'Panipat', NULL, NULL),
(165, 6, 'Rewari', NULL, NULL),
(166, 6, 'Rohtak', NULL, NULL),
(167, 6, 'Sirsa', NULL, NULL),
(168, 6, 'Sonepat', NULL, NULL),
(169, 6, 'Yamuna Nagar', NULL, NULL),
(170, 6, 'Palwal', NULL, NULL),
(171, 7, 'Bilaspur', NULL, NULL),
(172, 7, 'Chamba', NULL, NULL),
(173, 7, 'Hamirpur', NULL, NULL),
(174, 7, 'Kangra', NULL, NULL),
(175, 7, 'Kinnaur', NULL, NULL),
(176, 7, 'Kulu', NULL, NULL),
(177, 7, 'Lahaul and Spiti', NULL, NULL),
(178, 7, 'Mandi', NULL, NULL),
(179, 7, 'Shimla', NULL, NULL),
(180, 7, 'Sirmaur', NULL, NULL),
(181, 7, 'Solan', NULL, NULL),
(182, 7, 'Una', NULL, NULL),
(183, 8, 'Anantnag', NULL, NULL),
(184, 8, 'Badgam', NULL, NULL),
(185, 8, 'Bandipore', NULL, NULL),
(186, 8, 'Baramula', NULL, NULL),
(187, 8, 'Doda', NULL, NULL),
(188, 8, 'Jammu', NULL, NULL),
(189, 8, 'Kargil', NULL, NULL),
(190, 8, 'Kathua', NULL, NULL),
(191, 8, 'Kupwara', NULL, NULL),
(192, 8, 'Leh', NULL, NULL),
(193, 8, 'Poonch', NULL, NULL),
(194, 8, 'Pulwama', NULL, NULL),
(195, 8, 'Rajauri', NULL, NULL),
(196, 8, 'Srinagar', NULL, NULL),
(197, 8, 'Samba', NULL, NULL),
(198, 8, 'Udhampur', NULL, NULL),
(199, 34, 'Bokaro', NULL, NULL),
(200, 34, 'Chatra', NULL, NULL),
(201, 34, 'Deoghar', NULL, NULL),
(202, 34, 'Dhanbad', NULL, NULL),
(203, 34, 'Dumka', NULL, NULL),
(204, 34, 'Purba Singhbhum', NULL, NULL),
(205, 34, 'Garhwa', NULL, NULL),
(206, 34, 'Giridih', NULL, NULL),
(207, 34, 'Godda', NULL, NULL),
(208, 34, 'Gumla', NULL, NULL),
(209, 34, 'Hazaribagh', NULL, NULL),
(210, 34, 'Koderma', NULL, NULL),
(211, 34, 'Lohardaga', NULL, NULL),
(212, 34, 'Pakur', NULL, NULL),
(213, 34, 'Palamu', NULL, NULL),
(214, 34, 'Ranchi', NULL, NULL),
(215, 34, 'Sahibganj', NULL, NULL),
(216, 34, 'Seraikela and Kharsawan', NULL, NULL),
(217, 34, 'Pashchim Singhbhum', NULL, NULL),
(218, 34, 'Ramgarh', NULL, NULL),
(219, 9, 'Bidar', NULL, NULL),
(220, 9, 'Belgaum', NULL, NULL),
(221, 9, 'Bijapur', NULL, NULL),
(222, 9, 'Bagalkot', NULL, NULL),
(223, 9, 'Bellary', NULL, NULL),
(224, 9, 'Bangalore Rural District', NULL, NULL),
(225, 9, 'Bangalore Urban District', NULL, NULL),
(226, 9, 'Chamarajnagar', NULL, NULL),
(227, 9, 'Chikmagalur', NULL, NULL),
(228, 9, 'Chitradurga', NULL, NULL),
(229, 9, 'Davanagere', NULL, NULL),
(230, 9, 'Dharwad', NULL, NULL),
(231, 9, 'Dakshina Kannada', NULL, NULL),
(232, 9, 'Gadag', NULL, NULL),
(233, 9, 'Gulbarga', NULL, NULL),
(234, 9, 'Hassan', NULL, NULL),
(235, 9, 'Haveri District', NULL, NULL),
(236, 9, 'Kodagu', NULL, NULL),
(237, 9, 'Kolar', NULL, NULL),
(238, 9, 'Koppal', NULL, NULL),
(239, 9, 'Mandya', NULL, NULL),
(240, 9, 'Mysore', NULL, NULL),
(241, 9, 'Raichur', NULL, NULL),
(242, 9, 'Shimoga', NULL, NULL),
(243, 9, 'Tumkur', NULL, NULL),
(244, 9, 'Udupi', NULL, NULL),
(245, 9, 'Uttara Kannada', NULL, NULL),
(246, 9, 'Ramanagara', NULL, NULL),
(247, 9, 'Chikballapur', NULL, NULL),
(248, 9, 'Yadagiri', NULL, NULL),
(249, 10, 'Alappuzha', NULL, NULL),
(250, 10, 'Ernakulam', NULL, NULL),
(251, 10, 'Idukki', NULL, NULL),
(252, 10, 'Kollam', NULL, NULL),
(253, 10, 'Kannur', NULL, NULL),
(254, 10, 'Kasaragod', NULL, NULL),
(255, 10, 'Kottayam', NULL, NULL),
(256, 10, 'Kozhikode', NULL, NULL),
(257, 10, 'Malappuram', NULL, NULL),
(258, 10, 'Palakkad', NULL, NULL),
(259, 10, 'Pathanamthitta', NULL, NULL),
(260, 10, 'Thrissur', NULL, NULL),
(261, 10, 'Thiruvananthapuram', NULL, NULL),
(262, 10, 'Wayanad', NULL, NULL),
(263, 11, 'Alirajpur', NULL, NULL),
(264, 11, 'Anuppur', NULL, NULL),
(265, 11, 'Ashok Nagar', NULL, NULL),
(266, 11, 'Balaghat', NULL, NULL),
(267, 11, 'Barwani', NULL, NULL),
(268, 11, 'Betul', NULL, NULL),
(269, 11, 'Bhind', NULL, NULL),
(270, 11, 'Bhopal', NULL, NULL),
(271, 11, 'Burhanpur', NULL, NULL),
(272, 11, 'Chhatarpur', NULL, NULL),
(273, 11, 'Chhindwara', NULL, NULL),
(274, 11, 'Damoh', NULL, NULL),
(275, 11, 'Datia', NULL, NULL),
(276, 11, 'Dewas', NULL, NULL),
(277, 11, 'Dhar', NULL, NULL),
(278, 11, 'Dindori', NULL, NULL),
(279, 11, 'Guna', NULL, NULL),
(280, 11, 'Gwalior', NULL, NULL),
(281, 11, 'Harda', NULL, NULL),
(282, 11, 'Hoshangabad', NULL, NULL),
(283, 11, 'Indore', NULL, NULL),
(284, 11, 'Jabalpur', NULL, NULL),
(285, 11, 'Jhabua', NULL, NULL),
(286, 11, 'Katni', NULL, NULL),
(287, 11, 'Khandwa', NULL, NULL),
(288, 11, 'Khargone', NULL, NULL),
(289, 11, 'Mandla', NULL, NULL),
(290, 11, 'Mandsaur', NULL, NULL),
(291, 11, 'Morena', NULL, NULL),
(292, 11, 'Narsinghpur', NULL, NULL),
(293, 11, 'Neemuch', NULL, NULL),
(294, 11, 'Panna', NULL, NULL),
(295, 11, 'Rewa', NULL, NULL),
(296, 11, 'Rajgarh', NULL, NULL),
(297, 11, 'Ratlam', NULL, NULL),
(298, 11, 'Raisen', NULL, NULL),
(299, 11, 'Sagar', NULL, NULL),
(300, 11, 'Satna', NULL, NULL),
(301, 11, 'Sehore', NULL, NULL),
(302, 11, 'Seoni', NULL, NULL),
(303, 11, 'Shahdol', NULL, NULL),
(304, 11, 'Shajapur', NULL, NULL),
(305, 11, 'Sheopur', NULL, NULL),
(306, 11, 'Shivpuri', NULL, NULL),
(307, 11, 'Sidhi', NULL, NULL),
(308, 11, 'Singrauli', NULL, NULL),
(309, 11, 'Tikamgarh', NULL, NULL),
(310, 11, 'Ujjain', NULL, NULL),
(311, 11, 'Umaria', NULL, NULL),
(312, 11, 'Vidisha', NULL, NULL),
(313, 12, 'Ahmednagar', NULL, NULL),
(314, 12, 'Akola', NULL, NULL),
(315, 12, 'Amrawati', NULL, NULL),
(316, 12, 'Aurangabad', NULL, NULL),
(317, 12, 'Bhandara', NULL, NULL),
(318, 12, 'Beed', NULL, NULL),
(319, 12, 'Buldhana', NULL, NULL),
(320, 12, 'Chandrapur', NULL, NULL),
(321, 12, 'Dhule', NULL, NULL),
(322, 12, 'Gadchiroli', NULL, NULL),
(323, 12, 'Gondiya', NULL, NULL),
(324, 12, 'Hingoli', NULL, NULL),
(325, 12, 'Jalgaon', NULL, NULL),
(326, 12, 'Jalna', NULL, NULL),
(327, 12, 'Kolhapur', NULL, NULL),
(328, 12, 'Latur', NULL, NULL),
(329, 12, 'Mumbai City', NULL, NULL),
(330, 12, 'Mumbai suburban', NULL, NULL),
(331, 12, 'Nandurbar', NULL, NULL),
(332, 12, 'Nanded', NULL, NULL),
(333, 12, 'Nagpur', NULL, NULL),
(334, 12, 'Nashik', NULL, NULL),
(335, 12, 'Osmanabad', NULL, NULL),
(336, 12, 'Parbhani', NULL, NULL),
(337, 12, 'Pune', NULL, NULL),
(338, 12, 'Raigad', NULL, NULL),
(339, 12, 'Ratnagiri', NULL, NULL),
(340, 12, 'Sindhudurg', NULL, NULL),
(341, 12, 'Sangli', NULL, NULL),
(342, 12, 'Solapur', NULL, NULL),
(343, 12, 'Satara', NULL, NULL),
(344, 12, 'Thane', NULL, NULL),
(345, 12, 'Wardha', NULL, NULL),
(346, 12, 'Washim', NULL, NULL),
(347, 12, 'Yavatmal', NULL, NULL),
(348, 13, 'Bishnupur', NULL, NULL),
(349, 13, 'Churachandpur', NULL, NULL),
(350, 13, 'Chandel', NULL, NULL),
(351, 13, 'Imphal East', NULL, NULL),
(352, 13, 'Senapati', NULL, NULL),
(353, 13, 'Tamenglong', NULL, NULL),
(354, 13, 'Thoubal', NULL, NULL),
(355, 13, 'Ukhrul', NULL, NULL),
(356, 13, 'Imphal West', NULL, NULL),
(357, 14, 'East Garo Hills', NULL, NULL),
(358, 14, 'East Khasi Hills', NULL, NULL),
(359, 14, 'Jaintia Hills', NULL, NULL),
(360, 14, 'Ri-Bhoi', NULL, NULL),
(361, 14, 'South Garo Hills', NULL, NULL),
(362, 14, 'West Garo Hills', NULL, NULL),
(363, 14, 'West Khasi Hills', NULL, NULL),
(364, 15, 'Aizawl', NULL, NULL),
(365, 15, 'Champhai', NULL, NULL),
(366, 15, 'Kolasib', NULL, NULL),
(367, 15, 'Lawngtlai', NULL, NULL),
(368, 15, 'Lunglei', NULL, NULL),
(369, 15, 'Mamit', NULL, NULL),
(370, 15, 'Saiha', NULL, NULL),
(371, 15, 'Serchhip', NULL, NULL),
(372, 16, 'Dimapur', NULL, NULL),
(373, 16, 'Kohima', NULL, NULL),
(374, 16, 'Mokokchung', NULL, NULL),
(375, 16, 'Mon', NULL, NULL),
(376, 16, 'Phek', NULL, NULL),
(377, 16, 'Tuensang', NULL, NULL),
(378, 16, 'Wokha', NULL, NULL),
(379, 16, 'Zunheboto', NULL, NULL),
(380, 17, 'Angul', NULL, NULL),
(381, 17, 'Boudh', NULL, NULL),
(382, 17, 'Bhadrak', NULL, NULL),
(383, 17, 'Bolangir', NULL, NULL),
(384, 17, 'Bargarh', NULL, NULL),
(385, 17, 'Baleswar', NULL, NULL),
(386, 17, 'Cuttack', NULL, NULL),
(387, 17, 'Debagarh', NULL, NULL),
(388, 17, 'Dhenkanal', NULL, NULL),
(389, 17, 'Ganjam', NULL, NULL),
(390, 17, 'Gajapati', NULL, NULL),
(391, 17, 'Jharsuguda', NULL, NULL),
(392, 17, 'Jajapur', NULL, NULL),
(393, 17, 'Jagatsinghpur', NULL, NULL),
(394, 17, 'Khordha', NULL, NULL),
(395, 17, 'Kendujhar', NULL, NULL),
(396, 17, 'Kalahandi', NULL, NULL),
(397, 17, 'Kandhamal', NULL, NULL),
(398, 17, 'Koraput', NULL, NULL),
(399, 17, 'Kendrapara', NULL, NULL),
(400, 17, 'Malkangiri', NULL, NULL),
(401, 17, 'Mayurbhanj', NULL, NULL),
(402, 17, 'Nabarangpur', NULL, NULL),
(403, 17, 'Nuapada', NULL, NULL),
(404, 17, 'Nayagarh', NULL, NULL),
(405, 17, 'Puri', NULL, NULL),
(406, 17, 'Rayagada', NULL, NULL),
(407, 17, 'Sambalpur', NULL, NULL),
(408, 17, 'Subarnapur', NULL, NULL),
(409, 17, 'Sundargarh', NULL, NULL),
(410, 27, 'Karaikal', NULL, NULL),
(411, 27, 'Mahe', NULL, NULL),
(412, 27, 'Puducherry', NULL, NULL),
(413, 27, 'Yanam', NULL, NULL),
(414, 18, 'Amritsar', NULL, NULL),
(415, 18, 'Bathinda', NULL, NULL),
(416, 18, 'Firozpur', NULL, NULL),
(417, 18, 'Faridkot', NULL, NULL),
(418, 18, 'Fatehgarh Sahib', NULL, NULL),
(419, 18, 'Gurdaspur', NULL, NULL),
(420, 18, 'Hoshiarpur', NULL, NULL),
(421, 18, 'Jalandhar', NULL, NULL),
(422, 18, 'Kapurthala', NULL, NULL),
(423, 18, 'Ludhiana', NULL, NULL),
(424, 18, 'Mansa', NULL, NULL),
(425, 18, 'Moga', NULL, NULL),
(426, 18, 'Mukatsar', NULL, NULL),
(427, 18, 'Nawan Shehar', NULL, NULL),
(428, 18, 'Patiala', NULL, NULL),
(429, 18, 'Rupnagar', NULL, NULL),
(430, 18, 'Sangrur', NULL, NULL),
(431, 19, 'Ajmer', NULL, NULL),
(432, 19, 'Alwar', NULL, NULL),
(433, 19, 'Bikaner', NULL, NULL),
(434, 19, 'Barmer', NULL, NULL),
(435, 19, 'Banswara', NULL, NULL),
(436, 19, 'Bharatpur', NULL, NULL),
(437, 19, 'Baran', NULL, NULL),
(438, 19, 'Bundi', NULL, NULL),
(439, 19, 'Bhilwara', NULL, NULL),
(440, 19, 'Churu', NULL, NULL),
(441, 19, 'Chittorgarh', NULL, NULL),
(442, 19, 'Dausa', NULL, NULL),
(443, 19, 'Dholpur', NULL, NULL),
(444, 19, 'Dungapur', NULL, NULL),
(445, 19, 'Ganganagar', NULL, NULL),
(446, 19, 'Hanumangarh', NULL, NULL),
(447, 19, 'Juhnjhunun', NULL, NULL),
(448, 19, 'Jalore', NULL, NULL),
(449, 19, 'Jodhpur', NULL, NULL),
(450, 19, 'Jaipur', NULL, NULL),
(451, 19, 'Jaisalmer', NULL, NULL),
(452, 19, 'Jhalawar', NULL, NULL),
(453, 19, 'Karauli', NULL, NULL),
(454, 19, 'Kota', NULL, NULL),
(455, 19, 'Nagaur', NULL, NULL),
(456, 19, 'Pali', NULL, NULL),
(457, 19, 'Pratapgarh', NULL, NULL),
(458, 19, 'Rajsamand', NULL, NULL),
(459, 19, 'Sikar', NULL, NULL),
(460, 19, 'Sawai Madhopur', NULL, NULL),
(461, 19, 'Sirohi', NULL, NULL),
(462, 19, 'Tonk', NULL, NULL),
(463, 19, 'Udaipur', NULL, NULL),
(464, 20, 'East Sikkim', NULL, NULL),
(465, 20, 'North Sikkim', NULL, NULL),
(466, 20, 'South Sikkim', NULL, NULL),
(467, 20, 'West Sikkim', NULL, NULL),
(468, 21, 'Ariyalur', NULL, NULL),
(469, 21, 'Chennai', NULL, NULL),
(470, 21, 'Coimbatore', NULL, NULL),
(471, 21, 'Cuddalore', NULL, NULL),
(472, 21, 'Dharmapuri', NULL, NULL),
(473, 21, 'Dindigul', NULL, NULL),
(474, 21, 'Erode', NULL, NULL),
(475, 21, 'Kanchipuram', NULL, NULL),
(476, 21, 'Kanyakumari', NULL, NULL),
(477, 21, 'Karur', NULL, NULL),
(478, 21, 'Madurai', NULL, NULL),
(479, 21, 'Nagapattinam', NULL, NULL),
(480, 21, 'The Nilgiris', NULL, NULL),
(481, 21, 'Namakkal', NULL, NULL),
(482, 21, 'Perambalur', NULL, NULL),
(483, 21, 'Pudukkottai', NULL, NULL),
(484, 21, 'Ramanathapuram', NULL, NULL),
(485, 21, 'Salem', NULL, NULL),
(486, 21, 'Sivagangai', NULL, NULL),
(487, 21, 'Tiruppur', NULL, NULL),
(488, 21, 'Tiruchirappalli', NULL, NULL),
(489, 21, 'Theni', NULL, NULL),
(490, 21, 'Tirunelveli', NULL, NULL),
(491, 21, 'Thanjavur', NULL, NULL),
(492, 21, 'Thoothukudi', NULL, NULL),
(493, 21, 'Thiruvallur', NULL, NULL),
(494, 21, 'Thiruvarur', NULL, NULL),
(495, 21, 'Tiruvannamalai', NULL, NULL),
(496, 21, 'Vellore', NULL, NULL),
(497, 21, 'Villupuram', NULL, NULL),
(498, 22, 'Dhalai', NULL, NULL),
(499, 22, 'North Tripura', NULL, NULL),
(500, 22, 'South Tripura', NULL, NULL),
(501, 22, 'West Tripura', NULL, NULL),
(502, 33, 'Almora', NULL, NULL),
(503, 33, 'Bageshwar', NULL, NULL),
(504, 33, 'Chamoli', NULL, NULL),
(505, 33, 'Champawat', NULL, NULL),
(506, 33, 'Dehradun', NULL, NULL),
(507, 33, 'Haridwar', NULL, NULL),
(508, 33, 'Nainital', NULL, NULL),
(509, 33, 'Pauri Garhwal', NULL, NULL),
(510, 33, 'Pithoragharh', NULL, NULL),
(511, 33, 'Rudraprayag', NULL, NULL),
(512, 33, 'Tehri Garhwal', NULL, NULL),
(513, 33, 'Udham Singh Nagar', NULL, NULL),
(514, 33, 'Uttarkashi', NULL, NULL),
(515, 23, 'Agra', NULL, NULL),
(516, 23, 'Allahabad', NULL, NULL),
(517, 23, 'Aligarh', NULL, NULL),
(518, 23, 'Ambedkar Nagar', NULL, NULL),
(519, 23, 'Auraiya', NULL, NULL),
(520, 23, 'Azamgarh', NULL, NULL),
(521, 23, 'Barabanki', NULL, NULL),
(522, 23, 'Badaun', NULL, NULL),
(523, 23, 'Bagpat', NULL, NULL),
(524, 23, 'Bahraich', NULL, NULL),
(525, 23, 'Bijnor', NULL, NULL),
(526, 23, 'Ballia', NULL, NULL),
(527, 23, 'Banda', NULL, NULL),
(528, 23, 'Balrampur', NULL, NULL),
(529, 23, 'Bareilly', NULL, NULL),
(530, 23, 'Basti', NULL, NULL),
(531, 23, 'Bulandshahr', NULL, NULL),
(532, 23, 'Chandauli', NULL, NULL),
(533, 23, 'Chitrakoot', NULL, NULL),
(534, 23, 'Deoria', NULL, NULL),
(535, 23, 'Etah', NULL, NULL),
(536, 23, 'Kanshiram Nagar', NULL, NULL),
(537, 23, 'Etawah', NULL, NULL),
(538, 23, 'Firozabad', NULL, NULL),
(539, 23, 'Farrukhabad', NULL, NULL),
(540, 23, 'Fatehpur', NULL, NULL),
(541, 23, 'Faizabad', NULL, NULL),
(542, 23, 'Gautam Buddha Nagar', NULL, NULL),
(543, 23, 'Gonda', NULL, NULL),
(544, 23, 'Ghazipur', NULL, NULL),
(545, 23, 'Gorkakhpur', NULL, NULL),
(546, 23, 'Ghaziabad', NULL, NULL),
(547, 23, 'Hamirpur', NULL, NULL),
(548, 23, 'Hardoi', NULL, NULL),
(549, 23, 'Mahamaya Nagar', NULL, NULL),
(550, 23, 'Jhansi', NULL, NULL),
(551, 23, 'Jalaun', NULL, NULL),
(552, 23, 'Jyotiba Phule Nagar', NULL, NULL),
(553, 23, 'Jaunpur District', NULL, NULL),
(554, 23, 'Kanpur Dehat', NULL, NULL),
(555, 23, 'Kannauj', NULL, NULL),
(556, 23, 'Kanpur Nagar', NULL, NULL),
(557, 23, 'Kaushambi', NULL, NULL),
(558, 23, 'Kushinagar', NULL, NULL),
(559, 23, 'Lalitpur', NULL, NULL),
(560, 23, 'Lakhimpur Kheri', NULL, NULL),
(561, 23, 'Lucknow', NULL, NULL),
(562, 23, 'Mau', NULL, NULL),
(563, 23, 'Meerut', NULL, NULL),
(564, 23, 'Maharajganj', NULL, NULL),
(565, 23, 'Mahoba', NULL, NULL),
(566, 23, 'Mirzapur', NULL, NULL),
(567, 23, 'Moradabad', NULL, NULL),
(568, 23, 'Mainpuri', NULL, NULL),
(569, 23, 'Mathura', NULL, NULL),
(570, 23, 'Muzaffarnagar', NULL, NULL),
(571, 23, 'Pilibhit', NULL, NULL),
(572, 23, 'Pratapgarh', NULL, NULL),
(573, 23, 'Rampur', NULL, NULL),
(574, 23, 'Rae Bareli', NULL, NULL),
(575, 23, 'Saharanpur', NULL, NULL),
(576, 23, 'Sitapur', NULL, NULL),
(577, 23, 'Shahjahanpur', NULL, NULL),
(578, 23, 'Sant Kabir Nagar', NULL, NULL),
(579, 23, 'Siddharthnagar', NULL, NULL),
(580, 23, 'Sonbhadra', NULL, NULL),
(581, 23, 'Sant Ravidas Nagar', NULL, NULL),
(582, 23, 'Sultanpur', NULL, NULL),
(583, 23, 'Shravasti', NULL, NULL),
(584, 23, 'Unnao', NULL, NULL),
(585, 23, 'Varanasi', NULL, NULL),
(586, 24, 'Birbhum', NULL, NULL),
(587, 24, 'Bankura', NULL, NULL),
(588, 24, 'Bardhaman', NULL, NULL),
(589, 24, 'Darjeeling', NULL, NULL),
(590, 24, 'Dakshin Dinajpur', NULL, NULL),
(591, 24, 'Hooghly', NULL, NULL),
(592, 24, 'Howrah', NULL, NULL),
(593, 24, 'Jalpaiguri', NULL, NULL),
(594, 24, 'Cooch Behar', NULL, NULL),
(595, 24, 'Kolkata', NULL, NULL),
(596, 24, 'Malda', NULL, NULL),
(597, 24, 'Midnapore', NULL, NULL),
(598, 24, 'Murshidabad', NULL, NULL),
(599, 24, 'Nadia', NULL, NULL),
(600, 24, 'North 24 Parganas', NULL, NULL),
(601, 24, 'South 24 Parganas', NULL, NULL),
(602, 24, 'Purulia', NULL, NULL),
(603, 24, 'Uttar Dinajpur', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_billings`
--

CREATE TABLE `client_billings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `transaction_type` varchar(255) DEFAULT NULL,
  `monthly_fee` varchar(255) DEFAULT NULL,
  `discount` decimal(10,0) DEFAULT NULL,
  `no_of_moths` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `receipt_method` varchar(255) DEFAULT NULL,
  `balance` decimal(10,0) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `description` text,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_billings`
--

INSERT INTO `client_billings` (`id`, `user_id`, `client_id`, `center_id`, `package_id`, `transaction_type`, `monthly_fee`, `discount`, `no_of_moths`, `start_date`, `end_date`, `receipt_method`, `balance`, `amount`, `reference`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(43, 457, 1003, NULL, 36, NULL, NULL, 0, NULL, '2024-11-22', '2024-11-23', '0', 15000, 5000, NULL, 'Total Balance 15000.00, Payable Balance 15000.00, Currently Paid 5000 Remaining Amount 10000, Date[2024-11-22/2024-11-23 ] , Plan Type- Daily', 1, '2024-11-21 23:43:34', '2024-11-21 23:43:34'),
(44, 457, 1003, NULL, 37, NULL, NULL, 0, NULL, '2024-11-22', '2024-12-22', '0', 80000, 80000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 80000 Remaining Amount 0, Date[2024-11-22/2024-12-22 ] , Plan Type- Monthly Men Membership', 1, '2024-11-21 23:46:30', '2024-11-21 23:46:30'),
(50, 458, 1004, NULL, 37, NULL, NULL, 0, NULL, '2024-11-22', '2024-12-22', '0', 80000, 80000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 10000 Remaining Amount 70000, Date[2024-11-22/2024-12-22 ] , Plan Type- Monthly Men Membership', 1, '2024-11-22 04:09:33', '2024-11-22 04:09:33'),
(51, 458, 1004, NULL, 37, NULL, NULL, 0, NULL, '2024-11-22', '2024-12-22', '0', 80000, 80000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 10000 Remaining Amount 70000, Date[2024-11-22/2024-12-22 ] , Plan Type- Monthly Men Membership', 1, '2024-11-22 04:35:09', '2024-11-22 04:35:09'),
(55, 464, 1006, NULL, 38, NULL, NULL, 0, NULL, '2024-11-26', '2024-12-26', '0', 60000, 60000, NULL, 'Total Balance 60000.00, Payable Balance 60000.00, Currently Paid 50000 Remaining Amount 10000, Date[2024-11-26/2024-12-26 ] , Plan Type- Monthly Women Membership', 1, '2024-11-26 10:38:10', '2024-11-26 10:38:10'),
(56, 464, 1006, NULL, 38, NULL, NULL, 0, NULL, '2024-11-29', '2024-12-29', '0', 60000, 40500, NULL, 'Total Balance 60000.00, Payable Balance 60000.00, Currently Paid 20000 Remaining Amount 40000, Date[2024-11-29/2024-12-29 ] , Plan Type- Monthly Women Membership', 1, '2024-11-29 04:28:55', '2024-11-29 04:28:55'),
(57, 465, 1007, NULL, 37, NULL, NULL, 0, NULL, '2024-11-29', '2024-12-29', '0', 80000, 80000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 10000 Remaining Amount 70000, Date[2024-11-29/2024-12-29 ] , Plan Type- Monthly Men Membership', 1, '2024-11-29 05:43:39', '2024-11-29 05:43:39'),
(58, 466, 1008, NULL, 37, NULL, NULL, 0, NULL, '2024-11-29', '2025-01-17', '0', 80000, 30000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 10000 Remaining Amount 70000, Date[2024-11-29/2024-12-29 ] , Plan Type- Monthly Men Membership', 1, '2024-11-29 05:59:07', '2024-11-29 05:59:07'),
(60, 469, 1010, NULL, 37, NULL, NULL, 0, NULL, '2024-12-17', '2025-02-03', '0', 80000, 80000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 80000 Remaining Amount 0, Date[2024-12-17/2025-01-16 ] , Plan Type- Monthly Men Membership', 1, '2024-12-17 06:10:57', '2024-12-17 06:10:57'),
(61, 470, 1011, NULL, 39, NULL, NULL, 0, NULL, '2024-12-23', '2024-12-28', '0', 60000, 60000, NULL, 'Total Balance 60000.00, Payable Balance 60000.00, Currently Paid 5000 Remaining Amount 55000, Date[2024-12-23/2024-12-30 ] , Plan Type- Weekly', 1, '2024-12-18 23:53:10', '2024-12-18 23:53:10'),
(66, 473, 1012, NULL, 37, NULL, NULL, 0, NULL, '2025-01-01', '2025-01-31', '0', 80000, 60000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 60000 Remaining Amount 20000, Date[2025-01-01/2025-01-31 ] , Plan Type- Monthly Men Membership', 1, '2025-01-01 08:08:54', '2025-01-01 08:08:54'),
(68, 476, 1014, NULL, 37, NULL, NULL, 0, NULL, '2025-01-20', '2025-02-19', '0', 80000, 80000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 80000 Remaining Amount 0, Date[2025-01-20/2025-02-19 ] , Plan Type- Monthly Men Membership', 1, '2025-01-16 12:13:58', '2025-01-16 12:13:58'),
(69, 477, 1015, NULL, 41, NULL, NULL, 3750, NULL, '2025-01-20', '2025-01-27', '0', 21250, 21250, NULL, 'Total Balance 25000.00, Payable Balance 21250, Currently Paid 15000 Remaining Amount 6250, Date[2025-01-20/2025-01-27 ] , Plan Type- One Week Men', 1, '2025-01-16 12:35:37', '2025-01-16 12:35:37'),
(70, 479, 1017, NULL, 37, NULL, NULL, 0, NULL, '2025-01-01', '2025-01-31', '0', 80000, 80000, NULL, 'Total Balance 80000.00, Payable Balance 80000.00, Currently Paid 60000 Remaining Amount 20000, Date[2025-01-01/2025-01-31 ] , Plan Type- Monthly Men Membership', 1, '2025-01-16 12:55:26', '2025-01-16 12:55:26'),
(72, 480, 1018, NULL, 45, NULL, NULL, 0, NULL, '2025-01-01', '2025-01-31', '0', 50, 50, NULL, 'Total Balance 50.00, Payable Balance 50.00, Currently Paid 50 Remaining Amount 0, Date[2025-01-01/2025-01-31 ] , Plan Type- Testing Final', 1, '2025-01-16 13:11:05', '2025-01-16 13:11:05'),
(74, 483, 1019, NULL, 38, NULL, NULL, 0, NULL, '2025-01-21', '2025-02-20', '0', 60000, 80000, NULL, 'Total Balance 60000.00, Payable Balance 60000.00, Currently Paid 80000 Remaining Amount -20000, Date[2025-01-21/2025-02-20 ] , Plan Type- Monthly Women Membership', 482, '2025-01-21 10:25:23', '2025-01-21 10:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `client_billing_payment_histories`
--

CREATE TABLE `client_billing_payment_histories` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `payedAmount` int(11) DEFAULT NULL,
  `remaining_balance` int(11) DEFAULT NULL,
  `client_billing_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_billing_payment_histories`
--

INSERT INTO `client_billing_payment_histories` (`id`, `amount`, `balance`, `payedAmount`, `remaining_balance`, `client_billing_id`, `created_at`) VALUES
(9, 10500, 80000, 500, 69000, 48, '2024-11-22 09:23:47'),
(10, 11000, 80000, 8000, 61000, 48, '2024-11-22 09:24:08'),
(11, 10000, 80000, 50000, 20000, 50, '2024-11-22 09:39:44'),
(12, 60000, 80000, 20000, 0, 50, '2024-11-22 09:39:58'),
(13, 10000, 80000, 50000, 20000, 51, '2024-11-22 10:05:22'),
(14, 60000, 80000, 10000, 10000, 51, '2024-11-22 10:06:01'),
(15, 40000, 60000, 30000, -10000, 52, '2024-11-26 06:07:05'),
(16, 70000, 80000, 10000, 0, 54, '2024-11-26 16:06:25'),
(17, 70000, 80000, 10000, 0, 51, '2024-11-26 16:16:32'),
(18, 50000, 60000, 10000, 0, 55, '2024-11-28 15:00:17'),
(19, 20000, 60000, 20000, 20000, 56, '2024-11-29 09:59:08'),
(20, 25000, 60000, 2000, 33000, 42, '2024-11-29 10:00:03'),
(21, 10000, 80000, 20000, 50000, 57, '2024-11-29 11:18:53'),
(22, 30000, 80000, 10000, 40000, 57, '2024-11-29 11:20:46'),
(23, 10000, 80000, 20000, 50000, 58, '2024-11-29 11:29:39'),
(24, 40000, 60000, 500, 19500, 56, '2024-11-29 11:33:05'),
(25, 27000, 60000, 30000, 3000, 42, '2024-12-04 08:31:29'),
(26, 57000, 60000, 2000, 1000, 42, '2024-12-04 08:32:18'),
(27, 40000, 80000, 40000, 0, 57, '2024-12-04 14:17:59'),
(28, 5000, 60000, 50000, 5000, 61, '2024-12-19 05:23:20'),
(29, 40000, 50000, 10000, 0, 62, '2025-01-01 12:41:35'),
(30, 55000, 60000, 5000, 0, 61, '2025-01-01 12:47:53'),
(31, 40000, 60000, 20000, 0, 63, '2025-01-01 12:55:01'),
(32, 15000, 21250, 6250, 0, 69, '2025-01-16 18:06:51'),
(33, 60000, 80000, 20000, 0, 70, '2025-01-16 18:26:12'),
(34, 60000, 80000, 20000, 0, 71, '2025-01-16 18:32:48');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `center_id` int(10) UNSIGNED NOT NULL,
  `coupon_start_date` date NOT NULL,
  `coupon_end_date` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1: active, 2: inactive',
  `comments` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `amount`, `percentage`, `center_id`, `coupon_start_date`, `coupon_end_date`, `status`, `comments`, `created_at`, `updated_at`) VALUES
(1, 'WELCOME10', 500.00, 15.00, 2, '2024-08-10', '2024-08-16', '1', 'Welcome Coupon', '2024-07-11 07:50:57', '2024-07-11 07:50:57'),
(2, 'WELCOME10', 500.00, 15.00, 2, '2024-07-11', '2024-07-20', '1', 'Welcome Coupon', '2024-07-11 07:51:13', '2024-07-11 07:51:13'),
(3, 'Renewal Discount 15 % Off', 500.00, 15.00, 2, '2024-07-25', '2024-08-10', '1', 'Renewal Discount', '2024-07-26 06:41:08', '2024-07-26 06:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `type_of_expenses` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_id` int(11) DEFAULT NULL,
  `expense_date` date NOT NULL,
  `payment_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `title`, `amount`, `type_of_expenses`, `center_id`, `expense_date`, `payment_mode`, `remark`, `created_by`, `updated_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(84, NULL, 2000.00, 'Others', NULL, '2025-01-01', NULL, NULL, 1, NULL, NULL, NULL, '2025-01-01 07:30:56', '2025-01-01 07:30:56'),
(85, NULL, 450.00, 'Staff Salary', NULL, '2025-01-04', NULL, NULL, 1, NULL, NULL, NULL, '2025-01-04 11:26:39', '2025-01-04 11:26:39'),
(86, NULL, 1000000.00, 'Rent', NULL, '2025-01-21', NULL, 'paid monthly rent', 482, NULL, NULL, NULL, '2025-01-21 10:28:34', '2025-01-21 10:28:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finger_devices`
--

CREATE TABLE `finger_devices` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_users_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `manual_price` decimal(10,0) DEFAULT NULL,
  `membership_type` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members_plans`
--

CREATE TABLE `members_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `assigned_users_id` int(11) DEFAULT NULL,
  `package_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `center_id` int(10) UNSIGNED DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1: general, 2: personal',
  `type` int(11) NOT NULL DEFAULT '0',
  `package_timing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1: normal hours, 2: sunny hours',
  `package_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1: main, 2: add on',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `renew_start_date` date DEFAULT NULL,
  `renew_end_date` date DEFAULT NULL,
  `renew_no_of_days` int(11) DEFAULT NULL,
  `manual_price` decimal(10,2) DEFAULT NULL,
  `membership_type` tinyint(1) DEFAULT NULL COMMENT '0: package, 1: menual_type',
  `show_at_advicefit_platform` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '1: active, 2: inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members_plans`
--

INSERT INTO `members_plans` (`id`, `user_id`, `package_id`, `assigned_users_id`, `package_name`, `price`, `center_id`, `no_of_days`, `product_type`, `training_type`, `type`, `package_timing`, `package_type`, `date_from`, `date_to`, `renew_start_date`, `renew_end_date`, `renew_no_of_days`, `manual_price`, `membership_type`, `show_at_advicefit_platform`, `status`, `created_at`, `updated_at`) VALUES
(1, 391, 1, 2, 'Annual year', 550000.00, 1, 365, NULL, '1', 0, NULL, NULL, '2024-10-29', '2025-10-29', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-10-29 00:06:00', '2024-10-29 00:06:00'),
(3, 391, 3, 2, 'Monthly Women', 80000.00, 1, 30, NULL, '3', 0, NULL, NULL, '2024-10-01', '2024-10-31', NULL, NULL, NULL, NULL, 0, 0, 2, '2024-10-29 00:24:17', '2024-10-29 00:24:17'),
(5, 390, 2, 2, 'Monthly Men', 80000.00, 1, 30, NULL, '2', 0, NULL, NULL, '2024-10-02', '2024-11-01', NULL, NULL, NULL, NULL, 0, 0, 2, '2024-10-29 00:35:20', '2024-10-29 00:35:20'),
(6, 392, 1, 2, 'Annual year', 550000.00, 1, 365, NULL, '1', 0, NULL, NULL, '2024-10-29', '2025-10-29', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-10-29 01:22:50', '2024-10-29 01:22:50'),
(7, 392, 2, 2, 'Monthly Men', 80000.00, 1, 30, NULL, '2', 0, NULL, NULL, '2024-10-02', '2024-11-01', NULL, NULL, NULL, NULL, 0, 0, 2, '2024-10-29 01:23:32', '2024-10-29 01:23:32'),
(8, 394, 2, 2, 'Monthly Men', 80000.00, 1, 30, NULL, '2', 0, NULL, NULL, '2024-09-29', '2024-10-29', NULL, NULL, NULL, NULL, 0, 0, 2, '2024-10-29 02:27:40', '2024-10-29 02:27:40'),
(43, 457, 36, 2, 'Daily', 15000.00, 1, 1, NULL, '1', 1, NULL, NULL, '2024-11-22', '2024-11-23', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-11-21 23:43:34', '2024-11-21 23:43:34'),
(44, 457, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2024-11-22', '2024-12-22', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-11-21 23:46:30', '2024-11-21 23:46:30'),
(50, 458, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2024-11-22', '2024-12-22', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-11-22 04:09:33', '2024-11-22 04:09:33'),
(51, 458, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2024-11-22', '2024-12-22', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-11-22 04:35:09', '2024-11-22 04:35:09'),
(55, 464, 38, 2, 'Monthly Women Membership', 60000.00, 1, 30, NULL, '3', 0, NULL, '1', '2024-11-26', '2024-12-26', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-11-26 10:38:10', '2024-11-26 10:38:10'),
(56, 464, 38, 2, 'Monthly Women Membership', 60000.00, 1, 30, NULL, '3', 0, NULL, '1', '2024-11-29', '2024-12-29', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-11-29 04:28:55', '2024-11-29 04:28:55'),
(57, 465, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2024-11-29', '2024-12-29', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-11-29 05:43:39', '2024-11-29 05:43:39'),
(58, 466, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2024-11-29', '2024-12-29', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-11-29 05:59:07', '2024-11-29 05:59:07'),
(60, 469, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2024-12-17', '2025-01-16', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-12-17 06:10:57', '2024-12-17 06:10:57'),
(61, 470, 39, 2, 'Weekly', 60000.00, 1, 7, NULL, '1', 0, NULL, NULL, '2024-12-23', '2024-12-30', NULL, NULL, NULL, NULL, 0, 0, 1, '2024-12-18 23:53:10', '2024-12-18 23:53:10'),
(66, 473, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2025-01-01', '2025-01-31', NULL, NULL, NULL, NULL, 0, 0, 1, '2025-01-01 08:08:54', '2025-01-01 08:08:54'),
(68, 476, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2025-01-20', '2025-02-19', NULL, NULL, NULL, NULL, 0, 0, 1, '2025-01-16 12:13:58', '2025-01-16 12:13:58'),
(69, 477, 41, 2, 'One Week Men', 25000.00, 1, 7, NULL, '2', 0, NULL, NULL, '2025-01-20', '2025-01-27', NULL, NULL, NULL, NULL, 0, 0, 1, '2025-01-16 12:35:37', '2025-01-16 12:35:37'),
(70, 479, 37, 2, 'Monthly Men Membership', 80000.00, 1, 30, NULL, '2', 0, NULL, '1', '2025-01-01', '2025-01-31', NULL, NULL, NULL, NULL, 0, 0, 1, '2025-01-16 12:55:26', '2025-01-16 12:55:26'),
(72, 480, 45, 2, 'Testing Final', 50.00, 1, 30, NULL, '1', 0, NULL, NULL, '2025-01-01', '2025-01-31', NULL, NULL, NULL, NULL, 0, 0, 1, '2025-01-16 13:11:05', '2025-01-16 13:11:05'),
(74, 483, 38, 2, 'Monthly Women Membership', 60000.00, 1, 30, NULL, '3', 0, NULL, '1', '2025-01-21', '2025-02-20', NULL, NULL, NULL, NULL, 0, 0, 1, '2025-01-21 10:25:23', '2025-01-21 10:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_07_10_053426_create_sources_table', 2),
(6, '2024_07_10_053520_create_occupations_table', 2),
(7, '2024_07_10_053709_create_cities_table', 2),
(8, '2024_07_10_053725_create_states_table', 2),
(9, '2024_07_10_054539_create_addresses_table', 2),
(10, '2024_07_10_063209_create_centers_table', 3),
(11, '2014_10_12_100000_create_password_resets_table', 4),
(12, '2024_07_11_053000_create_members_table', 4),
(13, '2024_07_11_060838_create_packages_table', 5),
(14, '2024_07_11_122711_create_coupons_table', 6),
(15, '2024_07_11_123819_create_coupons_table', 7),
(16, '2024_07_15_051727_create_sessions_table', 8),
(17, '2024_07_15_063043_create_permission_tables', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(15, 'App\\Models\\User', 1),
(17, 'App\\Models\\User', 7),
(20, 'App\\Models\\User', 82),
(20, 'App\\Models\\User', 84),
(20, 'App\\Models\\User', 85),
(20, 'App\\Models\\User', 88),
(20, 'App\\Models\\User', 95),
(20, 'App\\Models\\User', 96),
(20, 'App\\Models\\User', 97),
(20, 'App\\Models\\User', 98),
(20, 'App\\Models\\User', 99),
(20, 'App\\Models\\User', 100),
(20, 'App\\Models\\User', 101),
(20, 'App\\Models\\User', 102),
(20, 'App\\Models\\User', 103),
(20, 'App\\Models\\User', 104),
(20, 'App\\Models\\User', 105),
(20, 'App\\Models\\User', 106),
(20, 'App\\Models\\User', 107),
(20, 'App\\Models\\User', 108),
(20, 'App\\Models\\User', 110),
(20, 'App\\Models\\User', 115),
(20, 'App\\Models\\User', 126),
(20, 'App\\Models\\User', 128),
(20, 'App\\Models\\User', 129),
(20, 'App\\Models\\User', 132),
(20, 'App\\Models\\User', 133),
(20, 'App\\Models\\User', 134),
(20, 'App\\Models\\User', 135),
(20, 'App\\Models\\User', 136),
(20, 'App\\Models\\User', 137),
(20, 'App\\Models\\User', 138),
(20, 'App\\Models\\User', 139),
(20, 'App\\Models\\User', 140),
(20, 'App\\Models\\User', 141),
(20, 'App\\Models\\User', 142),
(20, 'App\\Models\\User', 143),
(20, 'App\\Models\\User', 144),
(20, 'App\\Models\\User', 145),
(20, 'App\\Models\\User', 146),
(20, 'App\\Models\\User', 147),
(20, 'App\\Models\\User', 148),
(20, 'App\\Models\\User', 149),
(20, 'App\\Models\\User', 150),
(20, 'App\\Models\\User', 151),
(20, 'App\\Models\\User', 152),
(20, 'App\\Models\\User', 157),
(20, 'App\\Models\\User', 159),
(20, 'App\\Models\\User', 160),
(20, 'App\\Models\\User', 161),
(20, 'App\\Models\\User', 162),
(20, 'App\\Models\\User', 163),
(20, 'App\\Models\\User', 165),
(20, 'App\\Models\\User', 166),
(20, 'App\\Models\\User', 167),
(20, 'App\\Models\\User', 168),
(20, 'App\\Models\\User', 169),
(20, 'App\\Models\\User', 170),
(20, 'App\\Models\\User', 171),
(20, 'App\\Models\\User', 172),
(20, 'App\\Models\\User', 173),
(20, 'App\\Models\\User', 174),
(20, 'App\\Models\\User', 179),
(20, 'App\\Models\\User', 180),
(20, 'App\\Models\\User', 181),
(20, 'App\\Models\\User', 182),
(20, 'App\\Models\\User', 187),
(20, 'App\\Models\\User', 200),
(20, 'App\\Models\\User', 201),
(20, 'App\\Models\\User', 203),
(22, 'App\\Models\\User', 204),
(20, 'App\\Models\\User', 205),
(20, 'App\\Models\\User', 206),
(20, 'App\\Models\\User', 207),
(20, 'App\\Models\\User', 208),
(20, 'App\\Models\\User', 209),
(20, 'App\\Models\\User', 210),
(20, 'App\\Models\\User', 211),
(20, 'App\\Models\\User', 218),
(20, 'App\\Models\\User', 244),
(20, 'App\\Models\\User', 245),
(20, 'App\\Models\\User', 246),
(20, 'App\\Models\\User', 247),
(20, 'App\\Models\\User', 248),
(20, 'App\\Models\\User', 249),
(20, 'App\\Models\\User', 250),
(20, 'App\\Models\\User', 251),
(20, 'App\\Models\\User', 252),
(20, 'App\\Models\\User', 254),
(20, 'App\\Models\\User', 255),
(20, 'App\\Models\\User', 256),
(20, 'App\\Models\\User', 257),
(20, 'App\\Models\\User', 258),
(20, 'App\\Models\\User', 259),
(20, 'App\\Models\\User', 260),
(20, 'App\\Models\\User', 261),
(20, 'App\\Models\\User', 262),
(20, 'App\\Models\\User', 263),
(20, 'App\\Models\\User', 264),
(20, 'App\\Models\\User', 265),
(20, 'App\\Models\\User', 266),
(20, 'App\\Models\\User', 267),
(20, 'App\\Models\\User', 268),
(20, 'App\\Models\\User', 269),
(20, 'App\\Models\\User', 270),
(20, 'App\\Models\\User', 271),
(20, 'App\\Models\\User', 272),
(20, 'App\\Models\\User', 276),
(20, 'App\\Models\\User', 277),
(20, 'App\\Models\\User', 278),
(20, 'App\\Models\\User', 279),
(20, 'App\\Models\\User', 280),
(20, 'App\\Models\\User', 281),
(20, 'App\\Models\\User', 282),
(20, 'App\\Models\\User', 283),
(20, 'App\\Models\\User', 284),
(20, 'App\\Models\\User', 285),
(20, 'App\\Models\\User', 286),
(20, 'App\\Models\\User', 287),
(20, 'App\\Models\\User', 288),
(20, 'App\\Models\\User', 289),
(20, 'App\\Models\\User', 290),
(20, 'App\\Models\\User', 291),
(20, 'App\\Models\\User', 292),
(20, 'App\\Models\\User', 293),
(20, 'App\\Models\\User', 294),
(20, 'App\\Models\\User', 295),
(20, 'App\\Models\\User', 297),
(20, 'App\\Models\\User', 298),
(20, 'App\\Models\\User', 299),
(20, 'App\\Models\\User', 300),
(20, 'App\\Models\\User', 301),
(20, 'App\\Models\\User', 302),
(20, 'App\\Models\\User', 303),
(20, 'App\\Models\\User', 304),
(20, 'App\\Models\\User', 305),
(20, 'App\\Models\\User', 306),
(20, 'App\\Models\\User', 307),
(20, 'App\\Models\\User', 308),
(20, 'App\\Models\\User', 310),
(20, 'App\\Models\\User', 311),
(20, 'App\\Models\\User', 313),
(20, 'App\\Models\\User', 314),
(20, 'App\\Models\\User', 315),
(20, 'App\\Models\\User', 316),
(20, 'App\\Models\\User', 317),
(20, 'App\\Models\\User', 318),
(20, 'App\\Models\\User', 322),
(20, 'App\\Models\\User', 325),
(20, 'App\\Models\\User', 326),
(20, 'App\\Models\\User', 327),
(20, 'App\\Models\\User', 328),
(20, 'App\\Models\\User', 329),
(20, 'App\\Models\\User', 330),
(20, 'App\\Models\\User', 331),
(20, 'App\\Models\\User', 333),
(20, 'App\\Models\\User', 334),
(20, 'App\\Models\\User', 335),
(20, 'App\\Models\\User', 336),
(20, 'App\\Models\\User', 337),
(20, 'App\\Models\\User', 339),
(20, 'App\\Models\\User', 340),
(20, 'App\\Models\\User', 341),
(20, 'App\\Models\\User', 342),
(20, 'App\\Models\\User', 343),
(20, 'App\\Models\\User', 344),
(20, 'App\\Models\\User', 345),
(20, 'App\\Models\\User', 346),
(20, 'App\\Models\\User', 347),
(20, 'App\\Models\\User', 348),
(20, 'App\\Models\\User', 350),
(20, 'App\\Models\\User', 351),
(20, 'App\\Models\\User', 353),
(20, 'App\\Models\\User', 354),
(20, 'App\\Models\\User', 357),
(20, 'App\\Models\\User', 358),
(20, 'App\\Models\\User', 359),
(20, 'App\\Models\\User', 360),
(20, 'App\\Models\\User', 361),
(20, 'App\\Models\\User', 365),
(20, 'App\\Models\\User', 366),
(20, 'App\\Models\\User', 367),
(20, 'App\\Models\\User', 370),
(20, 'App\\Models\\User', 371),
(20, 'App\\Models\\User', 372),
(20, 'App\\Models\\User', 373),
(20, 'App\\Models\\User', 377),
(20, 'App\\Models\\User', 378),
(20, 'App\\Models\\User', 379),
(20, 'App\\Models\\User', 382),
(20, 'App\\Models\\User', 383),
(20, 'App\\Models\\User', 384),
(20, 'App\\Models\\User', 385),
(20, 'App\\Models\\User', 387),
(20, 'App\\Models\\User', 388),
(20, 'App\\Models\\User', 389),
(20, 'App\\Models\\User', 390),
(20, 'App\\Models\\User', 391),
(20, 'App\\Models\\User', 392),
(20, 'App\\Models\\User', 393),
(20, 'App\\Models\\User', 394),
(20, 'App\\Models\\User', 399),
(20, 'App\\Models\\User', 400),
(20, 'App\\Models\\User', 401),
(20, 'App\\Models\\User', 402),
(20, 'App\\Models\\User', 403),
(20, 'App\\Models\\User', 404),
(20, 'App\\Models\\User', 405),
(20, 'App\\Models\\User', 406),
(20, 'App\\Models\\User', 407),
(20, 'App\\Models\\User', 408),
(20, 'App\\Models\\User', 409),
(20, 'App\\Models\\User', 410),
(20, 'App\\Models\\User', 411),
(20, 'App\\Models\\User', 412),
(20, 'App\\Models\\User', 413),
(20, 'App\\Models\\User', 415),
(20, 'App\\Models\\User', 416),
(20, 'App\\Models\\User', 417),
(20, 'App\\Models\\User', 418),
(20, 'App\\Models\\User', 419),
(20, 'App\\Models\\User', 420),
(20, 'App\\Models\\User', 421),
(20, 'App\\Models\\User', 422),
(20, 'App\\Models\\User', 435),
(20, 'App\\Models\\User', 437),
(20, 'App\\Models\\User', 438),
(20, 'App\\Models\\User', 439),
(20, 'App\\Models\\User', 440),
(20, 'App\\Models\\User', 442),
(20, 'App\\Models\\User', 443),
(20, 'App\\Models\\User', 444),
(20, 'App\\Models\\User', 445),
(20, 'App\\Models\\User', 447),
(20, 'App\\Models\\User', 448),
(20, 'App\\Models\\User', 449),
(20, 'App\\Models\\User', 452),
(20, 'App\\Models\\User', 454),
(20, 'App\\Models\\User', 455),
(20, 'App\\Models\\User', 457),
(20, 'App\\Models\\User', 458),
(20, 'App\\Models\\User', 461),
(20, 'App\\Models\\User', 463),
(20, 'App\\Models\\User', 464),
(20, 'App\\Models\\User', 465),
(20, 'App\\Models\\User', 466),
(20, 'App\\Models\\User', 467),
(20, 'App\\Models\\User', 468),
(20, 'App\\Models\\User', 469),
(20, 'App\\Models\\User', 470),
(20, 'App\\Models\\User', 471),
(20, 'App\\Models\\User', 472),
(20, 'App\\Models\\User', 473),
(20, 'App\\Models\\User', 474),
(20, 'App\\Models\\User', 475),
(20, 'App\\Models\\User', 476),
(20, 'App\\Models\\User', 477),
(20, 'App\\Models\\User', 478),
(20, 'App\\Models\\User', 479),
(20, 'App\\Models\\User', 480),
(20, 'App\\Models\\User', 483);

-- --------------------------------------------------------

--
-- Table structure for table `occupations`
--

CREATE TABLE `occupations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `center_id` int(10) UNSIGNED DEFAULT NULL,
  `no_of_days` int(11) NOT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `training_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1: general, 2: personal',
  `package_timing` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1: normal hours, 2: sunny hours',
  `package_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1: main, 2: add on',
  `type` int(11) NOT NULL DEFAULT '0',
  `show_at_advicefit_platform` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1: active, 2: inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `price`, `center_id`, `no_of_days`, `product_type`, `training_type`, `package_timing`, `package_type`, `type`, `show_at_advicefit_platform`, `created_by`, `updated_by`, `status`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 'Annual year', 550000.00, NULL, 365, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 06:26:58', NULL, '2024-10-29 00:02:00', '2024-11-07 06:26:58'),
(2, 'Monthly Men', 80000.00, NULL, 30, NULL, '2', NULL, NULL, 0, 0, 1, NULL, '2', '2024-11-07 06:27:01', NULL, '2024-10-29 00:02:36', '2024-11-07 06:27:01'),
(3, 'Monthly Women', 80000.00, NULL, 30, NULL, '3', NULL, NULL, 0, 0, 1, NULL, '2', '2024-11-07 06:26:52', NULL, '2024-10-29 00:03:15', '2024-11-07 06:26:52'),
(4, 'SPA Daily', 12000.00, NULL, 1, NULL, '1', NULL, NULL, 2, 0, 1, NULL, '1', '2024-11-07 06:26:55', NULL, '2024-10-29 00:04:02', '2024-11-07 06:26:55'),
(5, 'Daily Cash', 12000.00, NULL, 1, NULL, '1', NULL, NULL, 1, 0, 1, NULL, '1', '2024-11-07 06:26:46', NULL, '2024-10-29 00:04:24', '2024-11-07 06:26:46'),
(6, 'Weekly', 25000.00, NULL, 7, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 06:26:49', NULL, '2024-11-04 07:48:34', '2024-11-07 06:26:49'),
(7, 'Half_month', 16000.00, NULL, 24, NULL, '1', NULL, '1', 1, 0, 1, 1, '1', '2024-11-07 06:26:40', NULL, '2024-11-05 04:01:17', '2024-11-07 06:26:40'),
(8, 'test', 4543.00, NULL, 4, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 05:01:11', NULL, '2024-11-07 05:01:01', '2024-11-07 05:01:11'),
(9, 'qwr', 1.00, NULL, 1, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 06:07:57', NULL, '2024-11-07 06:07:43', '2024-11-07 06:07:57'),
(10, 'qwerty', 1346.00, NULL, 1455, NULL, '1', NULL, '1', 0, 0, 1, 1, '1', '2024-11-07 06:26:42', NULL, '2024-11-07 06:08:15', '2024-11-07 06:26:42'),
(11, 'hhhh', 456.00, NULL, 12345, NULL, '2', NULL, NULL, 1, 0, 1, NULL, '1', '2024-11-07 06:26:37', NULL, '2024-11-07 06:12:04', '2024-11-07 06:26:37'),
(12, 'Monthly Men', 80000.00, NULL, 30, NULL, '2', NULL, '1', 0, 0, 1, 1, '1', '2024-11-18 01:48:21', NULL, '2024-11-07 06:29:53', '2024-11-18 01:48:21'),
(13, 'Monthly Women', 80000.00, NULL, 30, NULL, '3', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-18 01:48:25', NULL, '2024-11-07 06:35:28', '2024-11-18 01:48:25'),
(14, 'Annual year', 55000.00, NULL, 364, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-18 01:48:12', NULL, '2024-11-07 06:37:12', '2024-11-18 01:48:12'),
(15, 'Daily Cash', 10000.00, NULL, 1, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 06:47:58', NULL, '2024-11-07 06:45:14', '2024-11-07 06:47:58'),
(16, 'Daily Cash', 10000.00, NULL, 1, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-18 01:48:18', NULL, '2024-11-07 06:48:12', '2024-11-18 01:48:18'),
(17, 'Daily case 2', 15000.00, NULL, 1, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 06:52:56', NULL, '2024-11-07 06:49:26', '2024-11-07 06:52:56'),
(18, 'Daily cash3', 13000.00, NULL, 1, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 06:52:49', NULL, '2024-11-07 06:50:07', '2024-11-07 06:52:49'),
(19, 'Daily cash12', 10000.00, NULL, 1, NULL, '1', NULL, '1', 0, 0, 1, 1, '1', '2024-11-07 07:09:05', NULL, '2024-11-07 06:54:25', '2024-11-07 07:09:05'),
(20, 'Daily cash 23', 100.00, NULL, 1, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 06:55:31', NULL, '2024-11-07 06:54:45', '2024-11-07 06:55:31'),
(21, 'Daily Cash12', 13000.00, NULL, 30, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-07 23:43:28', NULL, '2024-11-07 23:43:20', '2024-11-07 23:43:28'),
(22, 'Daily cash 23', 13500.00, NULL, 30, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 00:05:01', NULL, '2024-11-07 23:48:07', '2024-11-08 00:05:01'),
(23, 'Daily cahoi', 30000.00, NULL, 30, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 00:04:34', NULL, '2024-11-07 23:57:05', '2024-11-08 00:04:34'),
(24, 'Daily cvahshhhh', 12222.00, NULL, 30, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 00:01:09', NULL, '2024-11-08 00:00:19', '2024-11-08 00:01:09'),
(25, 'nikhil', 121212.00, NULL, 12, NULL, '2', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 03:57:55', NULL, '2024-11-08 03:42:55', '2024-11-08 03:57:55'),
(26, 'gym', 12000000.00, NULL, 56, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 04:21:34', NULL, '2024-11-08 04:17:47', '2024-11-08 04:21:34'),
(27, 'gym', 1200.00, NULL, 56, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 04:21:40', NULL, '2024-11-08 04:18:31', '2024-11-08 04:21:40'),
(28, 'gym', 1234.00, NULL, 56, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 04:21:45', NULL, '2024-11-08 04:19:13', '2024-11-08 04:21:45'),
(29, 'gym', 1298765.00, NULL, 45, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 04:21:50', NULL, '2024-11-08 04:20:52', '2024-11-08 04:21:50'),
(30, 'gym', 1200.00, NULL, 23, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 04:21:54', NULL, '2024-11-08 04:21:10', '2024-11-08 04:21:54'),
(31, 'nikhil', 1200.00, NULL, 12, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-08 05:25:13', NULL, '2024-11-08 05:23:32', '2024-11-08 05:25:13'),
(32, 'monthly men', 100000.00, NULL, 30, NULL, '2', NULL, NULL, 0, 0, 1, NULL, '1', '2024-11-18 01:48:15', NULL, '2024-11-16 09:58:06', '2024-11-18 01:48:15'),
(33, 'Jama', 80000.00, NULL, 31, NULL, '2', NULL, NULL, 1, 0, 1, NULL, '1', '2024-11-18 01:48:09', NULL, '2024-11-18 01:47:55', '2024-11-18 01:48:09'),
(34, 'Monthly', 100000.00, NULL, 30, NULL, '2', NULL, NULL, 1, 0, 1, NULL, '1', '2024-11-18 01:54:47', NULL, '2024-11-18 01:54:27', '2024-11-18 01:54:47'),
(35, 'Spa', 15000.00, NULL, 1, NULL, '1', NULL, NULL, 2, 0, 1, NULL, '1', NULL, NULL, '2024-11-19 15:06:55', '2024-11-19 15:06:55'),
(36, 'Daily', 15000.00, NULL, 1, NULL, '1', NULL, '1', 0, 0, 1, 1, '1', NULL, NULL, '2024-11-19 15:07:31', '2025-01-06 14:59:49'),
(37, 'Monthly Men Membership', 80000.00, NULL, 30, NULL, '2', NULL, '1', 0, 0, 1, 453, '1', NULL, NULL, '2024-11-19 15:12:30', '2024-11-21 13:20:34'),
(38, 'Monthly Women Membership', 60000.00, NULL, 30, NULL, '3', NULL, '1', 0, 0, 1, 453, '1', NULL, NULL, '2024-11-19 15:12:59', '2024-11-21 13:20:13'),
(39, 'Weekly', 60000.00, NULL, 7, NULL, '1', NULL, NULL, 0, 0, 446, NULL, '1', NULL, NULL, '2024-11-21 03:38:47', '2024-11-21 03:38:47'),
(40, 'Two Weeks Men', 50000.00, NULL, 14, NULL, '2', NULL, NULL, 0, 0, 453, NULL, '1', NULL, NULL, '2024-11-21 13:21:11', '2024-11-21 13:21:11'),
(41, 'One Week Men', 25000.00, NULL, 7, NULL, '2', NULL, NULL, 0, 0, 453, NULL, '1', NULL, NULL, '2024-11-21 13:21:31', '2024-11-21 13:21:31'),
(42, 'MONTHLY MEN NEW', 100000.00, NULL, 50, NULL, '2', NULL, NULL, 0, 0, 1, NULL, '1', NULL, NULL, '2025-01-01 07:33:12', '2025-01-01 07:33:12'),
(43, 'MONTHLYMENNEW', 100000.00, NULL, 30, NULL, '2', NULL, NULL, 0, 0, 1, NULL, '1', NULL, NULL, '2025-01-01 07:34:09', '2025-01-01 07:34:09'),
(44, 'Testing', 50.00, NULL, 30, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', '2025-01-16 13:08:13', NULL, '2025-01-16 13:07:24', '2025-01-16 13:08:13'),
(45, 'Testing Final', 50.00, NULL, 30, NULL, '1', NULL, NULL, 0, 0, 1, NULL, '1', NULL, NULL, '2025-01-16 13:10:05', '2025-01-16 13:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage_clients_create', 'web', '2024-07-16 02:28:11', '2024-07-16 02:28:40'),
(2, 'manage_clients_update', 'web', '2024-07-16 02:28:58', '2024-07-16 02:28:58'),
(3, 'manage_clients_read', 'web', '2024-07-16 02:29:07', '2024-07-16 02:29:07'),
(4, 'manage_clients_delete', 'web', '2024-07-16 02:29:14', '2024-07-16 02:29:14'),
(5, 'manage_expenses_create', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(6, 'manage_expenses_update', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(7, 'manage_expenses_read', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(8, 'manage_expenses_delete', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(9, 'manage_packages_create', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(10, 'manage_packages_update', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(11, 'manage_packages_read', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(12, 'manage_packages_delete', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(13, 'manage_users_create', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(14, 'manage_users_update', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(15, 'manage_users_read', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(16, 'manage_users_delete', 'web', '2024-08-20 07:58:24', '2024-08-20 07:58:24'),
(17, 'manage_daily_clients_create', 'web', '2024-07-16 02:28:11', '2024-07-16 02:28:40'),
(18, 'manage_daily_clients_update', 'web', '2024-07-16 02:28:58', '2024-07-16 02:28:58'),
(19, 'manage_daily_clients_read', 'web', '2024-07-16 02:29:07', '2024-07-16 02:29:07'),
(20, 'manage_daily_clients_delete', 'web', '2024-07-16 02:29:14', '2024-07-16 02:29:14'),
(21, 'manage_daily_spa_clients_create', 'web', '2024-07-16 02:28:11', '2024-07-16 02:28:40'),
(22, 'manage_daily_spa_clients_update', 'web', '2024-07-16 02:28:58', '2024-07-16 02:28:58'),
(23, 'manage_daily_spa_clients_read', 'web', '2024-07-16 02:29:07', '2024-07-16 02:29:07'),
(24, 'manage_daily_spa_clients_delete', 'web', '2024-07-16 02:29:14', '2024-07-16 02:29:14'),
(25, 'manage_approval_approve', 'web', '2024-07-16 02:28:11', '2024-07-16 02:28:40'),
(26, 'manage_approval_reject', 'web', '2024-07-16 02:28:58', '2024-07-16 02:28:58'),
(27, 'manage_approval_read', 'web', '2024-07-16 02:29:07', '2024-07-16 02:29:07'),
(28, 'manage_role_create', 'web', '2024-07-16 02:28:11', '2024-07-16 02:28:40'),
(29, 'manage_role_update', 'web', '2024-07-16 02:28:58', '2024-07-16 02:28:58'),
(30, 'manage_role_read', 'web', '2024-07-16 02:29:07', '2024-07-16 02:29:07'),
(31, 'dashboard_report_total', 'web', '2025-01-21 06:34:47', NULL),
(32, 'dashboard_report_Daily', 'web', '2025-01-21 06:34:47', NULL),
(33, 'dashboard_report_details', 'web', '2025-01-21 06:36:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '0a002a22238ebecc4e7a979cacad375ebdf193c677d53e1e8f4a62e5418e4710', '[\"*\"]', '2024-10-18 06:33:02', NULL, '2024-10-18 06:28:53', '2024-10-18 06:33:02'),
(2, 'App\\Models\\User', 1, 'auth_token', '1e8d7f1269276c1e7782e646dcaa82a037b6f014d7eb5ab8c2322814399eafcf', '[\"*\"]', NULL, NULL, '2024-10-18 06:28:54', '2024-10-18 06:28:54'),
(3, 'App\\Models\\User', 344, 'auth_token', '52b2529589b4d609393a6aa2c353a8c6c4a93e7b3bd6a9dcc0daf1bdd30f0c65', '[\"*\"]', NULL, NULL, '2024-10-18 06:30:13', '2024-10-18 06:30:13'),
(4, 'App\\Models\\User', 345, 'auth_token', '7ef449e26a14367e83a26820d9b73699f92a8f571cb57d58750b35fe66492d4a', '[\"*\"]', NULL, NULL, '2024-10-18 06:30:48', '2024-10-18 06:30:48'),
(5, 'App\\Models\\User', 346, 'auth_token', 'f8734ac5fa01b11d1c081879964406574422fa4dcdde42b35deadf8be847ee50', '[\"*\"]', NULL, NULL, '2024-10-18 06:31:15', '2024-10-18 06:31:15'),
(6, 'App\\Models\\User', 347, 'auth_token', '67d77add4ea25f7a7c5b11bba32555ca86279d15a196434bd1d024df5288b2fa', '[\"*\"]', NULL, NULL, '2024-10-18 06:31:59', '2024-10-18 06:31:59'),
(7, 'App\\Models\\User', 348, 'auth_token', '50358f6e3546053c125a5cdd4a906f7c5bceea77b3df0cb52be2b3366630b637', '[\"*\"]', NULL, NULL, '2024-10-18 06:32:29', '2024-10-18 06:32:29'),
(8, 'App\\Models\\User', 1, 'auth_token', '7affdbb475702cb08e371eacafd0dfdfb71b0ab6ad4bea41257ad811222e11e4', '[\"*\"]', '2024-10-18 06:35:04', NULL, '2024-10-18 06:33:09', '2024-10-18 06:35:04'),
(9, 'App\\Models\\User', 1, 'auth_token', 'e41792527a67b8968daf2f4272185726bc26d16ab08f30b2ec79465609dc89a5', '[\"*\"]', NULL, NULL, '2024-10-18 06:33:10', '2024-10-18 06:33:10'),
(10, 'App\\Models\\User', 1, 'auth_token', 'da6e8b78a9e7a49dea3337afe8e3f3d77e0e0f18a6686ecdea038f3ac7bb87b7', '[\"*\"]', '2024-10-18 07:37:14', NULL, '2024-10-18 06:35:08', '2024-10-18 07:37:14'),
(11, 'App\\Models\\User', 1, 'auth_token', '2fa84adf64371ce98174b8b7d6cfc58c6c8fc502223f70ee1dd12bdfd6946dfe', '[\"*\"]', NULL, NULL, '2024-10-18 06:35:09', '2024-10-18 06:35:09'),
(12, 'App\\Models\\User', 1, 'auth_token', '44f5dd828cddfc03b2cf33f85e7124598180a1c1924e9f63f313748dbbf23124', '[\"*\"]', '2024-10-18 07:15:52', NULL, '2024-10-18 06:59:46', '2024-10-18 07:15:52'),
(13, 'App\\Models\\User', 1, 'auth_token', '7975aa4a43c46d80d24e53d016f755fba8c60acc9b49b340138287dc53e0292b', '[\"*\"]', '2024-10-18 07:17:16', NULL, '2024-10-18 07:16:34', '2024-10-18 07:17:16'),
(14, 'App\\Models\\User', 1, 'auth_token', 'c49a856aa15e36dfe268934ea7822636a5a6ebe4110650155f86f6b463f24430', '[\"*\"]', NULL, NULL, '2024-10-18 07:16:36', '2024-10-18 07:16:36'),
(15, 'App\\Models\\User', 1, 'auth_token', 'bdf3448e753a0930b96d1d1daa5d145ec02a6c1b070bb31dc1a0cbe5dace0a8a', '[\"*\"]', '2024-10-18 07:32:51', NULL, '2024-10-18 07:32:16', '2024-10-18 07:32:51'),
(16, 'App\\Models\\User', 1, 'auth_token', '9a686b1632b7d21267aa02aa2be5bb3a730f300f356d049185878a1c2b1dc589', '[\"*\"]', NULL, NULL, '2024-10-18 07:32:17', '2024-10-18 07:32:17'),
(17, 'App\\Models\\User', 1, 'auth_token', '18946f3d2170203b5bc8c6ad37edaaf5b997937c87a267fb6e7e1928542c8c12', '[\"*\"]', '2024-10-18 07:34:28', NULL, '2024-10-18 07:32:56', '2024-10-18 07:34:28'),
(18, 'App\\Models\\User', 1, 'auth_token', 'c2ebaf4521c42788d4adb6cfe1c24b88c49ca5c34192cb299fffc2bb3237b534', '[\"*\"]', NULL, NULL, '2024-10-18 07:32:57', '2024-10-18 07:32:57'),
(19, 'App\\Models\\User', 1, 'auth_token', '4f5e37ca0d3c09e22cfb53e23195c1d80efbde638738b34d2c727cbdf739e3d3', '[\"*\"]', '2024-10-18 10:36:25', NULL, '2024-10-18 10:29:23', '2024-10-18 10:36:25'),
(20, 'App\\Models\\User', 1, 'auth_token', '8b5dda777d52f5b1b22674dc1a0c2560963d1bc3429773b4a1f2190ce56e7c53', '[\"*\"]', NULL, NULL, '2024-10-18 10:29:23', '2024-10-18 10:29:23'),
(21, 'App\\Models\\User', 1, 'auth_token', '241544fa2283d1bfd68c61b8e61177e20a3883b3498653bb13f8b461507e3a96', '[\"*\"]', '2024-10-18 17:10:02', NULL, '2024-10-18 17:10:00', '2024-10-18 17:10:02'),
(22, 'App\\Models\\User', 1, 'auth_token', 'a2839d3aa3cb2b4ae11ff25ca4a7b0b3f693dd398c228585389df5eb442980d0', '[\"*\"]', NULL, NULL, '2024-10-18 17:10:01', '2024-10-18 17:10:01'),
(23, 'App\\Models\\User', 1, 'auth_token', 'a1dc15f5462e58f5172472c5fe06a65f52fe0d9d3f202d02307dec110cdcbb9c', '[\"*\"]', '2024-10-18 17:11:08', NULL, '2024-10-18 17:10:33', '2024-10-18 17:11:08'),
(24, 'App\\Models\\User', 1, 'auth_token', '9dc072e4a2857558cf415fb1e5050815bfd8287cb3c9e8c6d8d5d7e16c8cfb36', '[\"*\"]', NULL, NULL, '2024-10-18 17:10:33', '2024-10-18 17:10:33'),
(25, 'App\\Models\\User', 1, 'auth_token', 'a3415d530a5a1aef315ef6da162349caeffa00d1f3a7023e298f49d7f05d1dd3', '[\"*\"]', '2024-10-18 17:12:13', NULL, '2024-10-18 17:12:09', '2024-10-18 17:12:13'),
(26, 'App\\Models\\User', 1, 'auth_token', 'df79b565789c9070edea85186797561dcf2b8db9ddcef18794a0f2b02b1e904f', '[\"*\"]', NULL, NULL, '2024-10-18 17:12:09', '2024-10-18 17:12:09'),
(27, 'App\\Models\\User', 1, 'auth_token', 'ed0150a8d86dab841fd05f716dd5b7a9c5a2caec1b69fe75794c076053eed9b1', '[\"*\"]', '2024-10-19 06:03:41', NULL, '2024-10-19 06:01:54', '2024-10-19 06:03:41'),
(28, 'App\\Models\\User', 1, 'auth_token', '01352247bff254e5ab85ce2840b72920f33f30ab88e73548139266a6b2fcf28b', '[\"*\"]', NULL, NULL, '2024-10-19 06:01:55', '2024-10-19 06:01:55'),
(29, 'App\\Models\\User', 1, 'auth_token', '748ed7aaa8f02e7eec694ae249796f3c8b83a3c9c777b7df04552b5fa02930e9', '[\"*\"]', '2024-10-19 15:32:12', NULL, '2024-10-19 15:30:32', '2024-10-19 15:32:12'),
(30, 'App\\Models\\User', 1, 'auth_token', 'cc7aa201c268632b133fa05aa8167f41c6b22770de2153c6700b5713b75c39ee', '[\"*\"]', NULL, NULL, '2024-10-19 15:30:33', '2024-10-19 15:30:33'),
(31, 'App\\Models\\User', 1, 'auth_token', 'f41536b05dfddaa0171b149da73bf506b248838c62bb853d4f219aa61117117e', '[\"*\"]', '2024-10-20 13:04:41', NULL, '2024-10-20 13:03:17', '2024-10-20 13:04:41'),
(32, 'App\\Models\\User', 1, 'auth_token', '961a5a18db2d923efc918d7347744d375cfff9d434897930411bde7e284a7596', '[\"*\"]', NULL, NULL, '2024-10-20 13:03:18', '2024-10-20 13:03:18'),
(33, 'App\\Models\\User', 1, 'auth_token', '85ccada5ca7b36fbbd2bce8b0f33487f2925aebf62d353bf1c373da1c7c1b5f9', '[\"*\"]', '2024-10-20 23:30:46', NULL, '2024-10-20 23:23:54', '2024-10-20 23:30:46'),
(34, 'App\\Models\\User', 1, 'auth_token', 'f8b5e39f028b280768990641db3b2b37198247b8f4a3473ff769c8261a4d9571', '[\"*\"]', NULL, NULL, '2024-10-20 23:23:55', '2024-10-20 23:23:55'),
(35, 'App\\Models\\User', 1, 'auth_token', 'dec24c9152a45fe8f49a36bebe17bf71a7b6e717063b468bdec1f0cb32b9ca99', '[\"*\"]', '2024-10-20 23:50:59', NULL, '2024-10-20 23:23:56', '2024-10-20 23:50:59'),
(36, 'App\\Models\\User', 1, 'auth_token', '6b533e19cfc42ea5866d49834a7b25e5b2dfadf9886e43f312e12c968b2acbfc', '[\"*\"]', NULL, NULL, '2024-10-20 23:23:57', '2024-10-20 23:23:57'),
(37, 'App\\Models\\User', 1, 'auth_token', '3590acf33c92bb55058cbe193a5dc0b8e8c25b6103c835f6e275cc8c7bceb578', '[\"*\"]', '2024-10-20 23:31:39', NULL, '2024-10-20 23:30:58', '2024-10-20 23:31:39'),
(38, 'App\\Models\\User', 1, 'auth_token', '1dbbc234ee7015a0771c8bcc63d91c84f28c764c28076cdb2d62ce8a96e290cb', '[\"*\"]', NULL, NULL, '2024-10-20 23:30:59', '2024-10-20 23:30:59'),
(39, 'App\\Models\\User', 1, 'auth_token', 'fe019bbf50db0b47e54953d3341ba1ff7a951eb239b53bbb3810d93148d54df5', '[\"*\"]', '2024-10-20 23:32:05', NULL, '2024-10-20 23:31:52', '2024-10-20 23:32:05'),
(40, 'App\\Models\\User', 1, 'auth_token', 'ebf79eda60f5da7c7daacc62296c49af1be2198426d4d16c1afa56497f81bc21', '[\"*\"]', NULL, NULL, '2024-10-20 23:31:53', '2024-10-20 23:31:53'),
(41, 'App\\Models\\User', 1, 'auth_token', '6e9255fef2dd8a0c22a7d142cc4e8a6ec35963d4d4b9054b6787d6236a2d39e0', '[\"*\"]', '2024-10-20 23:38:14', NULL, '2024-10-20 23:37:36', '2024-10-20 23:38:14'),
(42, 'App\\Models\\User', 1, 'auth_token', '11002698a6b0d6008c0b4b6124b05dc056d1c45c514430621b6f1d6175acdc31', '[\"*\"]', NULL, NULL, '2024-10-20 23:37:37', '2024-10-20 23:37:37'),
(43, 'App\\Models\\User', 1, 'auth_token', 'ae7e2e29184789cccfd270c6eb7a8bc39fc24b52faa4deac73033319202b5991', '[\"*\"]', '2024-10-20 23:39:25', NULL, '2024-10-20 23:39:13', '2024-10-20 23:39:25'),
(44, 'App\\Models\\User', 1, 'auth_token', 'f7e92a1faa6325b516b92a9b6cb6502509db5fd8f7906602cf4821f93ddb8144', '[\"*\"]', NULL, NULL, '2024-10-20 23:39:14', '2024-10-20 23:39:14'),
(45, 'App\\Models\\User', 1, 'auth_token', '90b3c16479776afb147a0388611b3721374bdf7143da19575edaf685c6a6b536', '[\"*\"]', '2024-10-20 23:40:37', NULL, '2024-10-20 23:40:24', '2024-10-20 23:40:37'),
(46, 'App\\Models\\User', 1, 'auth_token', '35144a05298c211e94bfe05b7d17b92ead6bcde742fe14443199a11a69646d33', '[\"*\"]', NULL, NULL, '2024-10-20 23:40:25', '2024-10-20 23:40:25'),
(47, 'App\\Models\\User', 1, 'auth_token', '49f6b97a545dc4bbe447d79b7292c09ea5b6135a761fd32387c3f8515e4ca529', '[\"*\"]', '2024-10-20 23:56:21', NULL, '2024-10-20 23:43:15', '2024-10-20 23:56:21'),
(48, 'App\\Models\\User', 1, 'auth_token', '06aa8751400d823374a2b081665e38cab86d4db4b8ffb028a560260af567455e', '[\"*\"]', NULL, NULL, '2024-10-20 23:43:16', '2024-10-20 23:43:16'),
(49, 'App\\Models\\User', 1, 'auth_token', '6f624abd9f63fb65cfe459c7cbaa13fb542188df0bd0d0b8660023e3676ebc56', '[\"*\"]', '2024-10-20 23:47:33', NULL, '2024-10-20 23:45:49', '2024-10-20 23:47:33'),
(50, 'App\\Models\\User', 1, 'auth_token', '238d16532468e2a8e9edf537fa8ae452c7b789f97b4196f9aa4ff26560bb7971', '[\"*\"]', NULL, NULL, '2024-10-20 23:45:50', '2024-10-20 23:45:50'),
(51, 'App\\Models\\User', 349, 'auth_token', '26b038dd729fa5a8d0b56ea53d8def7cb719693a92f0fb2d055b5a72ecf90c6c', '[\"*\"]', '2024-10-20 23:51:29', NULL, '2024-10-20 23:48:12', '2024-10-20 23:51:29'),
(52, 'App\\Models\\User', 349, 'auth_token', '1f6eae8a2569d7e93298911cc93a69270ff6050c486f259fdabc898fbd02ac68', '[\"*\"]', NULL, NULL, '2024-10-20 23:48:13', '2024-10-20 23:48:13'),
(53, 'App\\Models\\User', 350, 'auth_token', '4b2dd80e6108d09f2be8ec064673f5f5f7c327d2677afa69f3b90e5cf919d27e', '[\"*\"]', NULL, NULL, '2024-10-20 23:51:23', '2024-10-20 23:51:23'),
(54, 'App\\Models\\User', 349, 'auth_token', '662a2ef884211470e85329699de7aa4b18834dafba84ceb70b8977632f56dac6', '[\"*\"]', '2024-10-20 23:52:19', NULL, '2024-10-20 23:51:51', '2024-10-20 23:52:19'),
(55, 'App\\Models\\User', 349, 'auth_token', 'c5b11244d34c7a63472e6002d7849887f41238755d6ac6b85ae398f09dd39ba0', '[\"*\"]', NULL, NULL, '2024-10-20 23:51:52', '2024-10-20 23:51:52'),
(56, 'App\\Models\\User', 1, 'auth_token', 'f9ac6fc1aa3e47c0b5d28182f9a1ae593a638916774a271c0cd96c5a5f12857a', '[\"*\"]', '2024-10-20 23:58:04', NULL, '2024-10-20 23:58:02', '2024-10-20 23:58:04'),
(57, 'App\\Models\\User', 1, 'auth_token', '887f35e3f0903b5bcaf18a7a25ee6fb92c4c245d69e04512a11043a954b91f47', '[\"*\"]', NULL, NULL, '2024-10-20 23:58:03', '2024-10-20 23:58:03'),
(58, 'App\\Models\\User', 349, 'auth_token', 'fd0a11efedbf0dfa1332eef4a13b84569d4efc28cfcce98085c53633b51f6b98', '[\"*\"]', '2024-10-21 00:05:55', NULL, '2024-10-20 23:58:20', '2024-10-21 00:05:55'),
(59, 'App\\Models\\User', 349, 'auth_token', '96846fe8be7aab7cfe92f92fbeb9d6849866ac896cecd034acea830cd1ec17ee', '[\"*\"]', NULL, NULL, '2024-10-20 23:58:21', '2024-10-20 23:58:21'),
(60, 'App\\Models\\User', 349, 'auth_token', '79cd152193db606be365ca552cbe54816306f0f27f781aca3a8974df6649d7d2', '[\"*\"]', '2024-10-21 00:15:29', NULL, '2024-10-21 00:06:38', '2024-10-21 00:15:29'),
(61, 'App\\Models\\User', 349, 'auth_token', 'acbfcd359e8a572e9a21ad6693cbe914cdbfbd3f22394f88e1071bfed42a6d6d', '[\"*\"]', NULL, NULL, '2024-10-21 00:06:39', '2024-10-21 00:06:39'),
(62, 'App\\Models\\User', 1, 'auth_token', 'b4c9d2a62c9bbbe4c184fde5814c999c88ee639c13412ed79a3c8be27f15f116', '[\"*\"]', '2024-10-21 00:28:20', NULL, '2024-10-21 00:28:08', '2024-10-21 00:28:20'),
(63, 'App\\Models\\User', 1, 'auth_token', '89fe87f4f585eae4c75667a761d4ba96b0adbb15d9c8f0016320374d3b179a53', '[\"*\"]', NULL, NULL, '2024-10-21 00:28:09', '2024-10-21 00:28:09'),
(64, 'App\\Models\\User', 1, 'auth_token', '659237f77cab330f0c68533a9bbafefef8b979096c07b3e3d609ef5be5dc14fc', '[\"*\"]', '2024-10-21 00:33:57', NULL, '2024-10-21 00:33:45', '2024-10-21 00:33:57'),
(65, 'App\\Models\\User', 1, 'auth_token', '11e958edce9864bc45757ae0c841f830a9e751ce8fe93344049a0f47aac50484', '[\"*\"]', NULL, NULL, '2024-10-21 00:33:46', '2024-10-21 00:33:46'),
(66, 'App\\Models\\User', 1, 'auth_token', '1dcc4f4e86da687a8370df111597fd7d5524f988790368897b05ff0d79684895', '[\"*\"]', '2024-10-21 00:42:23', NULL, '2024-10-21 00:41:09', '2024-10-21 00:42:23'),
(67, 'App\\Models\\User', 1, 'auth_token', '1ce941245dfbb5a10e4908608a1214d6d010e5ffe83218f2dbcc96fccb79727f', '[\"*\"]', NULL, NULL, '2024-10-21 00:41:10', '2024-10-21 00:41:10'),
(68, 'App\\Models\\User', 1, 'auth_token', '2b72d43622dd0516ccc8c7a24efbe47b9bb7bbd35d9761885a64b4bc7b608e18', '[\"*\"]', '2024-10-21 00:51:27', NULL, '2024-10-21 00:51:16', '2024-10-21 00:51:27'),
(69, 'App\\Models\\User', 1, 'auth_token', '7d6e03785bb784228e06b01d04cb2071f6ece0a6e1ec5071fd2773595ab93027', '[\"*\"]', NULL, NULL, '2024-10-21 00:51:17', '2024-10-21 00:51:17'),
(70, 'App\\Models\\User', 1, 'auth_token', '3f8af333b1453835d616d78a46113f816b77096296b3ec5d8541ef8da8616813', '[\"*\"]', '2024-10-21 04:06:36', NULL, '2024-10-21 00:52:58', '2024-10-21 04:06:36'),
(71, 'App\\Models\\User', 1, 'auth_token', '4b43df83c376dac7824999dfeca4789b94be1bccbd4ca0194351425bd75da928', '[\"*\"]', NULL, NULL, '2024-10-21 00:52:59', '2024-10-21 00:52:59'),
(72, 'App\\Models\\User', 1, 'auth_token', '0aea1f6afd4a1f867ed32ad8590e15755ae06542d4094551074f1fcdea5ddb2f', '[\"*\"]', '2024-10-21 03:35:33', NULL, '2024-10-21 03:34:35', '2024-10-21 03:35:33'),
(73, 'App\\Models\\User', 1, 'auth_token', '4d3defd0feb098cefdb2323f46a3de12652bbc2e5e14fe3398854071544ecb17', '[\"*\"]', NULL, NULL, '2024-10-21 03:34:36', '2024-10-21 03:34:36'),
(74, 'App\\Models\\User', 1, 'auth_token', '05c94284788f349e9e19b630da81c3a10810f45ebb3c07afb1a0c7dc54304d50', '[\"*\"]', '2024-10-21 04:52:55', NULL, '2024-10-21 03:36:19', '2024-10-21 04:52:55'),
(75, 'App\\Models\\User', 1, 'auth_token', '787e19a0b23426fbddd75c9fab761bc9095ba4e7ebb0d8be76b34af2d91b89d1', '[\"*\"]', NULL, NULL, '2024-10-21 03:36:20', '2024-10-21 03:36:20'),
(76, 'App\\Models\\User', 1, 'auth_token', '24887885989cb973359da43cf43de93396f4509d95e2f7b1ac495871df7dd470', '[\"*\"]', '2024-10-21 04:07:04', NULL, '2024-10-21 04:06:44', '2024-10-21 04:07:04'),
(77, 'App\\Models\\User', 1, 'auth_token', '8a39f30e346a42b67019b71dae26514d933fa907920a48f01079b681a3ac88b3', '[\"*\"]', NULL, NULL, '2024-10-21 04:06:45', '2024-10-21 04:06:45'),
(78, 'App\\Models\\User', 1, 'auth_token', 'd01d8bbb72d1d1b306ff2c78745cea03fdba2f8b9c426964d9795ccaef4e50b1', '[\"*\"]', '2024-10-21 04:08:22', NULL, '2024-10-21 04:07:40', '2024-10-21 04:08:22'),
(79, 'App\\Models\\User', 1, 'auth_token', '5ed3ed93f2794cced43730211c5510e710c165b0de335bb8437a50651abdee1f', '[\"*\"]', NULL, NULL, '2024-10-21 04:07:41', '2024-10-21 04:07:41'),
(80, 'App\\Models\\User', 1, 'auth_token', '16172ef742e35dd5ebc80310cfc0e4f899abf925ed01f1f1b971e7668a180cbb', '[\"*\"]', '2024-10-21 04:28:37', NULL, '2024-10-21 04:19:19', '2024-10-21 04:28:37'),
(81, 'App\\Models\\User', 1, 'auth_token', '0108f657e676fd618924861050221668923a9cf7ab1126612cbd45363237fde2', '[\"*\"]', '2024-10-21 05:22:43', NULL, '2024-10-21 04:40:48', '2024-10-21 05:22:43'),
(82, 'App\\Models\\User', 1, 'auth_token', '8d3670298a9a592613266ebfa1a423ade6ae6eb055df96c3d367204967f2949d', '[\"*\"]', NULL, NULL, '2024-10-21 04:40:49', '2024-10-21 04:40:49'),
(83, 'App\\Models\\User', 1, 'auth_token', '1b5d9a807f7f4612fb079244c67e9c28259617be0afedea22a961cea4ac8d889', '[\"*\"]', '2024-10-21 05:12:16', NULL, '2024-10-21 05:02:19', '2024-10-21 05:12:16'),
(84, 'App\\Models\\User', 1, 'auth_token', '6a9aff9f8d19b79bcf7defe26d8784a7709f0a6048b64925725e8bbf816316bb', '[\"*\"]', NULL, NULL, '2024-10-21 05:02:21', '2024-10-21 05:02:21'),
(85, 'App\\Models\\User', 1, 'auth_token', '29043f4eef95b9cb691d8b26315df2d35a8cf484e7f5374aaa6a2ca92379c687', '[\"*\"]', '2024-10-21 05:34:55', NULL, '2024-10-21 05:29:35', '2024-10-21 05:34:55'),
(86, 'App\\Models\\User', 1, 'auth_token', 'f47b2727790bff8295519013db6c54ebe430ffc442df62cde28b35a1f1a415d0', '[\"*\"]', NULL, NULL, '2024-10-21 05:29:36', '2024-10-21 05:29:36'),
(87, 'App\\Models\\User', 1, 'auth_token', '61bdd08f1b1b672a7b60f85f3773570461609a9eeebb117c40c493e33967a5ef', '[\"*\"]', '2024-10-21 05:38:21', NULL, '2024-10-21 05:38:09', '2024-10-21 05:38:21'),
(88, 'App\\Models\\User', 1, 'auth_token', '544191ac5445824da17d1872ef1810786ff32cad4fad7ff817e968985978ea04', '[\"*\"]', NULL, NULL, '2024-10-21 05:38:10', '2024-10-21 05:38:10'),
(89, 'App\\Models\\User', 1, 'auth_token', 'b672015f9380ba94cde8b53dd4d6e9a309f3ea99fc0039c27aa8c6b1a5f2f55b', '[\"*\"]', '2024-10-21 05:43:03', NULL, '2024-10-21 05:39:01', '2024-10-21 05:43:03'),
(90, 'App\\Models\\User', 1, 'auth_token', '7f1bb2b1023430d721b719115cff27f53341d94f4a9d2ed0b2ab97a1ba527895', '[\"*\"]', NULL, NULL, '2024-10-21 05:39:02', '2024-10-21 05:39:02'),
(91, 'App\\Models\\User', 1, 'auth_token', 'a84bbea385feeb9d2d824e41270200165778aaaa461f51837b123ee0b6608d8a', '[\"*\"]', '2024-10-21 06:04:40', NULL, '2024-10-21 06:03:39', '2024-10-21 06:04:40'),
(92, 'App\\Models\\User', 1, 'auth_token', 'ef912860026081bfae7f031caf0022b5a588c4572ac0679b1c91056ddedab6ba', '[\"*\"]', NULL, NULL, '2024-10-21 06:03:41', '2024-10-21 06:03:41'),
(93, 'App\\Models\\User', 1, 'auth_token', '7da00496067aba98cc5f37d1c7a9854e30e92b1905ff6c08391ce4f5d8c64f7d', '[\"*\"]', '2024-10-21 06:05:28', NULL, '2024-10-21 06:05:00', '2024-10-21 06:05:28'),
(94, 'App\\Models\\User', 1, 'auth_token', 'ffdc9d7ee3a8840f01cedaeac2d2d6106952dc0542bf2c9065a3d88fe27ece0f', '[\"*\"]', NULL, NULL, '2024-10-21 06:05:01', '2024-10-21 06:05:01'),
(95, 'App\\Models\\User', 1, 'auth_token', 'b2d9a1f06ab1165a69faf49076e67c121599f965c9b435ef7521b845f0fc53c9', '[\"*\"]', '2024-10-21 06:43:09', NULL, '2024-10-21 06:05:33', '2024-10-21 06:43:09'),
(96, 'App\\Models\\User', 1, 'auth_token', '83f086ea57a2f3ef3bf6240585280362edd4461791625335ef2a62439432f3b1', '[\"*\"]', NULL, NULL, '2024-10-21 06:05:34', '2024-10-21 06:05:34'),
(97, 'App\\Models\\User', 1, 'auth_token', '028759095fe1fdfac1ffe6814cc33c894119d3a6258fdf78377a2bb8d85fbd09', '[\"*\"]', '2024-10-21 06:18:14', NULL, '2024-10-21 06:17:25', '2024-10-21 06:18:14'),
(98, 'App\\Models\\User', 1, 'auth_token', '501a10563afb7c86ecec2a40c00a68660d700c2662448c610b5076fc094a6c77', '[\"*\"]', NULL, NULL, '2024-10-21 06:17:26', '2024-10-21 06:17:26'),
(99, 'App\\Models\\User', 351, 'auth_token', '23bb78046d8cce8961cdd0136c9ea6f3ed9c0849ed6da1212ba3837318c98373', '[\"*\"]', NULL, NULL, '2024-10-21 06:22:15', '2024-10-21 06:22:15'),
(100, 'App\\Models\\User', 1, 'auth_token', '721cf89932ef6e94a63f6e29d96e18daf9f72b40ba632640d0dcfaecde36f9f5', '[\"*\"]', '2024-10-22 06:07:28', NULL, '2024-10-22 06:05:59', '2024-10-22 06:07:28'),
(101, 'App\\Models\\User', 1, 'auth_token', 'bc98cd7620c9aab66f1a152c0f7d4ab955c97b9881c6bd2860c1e9ad45cb51a9', '[\"*\"]', NULL, NULL, '2024-10-22 06:06:00', '2024-10-22 06:06:00'),
(102, 'App\\Models\\User', 1, 'auth_token', '652e36a5ffbddc2e0460a498f5a160a1c6c0ae2a9e4a584ea0cfa986f10abf75', '[\"*\"]', '2024-10-22 06:09:32', NULL, '2024-10-22 06:09:29', '2024-10-22 06:09:32'),
(103, 'App\\Models\\User', 1, 'auth_token', '8cd73c3fe721bf3732a6c5d99304224a40c8598ed5bdfe48913c4a1d2da88a10', '[\"*\"]', NULL, NULL, '2024-10-22 06:09:31', '2024-10-22 06:09:31'),
(104, 'App\\Models\\User', 1, 'auth_token', 'b81fe4d0056935ccf5b3e40a3337bf0ebc67e5c775343bc47d95b11259bae5cf', '[\"*\"]', '2024-10-22 06:25:02', NULL, '2024-10-22 06:09:43', '2024-10-22 06:25:02'),
(105, 'App\\Models\\User', 1, 'auth_token', '881bf341185a18993593d840073f9aa1f7fa797e09625954f5974ff871f3c1f1', '[\"*\"]', NULL, NULL, '2024-10-22 06:09:45', '2024-10-22 06:09:45'),
(106, 'App\\Models\\User', 1, 'auth_token', '74bc45c1cf626bd41359adfa5895edbd7624730b2d26303837f92f99275124ea', '[\"*\"]', '2024-10-22 06:10:32', NULL, '2024-10-22 06:10:30', '2024-10-22 06:10:32'),
(107, 'App\\Models\\User', 1, 'auth_token', 'f49f5b39ecbfcfe02ddaadb426e8792e3a7f782d973f32c28a03dbe93144d15d', '[\"*\"]', NULL, NULL, '2024-10-22 06:10:31', '2024-10-22 06:10:31'),
(108, 'App\\Models\\User', 1, 'auth_token', '7efd28a412ee644d68c41338d01f12dbfd41ea0762c733b87441e4b35f91aab1', '[\"*\"]', '2024-10-22 07:22:17', NULL, '2024-10-22 06:15:07', '2024-10-22 07:22:17'),
(109, 'App\\Models\\User', 1, 'auth_token', 'ea7acf8af8e71b65061ba58606edbc76daa554eb152bacb94742079b60528072', '[\"*\"]', NULL, NULL, '2024-10-22 06:15:09', '2024-10-22 06:15:09'),
(110, 'App\\Models\\User', 353, 'auth_token', 'cb0d4c026eadcc6b949403d34c5d2ae8dabfdd16706ff8b23dc9c7ff753320fd', '[\"*\"]', NULL, NULL, '2024-10-22 06:15:49', '2024-10-22 06:15:49'),
(111, 'App\\Models\\User', 354, 'auth_token', '8ebc911c0aacb4e4f60c6660be37c754bfe5d2cac33dca73ea5f55c9d724f8f2', '[\"*\"]', NULL, NULL, '2024-10-22 06:22:13', '2024-10-22 06:22:13'),
(112, 'App\\Models\\User', 1, 'auth_token', '791b43b0b200c71803e0f9f2e0160d43b0842638b58be2a1a2b6b9cb76e33ee6', '[\"*\"]', '2024-10-22 07:23:09', NULL, '2024-10-22 07:22:26', '2024-10-22 07:23:09'),
(113, 'App\\Models\\User', 1, 'auth_token', '88ea4197ab2ecb40fa9edbee097ab29faaf88cf4b15bc3d4bd0c867672d9edfa', '[\"*\"]', NULL, NULL, '2024-10-22 07:22:27', '2024-10-22 07:22:27'),
(114, 'App\\Models\\User', 1, 'auth_token', 'f95cbf91742852921fc17d9e041cfb126922e47a53aac97e85428feb7738cadf', '[\"*\"]', '2024-10-23 04:21:45', NULL, '2024-10-22 23:00:32', '2024-10-23 04:21:45'),
(115, 'App\\Models\\User', 1, 'auth_token', 'e59d0c5c442d85ca96c60ef9545608c6829480e85e07d0b3ddbbcee9168f09a7', '[\"*\"]', NULL, NULL, '2024-10-22 23:00:33', '2024-10-22 23:00:33'),
(116, 'App\\Models\\User', 1, 'auth_token', '2185b077c1f76af68d51db4233f99fb111835420398032dddb444a27ae052034', '[\"*\"]', '2024-10-22 23:59:55', NULL, '2024-10-22 23:52:11', '2024-10-22 23:59:55'),
(117, 'App\\Models\\User', 1, 'auth_token', '4eadb0cf9eb8b2f0e97121df4410097fe3f217bd9717bc2f2cef56db0b4b1dab', '[\"*\"]', NULL, NULL, '2024-10-22 23:52:12', '2024-10-22 23:52:12'),
(118, 'App\\Models\\User', 1, 'auth_token', '42a709c1b671d33c00dea56b44cad820f472875af36e89d6ba61681d23a6e8df', '[\"*\"]', '2024-10-23 02:01:11', NULL, '2024-10-23 01:57:41', '2024-10-23 02:01:11'),
(119, 'App\\Models\\User', 1, 'auth_token', '47ad327879cb8830ab8f553ebbad40f2f29b345f2116e852a585c935ea8b2982', '[\"*\"]', NULL, NULL, '2024-10-23 01:57:42', '2024-10-23 01:57:42'),
(120, 'App\\Models\\User', 1, 'auth_token', '669ee0b9a52382dd21f29ff0a1cdb52323a44ed247a24691490fd29132214d7e', '[\"*\"]', '2024-10-23 04:00:29', NULL, '2024-10-23 02:01:54', '2024-10-23 04:00:29'),
(121, 'App\\Models\\User', 1, 'auth_token', '4aa1cde7d31bc60e2268daa1051ca2f8d7a54b98f8140406922611958b5b83f1', '[\"*\"]', NULL, NULL, '2024-10-23 02:01:55', '2024-10-23 02:01:55'),
(122, 'App\\Models\\User', 1, 'auth_token', '76d6aef26b9977d69cc0099ccd842a746ddba7b93ba20b54dc4c0ac32eb68bb8', '[\"*\"]', '2024-10-23 04:00:46', NULL, '2024-10-23 03:57:45', '2024-10-23 04:00:46'),
(123, 'App\\Models\\User', 1, 'auth_token', 'd68740ac40a1deded51219ac119e09e92f46cb61cf1584fd132ed199b2017a48', '[\"*\"]', NULL, NULL, '2024-10-23 03:57:46', '2024-10-23 03:57:46'),
(124, 'App\\Models\\User', 357, 'auth_token', 'fac3d112fcb541a29ce285cd5241a6bcd0459472ebfb7ccec07a517a09cd7e8c', '[\"*\"]', NULL, NULL, '2024-10-23 03:58:26', '2024-10-23 03:58:26'),
(125, 'App\\Models\\User', 1, 'auth_token', '7519b3b5cc5db5f2d7cca17fd71a5d42e8940ee3786bff4785aa4ddab796bfde', '[\"*\"]', '2024-10-23 04:25:58', NULL, '2024-10-23 04:23:25', '2024-10-23 04:25:58'),
(126, 'App\\Models\\User', 1, 'auth_token', '36822d7223b525745fdea59e1c0dce57c42fb6d87292966df3564732f881788e', '[\"*\"]', NULL, NULL, '2024-10-23 04:23:26', '2024-10-23 04:23:26'),
(127, 'App\\Models\\User', 1, 'auth_token', '53066a5d6cc923d7505395cebef10890ac843a2760c537bd594672df41b04fb0', '[\"*\"]', '2024-10-23 04:23:52', NULL, '2024-10-23 04:23:50', '2024-10-23 04:23:52'),
(128, 'App\\Models\\User', 1, 'auth_token', '601602700b61d2961d8f46161f0145142a959ff2177dc7994ca8e237f2e8515f', '[\"*\"]', NULL, NULL, '2024-10-23 04:23:51', '2024-10-23 04:23:51'),
(129, 'App\\Models\\User', 1, 'auth_token', 'e24e1f4f50046fddb0660cf227d344a0f83e96bb8deb0b732de189ff140c563d', '[\"*\"]', '2024-10-23 04:31:42', NULL, '2024-10-23 04:26:04', '2024-10-23 04:31:42'),
(130, 'App\\Models\\User', 1, 'auth_token', '4b9ba6c09c11bebcf05c4a86ce8c2dbb8194c8c6444b60a3cee73b4edbb2244a', '[\"*\"]', NULL, NULL, '2024-10-23 04:26:05', '2024-10-23 04:26:05'),
(131, 'App\\Models\\User', 1, 'auth_token', 'ae56b17f96bc428f585522dcb6141d94e141603e3c84014d5bb26c0ed7ebccf2', '[\"*\"]', '2024-10-23 04:31:07', NULL, '2024-10-23 04:28:29', '2024-10-23 04:31:07'),
(132, 'App\\Models\\User', 1, 'auth_token', '398d9ecc366473645e599a23c54d1297026c9fad02cd8b3e00397085088e2317', '[\"*\"]', NULL, NULL, '2024-10-23 04:28:30', '2024-10-23 04:28:30'),
(133, 'App\\Models\\User', 358, 'auth_token', '302b508002e71bd1b0b6014cb38b69b7ff97657b05e79fa7607de47b1977ad4c', '[\"*\"]', NULL, NULL, '2024-10-23 04:30:08', '2024-10-23 04:30:08'),
(134, 'App\\Models\\User', 1, 'auth_token', '880da5084ed3b84ebd7f27ec70f5077d1447e2ed152743ea89b530daa99fac0e', '[\"*\"]', '2024-10-23 05:33:45', NULL, '2024-10-23 04:31:51', '2024-10-23 05:33:45'),
(135, 'App\\Models\\User', 1, 'auth_token', '084060f04dac581a45059f8bacfd6063772e8270f7c63a5dd03d4c5001541dc1', '[\"*\"]', NULL, NULL, '2024-10-23 04:31:52', '2024-10-23 04:31:52'),
(136, 'App\\Models\\User', 1, 'auth_token', 'c371ecc08c9d44a5c3192b3375270e5b3ffe23303eec5b178a52de1da3ac1f51', '[\"*\"]', '2024-10-23 04:46:07', NULL, '2024-10-23 04:36:28', '2024-10-23 04:46:07'),
(137, 'App\\Models\\User', 1, 'auth_token', 'f085109f4ca6a2367ba66d61ec5c39f8e098bfff883399730dbf556bcc57e361', '[\"*\"]', NULL, NULL, '2024-10-23 04:36:29', '2024-10-23 04:36:29'),
(138, 'App\\Models\\User', 359, 'auth_token', 'df1f7d07e3d3964c437598710305e162f6f8e010b9480a8730896e3d9afa025a', '[\"*\"]', NULL, NULL, '2024-10-23 04:38:35', '2024-10-23 04:38:35'),
(139, 'App\\Models\\User', 360, 'auth_token', '1246d509650f9204581c0861ed237b41d959372d920cb94f4308ee8ca518ba89', '[\"*\"]', NULL, NULL, '2024-10-23 04:44:46', '2024-10-23 04:44:46'),
(140, 'App\\Models\\User', 1, 'auth_token', '4c94e2be684cc8eb2c5a920a037cae86824083d86cd0ed6dd7ce1075e13e85ff', '[\"*\"]', '2024-10-23 04:57:54', NULL, '2024-10-23 04:49:52', '2024-10-23 04:57:54'),
(141, 'App\\Models\\User', 1, 'auth_token', 'e9eda431edcf50a52102db36c08d23ecdceacf8d3fcaeafaffe51c166c9bae3d', '[\"*\"]', NULL, NULL, '2024-10-23 04:49:53', '2024-10-23 04:49:53'),
(142, 'App\\Models\\User', 361, 'auth_token', '94575f6e80f11a0ec3e47f4afa90e4b92af041f8ff513a5d9622cc70e9713ac6', '[\"*\"]', NULL, NULL, '2024-10-23 04:56:20', '2024-10-23 04:56:20'),
(143, 'App\\Models\\User', 1, 'auth_token', 'd8721040b0fdea5a804daaf9b4623b0638c1b2dc8fd1c636bc4c8584c45b81d0', '[\"*\"]', '2024-10-23 05:09:44', NULL, '2024-10-23 05:05:02', '2024-10-23 05:09:44'),
(144, 'App\\Models\\User', 1, 'auth_token', '940d7f01a2df03b93e6714720fd90df7e85a6019d3092d0c94a8a6bb9e02fcd2', '[\"*\"]', NULL, NULL, '2024-10-23 05:05:03', '2024-10-23 05:05:03'),
(145, 'App\\Models\\User', 1, 'auth_token', '82d3b089668b88c3108f27386205319d33ee0b7540b0e6a2713e08ba5219693b', '[\"*\"]', '2024-10-23 05:31:28', NULL, '2024-10-23 05:11:00', '2024-10-23 05:31:28'),
(146, 'App\\Models\\User', 1, 'auth_token', '60c83c73364347f5524cc19a0ea52aeb617b565bf456042277186993b3db83b0', '[\"*\"]', NULL, NULL, '2024-10-23 05:11:01', '2024-10-23 05:11:01'),
(147, 'App\\Models\\User', 365, 'auth_token', '76b15188a0a896fcd8aac91e2fc22f027ae000205d49c4fb85bdf94f7f31581b', '[\"*\"]', NULL, NULL, '2024-10-23 05:12:53', '2024-10-23 05:12:53'),
(148, 'App\\Models\\User', 366, 'auth_token', '07883b3e83290f1eb886f04c4a240f4446552e3414de2b166b94f3e9e4ff6352', '[\"*\"]', NULL, NULL, '2024-10-23 05:13:45', '2024-10-23 05:13:45'),
(149, 'App\\Models\\User', 367, 'auth_token', '27d6cbb16e500e10d8b5b517701de86af0a78c1d470c127adeabd29051246996', '[\"*\"]', NULL, NULL, '2024-10-23 05:15:52', '2024-10-23 05:15:52'),
(150, 'App\\Models\\User', 1, 'auth_token', '8bd493b6c21ae3afed65f3995fc7f1b5a70920c8be56bc984fbe7ad272f6493e', '[\"*\"]', '2024-10-23 07:38:38', NULL, '2024-10-23 05:33:54', '2024-10-23 07:38:38'),
(151, 'App\\Models\\User', 1, 'auth_token', 'fca02421e2e34ccad5685720c2e7fdb8aa5ac7bce6869f994be01298027095d4', '[\"*\"]', NULL, NULL, '2024-10-23 05:33:55', '2024-10-23 05:33:55'),
(152, 'App\\Models\\User', 1, 'auth_token', 'e1cd5199fa8ea0366513356949914f4ce0f1ec6c9fe8ec785ddad3c4025881fd', '[\"*\"]', '2024-10-23 06:15:58', NULL, '2024-10-23 05:49:30', '2024-10-23 06:15:58'),
(153, 'App\\Models\\User', 1, 'auth_token', '4d7fa5c7905b3171bfee0186f3d9c3c1238ebd9a854fe74cf2cfc84c94f40cc9', '[\"*\"]', NULL, NULL, '2024-10-23 05:49:31', '2024-10-23 05:49:31'),
(154, 'App\\Models\\User', 1, 'auth_token', '118c68af0240fdf5bc111cbfa242af792b934a9504cc05c3bf70b92566369c23', '[\"*\"]', '2024-10-23 06:18:42', NULL, '2024-10-23 06:16:43', '2024-10-23 06:18:42'),
(155, 'App\\Models\\User', 1, 'auth_token', 'ec6b125b3eef0d20e686fc601b265a706ac5079117f1bea845bcc370e868b4c9', '[\"*\"]', NULL, NULL, '2024-10-23 06:16:44', '2024-10-23 06:16:44'),
(156, 'App\\Models\\User', 1, 'auth_token', '5af910c867532149d8abcf7ad5222b6777156639ff754c4b106fa8ed69de6db3', '[\"*\"]', '2024-10-23 06:34:56', NULL, '2024-10-23 06:19:05', '2024-10-23 06:34:56'),
(157, 'App\\Models\\User', 1, 'auth_token', 'c7c9b1bab5f731a8034bd4947792cba19e6e47c44b5e33079cf2095b8f9732a4', '[\"*\"]', NULL, NULL, '2024-10-23 06:19:06', '2024-10-23 06:19:06'),
(158, 'App\\Models\\User', 1, 'auth_token', '27c4ec84b2d561829d7f4e4347f30a5670f74fc25c08645622b45a417ba98650', '[\"*\"]', '2024-10-23 07:38:50', NULL, '2024-10-23 06:44:33', '2024-10-23 07:38:50'),
(159, 'App\\Models\\User', 1, 'auth_token', '41043fd331d57bd1f7e13e725d07d1f1d2857c6135c14c621a85781bc37c2c4b', '[\"*\"]', NULL, NULL, '2024-10-23 06:44:34', '2024-10-23 06:44:34'),
(160, 'App\\Models\\User', 1, 'auth_token', 'e5a14ac1bc9a1853f135ba04aec0b964887381134c7940c9cedb78218ffa1d2b', '[\"*\"]', '2024-10-23 11:47:35', NULL, '2024-10-23 11:27:35', '2024-10-23 11:47:35'),
(161, 'App\\Models\\User', 1, 'auth_token', '956d1a183aded5c371ed5f4e598a09ee9e8d513a093926aa9f7054b18bfc88ba', '[\"*\"]', NULL, NULL, '2024-10-23 11:27:36', '2024-10-23 11:27:36'),
(162, 'App\\Models\\User', 370, 'auth_token', '73508f14d5d1410c5f0558649ca6374cf9ee8155561f6d00e90902d5e8d51ca1', '[\"*\"]', NULL, NULL, '2024-10-23 11:43:28', '2024-10-23 11:43:28'),
(163, 'App\\Models\\User', 1, 'auth_token', 'a3412146f303d6db2e478a512fa1c761b28ce6a6dfd511f2ba6ae0f925928805', '[\"*\"]', '2024-10-23 12:03:44', NULL, '2024-10-23 11:47:49', '2024-10-23 12:03:44'),
(164, 'App\\Models\\User', 1, 'auth_token', 'deff3cb66cfdccbedf89a3744415d6189339fd3cf8f2fcc7b3a6bd7caaf08115', '[\"*\"]', NULL, NULL, '2024-10-23 11:47:50', '2024-10-23 11:47:50'),
(165, 'App\\Models\\User', 371, 'auth_token', '5c4b31015126cf878fbe866484e89888c3c8ab5fa593afcd1ce51e4f7010125e', '[\"*\"]', NULL, NULL, '2024-10-23 11:53:43', '2024-10-23 11:53:43'),
(166, 'App\\Models\\User', 372, 'auth_token', '0c1c96346fa313b07cb0bcb7c1cc9321e0f0bc16875554e5cbc1cb960297e483', '[\"*\"]', NULL, NULL, '2024-10-23 11:56:05', '2024-10-23 11:56:05'),
(167, 'App\\Models\\User', 373, 'auth_token', '534d071f8ecc365dc8260002c569ae71a7e8219ac472456dbbd7d5f8c323b569', '[\"*\"]', NULL, NULL, '2024-10-23 11:57:53', '2024-10-23 11:57:53'),
(168, 'App\\Models\\User', 1, 'auth_token', 'd35414db414d3e2deef7af83a6da8433fe733126d7a93022e1ea2a2ee3cc4b1b', '[\"*\"]', '2024-10-23 12:07:47', NULL, '2024-10-23 12:04:06', '2024-10-23 12:07:47'),
(169, 'App\\Models\\User', 1, 'auth_token', '61ce3feefa7a700e67fbe21c090208e607f2c11e66004f551276d3b63f47fb9a', '[\"*\"]', NULL, NULL, '2024-10-23 12:04:09', '2024-10-23 12:04:09'),
(170, 'App\\Models\\User', 1, 'auth_token', '246181465dbc970880b7404555d909645a57ebddda1ba47454bdf72419382cb5', '[\"*\"]', '2024-10-23 12:59:55', NULL, '2024-10-23 12:08:03', '2024-10-23 12:59:55'),
(171, 'App\\Models\\User', 1, 'auth_token', '9bf974454d73d05d87d8ea520443e1594aa52768ff11d3c414ff3cc137ef5b8d', '[\"*\"]', NULL, NULL, '2024-10-23 12:08:04', '2024-10-23 12:08:04'),
(172, 'App\\Models\\User', 1, 'auth_token', '4505ece6acba7873787fc8f54df74f71c6ed9660033cabe10c4a67a57684161e', '[\"*\"]', '2024-10-24 00:40:00', NULL, '2024-10-23 23:08:19', '2024-10-24 00:40:00'),
(173, 'App\\Models\\User', 1, 'auth_token', 'dfbe528c77a76d0f6ce81ed91c705c3f0a5307d682f0cbfe6a96da784a8c25c1', '[\"*\"]', NULL, NULL, '2024-10-23 23:08:20', '2024-10-23 23:08:20'),
(174, 'App\\Models\\User', 1, 'auth_token', '3a3c091945583fc00ec3517869b565f99616fb55fac099b8060f53ed11cb1339', '[\"*\"]', '2024-10-24 01:28:45', NULL, '2024-10-23 23:10:33', '2024-10-24 01:28:45'),
(175, 'App\\Models\\User', 1, 'auth_token', 'eacc9b3536c9fa89c48e79b902e8d721ce6d5dfa17269421ba946118cb8a9007', '[\"*\"]', NULL, NULL, '2024-10-23 23:10:34', '2024-10-23 23:10:34'),
(176, 'App\\Models\\User', 1, 'auth_token', '4e01bdaa26c0f54c51b1d7c7459c9a9bfd836cbd203fd23825e279ca292e75dd', '[\"*\"]', NULL, NULL, '2024-10-23 23:16:44', '2024-10-23 23:16:44'),
(177, 'App\\Models\\User', 1, 'auth_token', '3f44cfd80696070523ac97e19898bba0d1e65d91cf55747b08251edbbdb20df7', '[\"*\"]', '2024-10-24 01:33:29', NULL, '2024-10-23 23:16:52', '2024-10-24 01:33:29'),
(178, 'App\\Models\\User', 1, 'auth_token', '7abaeced7bde656b3dc335d76da189f6ac3cd245e8981971904b248501f971ca', '[\"*\"]', NULL, NULL, '2024-10-23 23:16:53', '2024-10-23 23:16:53'),
(179, 'App\\Models\\User', 1, 'auth_token', '21ac48c911eee39e4c00b60dbb70f16b999a739d37389d3dcd2347db7abecf12', '[\"*\"]', '2024-10-24 06:23:56', NULL, '2024-10-23 23:50:36', '2024-10-24 06:23:56'),
(180, 'App\\Models\\User', 1, 'auth_token', '5ad991a1ff31f2e171ccd1702d7accd55e0809894c0025577265984e96786fe0', '[\"*\"]', '2024-10-24 00:40:57', NULL, '2024-10-24 00:40:33', '2024-10-24 00:40:57'),
(181, 'App\\Models\\User', 1, 'auth_token', 'c0777225b44664943631630900492dd89f3f0d878a596d43e808af98ef42c94b', '[\"*\"]', NULL, NULL, '2024-10-24 00:40:34', '2024-10-24 00:40:34'),
(182, 'App\\Models\\User', 1, 'auth_token', 'b772345a225762585f6ac87a657106a06a88851f45cacfe7483418a38da80d7a', '[\"*\"]', '2024-10-24 07:26:58', NULL, '2024-10-24 00:44:28', '2024-10-24 07:26:58'),
(183, 'App\\Models\\User', 1, 'auth_token', '72b63183e7217588c4fac54d8e5b6fdd4879eceaeabaa861d21c1ca375b9555c', '[\"*\"]', NULL, NULL, '2024-10-24 00:44:29', '2024-10-24 00:44:29'),
(184, 'App\\Models\\User', 1, 'auth_token', '0ac16c02f0c011f7bf143b3693cc32c4aff8d89eb17b0ed119969f36fdee7a55', '[\"*\"]', '2024-10-24 01:29:56', NULL, '2024-10-24 01:29:20', '2024-10-24 01:29:56'),
(185, 'App\\Models\\User', 1, 'auth_token', 'f9dab98dc0fbf6a636a44050b4e6214ca7adc874bff0eb788d298b5aa07f2aa5', '[\"*\"]', NULL, NULL, '2024-10-24 01:29:21', '2024-10-24 01:29:21'),
(186, 'App\\Models\\User', 1, 'auth_token', '99186e3fb746eedc9bff929a10cb68dbc8bf1e91b6a22a07e3791f972f503c85', '[\"*\"]', '2024-10-24 03:37:19', NULL, '2024-10-24 01:33:58', '2024-10-24 03:37:19'),
(187, 'App\\Models\\User', 1, 'auth_token', '70ac68497e2dfde179acf9119903f3214e5829daa73290ee815ba4975e8af235', '[\"*\"]', NULL, NULL, '2024-10-24 01:33:59', '2024-10-24 01:33:59'),
(188, 'App\\Models\\User', 377, 'auth_token', '575a28c476b90f4216aea2a071f26bc4fa50c70e834d040e2a135e4be413121e', '[\"*\"]', NULL, NULL, '2024-10-24 02:30:27', '2024-10-24 02:30:27'),
(189, 'App\\Models\\User', 1, 'auth_token', 'ad63d7f7cc72c376fb36b8ffff4b52e8470c48d89d2120c98b4882c85e6082dd', '[\"*\"]', '2024-10-24 03:41:48', NULL, '2024-10-24 03:41:46', '2024-10-24 03:41:48'),
(190, 'App\\Models\\User', 1, 'auth_token', 'f5f544c9f8776f719a739e802610ac4cc53f875a34e97f22b6ab350931017ff1', '[\"*\"]', NULL, NULL, '2024-10-24 03:41:47', '2024-10-24 03:41:47'),
(191, 'App\\Models\\User', 1, 'auth_token', 'e0c775f6990412fed0fcc470e58a6b9b8b0d45323ccfb0b03ffde772330abd3f', '[\"*\"]', '2024-10-24 04:49:19', NULL, '2024-10-24 03:51:11', '2024-10-24 04:49:19'),
(192, 'App\\Models\\User', 1, 'auth_token', '0db320fd397937622bb4aeb2ab36c7ade617cf8ce0d1cac92e47776df7ed8dda', '[\"*\"]', NULL, NULL, '2024-10-24 03:51:12', '2024-10-24 03:51:12'),
(193, 'App\\Models\\User', 1, 'auth_token', 'f9cb8fc99a3e2b269c2664774536c27c563f6619ad933848f25f829326ff2cc9', '[\"*\"]', '2024-10-24 04:00:52', NULL, '2024-10-24 03:58:53', '2024-10-24 04:00:52'),
(194, 'App\\Models\\User', 1, 'auth_token', '9274f9eae39c2a00d94d74fe16caabff89ef48316615bcfd3b383a1e101a2472', '[\"*\"]', NULL, NULL, '2024-10-24 03:58:54', '2024-10-24 03:58:54'),
(195, 'App\\Models\\User', 1, 'auth_token', 'b89648a2efa820222f5780e5bf91515c5c99ee398682ac128100ea32c7138a77', '[\"*\"]', '2024-10-24 04:57:42', NULL, '2024-10-24 04:04:58', '2024-10-24 04:57:42'),
(196, 'App\\Models\\User', 1, 'auth_token', '032742c040a01bc78feaf1515d1687216eb73894dddfb64beeb0c20889238ece', '[\"*\"]', NULL, NULL, '2024-10-24 04:04:59', '2024-10-24 04:04:59'),
(197, 'App\\Models\\User', 378, 'auth_token', 'c13001401b896d02e0dcf619b69e5eda672a0620578e29c5af3438774ec6f552', '[\"*\"]', NULL, NULL, '2024-10-24 04:10:23', '2024-10-24 04:10:23'),
(198, 'App\\Models\\User', 1, 'auth_token', '4fd327c21a7743d3fbdaacbb5a7bc7a72f5e8cfad0959fdbd9ca05c955d20b56', '[\"*\"]', '2024-10-24 05:04:09', NULL, '2024-10-24 04:13:46', '2024-10-24 05:04:09'),
(199, 'App\\Models\\User', 1, 'auth_token', 'f0f58d2bffaec4cc36e0bc37fdef41054ae7dd983bab5fb8565fc22d79bec407', '[\"*\"]', NULL, NULL, '2024-10-24 04:13:47', '2024-10-24 04:13:47'),
(200, 'App\\Models\\User', 1, 'auth_token', '1ec296b86f621b1e9cfdfe024d17db872f199b3ed468c795aaf54d5f8504972b', '[\"*\"]', '2024-10-24 07:37:47', NULL, '2024-10-24 06:41:18', '2024-10-24 07:37:47'),
(201, 'App\\Models\\User', 1, 'auth_token', 'c4059e6f9004e53cb76d422150f496e27525e678e891e132943f7d3cf31f415e', '[\"*\"]', NULL, NULL, '2024-10-24 06:41:19', '2024-10-24 06:41:19'),
(202, 'App\\Models\\User', 379, 'auth_token', '76e40511c99ca23e4e1b036c0fae92dcf4b43a7698a613ff629e1c48476517ed', '[\"*\"]', NULL, NULL, '2024-10-24 06:45:00', '2024-10-24 06:45:00'),
(203, 'App\\Models\\User', 1, 'auth_token', '57c029e92e3ebee0731f411a2b3767e99366004bcbaca7b1fc6d7296918fe28d', '[\"*\"]', '2024-10-24 07:05:07', NULL, '2024-10-24 07:04:53', '2024-10-24 07:05:07'),
(204, 'App\\Models\\User', 1, 'auth_token', '60b427443d6a6ebd12e1a167c638b12b0503811f0035cb5960e1cfce2067c044', '[\"*\"]', '2024-10-24 07:16:37', NULL, '2024-10-24 07:11:49', '2024-10-24 07:16:37'),
(205, 'App\\Models\\User', 1, 'auth_token', '4b805457c5ca3476111637bcc0feebfd4142546e052dff41da42ad0c6be3bef1', '[\"*\"]', '2024-10-24 13:16:28', NULL, '2024-10-24 12:42:25', '2024-10-24 13:16:28'),
(206, 'App\\Models\\User', 1, 'auth_token', 'f8bbdd2b53253c72f93a6e526528dcc587b34952271846701fa877d16ec61ebb', '[\"*\"]', NULL, NULL, '2024-10-24 12:42:26', '2024-10-24 12:42:26'),
(207, 'App\\Models\\User', 382, 'auth_token', '47e10b77b735fabdc619736336ee7f33386e6343d2a7f8a8a509c189351b3f21', '[\"*\"]', NULL, NULL, '2024-10-24 13:07:16', '2024-10-24 13:07:16'),
(208, 'App\\Models\\User', 1, 'auth_token', '813ddcecffa76137b35215bb0cf38bf8df407e6c00df3e9b076cba92908493e5', '[\"*\"]', '2024-10-25 04:14:18', NULL, '2024-10-24 23:12:41', '2024-10-25 04:14:18'),
(209, 'App\\Models\\User', 1, 'auth_token', '7af30e7a01239155958193dae03552f022ab1343a86c027925b8d488d9e9ce7b', '[\"*\"]', NULL, NULL, '2024-10-24 23:12:42', '2024-10-24 23:12:42'),
(210, 'App\\Models\\User', 1, 'auth_token', '7e72062c2826b90437d0df0c144d31707dd29feac24211ccc75460cced517b90', '[\"*\"]', '2024-10-25 02:04:19', NULL, '2024-10-24 23:19:33', '2024-10-25 02:04:19'),
(211, 'App\\Models\\User', 1, 'auth_token', '1eaeb875385ce852d670acaf70fb0eb6e2ca1be7e16112c59307db49ac0ef51d', '[\"*\"]', NULL, NULL, '2024-10-24 23:19:35', '2024-10-24 23:19:35'),
(212, 'App\\Models\\User', 383, 'auth_token', 'c360ab499a4a163838d306d0615a9377de75134d3b795fee20885170f62efce2', '[\"*\"]', NULL, NULL, '2024-10-24 23:38:24', '2024-10-24 23:38:24'),
(213, 'App\\Models\\User', 1, 'auth_token', '68ec1d1d78a959cefd1971435b7e9471e0daf3afa90152bd007afeb5e88c7281', '[\"*\"]', '2024-10-25 02:08:32', NULL, '2024-10-24 23:58:26', '2024-10-25 02:08:32'),
(214, 'App\\Models\\User', 1, 'auth_token', 'c7eb244d29df6825162cdef570441919d0addc314fc55df442a2004bf75cd359', '[\"*\"]', NULL, NULL, '2024-10-24 23:58:27', '2024-10-24 23:58:27'),
(215, 'App\\Models\\User', 384, 'auth_token', '0a64731f1b976b0df1f07bf809d918190c7a54800d5b30ec912e62728234997c', '[\"*\"]', NULL, NULL, '2024-10-25 00:04:36', '2024-10-25 00:04:36'),
(216, 'App\\Models\\User', 385, 'auth_token', '5e44fe2803ff5d8d34d2499a47d622d99b58cab79a017f5eef8407a3c323b598', '[\"*\"]', NULL, NULL, '2024-10-25 01:08:46', '2024-10-25 01:08:46'),
(217, 'App\\Models\\User', 1, 'auth_token', '3533d0a5cbf2fa67db8074e54199e2d751e7add238757c1a95f289d2413ae0e2', '[\"*\"]', '2024-10-25 02:06:25', NULL, '2024-10-25 02:06:16', '2024-10-25 02:06:25'),
(218, 'App\\Models\\User', 1, 'auth_token', 'ee714c46dce6f3e63a80333a03ac60400f9fd4abe4c1969a2f02734667fb41e2', '[\"*\"]', NULL, NULL, '2024-10-25 02:06:17', '2024-10-25 02:06:17'),
(219, 'App\\Models\\User', 1, 'auth_token', 'e5167ae51ecef61521d00c0a1476e108adb37665ef0412c0c7328eefad2295f5', '[\"*\"]', '2024-10-25 02:07:46', NULL, '2024-10-25 02:07:36', '2024-10-25 02:07:46'),
(220, 'App\\Models\\User', 1, 'auth_token', 'd9557b0faa3d83b48097c2b760d84bd399fe76ac33d39e88fb6081a7a6b362d0', '[\"*\"]', NULL, NULL, '2024-10-25 02:07:37', '2024-10-25 02:07:37'),
(221, 'App\\Models\\User', 1, 'auth_token', '8e5d8571b17dd28949ccbe96e3b9bec03c4ce4a45da6ecfa78144279d0ab086d', '[\"*\"]', '2024-10-25 03:27:17', NULL, '2024-10-25 03:26:56', '2024-10-25 03:27:17'),
(222, 'App\\Models\\User', 1, 'auth_token', '4b251f318fba7a9989fcb40ffefb43a87f7c9adcd954b0f6b0c5087700769802', '[\"*\"]', NULL, NULL, '2024-10-25 03:26:57', '2024-10-25 03:26:57'),
(223, 'App\\Models\\User', 1, 'auth_token', '5018be8dc45bb19e6fdfef0b0ecc0c6ffea59203a442a081ba99254505de6c2e', '[\"*\"]', '2024-10-25 05:35:15', NULL, '2024-10-25 03:54:22', '2024-10-25 05:35:15'),
(224, 'App\\Models\\User', 1, 'auth_token', 'ea927e286cbee45897dcf4f1f09185fb23f1da26c1df4a6b5e749da1011103e5', '[\"*\"]', NULL, NULL, '2024-10-25 03:54:24', '2024-10-25 03:54:24'),
(225, 'App\\Models\\User', 1, 'auth_token', 'e4c590b32aa220b80a53cb976d27e2520257353cc2b4578c00bd30c55441c3e4', '[\"*\"]', '2024-10-25 06:20:12', NULL, '2024-10-25 03:59:40', '2024-10-25 06:20:12'),
(226, 'App\\Models\\User', 1, 'auth_token', '821a326b464a90153f07a99b6265ae9df0e8ea8fdd0015ff6122fa5d42350d8f', '[\"*\"]', NULL, NULL, '2024-10-25 03:59:41', '2024-10-25 03:59:41'),
(227, 'App\\Models\\User', 1, 'auth_token', 'a04da08fd8b0d77175ebf40c67635cc5205737db8488540db300016dc0b8cd66', '[\"*\"]', '2024-10-25 05:19:58', NULL, '2024-10-25 05:07:31', '2024-10-25 05:19:58'),
(228, 'App\\Models\\User', 1, 'auth_token', 'b93cd5f7e1ecd9f43398df33b30a27261d6e6973b5450d5621b8c4e800d145d6', '[\"*\"]', NULL, NULL, '2024-10-25 05:07:33', '2024-10-25 05:07:33'),
(229, 'App\\Models\\User', 1, 'auth_token', '2e1300973207a5caa4332664c95b16dd0211d30ceed57ce8f6e7d1ddfb612a25', '[\"*\"]', '2024-10-25 07:36:41', NULL, '2024-10-25 05:20:37', '2024-10-25 07:36:41'),
(230, 'App\\Models\\User', 1, 'auth_token', 'f34f6d3e86001096fc92fb3c83cddf112ce8b3d81e329a4b3632a2b15f729149', '[\"*\"]', NULL, NULL, '2024-10-25 05:20:38', '2024-10-25 05:20:38'),
(231, 'App\\Models\\User', 387, 'auth_token', 'd05124fc3f3755fda060918b4b3b7f7866143302c7b0d8fcf8902456a80ed663', '[\"*\"]', NULL, NULL, '2024-10-25 05:32:47', '2024-10-25 05:32:47'),
(232, 'App\\Models\\User', 1, 'auth_token', 'a78137e1ea1fdddb2eb132d015ff1f9edfee401673284a2bb7be336f1709f3cc', '[\"*\"]', '2024-10-25 06:32:19', NULL, '2024-10-25 05:35:42', '2024-10-25 06:32:19'),
(233, 'App\\Models\\User', 1, 'auth_token', '78bca87479772ab58918eaff4027cc8b56738c62e0479641ecbebd044c7c9b61', '[\"*\"]', NULL, NULL, '2024-10-25 05:35:43', '2024-10-25 05:35:43'),
(234, 'App\\Models\\User', 388, 'auth_token', '1aa98dfa0d481bf99ca5de4ecd2a6962c60e5db1db751ef76f0616ccfe5242dc', '[\"*\"]', NULL, NULL, '2024-10-25 05:52:30', '2024-10-25 05:52:30'),
(235, 'App\\Models\\User', 1, 'auth_token', 'dfc81007a14f57a1407f98f32e02bcfe19d36038a687eb268189774a7cf82b16', '[\"*\"]', '2024-10-25 06:32:32', NULL, '2024-10-25 06:30:10', '2024-10-25 06:32:32'),
(236, 'App\\Models\\User', 1, 'auth_token', 'c1ce764d41ac5ce2bf839edad2dd6ac2a36cea70c9df7632363198114482f388', '[\"*\"]', NULL, NULL, '2024-10-25 06:30:11', '2024-10-25 06:30:11'),
(237, 'App\\Models\\User', 1, 'auth_token', '7f0056e535c93ab2c243e8313f6ff29f4adb0d5a3077124f7d1d6e08be9b644e', '[\"*\"]', '2024-10-25 07:26:21', NULL, '2024-10-25 06:40:04', '2024-10-25 07:26:21'),
(238, 'App\\Models\\User', 1, 'auth_token', 'd87c40dc6d1c8f85ece4d63fc1244a07b59f9e189f1ac23ccaf2ae1cf6a8997e', '[\"*\"]', NULL, NULL, '2024-10-25 06:40:05', '2024-10-25 06:40:05'),
(239, 'App\\Models\\User', 389, 'auth_token', 'e1e93115802d167521dcad235b98624cbd93e474150c4a8176305ef4636fd0b7', '[\"*\"]', NULL, NULL, '2024-10-25 07:19:44', '2024-10-25 07:19:44'),
(240, 'App\\Models\\User', 1, 'auth_token', '7a1ce2aad0f20a9f400b30386e09b433f66c50d854cefe61bd985aafee2cad0b', '[\"*\"]', '2024-10-27 14:06:02', NULL, '2024-10-27 14:03:17', '2024-10-27 14:06:02'),
(241, 'App\\Models\\User', 1, 'auth_token', 'ab9b0dd3adffedaa53f956403d308f8935623d077984c7a17a5315d3cea06b53', '[\"*\"]', NULL, NULL, '2024-10-27 14:03:18', '2024-10-27 14:03:18'),
(242, 'App\\Models\\User', 1, 'auth_token', 'a188667d0d3943327eb34beafb3883bcec0eea26e9593df882f14a1e29310157', '[\"*\"]', '2024-10-28 06:48:33', NULL, '2024-10-28 00:03:45', '2024-10-28 06:48:33'),
(243, 'App\\Models\\User', 1, 'auth_token', 'd52db0b1ce0758757566bfcdd5c78aa38c3858b13164b5a59ee85b38e3489455', '[\"*\"]', NULL, NULL, '2024-10-28 00:03:46', '2024-10-28 00:03:46'),
(244, 'App\\Models\\User', 1, 'auth_token', 'e1794f1e9d25103076e85b43db798f1ed12ba3741442e876be9e2723a120563c', '[\"*\"]', '2024-10-28 03:26:03', NULL, '2024-10-28 01:18:20', '2024-10-28 03:26:03'),
(245, 'App\\Models\\User', 1, 'auth_token', 'd551cba6c692d0647e9f1b258c92760abba39d26f4a4daaa6f0b036b68d9e852', '[\"*\"]', NULL, NULL, '2024-10-28 01:18:21', '2024-10-28 01:18:21'),
(246, 'App\\Models\\User', 1, 'auth_token', '4eff61320444cabe53bcbce6bb5743786c62e15bfb10d5e663868480555ac44e', '[\"*\"]', '2024-10-28 06:36:02', NULL, '2024-10-28 06:30:16', '2024-10-28 06:36:02'),
(247, 'App\\Models\\User', 1, 'auth_token', '2b1717c2ff209bd034ce6d7ebf7ef21ec8c436752263affde40fbf02e7c42c29', '[\"*\"]', '2024-10-28 07:53:45', NULL, '2024-10-28 07:51:26', '2024-10-28 07:53:45'),
(248, 'App\\Models\\User', 1, 'auth_token', '8b75f08554d9a8e63efbf7ad491d2c8b612aa6abb5fb582477918bf1f832acb9', '[\"*\"]', NULL, NULL, '2024-10-28 07:51:27', '2024-10-28 07:51:27'),
(249, 'App\\Models\\User', 1, 'auth_token', '070c5f53f69ff44c64597d62a6d801052aead9594a443c2a3e63ca283c9af16b', '[\"*\"]', '2024-10-28 08:03:51', NULL, '2024-10-28 07:54:44', '2024-10-28 08:03:51'),
(250, 'App\\Models\\User', 1, 'auth_token', 'b2c0cb6502f332b111b654d67770c1bc9af53998b473cc936e75e3c5625e4282', '[\"*\"]', NULL, NULL, '2024-10-28 07:54:45', '2024-10-28 07:54:45'),
(251, 'App\\Models\\User', 1, 'auth_token', 'c4d6148a4761767136735a39064e4204e0b253fe393e97fac39cc5ad22c11b32', '[\"*\"]', '2024-10-28 17:37:18', NULL, '2024-10-28 17:36:13', '2024-10-28 17:37:18'),
(252, 'App\\Models\\User', 1, 'auth_token', '26d429727541e90194176799612dd2366fcd34f542853e72ff9699baae778866', '[\"*\"]', NULL, NULL, '2024-10-28 17:36:14', '2024-10-28 17:36:14'),
(253, 'App\\Models\\User', 1, 'auth_token', '3043e8e5e4dcc898ee066b88f11e87d2f273036c5a78c623154ec25eaed177a9', '[\"*\"]', '2024-10-28 23:24:38', NULL, '2024-10-28 23:19:00', '2024-10-28 23:24:38'),
(254, 'App\\Models\\User', 1, 'auth_token', '28a113169307fb255558dff86456f10364613fe58241f9ce4769f3aff89ad4e5', '[\"*\"]', NULL, NULL, '2024-10-28 23:19:01', '2024-10-28 23:19:01'),
(255, 'App\\Models\\User', 1, 'auth_token', '1e9a47ce908aafa43228a19b037f0d4fab40cf33e6dff9682053cc1738d25ebc', '[\"*\"]', '2024-10-29 01:23:33', NULL, '2024-10-28 23:33:46', '2024-10-29 01:23:33'),
(256, 'App\\Models\\User', 1, 'auth_token', '517a5029a2a20ab2a552e1b09f59893644f5ce954e4aa5f9ca700b3ea06becb0', '[\"*\"]', NULL, NULL, '2024-10-28 23:33:47', '2024-10-28 23:33:47'),
(257, 'App\\Models\\User', 1, 'auth_token', 'f572f51f01237ffbc305e8076decfe32700836288618534b50681ee8ff665a2e', '[\"*\"]', '2024-10-29 00:21:32', NULL, '2024-10-28 23:38:01', '2024-10-29 00:21:32'),
(258, 'App\\Models\\User', 1, 'auth_token', 'a61bd27de7cf308a1224b6bcd195c30665eee65e1ab6db94bb27028e2dbfc573', '[\"*\"]', NULL, NULL, '2024-10-28 23:38:02', '2024-10-28 23:38:02'),
(259, 'App\\Models\\User', 390, 'auth_token', '7ce92021818fd7debe596f48ba5b59d4f3bf96c9393e38b59cc4ac952981e81c', '[\"*\"]', NULL, NULL, '2024-10-28 23:51:22', '2024-10-28 23:51:22'),
(260, 'App\\Models\\User', 391, 'auth_token', '73131309732557c5b6268a3ba6af2edc57992b73627e999305c8c63b8db1a084', '[\"*\"]', NULL, NULL, '2024-10-28 23:54:03', '2024-10-28 23:54:03'),
(261, 'App\\Models\\User', 1, 'auth_token', 'f29c8614aec3c3f187bc530cf5aa77c1b35ed60f6e731c31f91af7a26aed675e', '[\"*\"]', '2024-10-29 00:17:20', NULL, '2024-10-29 00:15:10', '2024-10-29 00:17:20'),
(262, 'App\\Models\\User', 1, 'auth_token', '189a11e7811ed12515668ff47cd184002c0dcbb5864b9ec910eaeb25c7ceeac8', '[\"*\"]', '2024-10-29 07:15:03', NULL, '2024-10-29 00:21:53', '2024-10-29 07:15:03'),
(263, 'App\\Models\\User', 1, 'auth_token', '661636d47728be6b094af875280da61469e014cf0a5c593d3617b078809902ba', '[\"*\"]', NULL, NULL, '2024-10-29 00:21:54', '2024-10-29 00:21:54'),
(264, 'App\\Models\\User', 392, 'auth_token', 'ecce1bd5dc7f661d74557e7cadf73aae65be2bc81ca96623fe05bcf2faa4305e', '[\"*\"]', NULL, NULL, '2024-10-29 01:22:26', '2024-10-29 01:22:26'),
(265, 'App\\Models\\User', 1, 'auth_token', '1763897d52de4244eb81c75fa7ffa89248d3d43fce593cee36dc4a54f74ce841', '[\"*\"]', '2024-10-29 01:34:15', NULL, '2024-10-29 01:23:59', '2024-10-29 01:34:15');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(266, 'App\\Models\\User', 1, 'auth_token', '084394477d78c4444026bb33f42147878345aaa554f3a60a34184e59f2221360', '[\"*\"]', NULL, NULL, '2024-10-29 01:24:00', '2024-10-29 01:24:00'),
(267, 'App\\Models\\User', 393, 'auth_token', '874805bd25d95dbf034a9ab2ae1ae071e8d760eeb5383d67ea09a298f77bb44f', '[\"*\"]', NULL, NULL, '2024-10-29 02:24:13', '2024-10-29 02:24:13'),
(268, 'App\\Models\\User', 394, 'auth_token', '3642e369dc10a36ae174d5b88b83f3ff3e40589567dcee418809312bcf98c3ca', '[\"*\"]', NULL, NULL, '2024-10-29 02:27:05', '2024-10-29 02:27:05'),
(269, 'App\\Models\\User', 1, 'auth_token', 'ff3a47426a6571e413d0463067f9ecdef40afe4785212b48f008b4e66bb08b7d', '[\"*\"]', '2024-10-29 12:02:18', NULL, '2024-10-29 11:59:10', '2024-10-29 12:02:18'),
(270, 'App\\Models\\User', 1, 'auth_token', 'a1028993b1e4cbd6ac66dd2ef6099944872ec6cee7fb221da5e2841666191690', '[\"*\"]', NULL, NULL, '2024-10-29 11:59:11', '2024-10-29 11:59:11'),
(271, 'App\\Models\\User', 1, 'auth_token', '57b237dda3218af338b10ccc46aab3078e5bea396c62a36016a5aa83a0a0da4e', '[\"*\"]', '2024-10-29 12:03:22', NULL, '2024-10-29 12:03:14', '2024-10-29 12:03:22'),
(272, 'App\\Models\\User', 1, 'auth_token', '4bcf1c4f03b338061775eb574c4d1be74a95756464bbb01424b9d423242c120a', '[\"*\"]', NULL, NULL, '2024-10-29 12:03:15', '2024-10-29 12:03:15'),
(273, 'App\\Models\\User', 1, 'auth_token', 'ecafe176d76bf2a6931e67144cd7d76d58a155a43570dcd600f393a15c04112d', '[\"*\"]', '2024-10-29 12:04:34', NULL, '2024-10-29 12:04:02', '2024-10-29 12:04:34'),
(274, 'App\\Models\\User', 1, 'auth_token', '79601cdb1a4ecd2715659f208fbbd1561f1aa1bd83ac180931c104ec183544fc', '[\"*\"]', NULL, NULL, '2024-10-29 12:04:03', '2024-10-29 12:04:03'),
(275, 'App\\Models\\User', 1, 'auth_token', 'e92f2b84057e85c128231b324af86d4456b6de03d84d887e2e8d0047e51131f1', '[\"*\"]', '2024-10-29 12:20:03', NULL, '2024-10-29 12:05:21', '2024-10-29 12:20:03'),
(276, 'App\\Models\\User', 1, 'auth_token', 'e1185e722c549be163f365bff56be1fb23c3f7c871e8ad8fb1eb28d528e65317', '[\"*\"]', NULL, NULL, '2024-10-29 12:05:23', '2024-10-29 12:05:23'),
(277, 'App\\Models\\User', 399, 'auth_token', 'ddd6da355137a406601a6b00377d1ac60645cd37d45c16afb0b71b341b5d89ac', '[\"*\"]', NULL, NULL, '2024-10-29 12:14:14', '2024-10-29 12:14:14'),
(278, 'App\\Models\\User', 1, 'auth_token', 'ac47388ea1733313a57626ffef4a8fc6014ab4ccbf1eff84892429ca7ba2c5c7', '[\"*\"]', '2024-10-29 23:23:18', NULL, '2024-10-29 23:23:10', '2024-10-29 23:23:18'),
(279, 'App\\Models\\User', 1, 'auth_token', '6b3ce3ee5eded8c521ae08d116933b695c5ad0ea55ed2108320a39d46f341cb1', '[\"*\"]', NULL, NULL, '2024-10-29 23:23:11', '2024-10-29 23:23:11'),
(280, 'App\\Models\\User', 1, 'auth_token', 'dc86bd41b532209dcf09c6595406e2fdafbf20ac6fb385b91f0cd1ae9bd857de', '[\"*\"]', '2024-10-29 23:36:30', NULL, '2024-10-29 23:36:25', '2024-10-29 23:36:30'),
(281, 'App\\Models\\User', 1, 'auth_token', '791d1a194ae2655d80cb6db6ea63656c625ed12b265fc42fde7d945c9f346859', '[\"*\"]', NULL, NULL, '2024-10-29 23:36:26', '2024-10-29 23:36:26'),
(282, 'App\\Models\\User', 1, 'auth_token', 'ff05376f4987f22d823958d32756b2c8936d24b9226bf4f55704ff00868d1ec4', '[\"*\"]', '2024-10-29 23:53:41', NULL, '2024-10-29 23:37:21', '2024-10-29 23:53:41'),
(283, 'App\\Models\\User', 1, 'auth_token', '22423772833b50a2321ce1737cf5a0d8c8516e99114979c01132065d85a45517', '[\"*\"]', NULL, NULL, '2024-10-29 23:37:22', '2024-10-29 23:37:22'),
(284, 'App\\Models\\User', 400, 'auth_token', '0781d60579fa31e948562f769379ad81cdce45b182c0c3f4a078f4f38c319013', '[\"*\"]', NULL, NULL, '2024-10-29 23:38:45', '2024-10-29 23:38:45'),
(285, 'App\\Models\\User', 1, 'auth_token', '9734d12bcd33cfc6cd35817b6b48f6ab75c5cf0ff25e2070b1f9f3c34140dda1', '[\"*\"]', '2024-10-29 23:53:25', NULL, '2024-10-29 23:40:16', '2024-10-29 23:53:25'),
(286, 'App\\Models\\User', 1, 'auth_token', '2fe972210e7fbde04965a7f9ffb85fb10ecd5ebfc340ae9993f55aa574920b67', '[\"*\"]', '2024-10-30 01:22:22', NULL, '2024-10-30 01:21:26', '2024-10-30 01:22:22'),
(287, 'App\\Models\\User', 1, 'auth_token', 'c31707a6353eab42fcf81f742b3812658bdef6e5dafd2186262bbd2678e66306', '[\"*\"]', NULL, NULL, '2024-10-30 01:21:27', '2024-10-30 01:21:27'),
(288, 'App\\Models\\User', 1, 'auth_token', '473e9cceb642c9c7800fa7e933e19ba616a905ad084e5b6c9bd493387e47120c', '[\"*\"]', '2024-10-30 04:04:06', NULL, '2024-10-30 03:48:16', '2024-10-30 04:04:06'),
(289, 'App\\Models\\User', 1, 'auth_token', 'fe5f08af8a6fcfe52ddf79fc3c2b5538539bda049d4dfbb1bcd5e02d38079336', '[\"*\"]', NULL, NULL, '2024-10-30 03:48:17', '2024-10-30 03:48:17'),
(290, 'App\\Models\\User', 401, 'auth_token', 'f2f97a00dbf062cc19a097e43e9b0140eef30cff98061c6062b04575146ec73b', '[\"*\"]', NULL, NULL, '2024-10-30 04:01:36', '2024-10-30 04:01:36'),
(291, 'App\\Models\\User', 1, 'auth_token', '3f250c61510975bd78b6780b1e588dc9d8d4bbd499dc1b2ccc5884a9cd236297', '[\"*\"]', '2024-11-01 09:31:04', NULL, '2024-11-01 09:29:21', '2024-11-01 09:31:04'),
(292, 'App\\Models\\User', 1, 'auth_token', 'b6e6ba94237e120010648994c6e196a761e9871c4173fba6a2e984ec863733ad', '[\"*\"]', NULL, NULL, '2024-11-01 09:29:22', '2024-11-01 09:29:22'),
(293, 'App\\Models\\User', 1, 'auth_token', 'b2bc7b767010b21f2391aaea5890458567160111dd7fe01f3c558db9fa7ccee0', '[\"*\"]', '2024-11-03 15:43:03', NULL, '2024-11-03 15:42:26', '2024-11-03 15:43:03'),
(294, 'App\\Models\\User', 1, 'auth_token', 'a45908fcd9538d40aef2d72a869aff06ca0dd17de3aeb3463be0e67335bc4ab8', '[\"*\"]', NULL, NULL, '2024-11-03 15:42:26', '2024-11-03 15:42:26'),
(295, 'App\\Models\\User', 1, 'auth_token', 'c57a170ee9809bb05f877cd31cf715cfcfd8bb9c8a32612abdcd8f7263f16103', '[\"*\"]', '2024-11-04 07:56:12', NULL, '2024-11-03 23:35:26', '2024-11-04 07:56:12'),
(296, 'App\\Models\\User', 1, 'auth_token', '3be5a1b1255a74b59009a41327c8aba77b801ecf67c8876e4afb8ee322cf6c16', '[\"*\"]', NULL, NULL, '2024-11-03 23:35:27', '2024-11-03 23:35:27'),
(297, 'App\\Models\\User', 402, 'auth_token', '4e4c521b3fad0bf4039a2fa386b4402af82e8d2c5e0c1bb04bf7818ff66873c4', '[\"*\"]', NULL, NULL, '2024-11-04 01:20:19', '2024-11-04 01:20:19'),
(298, 'App\\Models\\User', 1, 'auth_token', '7b768b18f155414082e5e13497c285a87763d48d1210719a3ab7f0929c553890', '[\"*\"]', '2024-11-04 04:54:03', NULL, '2024-11-04 04:54:01', '2024-11-04 04:54:03'),
(299, 'App\\Models\\User', 1, 'auth_token', '3a1c8b4e291e04bd74717320003031110e69f69d45c4fe51ac41f707e66f0773', '[\"*\"]', NULL, NULL, '2024-11-04 04:54:02', '2024-11-04 04:54:02'),
(300, 'App\\Models\\User', 1, 'auth_token', '36b3709fa61a2197a6b03fee6c4feed9f75ce43fd88fb716625c5da08acd7c0c', '[\"*\"]', '2024-11-04 05:04:12', NULL, '2024-11-04 05:04:09', '2024-11-04 05:04:12'),
(301, 'App\\Models\\User', 1, 'auth_token', 'd7c648f45040c16ed0a7db4b0ec8195f90d3fc4671b00bd6349835dd9d256f01', '[\"*\"]', NULL, NULL, '2024-11-04 05:04:10', '2024-11-04 05:04:10'),
(302, 'App\\Models\\User', 1, 'auth_token', 'd53be75e8baf3c2ead0419b20c305faf95923ac269c6eaff5d0ddd64e72dac87', '[\"*\"]', '2024-11-04 05:22:18', NULL, '2024-11-04 05:21:22', '2024-11-04 05:22:18'),
(303, 'App\\Models\\User', 1, 'auth_token', '68c56273be5bd0279254b098c9434b7696fbbc4e248dd796de52af8b4c7b0d23', '[\"*\"]', NULL, NULL, '2024-11-04 05:21:23', '2024-11-04 05:21:23'),
(304, 'App\\Models\\User', 1, 'auth_token', 'e7c4990c38eb8b01b60aa58ec03d8a535a313277ae0015727eed8ee3fa61ffb1', '[\"*\"]', '2024-11-04 05:58:39', NULL, '2024-11-04 05:58:04', '2024-11-04 05:58:39'),
(305, 'App\\Models\\User', 1, 'auth_token', '1e2a8776dee22991393d1c886c04f6ab89b6c05ef94644ab5e0eaca4e0e5dddf', '[\"*\"]', NULL, NULL, '2024-11-04 05:58:05', '2024-11-04 05:58:05'),
(306, 'App\\Models\\User', 1, 'auth_token', '735ca06f808977d942d5b77a63015cc72d793a5817b892f49fd63a8ba10978fc', '[\"*\"]', '2024-11-04 06:10:41', NULL, '2024-11-04 05:59:09', '2024-11-04 06:10:41'),
(307, 'App\\Models\\User', 1, 'auth_token', 'ba3dac68aca463364f72f8cd690c6642d6213cb438afe8a0c09b0cd0daa17111', '[\"*\"]', NULL, NULL, '2024-11-04 05:59:11', '2024-11-04 05:59:11'),
(308, 'App\\Models\\User', 1, 'auth_token', '8ae4fdfec31382fdb48bca657a96a2595477045fb756b47d071d68bb48e17e96', '[\"*\"]', '2024-11-04 07:54:19', NULL, '2024-11-04 06:42:41', '2024-11-04 07:54:19'),
(309, 'App\\Models\\User', 1, 'auth_token', '704b678f421362d671fafa11bd1dcbc0cce142d9ebd756c3cec57ee9eaf257d1', '[\"*\"]', NULL, NULL, '2024-11-04 06:42:42', '2024-11-04 06:42:42'),
(310, 'App\\Models\\User', 403, 'auth_token', 'f0336fe9956503c8c252e6e1c606e3267b60da96412635c056e4f1a99f0c0a33', '[\"*\"]', NULL, NULL, '2024-11-04 07:22:08', '2024-11-04 07:22:08'),
(311, 'App\\Models\\User', 1, 'auth_token', 'aecc38d38da0321706289bc07e592bf3bd1eef2f569306826085184fceaca4a5', '[\"*\"]', '2024-11-04 07:27:24', NULL, '2024-11-04 07:27:21', '2024-11-04 07:27:24'),
(312, 'App\\Models\\User', 1, 'auth_token', '2c5032e8cfd84af8e947f7902588e95972d4d79df71438ba03f83b37c1ccbcc4', '[\"*\"]', NULL, NULL, '2024-11-04 07:27:23', '2024-11-04 07:27:23'),
(313, 'App\\Models\\User', 1, 'auth_token', '4487ddd50ec3a2868629d73368e1ccc7d9721105a1458f11c4dea9aaa53ba07a', '[\"*\"]', '2024-11-04 07:28:30', NULL, '2024-11-04 07:28:27', '2024-11-04 07:28:30'),
(314, 'App\\Models\\User', 1, 'auth_token', '6b4e0338aa93c1edf2b1bee0a897af57205f068a13bac5beaa66b2613634f804', '[\"*\"]', NULL, NULL, '2024-11-04 07:28:29', '2024-11-04 07:28:29'),
(315, 'App\\Models\\User', 1, 'auth_token', '52e73bf775c9405f7578e9c4e9461d2a91a1e203556bf7352e216278cf693007', '[\"*\"]', '2024-11-04 07:37:19', NULL, '2024-11-04 07:31:29', '2024-11-04 07:37:19'),
(316, 'App\\Models\\User', 1, 'auth_token', 'fe634d285aca89a5ba7bf69a608f1dbe28ca7e3b872aacfbb7ade443f7172f23', '[\"*\"]', NULL, NULL, '2024-11-04 07:31:30', '2024-11-04 07:31:30'),
(317, 'App\\Models\\User', 404, 'auth_token', 'e51cc62703995135bd55a85cf851376d9dfe2366c32d1a2e2349acdb4f8834c4', '[\"*\"]', NULL, NULL, '2024-11-04 07:37:06', '2024-11-04 07:37:06'),
(318, 'App\\Models\\User', 1, 'auth_token', '6814576c23178156c8b0879fb2eb206b5fb6646892085786a521978676d94878', '[\"*\"]', '2024-11-04 07:54:35', NULL, '2024-11-04 07:40:28', '2024-11-04 07:54:35'),
(319, 'App\\Models\\User', 1, 'auth_token', 'f6d57f92d6f450a740c5ce972909fc38375e5f91b60dc3cc54e23013db7aee58', '[\"*\"]', NULL, NULL, '2024-11-04 07:40:29', '2024-11-04 07:40:29'),
(320, 'App\\Models\\User', 405, 'auth_token', '23fa72adde593ffd24cbf75038123b30c670a26f84ce95d4c3743a2b688b3045', '[\"*\"]', NULL, NULL, '2024-11-04 07:41:23', '2024-11-04 07:41:23'),
(321, 'App\\Models\\User', 406, 'auth_token', '1407b2ea1867cee0305b3b093d02039a33874c4d9cc8528d5a46b36f7028a523', '[\"*\"]', NULL, NULL, '2024-11-04 07:48:59', '2024-11-04 07:48:59'),
(322, 'App\\Models\\User', 1, 'auth_token', '1dc21aef7bbe56f0262a177245b374b947b5eaed714ad65f854c5eeaedac290d', '[\"*\"]', '2024-11-04 07:55:16', NULL, '2024-11-04 07:54:55', '2024-11-04 07:55:16'),
(323, 'App\\Models\\User', 1, 'auth_token', '3d73643eae8b798483bc1061a386cc22e4229977e6f7e6897d9c02a63180709b', '[\"*\"]', NULL, NULL, '2024-11-04 07:54:56', '2024-11-04 07:54:56'),
(324, 'App\\Models\\User', 1, 'auth_token', '0eb4c3e69f27e63cc10c949f13326282044c5d2477f2774738d9e3b61d090a79', '[\"*\"]', '2024-11-04 07:56:37', NULL, '2024-11-04 07:56:35', '2024-11-04 07:56:37'),
(325, 'App\\Models\\User', 1, 'auth_token', 'acc996fc95827e8ce86a8b2d377993a353e6ed6339337dfc0528028f87d26a98', '[\"*\"]', NULL, NULL, '2024-11-04 07:56:36', '2024-11-04 07:56:36'),
(326, 'App\\Models\\User', 1, 'auth_token', '70867b7a95b12008d5e534b804680c09eca55ee52e365e6aa77551c065088272', '[\"*\"]', '2024-11-04 15:43:25', NULL, '2024-11-04 15:42:13', '2024-11-04 15:43:25'),
(327, 'App\\Models\\User', 1, 'auth_token', 'f4a5bc62ab3090d3fcd0f1b4b61c32f6a86f9c129be654c0cbb1db24bfddc085', '[\"*\"]', NULL, NULL, '2024-11-04 15:42:14', '2024-11-04 15:42:14'),
(328, 'App\\Models\\User', 1, 'auth_token', 'bb5310d44390431ef470066e08775c18d7f7d9e62e81b8ef3d0882e1cb08e106', '[\"*\"]', '2024-11-05 05:24:24', NULL, '2024-11-04 23:12:52', '2024-11-05 05:24:24'),
(329, 'App\\Models\\User', 1, 'auth_token', '27ae163abf57085cc65f858ab78779b7ab169cd40f5ac9bbca4f185131ad803d', '[\"*\"]', NULL, NULL, '2024-11-04 23:12:53', '2024-11-04 23:12:53'),
(330, 'App\\Models\\User', 1, 'auth_token', 'af626fa038e70ed87d0b74d25c88eec62dd7f077ec6bdd964bc6f5f78ebbb05c', '[\"*\"]', '2024-11-05 03:20:13', NULL, '2024-11-05 03:08:32', '2024-11-05 03:20:13'),
(331, 'App\\Models\\User', 1, 'auth_token', '9161abcab72d2126888b7e9616b5e6322dd782d113a33d985fca162b0b1bae11', '[\"*\"]', NULL, NULL, '2024-11-05 03:08:33', '2024-11-05 03:08:33'),
(332, 'App\\Models\\User', 1, 'auth_token', '96e61e05baada9d8a2b74aae411ef73160f7388ce850417435c9779e5dc03871', '[\"*\"]', '2024-11-05 03:35:00', NULL, '2024-11-05 03:20:48', '2024-11-05 03:35:00'),
(333, 'App\\Models\\User', 1, 'auth_token', '162eef47bce13a5f0fc133dd2fa1b155bb3ee3bc6092d55062475fa05f9e9952', '[\"*\"]', NULL, NULL, '2024-11-05 03:20:49', '2024-11-05 03:20:49'),
(334, 'App\\Models\\User', 1, 'auth_token', '2ea3e884f09c1c493992acc1b11af0e621e45576cfb5b5b23e72a08bb1e4ce46', '[\"*\"]', '2024-11-05 04:41:28', NULL, '2024-11-05 03:35:23', '2024-11-05 04:41:28'),
(335, 'App\\Models\\User', 1, 'auth_token', 'dac8adb52b198c4fdb2ea8315d30385b19cd31b3d19d4b705d055bb03caf601f', '[\"*\"]', NULL, NULL, '2024-11-05 03:35:24', '2024-11-05 03:35:24'),
(336, 'App\\Models\\User', 1, 'auth_token', 'd8999ffb0adce9000fe67bfaac9e1d6761c42f590295151da50aed6857d9bca4', '[\"*\"]', '2024-11-05 03:42:48', NULL, '2024-11-05 03:38:55', '2024-11-05 03:42:48'),
(337, 'App\\Models\\User', 1, 'auth_token', 'e77c741888ba2a18a305a65ab2ddb5c3912d6932800812638a8120701e5d09ee', '[\"*\"]', NULL, NULL, '2024-11-05 03:38:56', '2024-11-05 03:38:56'),
(338, 'App\\Models\\User', 407, 'auth_token', 'dc8d3b69de4bb4e22b97eb85cc8fac91eae02b7104173eb556b0583dedecf344', '[\"*\"]', NULL, NULL, '2024-11-05 04:30:16', '2024-11-05 04:30:16'),
(339, 'App\\Models\\User', 408, 'auth_token', '11545333818754413d61f9bbe3eb46face9d7b05f01c4262c21e5d7eb6472fe2', '[\"*\"]', NULL, NULL, '2024-11-05 04:32:34', '2024-11-05 04:32:34'),
(340, 'App\\Models\\User', 409, 'auth_token', '89b6f9ec71d206a8d9307b5fc2fbee5bbbc6fd8f3bc5f20d460cb740d605bc25', '[\"*\"]', NULL, NULL, '2024-11-05 04:35:32', '2024-11-05 04:35:32'),
(341, 'App\\Models\\User', 1, 'auth_token', 'd582fce045d8851e26dd2dbbd6bf75f920948cc8619a303036a7a84312690c76', '[\"*\"]', '2024-11-05 06:48:40', NULL, '2024-11-05 04:42:03', '2024-11-05 06:48:40'),
(342, 'App\\Models\\User', 1, 'auth_token', 'b3fc4ddde97ec5ee7829ef51cc46ecb9ace8a5b932d1383860089d7cbb03f90f', '[\"*\"]', NULL, NULL, '2024-11-05 04:42:05', '2024-11-05 04:42:05'),
(343, 'App\\Models\\User', 410, 'auth_token', 'fed00a67b558e86a244d58f3ffe5d0f03250d999837808a7f2b71653231f3d01', '[\"*\"]', NULL, NULL, '2024-11-05 04:43:32', '2024-11-05 04:43:32'),
(344, 'App\\Models\\User', 411, 'auth_token', '21fbe34eae3d063baed7be428e637341516964edaef331b97b490e6b222b3073', '[\"*\"]', NULL, NULL, '2024-11-05 04:47:29', '2024-11-05 04:47:29'),
(345, 'App\\Models\\User', 412, 'auth_token', '920dac10d7bfd480666b4bbbd4ca29d34e6af5dec10c194d2c8e1f1fc893dd04', '[\"*\"]', NULL, NULL, '2024-11-05 04:55:22', '2024-11-05 04:55:22'),
(346, 'App\\Models\\User', 413, 'auth_token', 'e7df2772b46e7b9719121ceefd761404ef74bc8000c07fa7cf993f809306fe54', '[\"*\"]', NULL, NULL, '2024-11-05 04:56:14', '2024-11-05 04:56:14'),
(347, 'App\\Models\\User', 1, 'auth_token', '959287e2ca8c21e8f29202a2a6677b97da1f85142f69da1028e43f61247251c4', '[\"*\"]', '2024-11-07 01:31:29', NULL, '2024-11-06 23:35:43', '2024-11-07 01:31:29'),
(348, 'App\\Models\\User', 1, 'auth_token', '12be2605e7d86908e5c1de3fa2a2c541e6af1b07ce162a537126d2f7b7cba6cd', '[\"*\"]', NULL, NULL, '2024-11-06 23:35:44', '2024-11-06 23:35:44'),
(349, 'App\\Models\\User', 1, 'auth_token', '879423c9f12125377ac0ea3d8d98cb5f9d20f7f967716350952f5e722a0bf1bd', '[\"*\"]', '2024-11-07 01:13:33', NULL, '2024-11-07 01:12:27', '2024-11-07 01:13:33'),
(350, 'App\\Models\\User', 1, 'auth_token', 'b43b0932722e60324694b5105667d5bc69bfec3201ad534ba02fa4f4622ec037', '[\"*\"]', NULL, NULL, '2024-11-07 01:12:28', '2024-11-07 01:12:28'),
(351, 'App\\Models\\User', 1, 'auth_token', '8ccdcbab4fcd3ea71aff2785ece7ab84c613409f48f301f34deb0177079674d3', '[\"*\"]', '2024-11-07 01:49:41', NULL, '2024-11-07 01:47:09', '2024-11-07 01:49:41'),
(352, 'App\\Models\\User', 1, 'auth_token', '92a1d99017d81a16cb3058d4cb0d553e4f74ebd33bdd38eec570a7b96f65b916', '[\"*\"]', NULL, NULL, '2024-11-07 01:47:10', '2024-11-07 01:47:10'),
(353, 'App\\Models\\User', 1, 'auth_token', 'a9f59e4435d64b6050a5dc64c5912e898b8243ead237250fc268018d636c94cc', '[\"*\"]', '2024-11-07 01:52:27', NULL, '2024-11-07 01:52:25', '2024-11-07 01:52:27'),
(354, 'App\\Models\\User', 1, 'auth_token', '441e5073a79f6b0c8dded2253b7e8432eea2a1df255131d513ab245dfb6d24b0', '[\"*\"]', NULL, NULL, '2024-11-07 01:52:26', '2024-11-07 01:52:26'),
(355, 'App\\Models\\User', 1, 'auth_token', '1b555da1b8f66d4ea37de9fae2b0f1c7a42f667c764590c3d8d1506b3e5a7411', '[\"*\"]', '2024-11-07 02:27:20', NULL, '2024-11-07 01:52:59', '2024-11-07 02:27:20'),
(356, 'App\\Models\\User', 1, 'auth_token', 'f5313bbac7b3a4e555e1610ac81db96cbefab32f15069484d352e38c563f756c', '[\"*\"]', NULL, NULL, '2024-11-07 01:53:00', '2024-11-07 01:53:00'),
(357, 'App\\Models\\User', 1, 'auth_token', '191a8cd690972f9df13123b9363f93edb02ac009b9729891b47ebff0a61a119f', '[\"*\"]', '2024-11-07 03:23:01', NULL, '2024-11-07 03:22:51', '2024-11-07 03:23:01'),
(358, 'App\\Models\\User', 1, 'auth_token', 'a0afecf027c9325f43a5dd9180a2612019718ae97745e18a3b2f856f275132f7', '[\"*\"]', NULL, NULL, '2024-11-07 03:22:52', '2024-11-07 03:22:52'),
(359, 'App\\Models\\User', 1, 'auth_token', '91c13f752a0277e8d9a2a3a84cf016712e4baefe25f1c9601c69fd0e61e17630', '[\"*\"]', '2024-11-07 03:47:29', NULL, '2024-11-07 03:24:23', '2024-11-07 03:47:29'),
(360, 'App\\Models\\User', 1, 'auth_token', '12fba80eeef4771bce8fd793d9bde1a084d9607f8d3af2b5fbc19c6a4ec0825a', '[\"*\"]', NULL, NULL, '2024-11-07 03:24:23', '2024-11-07 03:24:23'),
(361, 'App\\Models\\User', 415, 'auth_token', '92fa32690c31ab17ebb56f64dddaaf7abaa2870ced5e1f09fe3e21cf412fe908', '[\"*\"]', NULL, NULL, '2024-11-07 03:25:53', '2024-11-07 03:25:53'),
(362, 'App\\Models\\User', 414, 'auth_token', 'f3339d16196879b1f25b3e94ef525faa07dd283d399839b9ea7492ceb2d665cc', '[\"*\"]', '2024-11-07 04:57:15', NULL, '2024-11-07 04:57:14', '2024-11-07 04:57:15'),
(363, 'App\\Models\\User', 414, 'auth_token', '11e60c3867a88b36fa1a7127320cd3015bb304238103954dd0d1b3ad569a7cf1', '[\"*\"]', NULL, NULL, '2024-11-07 04:57:14', '2024-11-07 04:57:14'),
(364, 'App\\Models\\User', 1, 'auth_token', '2f5bcb994d546f98ad19885a7be3395c33bc109ed9d0c9536e763d711273afe5', '[\"*\"]', '2024-11-07 05:00:15', NULL, '2024-11-07 04:58:09', '2024-11-07 05:00:15'),
(365, 'App\\Models\\User', 1, 'auth_token', 'a9b3952eae99127a6fb2801316359009d41ee7992b8224527249bde7a5e80c63', '[\"*\"]', NULL, NULL, '2024-11-07 04:58:10', '2024-11-07 04:58:10'),
(366, 'App\\Models\\User', 1, 'auth_token', 'b66d87abda68ddb6c3f180be9470f36240230503ece5a2d00b05c40e5604656f', '[\"*\"]', '2024-11-07 05:01:12', NULL, '2024-11-07 04:59:24', '2024-11-07 05:01:12'),
(367, 'App\\Models\\User', 1, 'auth_token', '9397b278e11ada5bc2ddf238169ef2a70534776da3ee7a473231c59aaee766ed', '[\"*\"]', NULL, NULL, '2024-11-07 04:59:25', '2024-11-07 04:59:25'),
(368, 'App\\Models\\User', 1, 'auth_token', '874e41a7590d91677ba1c900496efbccea03e690b9170656e908b43f36f08365', '[\"*\"]', '2024-11-07 05:06:16', NULL, '2024-11-07 05:05:56', '2024-11-07 05:06:16'),
(369, 'App\\Models\\User', 1, 'auth_token', '98b78dfc181622c3283f7327005c12cdd2cd30ee5c38f45b296fd21260a6595e', '[\"*\"]', NULL, NULL, '2024-11-07 05:05:57', '2024-11-07 05:05:57'),
(370, 'App\\Models\\User', 1, 'auth_token', '6d2df3e648c296407f5231c3728c35ccb12f76725404f2260106cb931cbeb62f', '[\"*\"]', '2024-11-07 05:12:04', NULL, '2024-11-07 05:10:50', '2024-11-07 05:12:04'),
(371, 'App\\Models\\User', 1, 'auth_token', '6fd4f1762f762b65bd11e5de3703ebc398893f9e8a9110ffd8d52f1d2ac5b1d8', '[\"*\"]', NULL, NULL, '2024-11-07 05:10:51', '2024-11-07 05:10:51'),
(372, 'App\\Models\\User', 1, 'auth_token', 'c8831217618c66905ff041e085b8200c434c1c1ba0ae96123a5ac392228b4425', '[\"*\"]', '2024-11-07 05:13:44', NULL, '2024-11-07 05:13:42', '2024-11-07 05:13:44'),
(373, 'App\\Models\\User', 1, 'auth_token', '92dcfbcf69bcb2234c4adf079909213e6b7ff06c630ee7f44f64cfee30255031', '[\"*\"]', NULL, NULL, '2024-11-07 05:13:43', '2024-11-07 05:13:43'),
(374, 'App\\Models\\User', 1, 'auth_token', '5affb67878f4577404c73f58fa151ef3262f5042d0afad1de85d8dcc588749b7', '[\"*\"]', '2024-11-07 06:24:41', NULL, '2024-11-07 05:16:44', '2024-11-07 06:24:41'),
(375, 'App\\Models\\User', 1, 'auth_token', '1d263fc2cfadb169dcb086e3ba790b68378471bce7f16ca26c442e3f998ee374', '[\"*\"]', NULL, NULL, '2024-11-07 05:16:45', '2024-11-07 05:16:45'),
(376, 'App\\Models\\User', 1, 'auth_token', '27870a6a2c98f9ef3b369c967acd0592548609f2d30fa4724b1d00da1ed5e7d5', '[\"*\"]', '2024-11-07 06:39:24', NULL, '2024-11-07 05:17:35', '2024-11-07 06:39:24'),
(377, 'App\\Models\\User', 1, 'auth_token', 'b99a818bba3439998bed61ad8dc84ff8605767841dca234d4acfea56ddb540b6', '[\"*\"]', NULL, NULL, '2024-11-07 05:17:36', '2024-11-07 05:17:36'),
(378, 'App\\Models\\User', 416, 'auth_token', '731b83c9529f3f28c0bf685b35d4aa6895944b5231db27a8f9885e90ae2add43', '[\"*\"]', NULL, NULL, '2024-11-07 05:21:10', '2024-11-07 05:21:10'),
(379, 'App\\Models\\User', 417, 'auth_token', '38aba1523eae0f5ebf6f3cb52b62ab086e5a777b1241c6ad29e9295e8957b709', '[\"*\"]', NULL, NULL, '2024-11-07 05:31:33', '2024-11-07 05:31:33'),
(380, 'App\\Models\\User', 418, 'auth_token', '45adca6790e2f39f8fe7578e63064881ac0fe3015697f3b7d6548528295af37d', '[\"*\"]', NULL, NULL, '2024-11-07 05:36:46', '2024-11-07 05:36:46'),
(381, 'App\\Models\\User', 419, 'auth_token', 'd3d312808c4c61048e4ed803768530dc79ac427b133db614c9427b12fa3a9047', '[\"*\"]', NULL, NULL, '2024-11-07 05:41:21', '2024-11-07 05:41:21'),
(382, 'App\\Models\\User', 1, 'auth_token', 'd582efd15edf2335a1bb29befdb43a2a6b66143d3b1496c3b1bbf286cc848d03', '[\"*\"]', '2024-11-07 06:34:31', NULL, '2024-11-07 06:25:08', '2024-11-07 06:34:31'),
(383, 'App\\Models\\User', 1, 'auth_token', '809b2fbac64c8d089b183a6817bfef6669ae0837be64ca999e57d8c91e6ff2a0', '[\"*\"]', NULL, NULL, '2024-11-07 06:25:09', '2024-11-07 06:25:09'),
(384, 'App\\Models\\User', 420, 'auth_token', '15408234228d8dc5ed3e97ac2656b36d2e5177d4b689810512b60958fd6ca6b3', '[\"*\"]', NULL, NULL, '2024-11-07 06:28:51', '2024-11-07 06:28:51'),
(385, 'App\\Models\\User', 421, 'auth_token', 'b2df34847b572030529f7059d042a062458bca56358a1c07a04cbcd128e56248', '[\"*\"]', NULL, NULL, '2024-11-07 06:32:31', '2024-11-07 06:32:31'),
(386, 'App\\Models\\User', 1, 'auth_token', '8d03c50c9f23e14dfb5ae79b33f42b9698787bb54d1daa81e4c1166015274259', '[\"*\"]', '2024-11-07 06:37:27', NULL, '2024-11-07 06:36:58', '2024-11-07 06:37:27'),
(387, 'App\\Models\\User', 1, 'auth_token', 'f727b3d5100fae354aa30603c2871727259b3285158e84cfee12c82eda20bd94', '[\"*\"]', NULL, NULL, '2024-11-07 06:36:59', '2024-11-07 06:36:59'),
(388, 'App\\Models\\User', 1, 'auth_token', 'cdf17584dd9b275003502ebfeae424a88c6810fc030f1ad9a6403025f9c3f62b', '[\"*\"]', '2024-11-07 06:38:02', NULL, '2024-11-07 06:37:54', '2024-11-07 06:38:02'),
(389, 'App\\Models\\User', 1, 'auth_token', 'ca3602da68bfe51ec5d8c18abf09b9053ba3d18dcf102f2d764c22facf10c87d', '[\"*\"]', NULL, NULL, '2024-11-07 06:37:55', '2024-11-07 06:37:55'),
(390, 'App\\Models\\User', 1, 'auth_token', 'd887649b81a1be8f6966983165c78ade54bda9398657bb99287d1445fdc38e36', '[\"*\"]', '2024-11-07 06:38:52', NULL, '2024-11-07 06:38:45', '2024-11-07 06:38:52'),
(391, 'App\\Models\\User', 1, 'auth_token', '7e430c9b5e6080e45d63a76e6a45cf2ffb8e8af1dd0b832ffc6cc8b7ebb7b0ad', '[\"*\"]', NULL, NULL, '2024-11-07 06:38:46', '2024-11-07 06:38:46'),
(392, 'App\\Models\\User', 1, 'auth_token', '7c28e3d42b8df3757b0f879d1315d3e31a959554ced38a95deb1b06013db1261', '[\"*\"]', '2024-11-07 07:28:14', NULL, '2024-11-07 06:40:27', '2024-11-07 07:28:14'),
(393, 'App\\Models\\User', 1, 'auth_token', 'fd1219de3b409d4c8f5db824881c51708daaf430464189a9a859bec48644c935', '[\"*\"]', NULL, NULL, '2024-11-07 06:40:29', '2024-11-07 06:40:29'),
(394, 'App\\Models\\User', 1, 'auth_token', 'cfd035e7010aa093b617e99946ca0051d8ab29b11fb444221499712a2d1b5b49', '[\"*\"]', '2024-11-07 06:52:56', NULL, '2024-11-07 06:44:07', '2024-11-07 06:52:56'),
(395, 'App\\Models\\User', 1, 'auth_token', '2ad76003747aef485abd420604e88ac0ff9c5b73f887266c8312b385a5c14348', '[\"*\"]', NULL, NULL, '2024-11-07 06:44:08', '2024-11-07 06:44:08'),
(396, 'App\\Models\\User', 1, 'auth_token', 'a6ae4de4ee9dd612cd55d84bcef9a3770f04f41a593d6f95fa38650b639744ad', '[\"*\"]', '2024-11-07 06:47:50', NULL, '2024-11-07 06:46:53', '2024-11-07 06:47:50'),
(397, 'App\\Models\\User', 1, 'auth_token', '895de6b2e5cafa71ea74f75f147762f83c8f803a719e9b8f6051183e7636dbda', '[\"*\"]', NULL, NULL, '2024-11-07 06:46:54', '2024-11-07 06:46:54'),
(398, 'App\\Models\\User', 1, 'auth_token', '267a08be7a19f009e59fdecf73663ad388dddc6c2fc27418b15719041c594efe', '[\"*\"]', '2024-11-07 07:01:16', NULL, '2024-11-07 06:49:27', '2024-11-07 07:01:16'),
(399, 'App\\Models\\User', 1, 'auth_token', '3c2ef69161b1caa2ecad35c4d742bd86fb6472aca79342945559066ff2c3f6a7', '[\"*\"]', NULL, NULL, '2024-11-07 06:49:28', '2024-11-07 06:49:28'),
(400, 'App\\Models\\User', 1, 'auth_token', '1dfe1dc4588aaafc3e7090ca1b3ad243a9a7e80cf054bfefd648233c5bf7c12e', '[\"*\"]', '2024-11-07 06:55:32', NULL, '2024-11-07 06:53:25', '2024-11-07 06:55:32'),
(401, 'App\\Models\\User', 1, 'auth_token', '3fb8f96532a5a69b26241b753710fd48868b7d31721858b84387a098c2c9f1ad', '[\"*\"]', NULL, NULL, '2024-11-07 06:53:26', '2024-11-07 06:53:26'),
(402, 'App\\Models\\User', 422, 'auth_token', 'fe202035d09ae2087a869dd81b0f1efaf94ace5291cf55d347635ef9b65fb0af', '[\"*\"]', NULL, NULL, '2024-11-07 06:57:58', '2024-11-07 06:57:58'),
(403, 'App\\Models\\User', 1, 'auth_token', '11b0dadfe31b634f317e9ff7a09a86be5e11a11010cfcb2e8a6ccaf7283878ba', '[\"*\"]', '2024-11-07 07:09:06', NULL, '2024-11-07 06:59:21', '2024-11-07 07:09:06'),
(404, 'App\\Models\\User', 1, 'auth_token', 'ef9f216c9a26e06a5479fece5b3604d2efad6a703d5a448c261ff45294af1b4f', '[\"*\"]', NULL, NULL, '2024-11-07 06:59:21', '2024-11-07 06:59:21'),
(405, 'App\\Models\\User', 1, 'auth_token', '05f66f8ee4f355e64ed120e26490ec127e451452d42c29a698c36d978344b670', '[\"*\"]', '2024-11-07 07:15:54', NULL, '2024-11-07 07:01:41', '2024-11-07 07:15:54'),
(406, 'App\\Models\\User', 1, 'auth_token', 'aaeff52d93f1de2dde68439c4ae92460d2a55d17fbad3e939c0549913acd6d36', '[\"*\"]', NULL, NULL, '2024-11-07 07:01:41', '2024-11-07 07:01:41'),
(407, 'App\\Models\\User', 1, 'auth_token', 'ed9490c9e1c4bc092235351c64c6e226d6c55bbffbee2ee112ca892facce5e95', '[\"*\"]', '2024-11-08 00:04:35', NULL, '2024-11-07 23:22:58', '2024-11-08 00:04:35'),
(408, 'App\\Models\\User', 1, 'auth_token', '56621a56779916a7d2584930e1c38e356741e52446d3b43dd3b04b7c36f84a18', '[\"*\"]', NULL, NULL, '2024-11-07 23:22:59', '2024-11-07 23:22:59'),
(409, 'App\\Models\\User', 1, 'auth_token', '59e3b5410ec075baf55137efa35edb285cc1629214069fe6602851b60db985ee', '[\"*\"]', '2024-11-07 23:51:49', NULL, '2024-11-07 23:37:16', '2024-11-07 23:51:49'),
(410, 'App\\Models\\User', 1, 'auth_token', '213cdaa387b43663ca6e51851bdaeaae3fb38c636b040f2ae67a19833d42be14', '[\"*\"]', NULL, NULL, '2024-11-07 23:37:17', '2024-11-07 23:37:17'),
(411, 'App\\Models\\User', 1, 'auth_token', '44258958e2d0f68a32d89a4a9eb80bd305bb2fde7103a7c09ca24d7b89d1f3b0', '[\"*\"]', '2024-11-08 00:49:41', NULL, '2024-11-08 00:04:52', '2024-11-08 00:49:41'),
(412, 'App\\Models\\User', 1, 'auth_token', '7c27e78dca819b75509823b89c79d98525f34a320c39bcbf09c941784b2c24c0', '[\"*\"]', NULL, NULL, '2024-11-08 00:04:53', '2024-11-08 00:04:53'),
(413, 'App\\Models\\User', 1, 'auth_token', '1dc2cd4aa3ebbb32b8b3e7345cd0d209d9908f4978ad5a0e8399f8dfbcd1abb1', '[\"*\"]', '2024-11-08 03:54:55', NULL, '2024-11-08 03:10:42', '2024-11-08 03:54:55'),
(414, 'App\\Models\\User', 1, 'auth_token', 'ae08935b25e54de1116b721c7841ac1a4e610769c8a1b77885be9cf52e34deae', '[\"*\"]', NULL, NULL, '2024-11-08 03:10:43', '2024-11-08 03:10:43'),
(415, 'App\\Models\\User', 1, 'auth_token', 'fccef37697e5bda603150ce9bbfee6cb578b6e54519aed14966ce7a78d9611b6', '[\"*\"]', '2024-11-08 04:02:03', NULL, '2024-11-08 03:56:55', '2024-11-08 04:02:03'),
(416, 'App\\Models\\User', 1, 'auth_token', '56e815ac948f857a1e4ae0d9e03418e353f6117fb55e6fc82e79e68b137d1ed3', '[\"*\"]', NULL, NULL, '2024-11-08 03:56:56', '2024-11-08 03:56:56'),
(417, 'App\\Models\\User', 1, 'auth_token', 'bb559aacc7de4d363498e21212b33b98da7e034391f38a19f095724f227e7b94', '[\"*\"]', '2024-11-08 04:04:10', NULL, '2024-11-08 04:02:49', '2024-11-08 04:04:10'),
(418, 'App\\Models\\User', 1, 'auth_token', '3dec7b0ad020abf91b17933e0fc4edaffc81dc5dd3483b10641a5580aaeb116e', '[\"*\"]', NULL, NULL, '2024-11-08 04:02:50', '2024-11-08 04:02:50'),
(419, 'App\\Models\\User', 1, 'auth_token', '8ad64d651cb42c39718192e313c86818220087048591f5d2b4f6d6de850004c6', '[\"*\"]', '2024-11-08 04:03:28', NULL, '2024-11-08 04:03:13', '2024-11-08 04:03:28'),
(420, 'App\\Models\\User', 1, 'auth_token', 'cb9b4a1491b71c3e80fc615e5937f61dee48ffec7583cc54ff00a3d5bfa9c619', '[\"*\"]', NULL, NULL, '2024-11-08 04:03:14', '2024-11-08 04:03:14'),
(421, 'App\\Models\\User', 1, 'auth_token', 'ea9c43f9841e4fe5fe1e0a3da7dd8363d13ab80ee7e57fc285e14bd20a8d26fe', '[\"*\"]', '2024-11-08 04:06:18', NULL, '2024-11-08 04:05:33', '2024-11-08 04:06:18'),
(422, 'App\\Models\\User', 1, 'auth_token', 'fcc32b58eaea51e8abb8f242d1f743043363226c230c7becd2fa864e4a4bcd90', '[\"*\"]', NULL, NULL, '2024-11-08 04:05:34', '2024-11-08 04:05:34'),
(423, 'App\\Models\\User', 1, 'auth_token', 'a30019c337a46f21d92e57747e22663c9ca67ff64b38aa5a58c8c808bc87e9f6', '[\"*\"]', '2024-11-08 04:36:03', NULL, '2024-11-08 04:10:35', '2024-11-08 04:36:03'),
(424, 'App\\Models\\User', 1, 'auth_token', '9246bc912a458eb0fe9f9d1b4991e454503808c2f4b2a350a4fc09a772987961', '[\"*\"]', NULL, NULL, '2024-11-08 04:10:36', '2024-11-08 04:10:36'),
(425, 'App\\Models\\User', 1, 'auth_token', '411742beef5caa0fd89bb05b1a7531bdac533109da74ff711a61427f3031d2d4', '[\"*\"]', '2024-11-08 04:12:08', NULL, '2024-11-08 04:11:48', '2024-11-08 04:12:08'),
(426, 'App\\Models\\User', 1, 'auth_token', '7fe19c0b3dddc2c0fa950f747b0953852a051337c4207bd5d1606721d0eaa2cc', '[\"*\"]', NULL, NULL, '2024-11-08 04:11:49', '2024-11-08 04:11:49'),
(427, 'App\\Models\\User', 1, 'auth_token', 'def58089401a0f0bf8a7114c034cdab38496bf893e08e4c0505768320a68edef', '[\"*\"]', '2024-11-08 04:15:58', NULL, '2024-11-08 04:13:04', '2024-11-08 04:15:58'),
(428, 'App\\Models\\User', 1, 'auth_token', '1d2703f41396983bd559ab26dee566f2474fc8d6af57a0e15b912a8cb5019de3', '[\"*\"]', NULL, NULL, '2024-11-08 04:13:05', '2024-11-08 04:13:05'),
(429, 'App\\Models\\User', 1, 'auth_token', '464f2408b9423b162c569b48a76ee42eab65773a99a62a696591c07149830646', '[\"*\"]', '2024-11-08 04:16:21', NULL, '2024-11-08 04:16:19', '2024-11-08 04:16:21'),
(430, 'App\\Models\\User', 1, 'auth_token', 'afa630c3efc7efb4dd235c2c238701f4b5ab06480f471748ff9a9f1089e82279', '[\"*\"]', NULL, NULL, '2024-11-08 04:16:20', '2024-11-08 04:16:20'),
(431, 'App\\Models\\User', 1, 'auth_token', 'b172997ed404d91c3257e12723db55ac80600e1c81737f35c5992b603fcf1e61', '[\"*\"]', '2024-11-08 04:44:32', NULL, '2024-11-08 04:28:23', '2024-11-08 04:44:32'),
(432, 'App\\Models\\User', 1, 'auth_token', 'cf3062dbd297070a3d8419cff6b2b37124e1f5117bca46ed991578df576e2f25', '[\"*\"]', NULL, NULL, '2024-11-08 04:28:24', '2024-11-08 04:28:24'),
(433, 'App\\Models\\User', 1, 'auth_token', '73a2a75eb3b78dd43ceb40592b38bf4c32d30cf1a522fe4146dd898fd06152c8', '[\"*\"]', '2024-11-08 06:12:47', NULL, '2024-11-08 05:01:05', '2024-11-08 06:12:47'),
(434, 'App\\Models\\User', 1, 'auth_token', '1ba8e40654954089609f2fece30e8c58cfc74d8e2690ec2ad42bf4bd4e79e58f', '[\"*\"]', NULL, NULL, '2024-11-08 05:01:07', '2024-11-08 05:01:07'),
(435, 'App\\Models\\User', 435, 'auth_token', 'eefa7af475f15f911dde63c6384c2cb9191bba2a081299fbf4f3072f4e15a9a0', '[\"*\"]', NULL, NULL, '2024-11-08 05:37:45', '2024-11-08 05:37:45'),
(436, 'App\\Models\\User', 436, 'auth_token', 'f9a70041cccd7cf07e7833f5bfdd7dbae110ce040a2178f65607326701faf5d9', '[\"*\"]', '2024-11-08 06:17:37', NULL, '2024-11-08 06:13:27', '2024-11-08 06:17:37'),
(437, 'App\\Models\\User', 436, 'auth_token', '469c6d1ca1a82b5baffc23a795135a7b93a80f70f19ab9a11d4ed1bd4b2a925c', '[\"*\"]', NULL, NULL, '2024-11-08 06:13:28', '2024-11-08 06:13:28'),
(438, 'App\\Models\\User', 436, 'auth_token', 'adc6d1a824183273c644406e18cfc9df5a3b187c00feb33ff1c24b0be5359c93', '[\"*\"]', '2024-11-08 06:50:04', NULL, '2024-11-08 06:24:18', '2024-11-08 06:50:04'),
(439, 'App\\Models\\User', 436, 'auth_token', '88e477a18800dd973f5350b7abc465ad558b859a0949b196240949d857a8671c', '[\"*\"]', NULL, NULL, '2024-11-08 06:24:19', '2024-11-08 06:24:19'),
(440, 'App\\Models\\User', 437, 'auth_token', '99ca8e15b3db382c6a1c84dba0e6e7c94be0d725b0e7dedcb80c5ccc52c37377', '[\"*\"]', NULL, NULL, '2024-11-08 06:25:19', '2024-11-08 06:25:19'),
(441, 'App\\Models\\User', 1, 'auth_token', '21c108f6e2ec544c284788cfa286d5b1b92863c77f73c1a7de0983b7adc109e4', '[\"*\"]', '2024-11-08 07:01:18', NULL, '2024-11-08 06:51:08', '2024-11-08 07:01:18'),
(442, 'App\\Models\\User', 1, 'auth_token', 'b0950198e4d72e0b5f5a69207f0e1e4dac92b97050e496e957a89f4329f5a297', '[\"*\"]', NULL, NULL, '2024-11-08 06:51:09', '2024-11-08 06:51:09'),
(443, 'App\\Models\\User', 1, 'auth_token', '71ae841d74db9f8e4626b1602b0578e187cf3efaccbfca5387c7799df3e94d8a', '[\"*\"]', '2024-11-11 00:21:57', NULL, '2024-11-11 00:21:55', '2024-11-11 00:21:57'),
(444, 'App\\Models\\User', 1, 'auth_token', '7eeaa59c8b0e508fc6426d554c830216a5274ba941e8c42c24230728af2aac2c', '[\"*\"]', NULL, NULL, '2024-11-11 00:21:56', '2024-11-11 00:21:56'),
(445, 'App\\Models\\User', 1, 'auth_token', '76d555ddaa851e20218b00c7048f6518c71ba78559d1cc692e3b9eb19f3b6537', '[\"*\"]', '2024-11-15 12:59:03', NULL, '2024-11-15 12:57:37', '2024-11-15 12:59:03'),
(446, 'App\\Models\\User', 1, 'auth_token', '6e9932095366381b950538237114259f63a2e48707be87d873a7949e5cd58d7f', '[\"*\"]', NULL, NULL, '2024-11-15 12:57:38', '2024-11-15 12:57:38'),
(447, 'App\\Models\\User', 1, 'auth_token', '41f8df610559adf35a1e38d059f96fa42f8195251e00c953f837792bf04819e0', '[\"*\"]', '2024-11-15 12:59:53', NULL, '2024-11-15 12:59:51', '2024-11-15 12:59:53'),
(448, 'App\\Models\\User', 1, 'auth_token', '1624668ca0fd6e33e8e7202b6601b2f40161aa1f30fb79b94ba2469485c91b0b', '[\"*\"]', NULL, NULL, '2024-11-15 12:59:52', '2024-11-15 12:59:52'),
(449, 'App\\Models\\User', 1, 'auth_token', '29b5b664e1c010980c77003524e902f7d587725b714f55088a8d4254d0621cfa', '[\"*\"]', '2024-11-16 09:59:50', NULL, '2024-11-16 09:35:15', '2024-11-16 09:59:50'),
(450, 'App\\Models\\User', 1, 'auth_token', '1f9ee326c9a58c4deb3407f8a3b2c65cfd2a56d052ac24727f8cfb45230b2a9b', '[\"*\"]', NULL, NULL, '2024-11-16 09:35:17', '2024-11-16 09:35:17'),
(451, 'App\\Models\\User', 438, 'auth_token', 'fc587da2b8d406890e793c078137c1cc6c96aa36fed7e2835ea585846d853fbd', '[\"*\"]', NULL, NULL, '2024-11-16 09:37:25', '2024-11-16 09:37:25'),
(452, 'App\\Models\\User', 1, 'auth_token', 'e38fdc9f3fa907f695b92ba36162722d018233a3ddb7832076bd0bf2d3e0d8e0', '[\"*\"]', '2024-11-18 00:31:31', NULL, '2024-11-18 00:31:15', '2024-11-18 00:31:31'),
(453, 'App\\Models\\User', 1, 'auth_token', '936b54b7a25327676bec9080c24efafa9d7a8161ce28bd56077872d12f94fb47', '[\"*\"]', NULL, NULL, '2024-11-18 00:31:16', '2024-11-18 00:31:16'),
(454, 'App\\Models\\User', 1, 'auth_token', '47b8cec8d05f3c61c0ff89758b72a61eb07117d3c779329554915c713c1da520', '[\"*\"]', '2024-11-18 01:55:22', NULL, '2024-11-18 01:41:24', '2024-11-18 01:55:22'),
(455, 'App\\Models\\User', 1, 'auth_token', '7018dfa12e6bed7ef4a7666f56cf23f7f2ce14c6159fbeae3534186dffba5095', '[\"*\"]', NULL, NULL, '2024-11-18 01:41:26', '2024-11-18 01:41:26'),
(456, 'App\\Models\\User', 439, 'auth_token', '50e0d18dd2ca485bf0d90ee3cc1486ac0935071650c2560f43714ddbf08e205f', '[\"*\"]', NULL, NULL, '2024-11-18 01:43:17', '2024-11-18 01:43:17'),
(457, 'App\\Models\\User', 440, 'auth_token', '801a56d87b9053e3a6bab4bbf2230da75a5481d39d26fa935e28143d8ec8d999', '[\"*\"]', NULL, NULL, '2024-11-18 01:46:43', '2024-11-18 01:46:43'),
(458, 'App\\Models\\User', 1, 'auth_token', '898c742dc672175ccb134e1f498bfbd2cf5b385ccb7822a910109748b2b9e86d', '[\"*\"]', '2024-11-19 04:57:46', NULL, '2024-11-19 04:52:45', '2024-11-19 04:57:46'),
(459, 'App\\Models\\User', 1, 'auth_token', '3b6a8f8589b990734ac7e04e19307d3dcfa7e6ce4c75519f8c51d7da2be74ed9', '[\"*\"]', NULL, NULL, '2024-11-19 04:52:46', '2024-11-19 04:52:46'),
(460, 'App\\Models\\User', 1, 'auth_token', '961bbc23c09158c37d3673bc4758af7e0a0b9f8026e4124f303b1e0f10ded309', '[\"*\"]', '2024-11-19 14:59:51', NULL, '2024-11-19 14:53:44', '2024-11-19 14:59:51'),
(461, 'App\\Models\\User', 1, 'auth_token', 'bbf5c231917b3fadf69206b4748a33be1f8fc450e714626f2d7cea56c4cdcd30', '[\"*\"]', NULL, NULL, '2024-11-19 14:53:45', '2024-11-19 14:53:45'),
(462, 'App\\Models\\User', 1, 'auth_token', 'af9c5287aeee052b298f1c00b103a5fd28d0c978da4c8b71a530255a4380c3c5', '[\"*\"]', '2024-11-19 15:01:36', NULL, '2024-11-19 15:00:45', '2024-11-19 15:01:36'),
(463, 'App\\Models\\User', 1, 'auth_token', '2c03d12d4a7129965deb9b145f97a77ceff2ef9c629bdcd07f7df49e67f8bcb3', '[\"*\"]', NULL, NULL, '2024-11-19 15:00:46', '2024-11-19 15:00:46'),
(464, 'App\\Models\\User', 1, 'auth_token', '512d942ca888d53149bc6d8c110d642dfd0d114ae738fa15b557b060638192c1', '[\"*\"]', '2024-11-19 15:40:12', NULL, '2024-11-19 15:02:30', '2024-11-19 15:40:12'),
(465, 'App\\Models\\User', 1, 'auth_token', '9d98ea20414f068c574a766f318a23b1a21dc9261c4aa3df4ba14965b82aec0c', '[\"*\"]', NULL, NULL, '2024-11-19 15:02:31', '2024-11-19 15:02:31'),
(466, 'App\\Models\\User', 442, 'auth_token', 'e53881c8f04b2e95fea69c79dc5292b6ce20f500222f26068f631f960b3ac55a', '[\"*\"]', NULL, NULL, '2024-11-19 15:22:34', '2024-11-19 15:22:34'),
(467, 'App\\Models\\User', 1, 'auth_token', '65e87713dfd92732f9d6dea0dba2b97db28cdd05749333bc0c8298635d65bd2d', '[\"*\"]', '2024-11-20 01:40:38', NULL, '2024-11-19 23:51:19', '2024-11-20 01:40:38'),
(468, 'App\\Models\\User', 1, 'auth_token', '70ab9acd1793c9a0cb5046f4869c7dac0b15b3c1f03e3bd55da060218dab5920', '[\"*\"]', NULL, NULL, '2024-11-19 23:51:23', '2024-11-19 23:51:23'),
(469, 'App\\Models\\User', 436, 'auth_token', 'ba7060b95cef2c81e5049d980a3c8174548e85d4ce9e55a35bdb14ce758c5d47', '[\"*\"]', '2024-11-20 01:19:31', NULL, '2024-11-20 01:18:57', '2024-11-20 01:19:31'),
(470, 'App\\Models\\User', 436, 'auth_token', '529b635a3e0a2a4dec87e2930857a001bc16be688351304d9aa0f2c6f2b34fa6', '[\"*\"]', NULL, NULL, '2024-11-20 01:18:58', '2024-11-20 01:18:58'),
(471, 'App\\Models\\User', 436, 'auth_token', '06f6e31d06cfbc74945656bb627d841e00f6b872102aebc115963b84a40995d0', '[\"*\"]', '2024-11-20 01:20:33', NULL, '2024-11-20 01:20:31', '2024-11-20 01:20:33'),
(472, 'App\\Models\\User', 436, 'auth_token', '8ee8761f487bd18d7159653355a6a83899b060b7fb8dfeb50dc911096b5f4d73', '[\"*\"]', NULL, NULL, '2024-11-20 01:20:32', '2024-11-20 01:20:32'),
(473, 'App\\Models\\User', 436, 'auth_token', '72cd068759b07552f739359e036e9cdbbcee35906076ac9884794b60c3884fce', '[\"*\"]', '2024-11-20 01:22:42', NULL, '2024-11-20 01:22:40', '2024-11-20 01:22:42'),
(474, 'App\\Models\\User', 436, 'auth_token', '9f84009c5b5d5dabf25bb452a360a300a5cac0715b0c4d26b5989cebe11b7e0b', '[\"*\"]', NULL, NULL, '2024-11-20 01:22:41', '2024-11-20 01:22:41'),
(475, 'App\\Models\\User', 436, 'auth_token', 'f092f901e0e5fddfed296ec33e9f19a159bae31a79bea5945f5a0c5f4afe4ea0', '[\"*\"]', '2024-11-20 01:40:49', NULL, '2024-11-20 01:40:47', '2024-11-20 01:40:49'),
(476, 'App\\Models\\User', 436, 'auth_token', 'd25f3598443867eb535301ae4f8e27b46294835e5ace653ddc4f61aa097e0a60', '[\"*\"]', NULL, NULL, '2024-11-20 01:40:48', '2024-11-20 01:40:48'),
(477, 'App\\Models\\User', 1, 'auth_token', '5312a99d552b1c6b67563eef4f143b2e4056bc775c0fccdf40963d6b9192ea3b', '[\"*\"]', '2024-11-20 02:30:42', NULL, '2024-11-20 01:43:41', '2024-11-20 02:30:42'),
(478, 'App\\Models\\User', 1, 'auth_token', 'a248104dd86e9615299929ee853a3f691911eea8a70018a6a731c8b60bee7f0f', '[\"*\"]', NULL, NULL, '2024-11-20 01:43:42', '2024-11-20 01:43:42'),
(479, 'App\\Models\\User', 436, 'auth_token', '4993feb35ad493f0c67a71a6e5da46b83a276c5722b48ec76b63f1378b047174', '[\"*\"]', '2024-11-20 01:44:08', NULL, '2024-11-20 01:44:06', '2024-11-20 01:44:08'),
(480, 'App\\Models\\User', 436, 'auth_token', '324f05bda217a4e062207a504d3673a11c17e907def1c34c53749c65f5153121', '[\"*\"]', NULL, NULL, '2024-11-20 01:44:07', '2024-11-20 01:44:07'),
(481, 'App\\Models\\User', 1, 'auth_token', '28f4cbe883d1f3e9b8453bf0ae233c8c968ec682b9e9fbed462323423459e783', '[\"*\"]', '2024-11-20 03:29:29', NULL, '2024-11-20 02:32:13', '2024-11-20 03:29:29'),
(482, 'App\\Models\\User', 1, 'auth_token', '4cec0c792b667e1b9eb67fddd2577122e52f3b50315a26c31744d690d0a413a7', '[\"*\"]', NULL, NULL, '2024-11-20 02:32:14', '2024-11-20 02:32:14'),
(483, 'App\\Models\\User', 1, 'auth_token', '86c9012c6e2a384d6964b3c49ba1b5dac706ba8d88b03ba304aa2784470d651a', '[\"*\"]', '2024-11-20 03:37:42', NULL, '2024-11-20 03:37:39', '2024-11-20 03:37:42'),
(484, 'App\\Models\\User', 1, 'auth_token', '6ac985885357207b6b1c8c6f50de42ccdc66fb119dec26e9490442a3648bbe1d', '[\"*\"]', NULL, NULL, '2024-11-20 03:37:41', '2024-11-20 03:37:41'),
(485, 'App\\Models\\User', 1, 'auth_token', '56f61675e8138d5042efb0652dc865d26d07f7a2eb8c1e28d7270ed96dc17417', '[\"*\"]', '2024-11-20 03:53:33', NULL, '2024-11-20 03:40:05', '2024-11-20 03:53:33'),
(486, 'App\\Models\\User', 1, 'auth_token', 'a641e3a5701d3a05f5573aa73532de6e2300ea64821420e7bb232c1f8ad33dff', '[\"*\"]', NULL, NULL, '2024-11-20 03:40:06', '2024-11-20 03:40:06'),
(487, 'App\\Models\\User', 436, 'auth_token', '10f94851460893eb323322ea1ba16e261c34f581aa30cd7584684da8524f12b7', '[\"*\"]', '2024-11-20 03:42:57', NULL, '2024-11-20 03:42:55', '2024-11-20 03:42:57'),
(488, 'App\\Models\\User', 436, 'auth_token', 'a24ded1b576d7d2ade8cd9fdda88ebef88ac7ff1c5a60b096516a978883ee3c7', '[\"*\"]', NULL, NULL, '2024-11-20 03:42:56', '2024-11-20 03:42:56'),
(489, 'App\\Models\\User', 436, 'auth_token', '9ef3f728a013157f35f950012d84f2c5e3ee15f2c3242a184415e68cf83cc1b1', '[\"*\"]', '2024-11-20 03:55:12', NULL, '2024-11-20 03:54:03', '2024-11-20 03:55:12'),
(490, 'App\\Models\\User', 436, 'auth_token', 'c49737cd3b2a6847723126758c69e3f9f23c66d64959723579c3fcbf602b3c06', '[\"*\"]', NULL, NULL, '2024-11-20 03:54:04', '2024-11-20 03:54:04'),
(491, 'App\\Models\\User', 1, 'auth_token', '1ded9fc691ef954b44726d62e0fb73e2f5d1dd8a799ae6997ae8d8e6b268b052', '[\"*\"]', '2024-11-20 05:39:36', NULL, '2024-11-20 04:38:19', '2024-11-20 05:39:36'),
(492, 'App\\Models\\User', 1, 'auth_token', '5f27b91bba8b44c219cdced9114f4c6ac287d93b42f733fbab56f483163fe747', '[\"*\"]', NULL, NULL, '2024-11-20 04:38:20', '2024-11-20 04:38:20'),
(493, 'App\\Models\\User', 436, 'auth_token', '3e300028cb19e98b70ba580ff2528a4e7e9578efaba89956e41d2ea89846c884', '[\"*\"]', '2024-11-20 05:08:08', NULL, '2024-11-20 05:04:18', '2024-11-20 05:08:08'),
(494, 'App\\Models\\User', 436, 'auth_token', 'fda3fc90344f0d36e1ea062ec88797ab26d5faf990b3ac2b71635bbbe9784c5a', '[\"*\"]', NULL, NULL, '2024-11-20 05:04:19', '2024-11-20 05:04:19'),
(495, 'App\\Models\\User', 1, 'auth_token', 'bbcc1bc686b057b3e3de4607f945734a1ba0ed283d4addb2ea4b56480dc2b9c7', '[\"*\"]', '2024-11-20 05:40:18', NULL, '2024-11-20 05:39:59', '2024-11-20 05:40:18'),
(496, 'App\\Models\\User', 1, 'auth_token', '05bd8e0098fc48b812fb646805573fb119aaf82efe6a10ae42dafc143303e0ff', '[\"*\"]', NULL, NULL, '2024-11-20 05:40:00', '2024-11-20 05:40:00'),
(497, 'App\\Models\\User', 1, 'auth_token', 'd2a565e1bbb8892f9bb2aadea52ed79b977306a730c99c5a215bea6bc882e5ab', '[\"*\"]', '2024-11-20 05:40:38', NULL, '2024-11-20 05:40:32', '2024-11-20 05:40:38'),
(498, 'App\\Models\\User', 1, 'auth_token', 'bcc57f51140d90d23fee67e0ebef930414e0fdbeb6de05c7ccc2f5673a8353ce', '[\"*\"]', NULL, NULL, '2024-11-20 05:40:33', '2024-11-20 05:40:33'),
(499, 'App\\Models\\User', 1, 'auth_token', '84ec6b4342360ba518871a93ab26caf5e7547937fde4f1032872dbb28ea419c0', '[\"*\"]', '2024-11-20 06:11:51', NULL, '2024-11-20 06:11:38', '2024-11-20 06:11:51'),
(500, 'App\\Models\\User', 1, 'auth_token', '675af14875d04b93a389140063837c14044cc992006e2eaec4e299abf507f8a3', '[\"*\"]', NULL, NULL, '2024-11-20 06:11:39', '2024-11-20 06:11:39'),
(501, 'App\\Models\\User', 436, 'auth_token', '52b5bdd6e8393d3b658211ffe0709a69a6c4ec9abf856c9f026466bffd30077b', '[\"*\"]', '2024-11-20 06:12:14', NULL, '2024-11-20 06:12:12', '2024-11-20 06:12:14'),
(502, 'App\\Models\\User', 436, 'auth_token', '30ff410c01974bf2ee6f4e414edc0281aa10a1ef174252503f9496a838274ae0', '[\"*\"]', NULL, NULL, '2024-11-20 06:12:13', '2024-11-20 06:12:13'),
(503, 'App\\Models\\User', 1, 'auth_token', '4fd45cc55d2c13c2dc50ac80ff3e44be487e31c47ba11f99be7f899843c74ca5', '[\"*\"]', '2024-11-20 07:43:33', NULL, '2024-11-20 07:29:14', '2024-11-20 07:43:33'),
(504, 'App\\Models\\User', 1, 'auth_token', 'd786961a76813986ff3a91a06616a2c33cfb3a2d965020491373f6e973569025', '[\"*\"]', NULL, NULL, '2024-11-20 07:29:15', '2024-11-20 07:29:15'),
(505, 'App\\Models\\User', 1, 'auth_token', '2c0bc3f0655c373f2a3352b7f8d5ed45d0acae24430e37e03cc57ec3429f2d6e', '[\"*\"]', '2024-11-20 07:45:00', NULL, '2024-11-20 07:44:43', '2024-11-20 07:45:00'),
(506, 'App\\Models\\User', 1, 'auth_token', 'eb18793e4a331a55c37609efd62b74838bbd59e81ee7315d2f5e12ad2fc2336e', '[\"*\"]', NULL, NULL, '2024-11-20 07:44:44', '2024-11-20 07:44:44'),
(507, 'App\\Models\\User', 436, 'auth_token', '183e8e638b735e3c54cb6f3190fb9898f3c5e401e6a75a330631137d948580df', '[\"*\"]', '2024-11-20 07:52:36', NULL, '2024-11-20 07:45:16', '2024-11-20 07:52:36'),
(508, 'App\\Models\\User', 436, 'auth_token', 'e0afeccb4a5450718db74a6570732316b7f46ef2339f0eb752f022bbfb2f5689', '[\"*\"]', NULL, NULL, '2024-11-20 07:45:17', '2024-11-20 07:45:17'),
(509, 'App\\Models\\User', 1, 'auth_token', 'cddd4999ad405d85cdc765d3c26fb8768a0e3ee8d643f7b9d299cfd9afa11e82', '[\"*\"]', '2024-11-20 12:35:46', NULL, '2024-11-20 12:32:41', '2024-11-20 12:35:46'),
(510, 'App\\Models\\User', 1, 'auth_token', '1bd410228099d381208d3f3cf81c408820b2e60fce97a697d48756307717208c', '[\"*\"]', NULL, NULL, '2024-11-20 12:32:42', '2024-11-20 12:32:42'),
(511, 'App\\Models\\User', 1, 'auth_token', '34c067e82f892bcc3e359e391218fb67174f7712ec6bb5316f6fe44b72bde3cd', '[\"*\"]', '2024-11-20 12:45:41', NULL, '2024-11-20 12:36:18', '2024-11-20 12:45:41'),
(512, 'App\\Models\\User', 1, 'auth_token', '89a60bc40b69e8d46ed03c8b3a37e6c7e91d4859ec8107fd92d82de3bae73e7e', '[\"*\"]', NULL, NULL, '2024-11-20 12:36:19', '2024-11-20 12:36:19'),
(513, 'App\\Models\\User', 443, 'auth_token', '5419b4cae3080230a887b26e9ffd13a2bbd7ef8e67a942729f73dd5a2e6526f9', '[\"*\"]', NULL, NULL, '2024-11-20 12:41:56', '2024-11-20 12:41:56'),
(514, 'App\\Models\\User', 1, 'auth_token', 'a7a995fa0d11a5e47377e60674480313798fced280f2db7759c2c44b446bff73', '[\"*\"]', '2024-11-20 12:46:43', NULL, '2024-11-20 12:46:41', '2024-11-20 12:46:43'),
(515, 'App\\Models\\User', 1, 'auth_token', '4479439d5da56d082a62f0c593f96f79c744278eb60ea3da1ee8b459fbed5c68', '[\"*\"]', NULL, NULL, '2024-11-20 12:46:42', '2024-11-20 12:46:42'),
(516, 'App\\Models\\User', 1, 'auth_token', 'fe1713f33101a4ccd140bc3cd5a7317a4f2f8927b0153ffa6603717a2d16ee99', '[\"*\"]', '2024-11-20 13:12:41', NULL, '2024-11-20 12:47:05', '2024-11-20 13:12:41'),
(517, 'App\\Models\\User', 1, 'auth_token', '0f7cbb7125febfcf513c98778e65b268679945cd850e083c37fd473ae26ed348', '[\"*\"]', NULL, NULL, '2024-11-20 12:47:06', '2024-11-20 12:47:06'),
(518, 'App\\Models\\User', 444, 'auth_token', 'cb38babec13535c6a2bc36bb6df89592cdc397dbab6c8a690a27d4318447db92', '[\"*\"]', NULL, NULL, '2024-11-20 12:51:02', '2024-11-20 12:51:02'),
(519, 'App\\Models\\User', 445, 'auth_token', 'a1035502c3eb2de129abb47e4e28fcac6906b6720e3e306da3892b1f75adba51', '[\"*\"]', NULL, NULL, '2024-11-20 12:53:58', '2024-11-20 12:53:58'),
(520, 'App\\Models\\User', 1, 'auth_token', '002dc8041739cc0c4b080aa43cdc67916c02a1d04bd1b8e9c14fdfbf685ef33e', '[\"*\"]', '2024-11-20 13:16:59', NULL, '2024-11-20 13:08:37', '2024-11-20 13:16:59'),
(521, 'App\\Models\\User', 1, 'auth_token', '08c255dba2d3c9d951705cd10cc3faee518fa6e43ecb6bfdc54d7928a82c5fff', '[\"*\"]', NULL, NULL, '2024-11-20 13:08:38', '2024-11-20 13:08:38'),
(522, 'App\\Models\\User', 1, 'auth_token', 'bb5af9002e4f0602d529ea5d084ac008e4387ea51ef6f1ae62d5880106135b3b', '[\"*\"]', '2024-11-20 13:17:53', NULL, '2024-11-20 13:17:37', '2024-11-20 13:17:53'),
(523, 'App\\Models\\User', 1, 'auth_token', '0ca6516d53ba3ec147d9e6c04b7c43bf9498feb79c1b098ba2160fbfd84db47f', '[\"*\"]', NULL, NULL, '2024-11-20 13:17:38', '2024-11-20 13:17:38'),
(524, 'App\\Models\\User', 1, 'auth_token', 'e953e0fa2c49fced55353cd9f689285ed68910daaca65060c3a2dcebb4b6efa0', '[\"*\"]', '2024-11-20 13:40:43', NULL, '2024-11-20 13:40:30', '2024-11-20 13:40:43'),
(525, 'App\\Models\\User', 1, 'auth_token', '9f23784f4f54436c3fd523063aff23832ea56c3fb32d3651462c1a78df6c434e', '[\"*\"]', NULL, NULL, '2024-11-20 13:40:31', '2024-11-20 13:40:31'),
(526, 'App\\Models\\User', 1, 'auth_token', 'd61efa334939d8da6ef0fce708c8ef98ef763a0b2f5b1ff207196317d607e2da', '[\"*\"]', '2024-11-20 17:29:27', NULL, '2024-11-20 17:29:25', '2024-11-20 17:29:27'),
(527, 'App\\Models\\User', 1, 'auth_token', '48372dcae87a3bd6fbc3e849573bd695f379d1d9c0ca838fca69d8976fd9891a', '[\"*\"]', NULL, NULL, '2024-11-20 17:29:26', '2024-11-20 17:29:26'),
(528, 'App\\Models\\User', 1, 'auth_token', '4fdfd72007d66262d9bdfa9d224aaa0fc1f4e6249fea84cfc329493bbbb43fee', '[\"*\"]', '2024-11-20 17:30:48', NULL, '2024-11-20 17:30:21', '2024-11-20 17:30:48'),
(529, 'App\\Models\\User', 1, 'auth_token', 'e0aa59cd5dc8df5059b45f1cfad605faadad5922bb7ad3f0d72720ba1346e156', '[\"*\"]', NULL, NULL, '2024-11-20 17:30:22', '2024-11-20 17:30:22'),
(530, 'App\\Models\\User', 1, 'auth_token', '2a17640a278b80dc6440d612af851ec16cbe41aec72fd2c420caaa0af788947d', '[\"*\"]', '2024-11-20 23:21:35', NULL, '2024-11-20 23:20:08', '2024-11-20 23:21:35');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(531, 'App\\Models\\User', 1, 'auth_token', 'c2a738485ef985ec3a6338507c330961390c216d6c8129a602bbc023eaf4e582', '[\"*\"]', NULL, NULL, '2024-11-20 23:20:09', '2024-11-20 23:20:09'),
(532, 'App\\Models\\User', 1, 'auth_token', 'f432f7c88848e2268002aab30f6a4c64edad970c2f6a03c38e911d77aeb8d5a2', '[\"*\"]', '2024-11-20 23:22:07', NULL, '2024-11-20 23:22:01', '2024-11-20 23:22:07'),
(533, 'App\\Models\\User', 1, 'auth_token', 'ffc1c94615ec5cd8897e66ea45b245653e250777b621aac2b59f4752f204eaec', '[\"*\"]', NULL, NULL, '2024-11-20 23:22:02', '2024-11-20 23:22:02'),
(534, 'App\\Models\\User', 1, 'auth_token', '34ce4941cdde5b1d569528915def995ddcde13f48d488338b6b2fe4b95d2eec4', '[\"*\"]', '2024-11-20 23:23:49', NULL, '2024-11-20 23:23:48', '2024-11-20 23:23:49'),
(535, 'App\\Models\\User', 1, 'auth_token', '2b2df3a39b54def096d184358af77d4e694d01c2d7e890de8d86d15d61a6da62', '[\"*\"]', NULL, NULL, '2024-11-20 23:23:48', '2024-11-20 23:23:48'),
(536, 'App\\Models\\User', 1, 'auth_token', '50e944f26e6ae3bab5fcbc5cf5253d117c0649801fa4259932886243e5bdc897', '[\"*\"]', '2024-11-20 23:31:34', NULL, '2024-11-20 23:24:00', '2024-11-20 23:31:34'),
(537, 'App\\Models\\User', 1, 'auth_token', '634b2dccc61f38849e11a54241e5eb7d39f04338590a390a919a6ed0c9e83208', '[\"*\"]', NULL, NULL, '2024-11-20 23:24:01', '2024-11-20 23:24:01'),
(538, 'App\\Models\\User', 436, 'auth_token', '1356688f729c6eb425ab6b7e2b05b5814cae385d44c68aad4a3f8f335939688e', '[\"*\"]', '2024-11-20 23:40:17', NULL, '2024-11-20 23:33:34', '2024-11-20 23:40:17'),
(539, 'App\\Models\\User', 436, 'auth_token', '5d6c95cfeaf76dc1f42259aa7101d1fd5d26c5dc74c40feee1beb43478823553', '[\"*\"]', NULL, NULL, '2024-11-20 23:33:35', '2024-11-20 23:33:35'),
(540, 'App\\Models\\User', 1, 'auth_token', '070351ddcc04980e829b2a25093601b3c3fb9fae539bc85277ed574ef776d1be', '[\"*\"]', '2024-11-20 23:51:57', NULL, '2024-11-20 23:39:02', '2024-11-20 23:51:57'),
(541, 'App\\Models\\User', 1, 'auth_token', 'dabdbaa2fb09e0d696eeb2bdd7debfbe0b5610f728e9100a2d6a750563935cf8', '[\"*\"]', NULL, NULL, '2024-11-20 23:39:02', '2024-11-20 23:39:02'),
(542, 'App\\Models\\User', 1, 'auth_token', '715507cd50f5b7545cf117e5d51ecd5f8601df7536ed5fbc2815a36359133219', '[\"*\"]', '2024-11-20 23:48:06', NULL, '2024-11-20 23:47:55', '2024-11-20 23:48:06'),
(543, 'App\\Models\\User', 1, 'auth_token', '64233c7bd01616416c2887c72bff3a24e296869858cfc75bdb28bdb8f0663308', '[\"*\"]', NULL, NULL, '2024-11-20 23:47:56', '2024-11-20 23:47:56'),
(544, 'App\\Models\\User', 436, 'auth_token', '87f99ada91ad557a990a49f4e3c446fa98bbf51a2bc216dae302d81fb594e4ed', '[\"*\"]', '2024-11-20 23:56:05', NULL, '2024-11-20 23:48:37', '2024-11-20 23:56:05'),
(545, 'App\\Models\\User', 436, 'auth_token', '29ef9d89f6f155b8dfcafdd09bdda55945baccb23c8d9683e328174465c6edb4', '[\"*\"]', NULL, NULL, '2024-11-20 23:48:38', '2024-11-20 23:48:38'),
(546, 'App\\Models\\User', 446, 'auth_token', '869f8f7675a23e77c8a3e8b25e2354aedf0a39ed61ff92f0409171f28a008d41', '[\"*\"]', '2024-11-21 00:01:00', NULL, '2024-11-20 23:52:22', '2024-11-21 00:01:00'),
(547, 'App\\Models\\User', 446, 'auth_token', 'e6befbddd73c7434cecfee8567601d0ec2db12dc374dcfe1852898a559b4c8ea', '[\"*\"]', NULL, NULL, '2024-11-20 23:52:23', '2024-11-20 23:52:23'),
(548, 'App\\Models\\User', 436, 'auth_token', '98235db91b765e66ae325a45d389ba2869cd6cd7446a549eff1432c414f719c9', '[\"*\"]', '2024-11-20 23:57:09', NULL, '2024-11-20 23:57:07', '2024-11-20 23:57:09'),
(549, 'App\\Models\\User', 436, 'auth_token', '9b5c48cc774f629a916bc21aad1c84d2280f40bfd9c80e2ac325af36b423c7b7', '[\"*\"]', NULL, NULL, '2024-11-20 23:57:08', '2024-11-20 23:57:08'),
(550, 'App\\Models\\User', 436, 'auth_token', '45188a9633517d5817f4c5e9e9f4418de26a54677444ddea5f3a261d5f3ce955', '[\"*\"]', '2024-11-21 02:25:13', NULL, '2024-11-20 23:57:52', '2024-11-21 02:25:13'),
(551, 'App\\Models\\User', 436, 'auth_token', 'aadf8c229982ffb80387c37a3e73baf73aa097c671b4463d86f98524156a85fa', '[\"*\"]', NULL, NULL, '2024-11-20 23:57:53', '2024-11-20 23:57:53'),
(552, 'App\\Models\\User', 1, 'auth_token', 'cad7e296583f3b202a37b416e99fd5ff196235dbb9d07830e3360a42e677c3d2', '[\"*\"]', '2024-11-21 01:21:57', NULL, '2024-11-21 00:01:57', '2024-11-21 01:21:57'),
(553, 'App\\Models\\User', 1, 'auth_token', '55246a37ceb62cba4d28fa54ed8f4fb436f95261ebe17439058fbde82be8e8d8', '[\"*\"]', NULL, NULL, '2024-11-21 00:01:58', '2024-11-21 00:01:58'),
(554, 'App\\Models\\User', 446, 'auth_token', '173c7d534e1553875e11cba907d7d5a73d2e769ba21ba32662bf7a8ce504522b', '[\"*\"]', '2024-11-21 00:34:41', NULL, '2024-11-21 00:31:30', '2024-11-21 00:34:41'),
(555, 'App\\Models\\User', 446, 'auth_token', '4eaef484b865bfc0cc6495b8687b350c2c88dbcf365fd373e7f6a1edfd760ffc', '[\"*\"]', NULL, NULL, '2024-11-21 00:31:31', '2024-11-21 00:31:31'),
(556, 'App\\Models\\User', 446, 'auth_token', '0fefab90f634db58a441236928222aeaa501a683b0684261a9acb6adef73b7b5', '[\"*\"]', '2024-11-21 00:41:31', NULL, '2024-11-21 00:36:29', '2024-11-21 00:41:31'),
(557, 'App\\Models\\User', 446, 'auth_token', '5dd52028f27f1072c2973111005d8f1768437f955d6c2fef4d312baa0a180ac5', '[\"*\"]', NULL, NULL, '2024-11-21 00:36:29', '2024-11-21 00:36:29'),
(558, 'App\\Models\\User', 446, 'auth_token', '98a255d844fc56ad073c5a4344ee212d8ea361dbf55c724cf16bb6b2a772ac06', '[\"*\"]', '2024-11-21 00:43:41', NULL, '2024-11-21 00:42:16', '2024-11-21 00:43:41'),
(559, 'App\\Models\\User', 446, 'auth_token', 'a253c6555d5765bf8fac2e70bafcd50ea8caa723d45968d49147add642193bdb', '[\"*\"]', NULL, NULL, '2024-11-21 00:42:17', '2024-11-21 00:42:17'),
(560, 'App\\Models\\User', 446, 'auth_token', '69556173654f33158aae91704aa9ef515af5a8ad2915fec48986a2fba73a31ac', '[\"*\"]', '2024-11-21 01:01:34', NULL, '2024-11-21 00:47:38', '2024-11-21 01:01:34'),
(561, 'App\\Models\\User', 446, 'auth_token', 'd4cff78cea069d430d2c5dba71388b30c1516ae0494ec12b70dd800bab328e82', '[\"*\"]', NULL, NULL, '2024-11-21 00:47:39', '2024-11-21 00:47:39'),
(562, 'App\\Models\\User', 447, 'auth_token', 'f4fa1f7f4ff9095ac299d5faa4db46d53931ecb02300a64b9237f2dd99bd6074', '[\"*\"]', NULL, NULL, '2024-11-21 00:52:13', '2024-11-21 00:52:13'),
(563, 'App\\Models\\User', 448, 'auth_token', '0b53002e0bd28c3f56af0ed46b44740d5bf834718cd4129e6078aa0d137185d2', '[\"*\"]', NULL, NULL, '2024-11-21 00:57:20', '2024-11-21 00:57:20'),
(564, 'App\\Models\\User', 446, 'auth_token', '97ca6ab68d7c21ef6d66b086114fdc2feed309f549431853f47753a2628d0dc2', '[\"*\"]', '2024-11-21 01:11:35', NULL, '2024-11-21 01:11:33', '2024-11-21 01:11:35'),
(565, 'App\\Models\\User', 446, 'auth_token', 'c215abc484216ddae79373ec3e8a632f7cbfd8b46f6d046041b3e855419c5da5', '[\"*\"]', NULL, NULL, '2024-11-21 01:11:34', '2024-11-21 01:11:34'),
(566, 'App\\Models\\User', 446, 'auth_token', 'd98ba640ad3a41fbabe4120b6c382714ce9b26309772d650cdded21f52d872c0', '[\"*\"]', '2024-11-21 01:14:29', NULL, '2024-11-21 01:13:46', '2024-11-21 01:14:29'),
(567, 'App\\Models\\User', 446, 'auth_token', '2f2484a8162927d82cf0796c1ae56d07bd24dbec901cd48f2f2c5bdcca3c0fc0', '[\"*\"]', NULL, NULL, '2024-11-21 01:13:47', '2024-11-21 01:13:47'),
(568, 'App\\Models\\User', 446, 'auth_token', '907f03bc1a62962f7f958ececddf6bc8695a20073ebce69aa5b2bf60278f526a', '[\"*\"]', '2024-11-21 01:20:03', NULL, '2024-11-21 01:19:10', '2024-11-21 01:20:03'),
(569, 'App\\Models\\User', 446, 'auth_token', '1d5cf458c5ad4341b45a3c621570d3365e52c3635dd88bc6c96543ff0d42be19', '[\"*\"]', NULL, NULL, '2024-11-21 01:19:11', '2024-11-21 01:19:11'),
(570, 'App\\Models\\User', 446, 'auth_token', '5069c96b54b6cdb7e27805f937150ff385dc3e11a8dc1ac6d499b0d0b931fa19', '[\"*\"]', '2024-11-21 01:21:32', NULL, '2024-11-21 01:21:02', '2024-11-21 01:21:32'),
(571, 'App\\Models\\User', 446, 'auth_token', 'bea2a703e5596b4fd7782ecf11276ac9fe8d597ddc5175b79beb9d6ccdaabda9', '[\"*\"]', NULL, NULL, '2024-11-21 01:21:03', '2024-11-21 01:21:03'),
(572, 'App\\Models\\User', 449, 'auth_token', '1c6c9ad768903856b192af0b86d13745af06cf15689689a8c3aedc3eadd62e59', '[\"*\"]', NULL, NULL, '2024-11-21 01:21:31', '2024-11-21 01:21:31'),
(573, 'App\\Models\\User', 446, 'auth_token', 'f8a1224f8f5549385135eea5debac9958e554f150fe540698a0610269390af1a', '[\"*\"]', '2024-11-21 02:09:57', NULL, '2024-11-21 01:22:20', '2024-11-21 02:09:57'),
(574, 'App\\Models\\User', 446, 'auth_token', 'ea1305482410542ff63deeed0932673d7edccb7f295277ff30ea2e43bb1a90d5', '[\"*\"]', NULL, NULL, '2024-11-21 01:22:21', '2024-11-21 01:22:21'),
(575, 'App\\Models\\User', 1, 'auth_token', '5f4210150818333eeb40ee3383d6d2b184fd69759ebb513cee0f7885dbde047a', '[\"*\"]', '2024-11-21 03:53:13', NULL, '2024-11-21 01:52:49', '2024-11-21 03:53:13'),
(576, 'App\\Models\\User', 1, 'auth_token', 'a838071a1fbd88601c5346a55fbf8208481cdc5e641482268f18f4a89edb15b3', '[\"*\"]', NULL, NULL, '2024-11-21 01:52:50', '2024-11-21 01:52:50'),
(577, 'App\\Models\\User', 446, 'auth_token', '163258a28ba22c98bb71085f22f12bd4eb3f1a71670451b8b8caa8d9a49e6210', '[\"*\"]', '2024-11-21 02:14:55', NULL, '2024-11-21 02:13:31', '2024-11-21 02:14:55'),
(578, 'App\\Models\\User', 446, 'auth_token', '75f5ba2dc800b428940cfbf70c4d7030caf32cfc3dc55a29822e04bb1206173a', '[\"*\"]', NULL, NULL, '2024-11-21 02:13:32', '2024-11-21 02:13:32'),
(579, 'App\\Models\\User', 1, 'auth_token', '8450f9d2976d6fca99dc9a59b4499991fc3aa4535d3fd364ff481ccf83d53537', '[\"*\"]', '2024-11-21 02:30:44', NULL, '2024-11-21 02:16:39', '2024-11-21 02:30:44'),
(580, 'App\\Models\\User', 1, 'auth_token', '068a2eb383f679ace35cdb86f8937a16eb241d658d0e85a2bd3f10d2105a2dbe', '[\"*\"]', NULL, NULL, '2024-11-21 02:16:40', '2024-11-21 02:16:40'),
(581, 'App\\Models\\User', 446, 'auth_token', '50f3bf3fed0e1f63eba10d1ad5249428ed5532e8bd56b491e0821d99e1cc9d6a', '[\"*\"]', '2024-11-21 03:53:07', NULL, '2024-11-21 03:23:26', '2024-11-21 03:53:07'),
(582, 'App\\Models\\User', 446, 'auth_token', '33292729a4a4ecc8af87c4673d04219ab51972ca66f30e57573fb375713b7f48', '[\"*\"]', NULL, NULL, '2024-11-21 03:23:27', '2024-11-21 03:23:27'),
(583, 'App\\Models\\User', 1, 'auth_token', '1cb6efaee5df02e364e71297ab874127e9b703214f2b43bd9f798133765321b3', '[\"*\"]', '2024-11-21 03:53:56', NULL, '2024-11-21 03:53:53', '2024-11-21 03:53:56'),
(584, 'App\\Models\\User', 1, 'auth_token', '8a0ff824224f83b24769b4cfa87d8b9ec6d75636fc6e2781a7ba583d3391c236', '[\"*\"]', NULL, NULL, '2024-11-21 03:53:55', '2024-11-21 03:53:55'),
(585, 'App\\Models\\User', 1, 'auth_token', 'd6125df8336ef5000686bddb1119b12e7fcb0a5757183ca1dc23dccb8b770bd7', '[\"*\"]', '2024-11-21 08:26:53', NULL, '2024-11-21 08:21:24', '2024-11-21 08:26:53'),
(586, 'App\\Models\\User', 1, 'auth_token', '8dda0d2039b1ff931d8fa8fe14dbafea04e442396b7b28541f77da50db8bb0db', '[\"*\"]', NULL, NULL, '2024-11-21 08:21:24', '2024-11-21 08:21:24'),
(587, 'App\\Models\\User', 1, 'auth_token', 'b66358084377ecdedd6b3938ad2bda216f9e2c846bc2ec9fe32f3df694e8678e', '[\"*\"]', '2024-11-21 08:35:34', NULL, '2024-11-21 08:27:37', '2024-11-21 08:35:34'),
(588, 'App\\Models\\User', 1, 'auth_token', '25db4e48d5686839da3f8712c88cb108aa0404dd830e71e1825652f008c422f4', '[\"*\"]', NULL, NULL, '2024-11-21 08:27:38', '2024-11-21 08:27:38'),
(589, 'App\\Models\\User', 1, 'auth_token', '0b3c76aa4d369f7276677622b0bef558c23e7535508450b21959d8d473f643b9', '[\"*\"]', '2024-11-21 08:29:29', NULL, '2024-11-21 08:27:49', '2024-11-21 08:29:29'),
(590, 'App\\Models\\User', 1, 'auth_token', '92f1dba0587e0d9308722f443b91db8969247e092e05df86eb16a0bbc948cd7c', '[\"*\"]', NULL, NULL, '2024-11-21 08:27:50', '2024-11-21 08:27:50'),
(591, 'App\\Models\\User', 451, 'auth_token', '597e9dd14520cfae3526f2de81d09b470932d141091f5e5213d110e6f6c20445', '[\"*\"]', '2024-11-21 08:29:54', NULL, '2024-11-21 08:29:48', '2024-11-21 08:29:54'),
(592, 'App\\Models\\User', 451, 'auth_token', 'c71e6cbc69197156f143be5315329e14180672335453e19476de2c772c6800aa', '[\"*\"]', NULL, NULL, '2024-11-21 08:29:49', '2024-11-21 08:29:49'),
(593, 'App\\Models\\User', 1, 'auth_token', '313eea98792536ce114bf5c3c5e7a8f4561843695b8e3e22804bdf5b9b9da4fa', '[\"*\"]', '2024-11-21 08:36:24', NULL, '2024-11-21 08:31:06', '2024-11-21 08:36:24'),
(594, 'App\\Models\\User', 1, 'auth_token', '7c524a7b0cb7d9e54742a44b3e228ae1961dc4e4ca662013192b19010bc5744e', '[\"*\"]', NULL, NULL, '2024-11-21 08:31:07', '2024-11-21 08:31:07'),
(595, 'App\\Models\\User', 452, 'auth_token', 'f836b96f4043a1ae1f904760137522c90cb54147dd20caa6bb130e30a35ffb76', '[\"*\"]', NULL, NULL, '2024-11-21 08:31:42', '2024-11-21 08:31:42'),
(596, 'App\\Models\\User', 1, 'auth_token', 'bbd7989cb1b1a4d497acb8f4ab2318abdf29bd387390a41ccef43bcf018740ce', '[\"*\"]', '2024-11-21 08:46:53', NULL, '2024-11-21 08:35:54', '2024-11-21 08:46:53'),
(597, 'App\\Models\\User', 1, 'auth_token', '89f794a3ef2561171ec6457b7a07ece6ef748de0c12ade2d1b625789375889bf', '[\"*\"]', NULL, NULL, '2024-11-21 08:35:55', '2024-11-21 08:35:55'),
(598, 'App\\Models\\User', 1, 'auth_token', '0c0320576d99ecfe0730dce9739017ae756669f4dfc4f7d51f63328388ef658e', '[\"*\"]', '2024-11-21 12:51:05', NULL, '2024-11-21 12:49:06', '2024-11-21 12:51:05'),
(599, 'App\\Models\\User', 1, 'auth_token', '10d9d4e526ed2d8da98de79485c543acf323112762b08ac2ad62fb7407569e21', '[\"*\"]', NULL, NULL, '2024-11-21 12:49:08', '2024-11-21 12:49:08'),
(600, 'App\\Models\\User', 1, 'auth_token', 'b078ad864cf6619e71fefbcb54c9c1cdf5f6892d1991b499d04817e17a0cc156', '[\"*\"]', '2024-11-21 13:12:37', NULL, '2024-11-21 13:09:10', '2024-11-21 13:12:37'),
(601, 'App\\Models\\User', 1, 'auth_token', 'e6bcce23724cf29fb614ff6f6321644dd8053872436d8ec22ea928485128c06b', '[\"*\"]', NULL, NULL, '2024-11-21 13:09:11', '2024-11-21 13:09:11'),
(602, 'App\\Models\\User', 1, 'auth_token', '12a6db2748b8931e80c059ced34e71bd678c66bffafc2541441392e557a456bf', '[\"*\"]', '2024-11-21 13:18:15', NULL, '2024-11-21 13:14:24', '2024-11-21 13:18:15'),
(603, 'App\\Models\\User', 1, 'auth_token', 'fee678178ff8ce716f451b79887cca91c4a7a74232658adb5ce0643fde4dc5ad', '[\"*\"]', NULL, NULL, '2024-11-21 13:14:25', '2024-11-21 13:14:25'),
(604, 'App\\Models\\User', 453, 'auth_token', 'ce81cbb1685758aeb9bae3e0e09776cb8e97a0555ed5bce955289f70ba656bd3', '[\"*\"]', '2024-11-21 13:40:41', NULL, '2024-11-21 13:18:36', '2024-11-21 13:40:41'),
(605, 'App\\Models\\User', 453, 'auth_token', '0ff5d839f87e3da0f1ac23fd6dac623e12521988491a605b968f3d0ea14afbdc', '[\"*\"]', NULL, NULL, '2024-11-21 13:18:36', '2024-11-21 13:18:36'),
(606, 'App\\Models\\User', 454, 'auth_token', '4a7bcbda06955652c5e5b4a8548084ed184e6f2b7c3b9f0135721c06b50565ca', '[\"*\"]', NULL, NULL, '2024-11-21 13:19:21', '2024-11-21 13:19:21'),
(607, 'App\\Models\\User', 1, 'auth_token', 'cc3fe65b7ae9f34c841116c486f4d34ad3256011b42aecfc23887cc0b3ee74ef', '[\"*\"]', '2024-11-21 13:32:23', NULL, '2024-11-21 13:23:18', '2024-11-21 13:32:23'),
(608, 'App\\Models\\User', 1, 'auth_token', '696a60191ec5515bd2efac8052379bc896686b75d271c36c07bd61f9fbc39f20', '[\"*\"]', NULL, NULL, '2024-11-21 13:23:19', '2024-11-21 13:23:19'),
(609, 'App\\Models\\User', 455, 'auth_token', '089e5cd6856067448f472c9abe47dd1f0ed4485437ca2566f0f215821b9fe13c', '[\"*\"]', NULL, NULL, '2024-11-21 13:24:12', '2024-11-21 13:24:12'),
(610, 'App\\Models\\User', 1, 'auth_token', 'c5fbb07cfe089042dffb31c77514d205ac51d5ecae9aea4fd180c148ebf59808', '[\"*\"]', '2024-11-21 13:34:50', NULL, '2024-11-21 13:34:48', '2024-11-21 13:34:50'),
(611, 'App\\Models\\User', 1, 'auth_token', '31fe18dca5c9886836e1ff643140817a21c0489bc7bc7ae9a81dc9588a9fc80f', '[\"*\"]', NULL, NULL, '2024-11-21 13:34:49', '2024-11-21 13:34:49'),
(612, 'App\\Models\\User', 453, 'auth_token', '976baa86233bd32de00d05e5a267ad65ddf5f5f94915545d7106e3f54577c372', '[\"*\"]', '2024-11-21 13:37:15', NULL, '2024-11-21 13:35:26', '2024-11-21 13:37:15'),
(613, 'App\\Models\\User', 453, 'auth_token', 'bad3d92544226f0802d9d8d0a6872e8204e68d1ac97bcc2abbe5da86705ad1ec', '[\"*\"]', NULL, NULL, '2024-11-21 13:35:27', '2024-11-21 13:35:27'),
(614, 'App\\Models\\User', 456, 'auth_token', 'c22f81ef6a46c58ed5991b238bfd89136632f50225d5dfae0b52482301095261', '[\"*\"]', '2024-11-21 13:42:20', NULL, '2024-11-21 13:41:05', '2024-11-21 13:42:20'),
(615, 'App\\Models\\User', 456, 'auth_token', '95f7d124ec98513858ceb051744cb65df711b16b6be992b2493e12df79429289', '[\"*\"]', NULL, NULL, '2024-11-21 13:41:06', '2024-11-21 13:41:06'),
(616, 'App\\Models\\User', 1, 'auth_token', '6d9c1d8641f6abe4b2d15f7f66c6d78449807ad36b07fa11154d4f1878e44650', '[\"*\"]', '2024-11-21 13:43:42', NULL, '2024-11-21 13:42:41', '2024-11-21 13:43:42'),
(617, 'App\\Models\\User', 1, 'auth_token', 'e18b74eb9c9adb79d5a7d8fc171d62e834fd0fe3c37ce6992919ac1ddfec8725', '[\"*\"]', NULL, NULL, '2024-11-21 13:42:41', '2024-11-21 13:42:41'),
(618, 'App\\Models\\User', 456, 'auth_token', 'a4d95f0877babc277a26280404e3872ba753d61add5c88f842f9feee56cf664d', '[\"*\"]', '2024-11-21 13:46:05', NULL, '2024-11-21 13:44:23', '2024-11-21 13:46:05'),
(619, 'App\\Models\\User', 456, 'auth_token', '9c40e20c5567c1956c952f232554787bcbeb4efe6d82745caffb027e3328865a', '[\"*\"]', NULL, NULL, '2024-11-21 13:44:24', '2024-11-21 13:44:24'),
(620, 'App\\Models\\User', 1, 'auth_token', '4587961ab93768e0a78bcf51e502b566031ee9ed5c7b47ebca84b321249b3844', '[\"*\"]', '2024-11-21 23:35:50', NULL, '2024-11-21 23:35:29', '2024-11-21 23:35:50'),
(621, 'App\\Models\\User', 1, 'auth_token', '8a50a884712f5ccf63cbef7511a139286a74dc2618e0c9c9b347a8a47c93a6b6', '[\"*\"]', NULL, NULL, '2024-11-21 23:35:30', '2024-11-21 23:35:30'),
(622, 'App\\Models\\User', 1, 'auth_token', '56c13b76d0b4b82bebb3848fdebb7b96bb9d9a0b471ef671b0e8eb38f1b451ee', '[\"*\"]', '2024-11-22 03:49:00', NULL, '2024-11-21 23:40:02', '2024-11-22 03:49:00'),
(623, 'App\\Models\\User', 1, 'auth_token', 'cf6908affceecf8158e1939d979b7ad28edf1ec5f3b2acf67c2769deff74f5a4', '[\"*\"]', NULL, NULL, '2024-11-21 23:40:03', '2024-11-21 23:40:03'),
(624, 'App\\Models\\User', 1, 'auth_token', '1b9cce2f9096453701e9c3acced937f67856ec5764863aa05f3243b20e4187e3', '[\"*\"]', '2024-11-21 23:42:19', NULL, '2024-11-21 23:41:40', '2024-11-21 23:42:19'),
(625, 'App\\Models\\User', 1, 'auth_token', 'ce8b2d2ce6943071d4604c5b230b56f4233fc6ca1d94122274bfe8b7078f3b79', '[\"*\"]', NULL, NULL, '2024-11-21 23:41:41', '2024-11-21 23:41:41'),
(626, 'App\\Models\\User', 1, 'auth_token', 'daa244e5e6386b1876f5e2df0bfc5ca3b0cf340c048362a139560ace2675c3e3', '[\"*\"]', '2024-11-21 23:58:05', NULL, '2024-11-21 23:42:46', '2024-11-21 23:58:05'),
(627, 'App\\Models\\User', 1, 'auth_token', '212f015c603c754c1667ee715d63dfeba8b624a4a2fc33dede0bf047c87d5b6f', '[\"*\"]', NULL, NULL, '2024-11-21 23:42:47', '2024-11-21 23:42:47'),
(628, 'App\\Models\\User', 457, 'auth_token', '1106438e1efcb4f4a3d2ef57f0864b6c9fa47fe6233fbd60ed775f7c625ebbe3', '[\"*\"]', NULL, NULL, '2024-11-21 23:43:17', '2024-11-21 23:43:17'),
(629, 'App\\Models\\User', 458, 'auth_token', '37389d8a54c82441c0210d6238e3bd172eb97d192b2d2562f303c40ac432201f', '[\"*\"]', NULL, NULL, '2024-11-22 03:37:03', '2024-11-22 03:37:03'),
(630, 'App\\Models\\User', 1, 'auth_token', 'd9b35d68b097627c137c3e936ab9096e4eb269d0a0cf0207034f0b721917c39c', '[\"*\"]', '2024-11-22 04:18:33', NULL, '2024-11-22 03:49:21', '2024-11-22 04:18:33'),
(631, 'App\\Models\\User', 1, 'auth_token', '63b12b4924aedcdd2712a5ce0e421685abb0c8d5f418f21ba4cdf878887e0532', '[\"*\"]', NULL, NULL, '2024-11-22 03:49:22', '2024-11-22 03:49:22'),
(632, 'App\\Models\\User', 1, 'auth_token', '7f85606b177b87e836598006816d7fa8afc89319f742513e0a7f3013dbe99a72', '[\"*\"]', '2024-11-22 04:36:01', NULL, '2024-11-22 04:34:34', '2024-11-22 04:36:01'),
(633, 'App\\Models\\User', 1, 'auth_token', 'c2821d8c4a2d4373b9b4a3d9dc5d881b2871586c62abd7f930b1d129572a333b', '[\"*\"]', NULL, NULL, '2024-11-22 04:34:35', '2024-11-22 04:34:35'),
(634, 'App\\Models\\User', 1, 'auth_token', '4834d5b8bac680f7167e10571445be11a765427765b27301b9a16ef90b6de92a', '[\"*\"]', '2024-11-22 09:54:35', NULL, '2024-11-22 09:50:15', '2024-11-22 09:54:35'),
(635, 'App\\Models\\User', 1, 'auth_token', 'c52c624e20f8417e652cfe8e367267565e6c9d0fce5d8660af09cc2f289ed0a7', '[\"*\"]', NULL, NULL, '2024-11-22 09:50:15', '2024-11-22 09:50:15'),
(636, 'App\\Models\\User', 1, 'auth_token', '591082887d92dd822dd529d3486f46f15c43fd9d07726da08c22df4d6a23fb79', '[\"*\"]', '2024-11-25 23:08:17', NULL, '2024-11-25 23:07:59', '2024-11-25 23:08:17'),
(637, 'App\\Models\\User', 1, 'auth_token', '31bd47364790d89ba52de38a79ef00117ce31d4b9cc5b46f90ba4a8230b19df2', '[\"*\"]', NULL, NULL, '2024-11-25 23:08:00', '2024-11-25 23:08:00'),
(638, 'App\\Models\\User', 1, 'auth_token', '707a572016e9857a82a162630d33aa93d1eaf66199855bda6787944447190d15', '[\"*\"]', '2024-11-26 00:38:45', NULL, '2024-11-26 00:36:21', '2024-11-26 00:38:45'),
(639, 'App\\Models\\User', 1, 'auth_token', 'c374582fc989789d482addab434e1e1554510aaec5068758f845a7b97456bcc4', '[\"*\"]', NULL, NULL, '2024-11-26 00:36:22', '2024-11-26 00:36:22'),
(640, 'App\\Models\\User', 461, 'auth_token', '1f252489f0544ae485dd3e875ef6353cba124de7aad1ceef41a84100abc1803e', '[\"*\"]', NULL, NULL, '2024-11-26 00:36:37', '2024-11-26 00:36:37'),
(641, 'App\\Models\\User', 1, 'auth_token', '548d0526e7d821ee9bb74a0d44b7947018569c8c71fb286fa563b6a3e3064c8f', '[\"*\"]', '2024-11-26 10:48:06', NULL, '2024-11-26 10:29:07', '2024-11-26 10:48:06'),
(642, 'App\\Models\\User', 1, 'auth_token', 'd67cf2cb97caa7393403e291ad4325ff923d91bef01d66f279328897151ea317', '[\"*\"]', NULL, NULL, '2024-11-26 10:29:11', '2024-11-26 10:29:11'),
(643, 'App\\Models\\User', 463, 'auth_token', '171907ce7bf8a3b24ce568027fdb52ad450105316f5136f6b3773be4a3f331db', '[\"*\"]', NULL, NULL, '2024-11-26 10:34:46', '2024-11-26 10:34:46'),
(644, 'App\\Models\\User', 464, 'auth_token', '083a3735237046d26ec1048be631af1e95d876d7f71dc9c362ddd97c61ecb03a', '[\"*\"]', NULL, NULL, '2024-11-26 10:37:44', '2024-11-26 10:37:44'),
(645, 'App\\Models\\User', 1, 'auth_token', 'b84657e0b3120d51acd92d85c8a287db0fa69d27fbaad09094033cf3debdaf66', '[\"*\"]', '2024-11-28 09:33:25', NULL, '2024-11-28 09:26:03', '2024-11-28 09:33:25'),
(646, 'App\\Models\\User', 1, 'auth_token', 'df0fc7f0f827697753db48771846ebca903719c7087f38c250f747a8545d50fa', '[\"*\"]', NULL, NULL, '2024-11-28 09:26:04', '2024-11-28 09:26:04'),
(647, 'App\\Models\\User', 1, 'auth_token', 'e5c8096eac56df0efe91444a0003c26eec1462b647fabea02e192f692dc80670', '[\"*\"]', '2024-11-28 10:31:21', NULL, '2024-11-28 10:28:58', '2024-11-28 10:31:21'),
(648, 'App\\Models\\User', 1, 'auth_token', 'c5e38434129fe9109e9f0d7984ad5f0325ab5b89b99ba9465d891f53388b27e4', '[\"*\"]', NULL, NULL, '2024-11-28 10:29:00', '2024-11-28 10:29:00'),
(649, 'App\\Models\\User', 1, 'auth_token', 'd92dc06731deda4fb19ed042fe2b7cb84a8f7dd0a23be434f3945e929b3b2c4e', '[\"*\"]', '2024-11-28 23:28:23', NULL, '2024-11-28 23:25:13', '2024-11-28 23:28:23'),
(650, 'App\\Models\\User', 1, 'auth_token', '2f3869557dd05061a1f131d0c1831066933a6d77d08ad72478bdc8ee50e07bf1', '[\"*\"]', NULL, NULL, '2024-11-28 23:25:14', '2024-11-28 23:25:14'),
(651, 'App\\Models\\User', 1, 'auth_token', 'ec918502366343d89ca8866ea4b0f72c117effb899e87dec0ace70bac11a779d', '[\"*\"]', '2024-11-28 23:46:47', NULL, '2024-11-28 23:43:42', '2024-11-28 23:46:47'),
(652, 'App\\Models\\User', 1, 'auth_token', 'cb5da05a240e755c8ea651b828269217246bfab07166effd2e5ef8b309187513', '[\"*\"]', NULL, NULL, '2024-11-28 23:43:43', '2024-11-28 23:43:43'),
(653, 'App\\Models\\User', 1, 'auth_token', 'd46f37e738c98f7cb37b41a9c90bde62b2bef32f13030bd900f964484402b14a', '[\"*\"]', '2024-11-29 00:38:27', NULL, '2024-11-29 00:38:25', '2024-11-29 00:38:27'),
(654, 'App\\Models\\User', 1, 'auth_token', '2b442f45cd9f9355a9ee43eb32e183340d0e80b795c41e5911a768938d37a454', '[\"*\"]', NULL, NULL, '2024-11-29 00:38:26', '2024-11-29 00:38:26'),
(655, 'App\\Models\\User', 1, 'auth_token', 'c20c4b85f117565197212115d89474d785c228d3e9baa93a0878416f0129615a', '[\"*\"]', '2024-11-29 01:03:04', NULL, '2024-11-29 00:44:50', '2024-11-29 01:03:04'),
(656, 'App\\Models\\User', 1, 'auth_token', '457e7888146b7d6415bbe83c3856f642b4507cb08df67017db3ce086948dd6d5', '[\"*\"]', NULL, NULL, '2024-11-29 00:44:51', '2024-11-29 00:44:51'),
(657, 'App\\Models\\User', 1, 'auth_token', 'b4c3f7b716ce5d8ad0b6ea0ec5c11ee09363fcc4a92966afc2b048026309a16a', '[\"*\"]', '2024-11-29 01:11:00', NULL, '2024-11-29 01:10:54', '2024-11-29 01:11:00'),
(658, 'App\\Models\\User', 1, 'auth_token', '0c0c220de17880b926c84db669ba7d3d242a8fafc598d7f892f712b47c96f2b8', '[\"*\"]', NULL, NULL, '2024-11-29 01:10:55', '2024-11-29 01:10:55'),
(659, 'App\\Models\\User', 1, 'auth_token', '7412d43016f88d3654c3925bfd67b09d7214fbdf5f8235df109c71a4114e4436', '[\"*\"]', '2024-11-29 01:19:24', NULL, '2024-11-29 01:18:58', '2024-11-29 01:19:24'),
(660, 'App\\Models\\User', 1, 'auth_token', '54efd7214344efb92492c076f0ba6aa9e2bb6b9e17cbf37ab3bcbb507d677cef', '[\"*\"]', NULL, NULL, '2024-11-29 01:18:59', '2024-11-29 01:18:59'),
(661, 'App\\Models\\User', 1, 'auth_token', '0e2a70f9d90a73127d80de06ecd89591a2abe200e901e7b1612b59f232aa0b42', '[\"*\"]', '2024-11-29 01:53:30', NULL, '2024-11-29 01:22:08', '2024-11-29 01:53:30'),
(662, 'App\\Models\\User', 1, 'auth_token', '52056ea3be8f3d8973e6c597b08aa55225c501adff48d7f4c8aba169ffa5e35d', '[\"*\"]', NULL, NULL, '2024-11-29 01:22:09', '2024-11-29 01:22:09'),
(663, 'App\\Models\\User', 1, 'auth_token', '4e8e19a04577eefa2d9aae7eefe56a86f038a873d20238d4caaf4fbeb8679855', '[\"*\"]', '2024-11-29 04:03:45', NULL, '2024-11-29 01:47:21', '2024-11-29 04:03:45'),
(664, 'App\\Models\\User', 1, 'auth_token', '83d9aeca46e5cdbfa7f70317eb62ed7ab2216312a1d9685fc92e8211b7697f4f', '[\"*\"]', '2024-11-29 04:02:04', NULL, '2024-11-29 02:01:31', '2024-11-29 04:02:04'),
(665, 'App\\Models\\User', 1, 'auth_token', 'c4d40810a2a461285fc2c01302acdec2f38b05c11abca682ac70b2c7b42e96fb', '[\"*\"]', NULL, NULL, '2024-11-29 02:01:32', '2024-11-29 02:01:32'),
(666, 'App\\Models\\User', 1, 'auth_token', 'e7f691d5f741005ab6c6373d2b2221cda64ce0b2f6de0df79789a90addae2055', '[\"*\"]', '2024-11-29 05:57:09', NULL, '2024-11-29 04:05:32', '2024-11-29 05:57:09'),
(667, 'App\\Models\\User', 1, 'auth_token', '05195542ca71839c07719d36c84c90a398015b14964096289c27b9c574707d21', '[\"*\"]', NULL, NULL, '2024-11-29 04:05:33', '2024-11-29 04:05:33'),
(668, 'App\\Models\\User', 465, 'auth_token', '76281f5ca560e90b3cf3ef8517ac7f244050ddbfbff223c90eb95e9ab7757c30', '[\"*\"]', NULL, NULL, '2024-11-29 05:42:59', '2024-11-29 05:42:59'),
(669, 'App\\Models\\User', 466, 'auth_token', '55d0286602601154373b8a6e8a8d4e6cc7aa1eaa7e499924786366b757ab1aae', '[\"*\"]', NULL, NULL, '2024-11-29 05:57:08', '2024-11-29 05:57:08'),
(670, 'App\\Models\\User', 1, 'auth_token', '84e8684b2c664fc73f55a76197098df4671da479f1646528ed5d9eae4ae649c2', '[\"*\"]', '2024-11-29 06:20:39', NULL, '2024-11-29 05:57:55', '2024-11-29 06:20:39'),
(671, 'App\\Models\\User', 1, 'auth_token', 'ec924af2731901d6f34932232a768d94b835be74bef8adecc21812c74831e8ad', '[\"*\"]', NULL, NULL, '2024-11-29 05:57:56', '2024-11-29 05:57:56'),
(672, 'App\\Models\\User', 1, 'auth_token', '878c7da156700c854c9a3f70eb4518d349c63d4fbb97511e14adbf9c3b44e4fb', '[\"*\"]', '2024-11-29 06:24:45', NULL, '2024-11-29 06:21:07', '2024-11-29 06:24:45'),
(673, 'App\\Models\\User', 1, 'auth_token', '8175634f776763013099f6a1981256cb24918ac7635f6cf2ded554ab08d6b4f3', '[\"*\"]', NULL, NULL, '2024-11-29 06:21:08', '2024-11-29 06:21:08'),
(674, 'App\\Models\\User', 1, 'auth_token', '50e06d67ae568ee74d5b45c3d41d972941513f9b47b20655c4123977a7a99156', '[\"*\"]', '2024-11-29 06:27:15', NULL, '2024-11-29 06:27:07', '2024-11-29 06:27:15'),
(675, 'App\\Models\\User', 1, 'auth_token', 'c4f8db2388b921542cb99738d8cb76e767ce6dc0087d6937fc90ca3d1085f3cf', '[\"*\"]', NULL, NULL, '2024-11-29 06:27:08', '2024-11-29 06:27:08'),
(676, 'App\\Models\\User', 1, 'auth_token', 'fd85a2b601cd3c5ad67a773feae4bd517d3bfb8db0ca49b02e424d0b304a2381', '[\"*\"]', '2024-11-29 06:32:47', NULL, '2024-11-29 06:30:07', '2024-11-29 06:32:47'),
(677, 'App\\Models\\User', 1, 'auth_token', '964b7a1fb8d9fe688a18fcf93314effa7e08602c3b3262dc51a8c8fb7c6c9b94', '[\"*\"]', NULL, NULL, '2024-11-29 06:30:08', '2024-11-29 06:30:08'),
(678, 'App\\Models\\User', 1, 'auth_token', 'b2260ee8a12df13e66dd659e8f5bed404215a525ca6e70b90bbfe640f12f3ea7', '[\"*\"]', '2024-11-29 06:39:03', NULL, '2024-11-29 06:34:38', '2024-11-29 06:39:03'),
(679, 'App\\Models\\User', 1, 'auth_token', 'f985d264dcaed96ed0d027fb6d677b3e4098a6ed833eddacaafbb24ec31b4b39', '[\"*\"]', NULL, NULL, '2024-11-29 06:34:39', '2024-11-29 06:34:39'),
(680, 'App\\Models\\User', 1, 'auth_token', 'dc9354224f6c859489bd371d57558833fa847e6c039ce9f00bdeebb077e41f0c', '[\"*\"]', '2024-11-29 06:40:13', NULL, '2024-11-29 06:40:02', '2024-11-29 06:40:13'),
(681, 'App\\Models\\User', 1, 'auth_token', '72f56c1e8befec30a04b35bd121a3ec9dc6b2dfc7e3ec4ef2bf3633cf8b64d34', '[\"*\"]', NULL, NULL, '2024-11-29 06:40:04', '2024-11-29 06:40:04'),
(682, 'App\\Models\\User', 1, 'auth_token', 'a4239f00d6a8c401c75621b50c72fd67eea9b2051b80310181f98f02f893d725', '[\"*\"]', '2024-11-29 07:05:39', NULL, '2024-11-29 06:52:25', '2024-11-29 07:05:39'),
(683, 'App\\Models\\User', 1, 'auth_token', '99ab8077cbe31baf9b09909b2fdb8d6dcdb65c70e372dfcc745714c0ee0789f3', '[\"*\"]', NULL, NULL, '2024-11-29 06:52:26', '2024-11-29 06:52:26'),
(684, 'App\\Models\\User', 1, 'auth_token', '179bff9d56ab0245e7197f2f59a45f8d315953c9da74046b6f2df855e243b62c', '[\"*\"]', '2024-11-29 07:16:55', NULL, '2024-11-29 07:09:56', '2024-11-29 07:16:55'),
(685, 'App\\Models\\User', 1, 'auth_token', 'ef502af80f1c3324cd7f2530da84b2da9c6029c7ea3638ea0cbdc29dcf291a8f', '[\"*\"]', NULL, NULL, '2024-11-29 07:09:57', '2024-11-29 07:09:57'),
(686, 'App\\Models\\User', 467, 'auth_token', '76a87ee7d01a4c73fe97bf377fd6b375abd2b84ce3c7a5c1741453184371812e', '[\"*\"]', NULL, NULL, '2024-11-29 07:14:44', '2024-11-29 07:14:44'),
(687, 'App\\Models\\User', 1, 'auth_token', 'fcc44fad8c6959ce0188fec841dc57a0027c8ed2960a506b9750edfafa84607c', '[\"*\"]', '2024-11-29 07:24:20', NULL, '2024-11-29 07:23:57', '2024-11-29 07:24:20'),
(688, 'App\\Models\\User', 1, 'auth_token', '519b79f8eb43885f2fa0095c522410eaf27f5a6bb41d75a5467464ba04593fa7', '[\"*\"]', NULL, NULL, '2024-11-29 07:23:58', '2024-11-29 07:23:58'),
(689, 'App\\Models\\User', 1, 'auth_token', 'fd5cc23d86648dc9e17dfd72cc0a04322a52cdecdcfe60eae5f01d13cdd9bcf2', '[\"*\"]', '2024-12-04 03:15:50', NULL, '2024-12-04 02:57:56', '2024-12-04 03:15:50'),
(690, 'App\\Models\\User', 1, 'auth_token', '319790e538ef3b8aea4a828fa8951820796b6fe47bbe02b8af6ce652c60459d0', '[\"*\"]', NULL, NULL, '2024-12-04 02:57:57', '2024-12-04 02:57:57'),
(691, 'App\\Models\\User', 468, 'auth_token', 'f16b4d9b9ff51b81cc509e4f02ec812cfda79f850d7627f83faf6aeee29221c0', '[\"*\"]', NULL, NULL, '2024-12-04 03:00:34', '2024-12-04 03:00:34'),
(692, 'App\\Models\\User', 1, 'auth_token', 'c2b0854e26ce3a4f47485a0a1c3389596d1118699b8dd5c36f54e73cd75f30ff', '[\"*\"]', '2024-12-04 03:41:56', NULL, '2024-12-04 03:36:20', '2024-12-04 03:41:56'),
(693, 'App\\Models\\User', 1, 'auth_token', '61839d1269a1c5ab1e2b9c941ded9d2b1cce399f19f5f05295eebb680350c526', '[\"*\"]', NULL, NULL, '2024-12-04 03:36:21', '2024-12-04 03:36:21'),
(694, 'App\\Models\\User', 1, 'auth_token', '4f98a6f591f1799bf096175fb16154950a9c4b8e753231d5c1ea1efe88d7c8bf', '[\"*\"]', '2024-12-04 04:03:00', NULL, '2024-12-04 04:02:51', '2024-12-04 04:03:00'),
(695, 'App\\Models\\User', 1, 'auth_token', '3e1686a05cbdbab3fddc6ca1b6addd6720134069ad2cfc5698a6d612da2a291a', '[\"*\"]', NULL, NULL, '2024-12-04 04:02:52', '2024-12-04 04:02:52'),
(696, 'App\\Models\\User', 1, 'auth_token', '7f444d9d34f50ef805eb9dd4e9a7c2a18cfa04e924a8a39cd2c27c3184daf0c8', '[\"*\"]', '2024-12-04 04:04:49', NULL, '2024-12-04 04:04:30', '2024-12-04 04:04:49'),
(697, 'App\\Models\\User', 1, 'auth_token', '1b02c7fb0cc3d560b17fea340eb5f3d4ae567a0babb696148b94a1b592c7fb50', '[\"*\"]', NULL, NULL, '2024-12-04 04:04:31', '2024-12-04 04:04:31'),
(698, 'App\\Models\\User', 1, 'auth_token', 'b5c30ad877db9c9ba6e26871263965a4760c1987bd712259ddca06f4bf6c66ce', '[\"*\"]', '2024-12-04 04:05:53', NULL, '2024-12-04 04:05:27', '2024-12-04 04:05:53'),
(699, 'App\\Models\\User', 1, 'auth_token', 'ebc2419e362dba53a3969acd811e06dbb8b2fefb57cba081e5aa0b2de7a97a85', '[\"*\"]', NULL, NULL, '2024-12-04 04:05:28', '2024-12-04 04:05:28'),
(700, 'App\\Models\\User', 1, 'auth_token', '08343e5437ce1abe1e95447849ad5d7c28f56e37e528ab7ceb4c516bcb2a58f4', '[\"*\"]', '2024-12-04 04:12:33', NULL, '2024-12-04 04:12:27', '2024-12-04 04:12:33'),
(701, 'App\\Models\\User', 1, 'auth_token', '1d7b1f3572d91cd0103d24580fb3fe717547c946807752f32ba6620389aa2e8a', '[\"*\"]', NULL, NULL, '2024-12-04 04:12:28', '2024-12-04 04:12:28'),
(702, 'App\\Models\\User', 1, 'auth_token', '348003ed3642ce993be3014b76851fd7479fc460dfda82b07609cc9332475be7', '[\"*\"]', '2024-12-04 08:54:02', NULL, '2024-12-04 08:31:15', '2024-12-04 08:54:02'),
(703, 'App\\Models\\User', 1, 'auth_token', 'e7630b529d66ef0da43bf5348fefce9c9b26f18d02babbf7e7629a8e9c41209a', '[\"*\"]', NULL, NULL, '2024-12-04 08:31:16', '2024-12-04 08:31:16'),
(704, 'App\\Models\\User', 1, 'auth_token', 'b65cba822f787c111e5d0f7035bbfb2f05e04b2f215593ada73ead70937a3379', '[\"*\"]', '2024-12-12 13:31:45', NULL, '2024-12-12 13:31:11', '2024-12-12 13:31:45'),
(705, 'App\\Models\\User', 1, 'auth_token', 'ac164a8d79ce5b9a55c43974ae6926b73d46cee8f303be89f586088f06bc3651', '[\"*\"]', NULL, NULL, '2024-12-12 13:31:12', '2024-12-12 13:31:12'),
(706, 'App\\Models\\User', 1, 'auth_token', 'a76588d4a8f1a57a8bbfd1cf11c4035bb316d92319d7059ad266f6003c61c4a3', '[\"*\"]', '2024-12-17 14:18:58', NULL, '2024-12-17 06:05:37', '2024-12-17 14:18:58'),
(707, 'App\\Models\\User', 1, 'auth_token', '43405e13e98ed82e609376edcc013a0daa3af987bbc081a8175dc2c04991e000', '[\"*\"]', NULL, NULL, '2024-12-17 06:05:38', '2024-12-17 06:05:38'),
(708, 'App\\Models\\User', 469, 'auth_token', '02b77a132094f24d4c31b68c76e469970ad95a201e9fab019ec9528d4db449ab', '[\"*\"]', NULL, NULL, '2024-12-17 06:10:41', '2024-12-17 06:10:41'),
(709, 'App\\Models\\User', 1, 'auth_token', '0b752f4692e25654c430f8bc66b357864865c33450436aabe2e1e668c135af60', '[\"*\"]', '2024-12-18 00:12:06', NULL, '2024-12-18 00:07:10', '2024-12-18 00:12:06'),
(710, 'App\\Models\\User', 1, 'auth_token', '22a679cb4fa3fb34c5f0268fef9deffcb106821919def5476a0a4302b72a6524', '[\"*\"]', NULL, NULL, '2024-12-18 00:07:11', '2024-12-18 00:07:11'),
(711, 'App\\Models\\User', 1, 'auth_token', 'a74ac1c2a395b49b09771e269ca6623f81b062281169519189c5629adc106df9', '[\"*\"]', '2024-12-18 02:25:05', NULL, '2024-12-18 02:05:46', '2024-12-18 02:25:05'),
(712, 'App\\Models\\User', 1, 'auth_token', 'b2b141f1aac4ace600c46672476bcc3be9b06f1d9ba2158f9f39ac16042e975b', '[\"*\"]', NULL, NULL, '2024-12-18 02:05:47', '2024-12-18 02:05:47'),
(713, 'App\\Models\\User', 1, 'auth_token', '2c422a60d5f296b464b0deca914c13bd5e1b238e3f9ead15ed7658ebbccc1896', '[\"*\"]', '2024-12-18 02:41:31', NULL, '2024-12-18 02:41:25', '2024-12-18 02:41:31'),
(714, 'App\\Models\\User', 1, 'auth_token', 'f92086b37c479e5bdfd8f19f4ebf22cfbf0d0424d9fad75ece20188d1052e0f8', '[\"*\"]', NULL, NULL, '2024-12-18 02:41:26', '2024-12-18 02:41:26'),
(715, 'App\\Models\\User', 1, 'auth_token', '8003be3b9300cdcf78a4977764ce7ad33b4b97f19d8d4da43e3a7ed8bb7350cd', '[\"*\"]', '2024-12-18 05:15:32', NULL, '2024-12-18 02:42:26', '2024-12-18 05:15:32'),
(716, 'App\\Models\\User', 1, 'auth_token', 'ed882b8b085588873e18542f32d8c000a9c6b4cffb3b1d6ecdc67bb111e79394', '[\"*\"]', NULL, NULL, '2024-12-18 02:42:27', '2024-12-18 02:42:27'),
(717, 'App\\Models\\User', 1, 'auth_token', '9311e5af27d723548b53e239ed90945289472962c337c2396d8021f574d42d3c', '[\"*\"]', '2024-12-18 04:09:55', NULL, '2024-12-18 03:44:55', '2024-12-18 04:09:55'),
(718, 'App\\Models\\User', 1, 'auth_token', '781160c220b8ff004d71ed03a90caee157d73eaf9c8ba9ebfdc02b83678bb1c6', '[\"*\"]', '2024-12-18 06:23:14', NULL, '2024-12-18 05:19:48', '2024-12-18 06:23:14'),
(719, 'App\\Models\\User', 1, 'auth_token', '01c89652ef2010b726651e2b85e1e4b6ab4841caf536b0f58cad98c5f096424c', '[\"*\"]', NULL, NULL, '2024-12-18 05:19:49', '2024-12-18 05:19:49'),
(720, 'App\\Models\\User', 1, 'auth_token', 'ac67fb4dc8930856061abf810fef49c9f4e6e0dc05f578d0b203a3b754139bc6', '[\"*\"]', '2024-12-18 08:29:51', NULL, '2024-12-18 08:29:09', '2024-12-18 08:29:51'),
(721, 'App\\Models\\User', 1, 'auth_token', 'c9b99ce6d4053aff45a9f5c7ea0a9c0e641121c47497cc53afb26859607c3701', '[\"*\"]', NULL, NULL, '2024-12-18 08:29:10', '2024-12-18 08:29:10'),
(722, 'App\\Models\\User', 1, 'auth_token', '250a06132e4556221011dce91d967ef3890725bfb1c9bec89ac5675230298fb9', '[\"*\"]', '2024-12-18 23:45:52', NULL, '2024-12-18 23:45:32', '2024-12-18 23:45:52'),
(723, 'App\\Models\\User', 1, 'auth_token', 'f0a151f8b542db412f85716a617133f7e06115113549c345267664671ac168fd', '[\"*\"]', NULL, NULL, '2024-12-18 23:45:33', '2024-12-18 23:45:33'),
(724, 'App\\Models\\User', 1, 'auth_token', '76fdd9d0872813de7f063762948cafd197b58e05d383eced17e27f870c5320b3', '[\"*\"]', '2024-12-19 00:53:18', NULL, '2024-12-18 23:49:38', '2024-12-19 00:53:18'),
(725, 'App\\Models\\User', 1, 'auth_token', '73dba4633eac50d8f6cb2ca21e6ad0ff5c27dce8625876a1080f62beea0eb967', '[\"*\"]', NULL, NULL, '2024-12-18 23:49:39', '2024-12-18 23:49:39'),
(726, 'App\\Models\\User', 1, 'auth_token', '20c18c7ce718bc3d89e729890e37b91f4d179a3250e04a44068cc4bc3c9a503d', '[\"*\"]', '2024-12-18 23:54:52', NULL, '2024-12-18 23:51:28', '2024-12-18 23:54:52'),
(727, 'App\\Models\\User', 1, 'auth_token', '6abb4aff3fc8a9ce28cdd7adc11e8fe1bcd5cf159ef38280f5d28b7ff8cce600', '[\"*\"]', NULL, NULL, '2024-12-18 23:51:30', '2024-12-18 23:51:30'),
(728, 'App\\Models\\User', 470, 'auth_token', '91e1562f0e28b9a66bd325d7cdae050277b6f02ce6106f392b136f7db958d82a', '[\"*\"]', NULL, NULL, '2024-12-18 23:52:47', '2024-12-18 23:52:47'),
(729, 'App\\Models\\User', 1, 'auth_token', '94b2a16651c4a72b5190c35e8a67044e84c22e9d9f3b5ad19625a7d9e990b233', '[\"*\"]', '2024-12-18 23:55:53', NULL, '2024-12-18 23:55:48', '2024-12-18 23:55:53'),
(730, 'App\\Models\\User', 1, 'auth_token', '28c5218d41e4299238f66ab6cfe4f5dfe021a6fc81bbd5ed9786d3a0611f1075', '[\"*\"]', NULL, NULL, '2024-12-18 23:55:49', '2024-12-18 23:55:49'),
(731, 'App\\Models\\User', 1, 'auth_token', 'b504ed9bb9124b88d5295ebb8e7ed4df73b3b1164945295d7cec64947c2c0d99', '[\"*\"]', '2024-12-19 00:54:05', NULL, '2024-12-19 00:52:44', '2024-12-19 00:54:05'),
(732, 'App\\Models\\User', 1, 'auth_token', '8ea189e6b71219cef345f6b719982576caa40bcb887b16e50b7f076b985098ae', '[\"*\"]', NULL, NULL, '2024-12-19 00:52:45', '2024-12-19 00:52:45'),
(733, 'App\\Models\\User', 1, 'auth_token', '77d3488469a2f088e6e65393a96690861abef937622d88cfaed6ef9ad97e9dc7', '[\"*\"]', '2024-12-19 10:01:49', NULL, '2024-12-19 09:58:56', '2024-12-19 10:01:49'),
(734, 'App\\Models\\User', 1, 'auth_token', '99bf44e4309fb70ec6f03b1da51feb5eb1df5f91faade43d980771aa1af88f3a', '[\"*\"]', NULL, NULL, '2024-12-19 09:58:57', '2024-12-19 09:58:57'),
(735, 'App\\Models\\User', 1, 'auth_token', '456c9dd61e9cf722ad67a5a347f79f26d30ff21b6bf41bd237d5939236d0a2a2', '[\"*\"]', '2024-12-20 04:40:54', NULL, '2024-12-20 04:40:48', '2024-12-20 04:40:54'),
(736, 'App\\Models\\User', 1, 'auth_token', '0be9479853fa6bf6d9f3923d28a546bcc47042c32874bf87c9c9a72fd37cce9e', '[\"*\"]', NULL, NULL, '2024-12-20 04:40:49', '2024-12-20 04:40:49'),
(737, 'App\\Models\\User', 1, 'auth_token', '755012a224bb44a60d0e8b4de6af3822782b784824027d680f90d2ffe28d415b', '[\"*\"]', '2024-12-20 04:46:05', NULL, '2024-12-20 04:45:56', '2024-12-20 04:46:05'),
(738, 'App\\Models\\User', 1, 'auth_token', '7cbcc0b54ca6a172c740bcd46b89e9c0f3193f47702c04bb964d2d0376971d1c', '[\"*\"]', NULL, NULL, '2024-12-20 04:45:57', '2024-12-20 04:45:57'),
(739, 'App\\Models\\User', 1, 'auth_token', '71b550a9f82b79449a6b2a41bb6d905d7a118235e273bafa024bb9356492c48b', '[\"*\"]', '2024-12-21 11:01:09', NULL, '2024-12-21 11:00:12', '2024-12-21 11:01:09'),
(740, 'App\\Models\\User', 1, 'auth_token', 'b9998e7dec0b86e5c46ff7be813889bbccbf3c41252e5ceb7dca7e499c752f77', '[\"*\"]', NULL, NULL, '2024-12-21 11:00:13', '2024-12-21 11:00:13'),
(741, 'App\\Models\\User', 1, 'auth_token', '85e9f9739cd7cbca15ae6bc0ce53cab87aa00556e5fbbd1615501d91c3e56d75', '[\"*\"]', '2024-12-22 16:56:29', NULL, '2024-12-22 16:53:56', '2024-12-22 16:56:29'),
(742, 'App\\Models\\User', 1, 'auth_token', 'b9217dc594d353ecf6524a68792317adae61416e17973860ab87a0485c8f62ba', '[\"*\"]', NULL, NULL, '2024-12-22 16:53:57', '2024-12-22 16:53:57'),
(743, 'App\\Models\\User', 1, 'auth_token', 'd5b951fe0a4ea4e3b7e11305e43b6c1830487e229c59c674f83bf1d6e31153e0', '[\"*\"]', '2024-12-23 01:30:27', NULL, '2024-12-23 01:25:13', '2024-12-23 01:30:27'),
(744, 'App\\Models\\User', 1, 'auth_token', 'e21d956a339b0caf1781dca949011c19fdb268e579db79562a4e51413b7dbd07', '[\"*\"]', NULL, NULL, '2024-12-23 01:25:15', '2024-12-23 01:25:15'),
(745, 'App\\Models\\User', 1, 'auth_token', '43327daa235a02d953f2ef2b9dc604ee129fe0ce1e7056271a39e4cd96149c4a', '[\"*\"]', '2024-12-23 01:37:49', NULL, '2024-12-23 01:31:16', '2024-12-23 01:37:49'),
(746, 'App\\Models\\User', 1, 'auth_token', '75251feb1e9405284081f1707b52c447f5a8e1d36a41c2f108810905d2e7b2eb', '[\"*\"]', NULL, NULL, '2024-12-23 01:31:17', '2024-12-23 01:31:17'),
(747, 'App\\Models\\User', 1, 'auth_token', '8141b69b29667eea221fea8b87f4f6f83bc4eeb187005af6af51a223dce1b5d7', '[\"*\"]', '2024-12-23 01:46:04', NULL, '2024-12-23 01:46:02', '2024-12-23 01:46:04'),
(748, 'App\\Models\\User', 1, 'auth_token', 'ee9f90c29453c54024676dbe6bb67d01d1182baac5cf517ae1aa9258c8410d19', '[\"*\"]', NULL, NULL, '2024-12-23 01:46:03', '2024-12-23 01:46:03'),
(749, 'App\\Models\\User', 1, 'auth_token', '50f4aca253c1e28a700288e10bc380a17b9a89ccc141ad559a22dda3b259ca37', '[\"*\"]', '2024-12-23 05:55:49', NULL, '2024-12-23 05:55:05', '2024-12-23 05:55:49'),
(750, 'App\\Models\\User', 1, 'auth_token', '1a0eb77fb6bdbc56b3afde7a1600917edb70c67e7299bbafd8c0688b6f9e04af', '[\"*\"]', NULL, NULL, '2024-12-23 05:55:06', '2024-12-23 05:55:06'),
(751, 'App\\Models\\User', 1, 'auth_token', '24c922529fd43bf6cb113979df297363db01e1e4177916c0cfc3000c5f97b0f1', '[\"*\"]', '2025-01-01 06:59:29', NULL, '2025-01-01 06:59:27', '2025-01-01 06:59:29'),
(752, 'App\\Models\\User', 1, 'auth_token', '04c5c84826e5f4dccf5c0965fc11cb6bd26c3f8b2e1a23042cef1d4d7fbf44d6', '[\"*\"]', NULL, NULL, '2025-01-01 06:59:28', '2025-01-01 06:59:28'),
(753, 'App\\Models\\User', 1, 'auth_token', 'ba282ac2856cd33866c8397b2b84738173e73134e13c6dcce891ac51ee897d32', '[\"*\"]', '2025-01-01 08:10:24', NULL, '2025-01-01 07:00:27', '2025-01-01 08:10:24'),
(754, 'App\\Models\\User', 1, 'auth_token', 'e1f2eb00508b53facbcdfca65a6e0a0c2243d1078fff1fb5c6d6c7987091c30d', '[\"*\"]', NULL, NULL, '2025-01-01 07:00:28', '2025-01-01 07:00:28'),
(755, 'App\\Models\\User', 471, 'auth_token', '4e846799c59cd99632aec03d0555aadcc5f75318dc7f0b2ac7ce7c1a6cd29532', '[\"*\"]', NULL, NULL, '2025-01-01 07:02:47', '2025-01-01 07:02:47'),
(756, 'App\\Models\\User', 472, 'auth_token', '69a4a79563a17f08a916967a109727694f83a2b71051086d5c73b767b640d62d', '[\"*\"]', NULL, NULL, '2025-01-01 07:20:39', '2025-01-01 07:20:39'),
(757, 'App\\Models\\User', 473, 'auth_token', '51b5024983f75eab535bbec3e7a486ea6e3e9b3f4b34b6b6976a440cef8f02ee', '[\"*\"]', NULL, NULL, '2025-01-01 08:06:30', '2025-01-01 08:06:30'),
(758, 'App\\Models\\User', 1, 'auth_token', 'c1dee412ed0723c9a98b66751886740e178ab0c2ca675c9f941161ec07416fa6', '[\"*\"]', '2025-01-02 05:54:39', NULL, '2025-01-02 05:53:24', '2025-01-02 05:54:39'),
(759, 'App\\Models\\User', 1, 'auth_token', 'fa645de193d6de799e04b8f9c34d2d03831c0872e8489830880959d383eebedb', '[\"*\"]', NULL, NULL, '2025-01-02 05:53:25', '2025-01-02 05:53:25'),
(760, 'App\\Models\\User', 474, 'auth_token', '9a365151bddeca4c8d347f70f0cdae4a4053c3531f9b37a34a68e2f4435ab47a', '[\"*\"]', NULL, NULL, '2025-01-02 05:54:39', '2025-01-02 05:54:39'),
(761, 'App\\Models\\User', 1, 'auth_token', 'a4697a973da5277b80fdcbe4281fa2d9229d314679d61ecc0d01239c0a06c06d', '[\"*\"]', '2025-01-02 15:59:23', NULL, '2025-01-02 15:58:01', '2025-01-02 15:59:23'),
(762, 'App\\Models\\User', 1, 'auth_token', '25a3822b00dd85a402642f2a8762929435fb5d96b71542426e4cd8fd3a4d4ed8', '[\"*\"]', NULL, NULL, '2025-01-02 15:58:02', '2025-01-02 15:58:02'),
(763, 'App\\Models\\User', 1, 'auth_token', '6e088c15e911b01e8bce105a15242febbfc2cf1456f5bc022772fd6e854d4daa', '[\"*\"]', '2025-01-04 11:27:37', NULL, '2025-01-04 11:25:08', '2025-01-04 11:27:37'),
(764, 'App\\Models\\User', 1, 'auth_token', 'fc0be62c11510207b61418d2156b027421bc7f2e141d5400aa4ce7e595694f99', '[\"*\"]', NULL, NULL, '2025-01-04 11:25:09', '2025-01-04 11:25:09'),
(765, 'App\\Models\\User', 1, 'auth_token', '43ca505cf3a021501bbfbde39640da1ee26f4d7820921fbf1b17cfa66e4c8322', '[\"*\"]', '2025-01-06 07:39:40', NULL, '2025-01-06 07:37:00', '2025-01-06 07:39:40'),
(766, 'App\\Models\\User', 1, 'auth_token', 'd7e309de27d46b708192edde7f8e595e0cc269da95e91e7f8872da752296bc16', '[\"*\"]', NULL, NULL, '2025-01-06 07:37:01', '2025-01-06 07:37:01'),
(767, 'App\\Models\\User', 475, 'auth_token', '26fd365c61835423623aff8be8864968635f103ca826f4137dd6a9f621d4afe8', '[\"*\"]', NULL, NULL, '2025-01-06 07:38:47', '2025-01-06 07:38:47'),
(768, 'App\\Models\\User', 1, 'auth_token', 'bed65b9afd363c7927c7db2bfacad81352e680b3b88654f9914fd82c0180d633', '[\"*\"]', '2025-01-06 15:02:26', NULL, '2025-01-06 14:55:22', '2025-01-06 15:02:26'),
(769, 'App\\Models\\User', 1, 'auth_token', 'a07df0a535a96d4bb78c0aa43253bba60af98d3a5520a28ecacb18916e345d51', '[\"*\"]', NULL, NULL, '2025-01-06 14:55:24', '2025-01-06 14:55:24'),
(770, 'App\\Models\\User', 1, 'auth_token', '9bf656974ef7fbc715a3f5d6ddd046de0c4d7b0cc0fa87e0144367fee892b390', '[\"*\"]', '2025-01-10 17:01:26', NULL, '2025-01-10 16:59:33', '2025-01-10 17:01:26'),
(771, 'App\\Models\\User', 1, 'auth_token', '85da57fdd22baf6989890503d4a2d50fac176a47daf3c7f6d5a7fe335fde7c04', '[\"*\"]', NULL, NULL, '2025-01-10 16:59:34', '2025-01-10 16:59:34'),
(772, 'App\\Models\\User', 1, 'auth_token', '214f68fae84bb519c114b0334a113839eed22fc109e8a48099f632ff34570afb', '[\"*\"]', '2025-01-14 14:16:50', NULL, '2025-01-14 13:49:19', '2025-01-14 14:16:50'),
(773, 'App\\Models\\User', 1, 'auth_token', '8d2b6b3996865c4d43409666c56cf7eaad7a8b9807d65a61c422577fe79cc751', '[\"*\"]', NULL, NULL, '2025-01-14 13:49:21', '2025-01-14 13:49:21'),
(774, 'App\\Models\\User', 1, 'auth_token', '85c763c043ba5cf9d4adc22061bd3cf5abf7904b3b8e6f086c0d7905dc25fd65', '[\"*\"]', '2025-01-16 12:11:59', NULL, '2025-01-16 11:46:09', '2025-01-16 12:11:59'),
(775, 'App\\Models\\User', 1, 'auth_token', '2a6aa2b598f58d6750a11682ffd845b3014a67008b7eea0d1d2c857e5dc92f75', '[\"*\"]', NULL, NULL, '2025-01-16 11:46:10', '2025-01-16 11:46:10'),
(776, 'App\\Models\\User', 1, 'auth_token', '830a2183721c566dd11194fd971cc2920119a2953cafa2bb7430cabe37efac21', '[\"*\"]', '2025-01-16 12:36:51', NULL, '2025-01-16 12:12:24', '2025-01-16 12:36:51'),
(777, 'App\\Models\\User', 1, 'auth_token', 'a1f1a2790aad0fda9af57369ac84dc1cbfdda998161dd0ab1c3aeb24996237be', '[\"*\"]', NULL, NULL, '2025-01-16 12:12:25', '2025-01-16 12:12:25'),
(778, 'App\\Models\\User', 476, 'auth_token', '80e5e98effa7855f1dc28ad004b035fa82e2e8be2bc9d296049d7fdafaa4f867', '[\"*\"]', NULL, NULL, '2025-01-16 12:13:09', '2025-01-16 12:13:09'),
(779, 'App\\Models\\User', 477, 'auth_token', '5af89faa6d9e847e7c58992e34890a9f6ed3ee39569dc93e52e0a2054257ee46', '[\"*\"]', NULL, NULL, '2025-01-16 12:34:32', '2025-01-16 12:34:32'),
(780, 'App\\Models\\User', 1, 'auth_token', '581bffed522ec5b6f687d6c79dee4a5f2c411059651a257e196c6486266e5bb2', '[\"*\"]', '2025-01-16 12:56:12', NULL, '2025-01-16 12:46:46', '2025-01-16 12:56:12'),
(781, 'App\\Models\\User', 1, 'auth_token', '3311fb7d89e3648015e1f5d74682587e1f425fdb3cbc535cab82f4c6dc68b724', '[\"*\"]', NULL, NULL, '2025-01-16 12:46:47', '2025-01-16 12:46:47'),
(782, 'App\\Models\\User', 478, 'auth_token', '5e4b4966efb5510d064dda2277d8dfa5d994637276128f49ad4fb40cdd36a2c9', '[\"*\"]', NULL, NULL, '2025-01-16 12:50:26', '2025-01-16 12:50:26'),
(783, 'App\\Models\\User', 479, 'auth_token', '5d90d20b1539009eea0f8e3c3a9a4e5c68ae12bf6358957a05eb6b0d07f3d7c9', '[\"*\"]', NULL, NULL, '2025-01-16 12:53:41', '2025-01-16 12:53:41'),
(784, 'App\\Models\\User', 1, 'auth_token', 'db1c59454c14b31aaaaaa735c55951aefe8daa02264b3cd3bd9e8364dd5be090', '[\"*\"]', '2025-01-16 13:02:49', NULL, '2025-01-16 12:58:50', '2025-01-16 13:02:49'),
(785, 'App\\Models\\User', 1, 'auth_token', '7423db530d4d850f1d523836b8f101510ab7917d96617ea346567f2aea517b81', '[\"*\"]', NULL, NULL, '2025-01-16 12:58:51', '2025-01-16 12:58:51'),
(786, 'App\\Models\\User', 480, 'auth_token', '5a12936708a5286a5f488d702573618b5d7ed8a45d5987ff7b08b61bcd799a76', '[\"*\"]', NULL, NULL, '2025-01-16 12:59:59', '2025-01-16 12:59:59'),
(787, 'App\\Models\\User', 1, 'auth_token', '9b78584f215341e12348bbb2f2ab03298fdfdc6615ce3098068159d80e4d069e', '[\"*\"]', '2025-01-16 13:15:25', NULL, '2025-01-16 13:04:02', '2025-01-16 13:15:25'),
(788, 'App\\Models\\User', 1, 'auth_token', '51f608684f3aca0e0666fb24444a6bcc91ba8c18fdb53f68fc3ca35315a89355', '[\"*\"]', NULL, NULL, '2025-01-16 13:04:03', '2025-01-16 13:04:03'),
(789, 'App\\Models\\User', 1, 'auth_token', 'b65ed16ce5bb959e7738485b6d90a04384f80c0aae73219fdaaa6201cd15d80c', '[\"*\"]', '2025-01-18 05:59:27', NULL, '2025-01-18 05:49:42', '2025-01-18 05:59:27'),
(790, 'App\\Models\\User', 1, 'auth_token', '98b0d8a28817014c8e4d261840337857af914b681c5e95dfaca8dd55bf03adf1', '[\"*\"]', NULL, NULL, '2025-01-18 05:49:43', '2025-01-18 05:49:43'),
(791, 'App\\Models\\User', 1, 'auth_token', '84e3695b13ed4fade90ed3e65182d26e5675f262838b2d4aeaed18870e267257', '[\"*\"]', '2025-01-21 01:01:02', NULL, '2025-01-20 02:23:06', '2025-01-21 01:01:02'),
(792, 'App\\Models\\User', 1, 'auth_token', '49657c7c017c022bfb6184b3b3f67f7139da366de2b70665b4dfc736036525c5', '[\"*\"]', '2025-01-21 00:29:20', NULL, '2025-01-20 23:20:09', '2025-01-21 00:29:20'),
(793, 'App\\Models\\User', 1, 'auth_token', '207d31e1abcfe2b727546520e59954349a2c105b4964bdef49d47dba1fd2f89b', '[\"*\"]', NULL, NULL, '2025-01-20 23:20:10', '2025-01-20 23:20:10'),
(794, 'App\\Models\\User', 1, 'auth_token', '0fe0c0751e3fd657b2282434fe1d36458044fe5a4cd9efff786eeb4a7ae490f4', '[\"*\"]', '2025-01-21 00:32:42', NULL, '2025-01-21 00:29:38', '2025-01-21 00:32:42');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(795, 'App\\Models\\User', 1, 'auth_token', '77d1ea7832992d9973967fb53718d61887758945746122c219bde8fed846a495', '[\"*\"]', NULL, NULL, '2025-01-21 00:29:38', '2025-01-21 00:29:38'),
(796, 'App\\Models\\User', 1, 'auth_token', '046ae71021227607bc7f38d3660ea5c7e04480b60f234802c3aec80170acbb79', '[\"*\"]', '2025-01-21 01:15:17', NULL, '2025-01-21 00:42:52', '2025-01-21 01:15:17'),
(797, 'App\\Models\\User', 1, 'auth_token', 'a11a4da7c56d263504a79c36548b8a73909691f65ff26ea6cd0a3fba7c2978df', '[\"*\"]', NULL, NULL, '2025-01-21 00:42:53', '2025-01-21 00:42:53'),
(798, 'App\\Models\\User', 1, 'auth_token', 'e2351859933ba7e981bdfab072e790aa29f95c3137f000d6681371d385255d62', '[\"*\"]', '2025-01-21 01:16:01', NULL, '2025-01-21 01:15:35', '2025-01-21 01:16:01'),
(799, 'App\\Models\\User', 1, 'auth_token', '97645c74585b304bb213bb701a91acddbe0af3f5222708c696eef2c26e194145', '[\"*\"]', NULL, NULL, '2025-01-21 01:15:37', '2025-01-21 01:15:37'),
(800, 'App\\Models\\User', 1, 'auth_token', '3d8c755b89ad5247041feeda89b4cffe09c806ef633f75305e44bc3abafa0062', '[\"*\"]', '2025-01-21 02:04:42', NULL, '2025-01-21 01:16:30', '2025-01-21 02:04:42'),
(801, 'App\\Models\\User', 1, 'auth_token', 'c23a55a4bd7defb49afa7115ac37594019a7303da044e93f10be9ded37e60cf9', '[\"*\"]', NULL, NULL, '2025-01-21 01:16:32', '2025-01-21 01:16:32'),
(802, 'App\\Models\\User', 1, 'auth_token', 'c0d7fcd63d2d6e99bfd67117d9d30d93ddbbb22091e3356ec1ca9352da6fef32', '[\"*\"]', NULL, NULL, '2025-01-21 02:17:51', '2025-01-21 02:17:51'),
(803, 'App\\Models\\User', 1, 'auth_token', 'd58f99adbc5fde92f3ff7a8b4d1a67f0b24fb715de6fec711ee21c051e0ed871', '[\"*\"]', NULL, NULL, '2025-01-21 02:17:52', '2025-01-21 02:17:52'),
(804, 'App\\Models\\User', 1, 'auth_token', '5b32d155466c38edba5daade1442016c4ecb92657343f0ce7e9ef2e7d4d4575b', '[\"*\"]', '2025-01-21 02:19:06', NULL, '2025-01-21 02:18:26', '2025-01-21 02:19:06'),
(805, 'App\\Models\\User', 1, 'auth_token', 'e1c4d4828b45728777000997b0fd3a59eb4101d25bde79a00173cc1b5a10372a', '[\"*\"]', NULL, NULL, '2025-01-21 02:18:27', '2025-01-21 02:18:27'),
(806, 'App\\Models\\User', 1, 'auth_token', 'e13e01b568aabf3cbdf2d9fee0180e24fb354d2dd584d85274495b629a175d73', '[\"*\"]', '2025-01-21 02:32:24', NULL, '2025-01-21 02:19:29', '2025-01-21 02:32:24'),
(807, 'App\\Models\\User', 1, 'auth_token', 'fa3647c371b9840eea731a072e2ca239021f5ce835905377496db1103869e8ca', '[\"*\"]', NULL, NULL, '2025-01-21 02:19:30', '2025-01-21 02:19:30'),
(808, 'App\\Models\\User', 1, 'auth_token', 'd39dd83dd208e94a63b0538fd714d18d47ea1bd9acb5b580a47f900d61645213', '[\"*\"]', '2025-01-21 03:48:30', NULL, '2025-01-21 03:47:52', '2025-01-21 03:48:30'),
(809, 'App\\Models\\User', 1, 'auth_token', '676f795d00dd8eee47c53050afae536a7e846fbb48a88ff0242c4a297260f08b', '[\"*\"]', NULL, NULL, '2025-01-21 03:47:54', '2025-01-21 03:47:54'),
(810, 'App\\Models\\User', 1, 'auth_token', '3fdaf1708bda9dd6778aae01a1417fa5fbf35cd18d80ee23702a63978df9436b', '[\"*\"]', '2025-01-21 10:27:46', NULL, '2025-01-21 09:57:22', '2025-01-21 10:27:46'),
(811, 'App\\Models\\User', 1, 'auth_token', '261a081cc2ede71cbf1d3ae904b658b4d89b7a4d482dc567af42d5c6e1986a45', '[\"*\"]', NULL, NULL, '2025-01-21 09:57:23', '2025-01-21 09:57:23'),
(812, 'App\\Models\\User', 482, 'auth_token', 'cb6489c7e0f3ff883332830baf4ad1a129406415dcdc5201319e066851f6e3e9', '[\"*\"]', '2025-01-21 10:32:35', NULL, '2025-01-21 10:20:47', '2025-01-21 10:32:35'),
(813, 'App\\Models\\User', 482, 'auth_token', '99b590c6318068def109ba86b4ea01143b77e2a530bf32ac8d28210bc7283e77', '[\"*\"]', NULL, NULL, '2025-01-21 10:20:48', '2025-01-21 10:20:48'),
(814, 'App\\Models\\User', 483, 'auth_token', '636dfc900e455abd2465de09f6ad0ce519d195e184a2efb7f989bb13f42fe195', '[\"*\"]', NULL, NULL, '2025-01-21 10:21:39', '2025-01-21 10:21:39'),
(815, 'App\\Models\\User', 1, 'auth_token', 'd1c39d76f466baf021a472edfa245fdaa7706550bf34d8741fd82b4f9961c2d6', '[\"*\"]', '2025-01-21 18:03:18', NULL, '2025-01-21 18:00:05', '2025-01-21 18:03:18'),
(816, 'App\\Models\\User', 1, 'auth_token', '580d81368515ab700b7dc58b7942c30ab0d5ddea12152b2e25635565a1cb615c', '[\"*\"]', NULL, NULL, '2025-01-21 18:00:06', '2025-01-21 18:00:06'),
(817, 'App\\Models\\User', 1, 'auth_token', '5eecbecfd485dd3674d7486e2a97aa7508532a93616f7189c900a3ea53592216', '[\"*\"]', '2025-01-22 14:15:39', NULL, '2025-01-22 14:15:34', '2025-01-22 14:15:39'),
(818, 'App\\Models\\User', 1, 'auth_token', '324e56c6dd0e23863a4a7d9242aa5f9ed3faa98c76d5a690c8f9920db0c4c1d5', '[\"*\"]', NULL, NULL, '2025-01-22 14:15:35', '2025-01-22 14:15:35'),
(819, 'App\\Models\\User', 1, 'auth_token', '124078a3db695b7c1f9d8feb4f44b7ac3ea57de8366e21f479a04269c3a41be3', '[\"*\"]', '2025-01-22 14:18:18', NULL, '2025-01-22 14:16:02', '2025-01-22 14:18:18'),
(820, 'App\\Models\\User', 1, 'auth_token', 'd28d0dc79b403b6d2228614dbb1cc204c0906eeb051e639ff12f700d7517d5c0', '[\"*\"]', NULL, NULL, '2025-01-22 14:16:03', '2025-01-22 14:16:03'),
(821, 'App\\Models\\User', 1, 'auth_token', '5e14901c2606d0083fb389e4414645ba9b9874b3e4d5364c4176172853b9f3d9', '[\"*\"]', '2025-01-22 23:56:27', NULL, '2025-01-22 23:54:24', '2025-01-22 23:56:27'),
(822, 'App\\Models\\User', 1, 'auth_token', 'ad0a59c7c8d38eaa19b8c459620e40bb23be9c023e5fc61821e5fae1ca4a30f8', '[\"*\"]', NULL, NULL, '2025-01-22 23:54:25', '2025-01-22 23:54:25'),
(823, 'App\\Models\\User', 1, 'auth_token', '5b2278d5c3a08625825d76eae96e2d29e07631168860e8f9640784a1bee5734c', '[\"*\"]', '2025-01-23 00:17:01', NULL, '2025-01-23 00:12:13', '2025-01-23 00:17:01'),
(824, 'App\\Models\\User', 1, 'auth_token', '0e793a4e297a414decda94df6a33eaa1ff338b7ee23ee43f00508209bf7bdedc', '[\"*\"]', NULL, NULL, '2025-01-23 00:12:14', '2025-01-23 00:12:14'),
(825, 'App\\Models\\User', 1, 'auth_token', '75a66416cd5c8eba7f99a1c20ec14fbbf084102eace48f66272c2e77dfecefbb', '[\"*\"]', '2025-01-23 00:25:23', NULL, '2025-01-23 00:23:19', '2025-01-23 00:25:23'),
(826, 'App\\Models\\User', 1, 'auth_token', 'cf000746d232597339bf49f5c3343d5be55bce575c065f6c65977c3d94901ee6', '[\"*\"]', NULL, NULL, '2025-01-23 00:23:20', '2025-01-23 00:23:20'),
(827, 'App\\Models\\User', 1, 'auth_token', '0a23a4b2038a84edbe076f4c911b529ccf83edfa458323aa982587db6fbc29f8', '[\"*\"]', '2025-01-23 00:26:19', NULL, '2025-01-23 00:26:17', '2025-01-23 00:26:19'),
(828, 'App\\Models\\User', 1, 'auth_token', '7efeee4fa3a3f0010026e02067dea9d3f3c5ccb4bb8a87cf3cadd293a1e58433', '[\"*\"]', NULL, NULL, '2025-01-23 00:26:18', '2025-01-23 00:26:18'),
(829, 'App\\Models\\User', 1, 'auth_token', 'bc531ba344b67c02760c03107ace6225599811bd4f4bec6137751e04c2e54f76', '[\"*\"]', '2025-01-23 00:27:57', NULL, '2025-01-23 00:27:09', '2025-01-23 00:27:57'),
(830, 'App\\Models\\User', 1, 'auth_token', '9eac4a44f3003dffbe5333a3a9d4172a59bb6e7b6634f78d82b35629f0ff5e9a', '[\"*\"]', NULL, NULL, '2025-01-23 00:27:10', '2025-01-23 00:27:10'),
(831, 'App\\Models\\User', 1, 'auth_token', '0c552e6220e0b12bcf8f90bc95be8b15cfa750d7b32e668ee5255322272491ba', '[\"*\"]', '2025-01-23 00:29:14', NULL, '2025-01-23 00:29:13', '2025-01-23 00:29:14'),
(832, 'App\\Models\\User', 1, 'auth_token', 'd5657bbdb513a725ca533461296909d71c282ad05400df34e9d0f91a7388f966', '[\"*\"]', NULL, NULL, '2025-01-23 00:29:14', '2025-01-23 00:29:14'),
(833, 'App\\Models\\User', 1, 'auth_token', '24871d9a7a9a6a0a12b5053b94a9bf879e4f580a329e6c50469225d5e92f312d', '[\"*\"]', '2025-01-23 00:36:32', NULL, '2025-01-23 00:36:29', '2025-01-23 00:36:32'),
(834, 'App\\Models\\User', 1, 'auth_token', '7c832c6a67f6acc966600776bffb5a88b8829463d37cc906702d3ae8abd662fc', '[\"*\"]', NULL, NULL, '2025-01-23 00:36:30', '2025-01-23 00:36:30'),
(835, 'App\\Models\\User', 1, 'auth_token', '96cd26388799c9307b2df0cf4ecedf012efccc3e9230067390c9093472309405', '[\"*\"]', '2025-01-23 01:10:02', NULL, '2025-01-23 01:08:37', '2025-01-23 01:10:02'),
(836, 'App\\Models\\User', 1, 'auth_token', '471eff89f648a6e59306199c1550e3b13a04488eae8eed8626c6598c7ccb4d44', '[\"*\"]', NULL, NULL, '2025-01-23 01:08:38', '2025-01-23 01:08:38'),
(837, 'App\\Models\\User', 1, 'auth_token', 'd4f03ff0e12e5928eb8d3141254b40f73ac8cd909f9ef519230f168eebf6ac01', '[\"*\"]', '2025-01-23 01:15:50', NULL, '2025-01-23 01:10:24', '2025-01-23 01:15:50'),
(838, 'App\\Models\\User', 1, 'auth_token', '3200f855a16d701f7f05cc4242b680b01747aee37b7cf8783ee106110384157d', '[\"*\"]', NULL, NULL, '2025-01-23 01:10:25', '2025-01-23 01:10:25'),
(839, 'App\\Models\\User', 1, 'auth_token', 'ed91b4da18268e7d0fd1cc6b237483e67b24ad11358af8ddc513a4869beeeb48', '[\"*\"]', '2025-01-23 01:31:00', NULL, '2025-01-23 01:30:58', '2025-01-23 01:31:00'),
(840, 'App\\Models\\User', 1, 'auth_token', '592fab2f23ed26baeb027ca3c0060e6c4b4a0ca350a3ef8cc6248b24874b767a', '[\"*\"]', NULL, NULL, '2025-01-23 01:30:59', '2025-01-23 01:30:59'),
(841, 'App\\Models\\User', 1, 'auth_token', '0a5d22f79dfca15f714b24239cba33ce4e4c4d381d9c97d6455ac20c4112cf34', '[\"*\"]', '2025-01-23 01:32:41', NULL, '2025-01-23 01:32:02', '2025-01-23 01:32:41'),
(842, 'App\\Models\\User', 1, 'auth_token', '55b90edda84991cfb5157081ec0d366a1b2edea8fd60bab6a223069447506335', '[\"*\"]', NULL, NULL, '2025-01-23 01:32:03', '2025-01-23 01:32:03'),
(843, 'App\\Models\\User', 1, 'auth_token', '10e5ef908dda6dc3ee08008db5eafd8f197eaa4f99c09158adcf5e009823aa79', '[\"*\"]', '2025-01-23 01:35:16', NULL, '2025-01-23 01:33:22', '2025-01-23 01:35:16'),
(844, 'App\\Models\\User', 1, 'auth_token', '1d33ba94d12c77fb7c387d69a09be3fcb0892984363609ec1e4f1959c6b9c57e', '[\"*\"]', NULL, NULL, '2025-01-23 01:33:23', '2025-01-23 01:33:23'),
(845, 'App\\Models\\User', 1, 'auth_token', 'd1288ab88618f69b2ebd411adc8cdb24f51d55aadee5c39dac50b9f1f3c1685e', '[\"*\"]', '2025-01-23 01:49:16', NULL, '2025-01-23 01:49:01', '2025-01-23 01:49:16'),
(846, 'App\\Models\\User', 1, 'auth_token', '1657a2e1299fd3992184b86b1f3ebbfb22bd14d0c3c3e4443c54f56bb33063de', '[\"*\"]', NULL, NULL, '2025-01-23 01:49:02', '2025-01-23 01:49:02'),
(847, 'App\\Models\\User', 1, 'auth_token', '230ac3c54f2b673f374e9e86f5fee79271df9f00f4777ffdf168a45f7362d156', '[\"*\"]', '2025-01-23 02:26:11', NULL, '2025-01-23 02:01:08', '2025-01-23 02:26:11'),
(848, 'App\\Models\\User', 1, 'auth_token', 'f6be9ae9836c1fb331eae46df3a9c29ef80ac53cf531fa14c427ffb466b46ea6', '[\"*\"]', NULL, NULL, '2025-01-23 02:01:09', '2025-01-23 02:01:09'),
(849, 'App\\Models\\User', 482, 'auth_token', '9f03f11201d52da3739ff5f311f1c778d36e9a7c40204f55a5b26d99e1ce566e', '[\"*\"]', '2025-01-28 13:26:22', NULL, '2025-01-28 13:26:21', '2025-01-28 13:26:22'),
(850, 'App\\Models\\User', 482, 'auth_token', '7c225fb948d20d9fc182bfe9fa7fa54ce220589fa71d916fb7f196a33e10d18c', '[\"*\"]', NULL, NULL, '2025-01-28 13:26:21', '2025-01-28 13:26:21'),
(851, 'App\\Models\\User', 1, 'auth_token', '2db05dcb7e28b44419afbe2d8c95714bfcd392a73c3d6dce5701989ea6a80582', '[\"*\"]', '2025-02-03 11:48:10', NULL, '2025-02-03 11:47:13', '2025-02-03 11:48:10'),
(852, 'App\\Models\\User', 1, 'auth_token', '2313a06a5ca6560a6bc50f15d4e05b512c3e8efa03fca46e00f660b2d8aa08ce', '[\"*\"]', NULL, NULL, '2025-02-03 11:47:14', '2025-02-03 11:47:14'),
(853, 'App\\Models\\User', 1, 'auth_token', 'e4e34a7f0b8bbbf5838a77bdcb9259141783dcb7a233cb054f54dec1d318a44e', '[\"*\"]', '2025-02-04 06:56:17', NULL, '2025-02-04 06:55:47', '2025-02-04 06:56:17'),
(854, 'App\\Models\\User', 1, 'auth_token', '8db2abe3edc981c0e175b21c8b47a26d378b5b1b65ba5e0c6fad493e364d3576', '[\"*\"]', NULL, NULL, '2025-02-04 06:55:48', '2025-02-04 06:55:48'),
(855, 'App\\Models\\User', 1, 'auth_token', '41149711e7a00ef99e67d42f02817f1a945a2e3a3a4010197c3ec7ff27a3606e', '[\"*\"]', '2025-02-04 23:30:44', NULL, '2025-02-04 23:30:41', '2025-02-04 23:30:44'),
(856, 'App\\Models\\User', 1, 'auth_token', 'f7ab26342dcee30a02a8f6f2782b3e485ee1b297756632add89c62a9da60340e', '[\"*\"]', NULL, NULL, '2025-02-04 23:30:42', '2025-02-04 23:30:42'),
(857, 'App\\Models\\User', 1, 'auth_token', '852f14fcc3f1457eab90e746c0d58f22bdd24c2e4f6e3fe5d5cf38ea94974fe7', '[\"*\"]', '2025-02-05 00:52:29', NULL, '2025-02-05 00:52:27', '2025-02-05 00:52:29'),
(858, 'App\\Models\\User', 1, 'auth_token', 'bce5b6486f9ddc3658838a74dd4a9578788d04f1bba69036275fbc765c8e373a', '[\"*\"]', NULL, NULL, '2025-02-05 00:52:28', '2025-02-05 00:52:28'),
(859, 'App\\Models\\User', 1, 'auth_token', 'edf27a6a7845b2e7cb2ad53c6d93c5d3ebb701217f9b63fda313d60e971369b1', '[\"*\"]', '2025-02-05 01:51:46', NULL, '2025-02-05 00:52:58', '2025-02-05 01:51:46'),
(860, 'App\\Models\\User', 1, 'auth_token', '5dcdd0e9abab5a229d4ca6fd6fff317e2e91405683fe21f2a0e3a0fde1d76b58', '[\"*\"]', NULL, NULL, '2025-02-05 00:52:59', '2025-02-05 00:52:59'),
(861, 'App\\Models\\User', 1, 'auth_token', '0d6baa6b9ee34cafadbeb94484ad6c737c1dcf250f7c0bd034856bb9fc4bc21d', '[\"*\"]', '2025-02-07 00:09:51', NULL, '2025-02-07 00:06:20', '2025-02-07 00:09:51'),
(862, 'App\\Models\\User', 1, 'auth_token', '361991c4235d2b3d01a37c85229de2b50f3f87d958a9131b04debe0b49c3aea6', '[\"*\"]', NULL, NULL, '2025-02-07 00:06:21', '2025-02-07 00:06:21'),
(863, 'App\\Models\\User', 1, 'auth_token', '692a0637ebe7c5b2fb0fd4541d0c106a61e8a7024412b155a587c49b3ea68d4c', '[\"*\"]', '2025-02-07 02:05:34', NULL, '2025-02-07 01:19:27', '2025-02-07 02:05:34'),
(864, 'App\\Models\\User', 1, 'auth_token', 'c8c45f58e3a5581a0a297b3a68cc7995a9db15e8cd70bb180c83eee32bb95883', '[\"*\"]', NULL, NULL, '2025-02-07 01:19:28', '2025-02-07 01:19:28'),
(865, 'App\\Models\\User', 1, 'auth_token', 'a23536b4b687b7d87beb984eabfabf593930dcb5bd665a1076317dbdfb5c573f', '[\"*\"]', '2025-02-07 02:15:11', NULL, '2025-02-07 02:07:20', '2025-02-07 02:15:11'),
(866, 'App\\Models\\User', 1, 'auth_token', 'ebf5c4078ce850156be5e3c706e2b9244fe469c8642fcdca61ef3acef4dd0a02', '[\"*\"]', NULL, NULL, '2025-02-07 02:07:22', '2025-02-07 02:07:22'),
(867, 'App\\Models\\User', 1, 'auth_token', '7cca38a34d74d9264a6f3abe25ef1f3dbb226623018467c0147802ee82bb681c', '[\"*\"]', '2025-02-07 02:18:31', NULL, '2025-02-07 02:16:47', '2025-02-07 02:18:31'),
(868, 'App\\Models\\User', 1, 'auth_token', '98de77bc3ae36610dad6585eb3ddfdb15a3b849c49264ebabfad052b71500384', '[\"*\"]', NULL, NULL, '2025-02-07 02:16:48', '2025-02-07 02:16:48'),
(869, 'App\\Models\\User', 1, 'auth_token', '36e743286d3357a6e82ae0db3441e3fdc6da38c841e2be00225d46819bbcb76f', '[\"*\"]', '2025-02-07 02:22:38', NULL, '2025-02-07 02:20:47', '2025-02-07 02:22:38'),
(870, 'App\\Models\\User', 1, 'auth_token', '19676369c5c43ac86ca34b36a323940d0fd623b08c1887d4bfdd67d3c471b116', '[\"*\"]', NULL, NULL, '2025-02-07 02:20:48', '2025-02-07 02:20:48'),
(871, 'App\\Models\\User', 1, 'auth_token', 'e64fffd4c2825146baf9bf5d67a58f199341f551d7403fee457d918c97358c31', '[\"*\"]', '2025-02-07 03:07:57', NULL, '2025-02-07 02:26:36', '2025-02-07 03:07:57'),
(872, 'App\\Models\\User', 1, 'auth_token', '5d44ae89d0ec66828d3da9f2348f2b4f5fa4de69a40fc49c2b9f4dd18d28d837', '[\"*\"]', NULL, NULL, '2025-02-07 02:26:38', '2025-02-07 02:26:38'),
(873, 'App\\Models\\User', 1, 'auth_token', '8f8387183081771864bb62a2a14e71977724449fa500f93a63ed28a003f2d0c6', '[\"*\"]', '2025-02-07 06:40:11', NULL, '2025-02-07 06:27:24', '2025-02-07 06:40:11'),
(874, 'App\\Models\\User', 1, 'auth_token', 'c48ee9b70c698c9e7a0e47afcfd6fd877c63358009cec820c4f126e7924c615a', '[\"*\"]', NULL, NULL, '2025-02-07 06:27:25', '2025-02-07 06:27:25'),
(875, 'App\\Models\\User', 1, 'auth_token', '34a062ac412a366dd8d14ad51dda7476ea12754c9ffb9e3bf0c70b2277443ba2', '[\"*\"]', '2025-02-07 07:04:07', NULL, '2025-02-07 06:44:26', '2025-02-07 07:04:07'),
(876, 'App\\Models\\User', 1, 'auth_token', '53431b36aceb27191799ab2858d2115adca24117ee35bec9ddb3883cc7ca2de5', '[\"*\"]', NULL, NULL, '2025-02-07 06:44:27', '2025-02-07 06:44:27'),
(877, 'App\\Models\\User', 1, 'auth_token', 'b8172f7e2f841c1f78dd577a2facb8bacecc21a710e7578db9a22ae7a5c5d317', '[\"*\"]', '2025-02-10 04:04:42', NULL, '2025-02-09 23:50:42', '2025-02-10 04:04:42'),
(878, 'App\\Models\\User', 1, 'auth_token', 'e49d42e83a27131d2af8e121577edff3324486d00386024b6c8eaacea4eb244d', '[\"*\"]', NULL, NULL, '2025-02-09 23:50:43', '2025-02-09 23:50:43'),
(879, 'App\\Models\\User', 1, 'auth_token', 'cc8bb0cb1c12fc4b5516bac56b76f500a9a10499c858c805b11c9cc5ff3bc842', '[\"*\"]', '2025-02-10 07:14:20', NULL, '2025-02-10 04:33:57', '2025-02-10 07:14:20'),
(880, 'App\\Models\\User', 1, 'auth_token', 'a8a8ecc541ec1259146f247d0ea27a981a4c56dbdb2f4367b05c620358fe250a', '[\"*\"]', NULL, NULL, '2025-02-10 04:33:58', '2025-02-10 04:33:58'),
(881, 'App\\Models\\User', 1, 'auth_token', '4597a040abaf6e22811cec43d14bb7cd1f042526dd152ce5ec998d9dec33b1fb', '[\"*\"]', '2025-02-11 04:06:20', NULL, '2025-02-11 00:44:40', '2025-02-11 04:06:20'),
(882, 'App\\Models\\User', 1, 'auth_token', '23ab09da6672f23437a6def13f00cdb7e423eb63fccbad768162e9b0893ba16c', '[\"*\"]', NULL, NULL, '2025-02-11 00:44:41', '2025-02-11 00:44:41'),
(883, 'App\\Models\\User', 1, 'auth_token', '428a23057d9c1beeee2c0934afa7d0c1ab53e7d9ac608d16a9ecd2c98a405b83', '[\"*\"]', '2025-02-11 03:05:30', NULL, '2025-02-11 03:05:17', '2025-02-11 03:05:30'),
(884, 'App\\Models\\User', 1, 'auth_token', '535573c2ccf9f3099d61d1eb39b39b419353700ba747711c366a5330efbd9eb6', '[\"*\"]', NULL, NULL, '2025-02-11 03:05:18', '2025-02-11 03:05:18'),
(885, 'App\\Models\\User', 1, 'auth_token', 'e530c07997e07202b618dad6982792e92a0b9ad834a5829e324e9c4389e50cdd', '[\"*\"]', '2025-02-11 03:06:11', NULL, '2025-02-11 03:05:58', '2025-02-11 03:06:11'),
(886, 'App\\Models\\User', 1, 'auth_token', 'b561f734216c60709f5dc20daba8a1f873620081125644cc842eefbf022f3b48', '[\"*\"]', NULL, NULL, '2025-02-11 03:05:59', '2025-02-11 03:05:59'),
(887, 'App\\Models\\User', 1, 'auth_token', 'ea071b7c6ad950882e30383a1a51cc9eb71e4a953c20bbbb678db8032481207e', '[\"*\"]', '2025-02-12 00:52:58', NULL, '2025-02-12 00:48:15', '2025-02-12 00:52:58'),
(888, 'App\\Models\\User', 1, 'auth_token', '3b16f2a337007e9c3bbdb54f72e0b880d1969b59407b2c992fa0be94d309da2f', '[\"*\"]', NULL, NULL, '2025-02-12 00:48:16', '2025-02-12 00:48:16'),
(889, 'App\\Models\\User', 1, 'auth_token', '5f1d1ad7dacb7f8d5a234c0b5c218d67ff39a273455c7fe3a26c0f07dc15b5ea', '[\"*\"]', '2025-02-19 06:27:13', NULL, '2025-02-19 06:25:24', '2025-02-19 06:27:13'),
(890, 'App\\Models\\User', 1, 'auth_token', 'a5c553f437df45b3e7bca1cdb72012e8b470c6ff5171d5cba4ff775578d9af3a', '[\"*\"]', NULL, NULL, '2025-02-19 06:25:25', '2025-02-19 06:25:25'),
(891, 'App\\Models\\User', 1, 'auth_token', 'b6c7320f6114b1f89f36c2027631f722a7d7fd4d5ca4bfe95eadb416893cd0c7', '[\"*\"]', '2025-02-19 06:27:31', NULL, '2025-02-19 06:26:49', '2025-02-19 06:27:31'),
(892, 'App\\Models\\User', 1, 'auth_token', 'd3ea0687b7fe717feff857f20b1ef47ac98d4bde1bc9f29576ca6e0f62ad6814', '[\"*\"]', NULL, NULL, '2025-02-19 06:26:50', '2025-02-19 06:26:50'),
(893, 'App\\Models\\User', 1, 'auth_token', '9ba9c23c7150a93aa983cf04c6f4e812c94e7c074b9abe9fcccac5213eb31959', '[\"*\"]', '2025-02-19 06:33:51', NULL, '2025-02-19 06:33:41', '2025-02-19 06:33:51'),
(894, 'App\\Models\\User', 1, 'auth_token', 'ae937077372b6a019fe40b43f42670dfbad3743ffc279b1f188c7a7178cd5451', '[\"*\"]', NULL, NULL, '2025-02-19 06:33:42', '2025-02-19 06:33:42'),
(895, 'App\\Models\\User', 1, 'auth_token', 'b332c87fcc91b6da98057e4356252cb501c26180383362d2990d80478408d2d2', '[\"*\"]', '2025-02-20 00:01:13', NULL, '2025-02-20 00:00:58', '2025-02-20 00:01:13'),
(896, 'App\\Models\\User', 1, 'auth_token', 'c411016028e9b770d9d3700182f6861f6f0bca4196261b218d24a8fc8410bae3', '[\"*\"]', NULL, NULL, '2025-02-20 00:00:59', '2025-02-20 00:00:59'),
(897, 'App\\Models\\User', 1, 'auth_token', '66244438d285577d85f1cc187e6a37f0eb54755f0edbe330402039978a126f4a', '[\"*\"]', '2025-02-22 14:50:39', NULL, '2025-02-22 14:48:11', '2025-02-22 14:50:39'),
(898, 'App\\Models\\User', 1, 'auth_token', '46abf71cd0a8f0109c9cc814cf584cca671ad2c6e724342fa1cb4bbf2b5acb2f', '[\"*\"]', NULL, NULL, '2025-02-22 14:48:11', '2025-02-22 14:48:11'),
(899, 'App\\Models\\User', 1, 'auth_token', 'cff1e0154e15393f5686fc10ea4aec88c7c083bee951ea9713b491567e8724dd', '[\"*\"]', '2025-02-24 04:38:49', NULL, '2025-02-24 00:37:29', '2025-02-24 04:38:49'),
(900, 'App\\Models\\User', 1, 'auth_token', 'b894767a59c674168db676a326ec387faf248445ddccbc72961a7035bbf7282e', '[\"*\"]', NULL, NULL, '2025-02-24 00:37:30', '2025-02-24 00:37:30'),
(901, 'App\\Models\\User', 1, 'auth_token', 'd577da0b3ff8798427314da64277f20a75d5d337f24377fd0327402df1ca0e66', '[\"*\"]', '2025-02-24 04:03:39', NULL, '2025-02-24 04:03:34', '2025-02-24 04:03:39'),
(902, 'App\\Models\\User', 1, 'auth_token', '26920049c18ff4d5e0d92823b3deaaa38f1e97ffa0d6136fa23912b8e22e52ba', '[\"*\"]', NULL, NULL, '2025-02-24 04:03:36', '2025-02-24 04:03:36'),
(903, 'App\\Models\\User', 1, 'auth_token', '4449a52dacf77351761fb6924b837b53c15510d0459618378804d16a47c29e78', '[\"*\"]', '2025-02-24 14:54:14', NULL, '2025-02-24 04:06:06', '2025-02-24 14:54:14'),
(904, 'App\\Models\\User', 1, 'auth_token', 'f162f9b62978488b4b418ac29acb5c922bf8b644caf49f7d069c093f6c94f897', '[\"*\"]', NULL, NULL, '2025-02-24 04:06:07', '2025-02-24 04:06:07'),
(905, 'App\\Models\\User', 1, 'auth_token', 'e16ef10412a3f50a19935d02e9c09fe09d0c6d5440a1a76e3d489b703c788f22', '[\"*\"]', '2025-02-24 14:20:31', NULL, '2025-02-24 14:20:28', '2025-02-24 14:20:31'),
(906, 'App\\Models\\User', 1, 'auth_token', '3683f531360f9dbe906ae05ae7ff43523b2e2ba4c2e0e0b8d1f93b6e48cb3894', '[\"*\"]', NULL, NULL, '2025-02-24 14:20:28', '2025-02-24 14:20:28'),
(907, 'App\\Models\\User', 1, 'auth_token', 'f6746cd1191d6a69317cf3773cda25f6a3f63594a0ec9a02c626d941f4b145be', '[\"*\"]', '2025-02-24 14:44:47', NULL, '2025-02-24 14:26:59', '2025-02-24 14:44:47'),
(908, 'App\\Models\\User', 1, 'auth_token', 'bbe43c250cf9333f9ae14e094c579d0b2b937e0c754c4c7facd2b3cb4e3d57c1', '[\"*\"]', NULL, NULL, '2025-02-24 14:26:59', '2025-02-24 14:26:59'),
(909, 'App\\Models\\User', 1, 'auth_token', '5d190f8bc156b5a3bb2739a71d67b872099a4063f112c7616d6f03b5692dc5b9', '[\"*\"]', '2025-02-25 07:50:19', NULL, '2025-02-25 04:55:28', '2025-02-25 07:50:19'),
(910, 'App\\Models\\User', 1, 'auth_token', '6434fe44fd13da2dbc7f8cc42e0c43e7d5fd954e71b1b1028d4fc4f9d8f7e1d8', '[\"*\"]', NULL, NULL, '2025-02-25 04:55:30', '2025-02-25 04:55:30'),
(911, 'App\\Models\\User', 1, 'auth_token', '0d362c322c012c25bb55e96bae15eba87a3dddff0029ede1e410132c96c1edba', '[\"*\"]', '2025-02-27 14:17:46', NULL, '2025-02-27 14:17:44', '2025-02-27 14:17:46'),
(912, 'App\\Models\\User', 1, 'auth_token', '4e26270e8235b3a7ec74277dd18c76959b8190531553a03872366bb508a24870', '[\"*\"]', NULL, NULL, '2025-02-27 14:17:46', '2025-02-27 14:17:46'),
(913, 'App\\Models\\User', 1, 'auth_token', 'dd225d867bdf68d647ff961572718a8d78209338b878f93ee0b38d95f3a3b529', '[\"*\"]', '2025-02-27 14:19:36', NULL, '2025-02-27 14:18:44', '2025-02-27 14:19:36'),
(914, 'App\\Models\\User', 1, 'auth_token', 'f8155ec28960703b6232bef24bd961c6fc41d0008751d70d6de852ab508a74ff', '[\"*\"]', NULL, NULL, '2025-02-27 14:18:45', '2025-02-27 14:18:45'),
(915, 'App\\Models\\User', 1, 'auth_token', 'f0efb6a847672df61ba91fd7e13bdf0b15b0269a0240df8a564a8ad966d9b79b', '[\"*\"]', '2025-02-28 05:16:56', NULL, '2025-02-28 05:16:24', '2025-02-28 05:16:56'),
(916, 'App\\Models\\User', 1, 'auth_token', 'bd11e6baa42c6a63592ad36735390f8b6f83ff247c59d17a8bc34b16653a2410', '[\"*\"]', NULL, NULL, '2025-02-28 05:16:24', '2025-02-28 05:16:24'),
(917, 'App\\Models\\User', 1, 'auth_token', 'c3f922430f6177d9a846c76386c02c6ae0cd0626dbf8bd9eebeeb21189075547', '[\"*\"]', '2025-03-10 15:01:12', NULL, '2025-03-07 11:49:46', '2025-03-10 15:01:12'),
(918, 'App\\Models\\User', 1, 'auth_token', '9d9b24f72f6e5bcd1db2f8a79afd242ae06d084f37d570a031fc6242b77dbe25', '[\"*\"]', NULL, NULL, '2025-03-07 11:49:47', '2025-03-07 11:49:47'),
(919, 'App\\Models\\User', 1, 'auth_token', 'f2275a2d42bec65658b5181bab18a699680634386a9aaedd7b106bd6bae26656', '[\"*\"]', '2025-03-11 10:20:26', NULL, '2025-03-11 10:19:33', '2025-03-11 10:20:26'),
(920, 'App\\Models\\User', 1, 'auth_token', '4f16794f1ba6c77c968ad40b17167fb621d4e0e9bc139f8c63c74c5a05593172', '[\"*\"]', NULL, NULL, '2025-03-11 10:19:36', '2025-03-11 10:19:36'),
(921, 'App\\Models\\User', 1, 'auth_token', '15e4f294a90d055aeb33b694c9d2617b0a7e531d786eac870d541ecfedc9b51b', '[\"*\"]', '2025-03-12 16:59:52', NULL, '2025-03-12 16:59:09', '2025-03-12 16:59:52'),
(922, 'App\\Models\\User', 1, 'auth_token', '1b85fac5c26dc107bc45d52ff69bfc41bd0734dced0c4a883cc4eef3a5195b39', '[\"*\"]', NULL, NULL, '2025-03-12 16:59:10', '2025-03-12 16:59:10'),
(923, 'App\\Models\\User', 1, 'auth_token', '004a8d494d5ca2a20d81eafb39116fff5f9f165247d889cacef4a7752a9acc0b', '[\"*\"]', '2025-03-18 06:52:51', NULL, '2025-03-18 06:46:40', '2025-03-18 06:52:51'),
(924, 'App\\Models\\User', 1, 'auth_token', '83a870ee8d0fba8df613bcfe8ad0166edf0bd20c3f624cf4619054fddf9a64a5', '[\"*\"]', NULL, NULL, '2025-03-18 06:46:41', '2025-03-18 06:46:41'),
(925, 'App\\Models\\User', 1, 'auth_token', 'd1b8a379d4418a39cb5040269ac6d0fd1f0ecdddbce7dc1728d04a2b4d408d53', '[\"*\"]', '2025-03-20 16:10:20', NULL, '2025-03-20 16:09:55', '2025-03-20 16:10:20'),
(926, 'App\\Models\\User', 1, 'auth_token', '5b96c7be8c30925f30c3d91f916d628002f14a76730f369e526abc049aa6c191', '[\"*\"]', NULL, NULL, '2025-03-20 16:09:56', '2025-03-20 16:09:56'),
(927, 'App\\Models\\User', 1, 'auth_token', 'b3a2c1a35b45eb3c6f58a20853aecc1e7a893395fdfb370744c3efe83a280ace', '[\"*\"]', '2025-03-24 13:47:53', NULL, '2025-03-24 13:47:22', '2025-03-24 13:47:53'),
(928, 'App\\Models\\User', 1, 'auth_token', 'c08d84dba7ecfc411f4a33837233766d44ca7a63497f0bdacb5d366fac3de4ad', '[\"*\"]', NULL, NULL, '2025-03-24 13:47:23', '2025-03-24 13:47:23'),
(929, 'App\\Models\\User', 1, 'auth_token', 'c947f4c0af5d84dd6064ad636f867a288af9e2392af864468793f98c0a3d0f51', '[\"*\"]', '2025-03-25 17:57:05', NULL, '2025-03-25 17:56:25', '2025-03-25 17:57:05'),
(930, 'App\\Models\\User', 1, 'auth_token', 'b9ff84b8efbbb4802895998efd47f8df531366362dee9f3608a4c5af4c9a20ec', '[\"*\"]', NULL, NULL, '2025-03-25 17:56:28', '2025-03-25 17:56:28'),
(931, 'App\\Models\\User', 1, 'auth_token', '4f24e0ef711902cde2c81781bae9181fa6154626dfd81c23f5f2ed8bf7ffafd4', '[\"*\"]', '2025-03-27 06:42:26', NULL, '2025-03-27 04:16:31', '2025-03-27 06:42:26'),
(932, 'App\\Models\\User', 1, 'auth_token', '9c001a5c54dfb6df7ff7e3b3decc30df17425313a7ba8b558447f1ca64c1977a', '[\"*\"]', NULL, NULL, '2025-03-27 04:16:34', '2025-03-27 04:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `renew_packages`
--

CREATE TABLE `renew_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `renew_start_date` date NOT NULL,
  `renew_end_date` date NOT NULL,
  `renew_no_of_days` int(11) NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `description`, `created_at`, `updated_at`) VALUES
(15, 'Admin', 'web', 'Admin Updated', '2024-07-16 05:37:14', '2024-10-17 01:51:47'),
(42, 'Apprentice', 'web', 'Training', '2024-11-21 13:39:23', '2024-11-21 13:39:23'),
(22, 'Assistant Manager', 'web', 'test data', '2024-08-20 02:34:53', '2024-08-20 02:34:53'),
(39, 'client test role', 'web', 'test', '2024-10-17 01:06:19', '2024-10-17 06:44:27'),
(38, 'Demo role', 'web', 'Demo roles', '2024-08-21 02:07:12', '2024-10-17 01:53:02'),
(41, 'helper', 'web', 'testing purpose', '2024-11-05 06:48:39', '2024-11-05 06:48:39'),
(40, 'Instructor', 'web', NULL, '2024-10-23 05:38:44', '2024-10-23 05:38:44'),
(17, 'Receptionist', 'web', NULL, '2024-07-16 05:42:18', '2024-07-16 05:42:18'),
(43, 'test', 'web', 'Sitigym tester', '2025-01-21 10:17:21', '2025-01-21 10:17:21'),
(20, 'Testing', 'web', 'member', '2024-08-21 09:08:14', '2024-11-20 23:48:48'),
(18, 'Trainer', 'web', 'Trainer', '2024-08-21 12:27:30', '2024-08-20 12:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 15),
(2, 15),
(3, 15),
(4, 15),
(5, 15),
(6, 15),
(7, 15),
(8, 15),
(9, 15),
(10, 15),
(11, 15),
(12, 15),
(13, 15),
(14, 15),
(15, 15),
(16, 15),
(17, 15),
(18, 15),
(19, 15),
(20, 15),
(21, 15),
(22, 15),
(23, 15),
(24, 15),
(25, 15),
(26, 15),
(27, 15),
(28, 15),
(29, 15),
(30, 15),
(31, 15),
(32, 15),
(33, 15),
(1, 17),
(2, 17),
(1, 20),
(2, 20),
(3, 20),
(4, 20),
(5, 20),
(6, 20),
(7, 20),
(8, 20),
(9, 20),
(10, 20),
(11, 20),
(12, 20),
(13, 20),
(14, 20),
(15, 20),
(16, 20),
(17, 20),
(18, 20),
(19, 20),
(20, 20),
(21, 20),
(22, 20),
(23, 20),
(24, 20),
(26, 20),
(27, 20),
(30, 20),
(1, 22),
(2, 22),
(3, 22),
(4, 22),
(5, 22),
(6, 22),
(7, 22),
(8, 22),
(9, 22),
(10, 22),
(11, 22),
(12, 22),
(13, 22),
(14, 22),
(15, 22),
(16, 22),
(1, 38),
(2, 38),
(3, 38),
(4, 38),
(5, 38),
(6, 38),
(7, 38),
(8, 38),
(9, 38),
(10, 38),
(11, 38),
(12, 38),
(13, 38),
(14, 38),
(15, 38),
(16, 38),
(1, 39),
(2, 39),
(3, 39),
(4, 39),
(5, 39),
(6, 39),
(7, 39),
(8, 39),
(9, 39),
(10, 39),
(11, 39),
(12, 39),
(13, 39),
(14, 39),
(15, 39),
(16, 39),
(1, 41),
(2, 41),
(3, 41),
(4, 41),
(5, 41),
(6, 41),
(7, 41),
(8, 41),
(9, 41),
(10, 41),
(11, 41),
(12, 41),
(13, 41),
(14, 41),
(15, 41),
(16, 41),
(1, 42),
(2, 42),
(3, 42),
(5, 42),
(6, 42),
(7, 42),
(13, 42),
(14, 42),
(15, 42),
(17, 42),
(18, 42),
(19, 42),
(21, 42),
(22, 42),
(23, 42),
(1, 43),
(2, 43),
(3, 43),
(5, 43),
(6, 43),
(7, 43),
(17, 43),
(18, 43),
(19, 43),
(21, 43),
(22, 43),
(23, 43),
(32, 43);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `center_id` int(11) NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `number_of_member_capacity` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 active, 2 inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `title`, `center_id`, `session_date`, `start_time`, `end_time`, `number_of_member_capacity`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Power Sculpt', 2, '2024-07-15', '12:00:00', '13:00:00', 15, '1', '2024-07-15 00:47:07', '2024-07-15 00:47:07'),
(2, 'Rhythm Revolution', 1, '2024-07-16', '10:00:00', '12:00:00', 30, '2', '2024-07-15 00:48:43', '2024-07-15 00:48:43'),
(3, 'Fitness Fiesta', 1, '2024-07-15', '16:00:00', '17:00:00', 10, '2', '2024-07-15 00:49:21', '2024-07-15 00:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` int(11) NOT NULL,
  `center_id` int(11) DEFAULT NULL,
  `shift_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `eligibility` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `center_id`, `shift_name`, `start_time`, `end_time`, `eligibility`, `created_at`, `updated_at`) VALUES
(1, NULL, 'MORNING [06:30-12:30]', NULL, NULL, NULL, '2024-08-21 12:38:51', '2024-08-21 10:04:56'),
(2, NULL, 'LADIES SHIFT [12:30-16:30]', NULL, NULL, NULL, '2024-08-21 12:38:59', '2024-08-21 10:04:56'),
(3, NULL, 'NIGHT [16:30-22:30]', NULL, NULL, NULL, '2024-08-21 12:39:06', '2024-08-21 10:04:56'),
(6, 6, 'Night Shift', '10:00:00', '11:00:00', NULL, '2024-09-18 09:30:29', '0000-00-00 00:00:00'),
(7, 6, 'Afternoon Shift', '04:00:00', '06:00:00', NULL, '2024-09-18 09:30:29', '0000-00-00 00:00:00'),
(8, 7, 'Night Shift', '10:00:00', '11:00:00', NULL, '2024-09-18 13:16:37', '0000-00-00 00:00:00'),
(9, 8, 'Night Shift', '10:00:00', '11:00:00', 3, '2024-09-19 06:34:48', '0000-00-00 00:00:00'),
(10, 8, 'Afternoon Shift', '04:00:00', '06:00:00', 1, '2024-09-19 06:51:40', '0000-00-00 00:00:00'),
(11, 9, 'Night Shift', '10:00:00', '11:00:00', 2, '2024-09-19 11:00:55', '0000-00-00 00:00:00'),
(12, 10, 'Night Shift', '10:00:00', '11:00:00', 2, '2024-09-19 11:02:53', '0000-00-00 00:00:00'),
(13, 10, 'Afternoon Shift', '04:00:00', '06:00:00', 1, '2024-09-19 11:02:53', '0000-00-00 00:00:00'),
(14, 11, 'Night Shift', '10:00:00', '11:00:00', 2, '2024-09-19 11:04:06', '0000-00-00 00:00:00'),
(15, 11, 'Afternoon Shift', '04:00:00', '06:00:00', 1, '2024-09-19 11:04:06', '0000-00-00 00:00:00'),
(16, 12, 'Night Shift', '10:00:00', '11:00:00', 3, '2024-09-19 11:15:19', '0000-00-00 00:00:00'),
(17, 13, 'Night Shift', '10:00:00', '11:00:00', 3, '2024-09-19 11:32:52', '0000-00-00 00:00:00'),
(18, 13, 'Afternoon Shift', '04:00:00', '06:00:00', 1, '2024-09-19 11:35:46', '0000-00-00 00:00:00'),
(19, 14, 'Night Shift', '10:00:00', '11:00:00', 1, '2024-09-20 04:49:51', '0000-00-00 00:00:00'),
(20, 15, 'Night Shift', '10:00:00', '11:00:00', 3, '2024-09-20 07:41:05', '0000-00-00 00:00:00'),
(21, 16, 'Night Shift', '10:00:00', '11:00:00', 3, '2024-09-20 09:22:41', '0000-00-00 00:00:00'),
(22, 17, 'Night Shift', '10:00:00', '11:00:00', 3, '2024-09-20 09:25:37', '0000-00-00 00:00:00'),
(23, 17, 'Afternoon Shift', '04:00:00', '06:00:00', 1, '2024-09-20 09:26:41', '0000-00-00 00:00:00'),
(24, 17, 'Night Shift 1', '14:00:00', '16:00:00', 3, '2024-09-20 09:55:13', '0000-00-00 00:00:00'),
(25, 17, 'Afternoon Shift 0001', '19:00:00', '21:00:00', 2, '2024-09-20 09:56:22', '0000-00-00 00:00:00'),
(26, 18, 'Night Shift', '20:00:00', '22:00:00', 2, '2024-09-23 08:57:37', '0000-00-00 00:00:00'),
(27, 17, 'Night_Shift', '20:00:00', '22:00:00', 2, '2024-09-23 09:33:30', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ANDHRA PRADESH', NULL, NULL),
(2, 'ASSAM', NULL, NULL),
(3, 'ARUNACHAL PRADESH', NULL, NULL),
(4, 'BIHAR', NULL, NULL),
(5, 'GUJRAT', NULL, NULL),
(6, 'HARYANA', NULL, NULL),
(7, 'HIMACHAL PRADESH', NULL, NULL),
(8, 'JAMMU & KASHMIR', NULL, NULL),
(9, 'KARNATAKA', NULL, NULL),
(10, 'KERALA', NULL, NULL),
(11, 'MADHYA PRADESH', NULL, NULL),
(12, 'MAHARASHTRA', NULL, NULL),
(13, 'MANIPUR', NULL, NULL),
(14, 'MEGHALAYA', NULL, NULL),
(15, 'MIZORAM', NULL, NULL),
(16, 'NAGALAND', NULL, NULL),
(17, 'ORISSA', NULL, NULL),
(18, 'PUNJAB', NULL, NULL),
(19, 'RAJASTHAN', NULL, NULL),
(20, 'SIKKIM', NULL, NULL),
(21, 'TAMIL NADU', NULL, NULL),
(22, 'TRIPURA', NULL, NULL),
(23, 'UTTAR PRADESH', NULL, NULL),
(24, 'WEST BENGAL', NULL, NULL),
(25, 'DELHI', NULL, NULL),
(26, 'GOA', NULL, NULL),
(27, 'PONDICHERY', NULL, NULL),
(28, 'LAKSHDWEEP', NULL, NULL),
(29, 'DAMAN & DIU', NULL, NULL),
(30, 'DADRA & NAGAR', NULL, NULL),
(31, 'CHANDIGARH', NULL, NULL),
(32, 'ANDAMAN & NICOBAR', NULL, NULL),
(33, 'UTTARANCHAL', NULL, NULL),
(34, 'JHARKHAND', NULL, NULL),
(35, 'CHATTISGARH', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `daily_sub_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `paid_amount` decimal(10,0) DEFAULT NULL,
  `payable_amount` decimal(10,0) DEFAULT NULL,
  `remark` text,
  `type` int(11) NOT NULL DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `daily_sub_id`, `name`, `surname`, `package_id`, `email`, `mobile`, `gender`, `date`, `paid_amount`, `payable_amount`, `remark`, `type`, `created_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(12, 10012, 'miara', 'sura', 6, NULL, NULL, 'Male', '2024-11-05', 0, 25000, 'testing', 0, 1, NULL, NULL, '2024-11-05 05:03:19', '2024-11-05 05:03:19'),
(39, 10014, 'Axmad', 'Maxamad', 36, NULL, NULL, 'Male', '2024-11-21', 15000, 15000, NULL, 1, 1, NULL, NULL, '2024-11-21 13:30:51', '2024-11-21 13:30:51'),
(42, 10015, 'sxrffsxxf', 'aesraes', 36, NULL, NULL, 'Male', '2025-01-06', 0, 15000, 'Total Balance 15000.00, Payable Balance 15000.00, Currently Paid 0 Remaining Amount 15000, Date[2025-01-06/2025-01-07 ] , Plan Type- Daily', 1, 1, '2025-01-06 15:02:20', 1, '2025-01-06 07:39:07', '2025-01-06 15:02:20'),
(43, 10016, NULL, NULL, NULL, NULL, NULL, 'Male', '2025-01-21', 0, 0, NULL, 1, 482, NULL, NULL, '2025-01-21 10:28:54', '2025-01-21 10:28:54'),
(44, 10017, 'John', 'Doe', 36, NULL, NULL, 'Male', '2025-01-21', 15000, 15000, 'Daily customer', 1, 482, NULL, NULL, '2025-01-21 10:30:36', '2025-01-21 10:30:36'),
(45, 10018, 'Hana', 'Ahmed', 35, NULL, NULL, 'Male', '2025-01-21', 15000, 15000, 'Spa customer', 2, 482, NULL, NULL, '2025-01-21 10:31:58', '2025-01-21 10:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `otp_created_at` timestamp NULL DEFAULT NULL,
  `otp_verified` int(11) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `center_id` bigint(20) UNSIGNED DEFAULT NULL,
  `gym_member_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation_id` int(11) DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `pause_date` date DEFAULT NULL,
  `paused_days` int(11) NOT NULL DEFAULT '0',
  `suspend_type` int(11) NOT NULL DEFAULT '0',
  `joining_date` date DEFAULT NULL,
  `shift_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anniversary_date` date DEFAULT NULL,
  `tentative_joining_date` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `inquiry_mode` int(11) DEFAULT NULL COMMENT '1 Talking,2 Walking,3 Any',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '1 Hot, 2 Cold',
  `source_id` int(10) UNSIGNED DEFAULT NULL,
  `employee_id_proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 Active, 2 inactive',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `client_id`, `name`, `surname`, `email`, `country_code`, `mobile_number`, `otp`, `otp_created_at`, `otp_verified`, `email_verified_at`, `password`, `role`, `center_id`, `gym_member_code`, `gender`, `image`, `occupation_id`, `marital_status`, `date_of_birth`, `visit_date`, `starting_date`, `end_date`, `pause_date`, `paused_days`, `suspend_type`, `joining_date`, `shift_id`, `anniversary_date`, `tentative_joining_date`, `description`, `inquiry_mode`, `remark`, `source_id`, `employee_id_proof`, `status`, `remember_token`, `created_by`, `updated_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`) VALUES
(1, 0, 'Admin', NULL, 'admin@yopmail.com', '+91', '9950215477', 8756, NULL, NULL, NULL, '$2y$12$bh/hwxqXgNRYL/Vhpa5tDOaRMLI2r4OHYj8G1T10nnCWDwc5hAIhe', '15', 1, NULL, 'male', NULL, 1, 'married', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, '1', 2, NULL, '1', NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:46:12', '2024-09-13 07:06:53'),
(395, 0, 'Matthew', 'Hall', 'Matthew@yopmail.com', NULL, '86734894237', NULL, NULL, NULL, NULL, '$2y$12$E1MM5.4yiuM1KLlpMfZOXu.MGF6qVDISvS0vdSQ8GBBk9VRzBAPnu', '18', 1, NULL, 'Female', 'images/1730192584.png', NULL, NULL, '2024-10-29', NULL, NULL, NULL, NULL, 0, 0, '2024-10-28', NULL, NULL, NULL, 'TEST DATA', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-10-29 03:33:44', NULL, '2024-10-29 03:30:23', '2024-10-29 03:33:44'),
(396, 0, 'Benjamin', 'Edwards', 'Benjamin@yopmail.com', NULL, '9832572572', NULL, NULL, NULL, NULL, '$2y$12$DVCVGH9YgNBd0a1.xeq9mOMr0YJ7MkPLa46GpJZijEEeouDU2v41W', '17', 1, NULL, 'Other', 'images/1730192769.jpg', NULL, NULL, '2024-10-29', NULL, NULL, NULL, NULL, 0, 0, '2024-10-29', NULL, NULL, NULL, 'TEST DATA', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-07 06:27:10', NULL, '2024-10-29 03:36:10', '2024-11-07 06:27:10'),
(397, 0, 'Charles', 'Evans', 'Charles@yopmail.com', NULL, '8342582643', NULL, NULL, NULL, NULL, '$2y$12$PJK./undPdN8PA.8GOHuPeWaw2IQzAC.L4cRd8YwYJtnDH0TBh9Uu', '18', 1, NULL, 'Male', 'images/1730192865.png', NULL, NULL, '2024-10-29', NULL, NULL, NULL, NULL, 0, 0, '2024-10-30', NULL, NULL, NULL, 'TEST DATA', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-07 06:27:15', NULL, '2024-10-29 03:37:46', '2024-11-07 06:27:15'),
(398, 0, 'holl', 'tes', 'test12@yopmail.com', NULL, '09876543', NULL, NULL, NULL, NULL, '$2y$12$4SKre3mzkOS.YmUoYggxRuL4lx0X9hBDAxu6n7Zq64JnF4Cke6z0O', '22', 1, NULL, 'Male', NULL, NULL, NULL, '1990-03-12', NULL, NULL, NULL, NULL, 0, 0, '2024-10-29', NULL, NULL, NULL, 'tes', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-04 07:46:33', NULL, '2024-10-29 12:01:34', '2024-11-04 07:46:33'),
(414, 0, 'Harry', 'potter', 'harrypotter@yopmail.com', NULL, '9293454678', NULL, NULL, NULL, NULL, '$2y$12$Ng9bmvEz6ZjVGj7Wwo8i7emni0gUr.ctWNtcmT9BTVNsRU5KQsbBe', '40', 1, NULL, 'Male', 'images/1730808144.jpg', NULL, NULL, '2008-06-05', NULL, NULL, NULL, NULL, 0, 0, '2024-11-05', NULL, NULL, NULL, 'Pass@123', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-11-07 06:27:12', NULL, '2024-11-05 06:32:24', '2024-11-07 06:27:12'),
(423, 0, 'nikhil', 'purohit', 'nikhil@yopmail.com', NULL, '324354566', NULL, NULL, NULL, NULL, '$2y$12$xeMQFQtI6TaotdjPQmOekuiS5qudGl2Ij1AFSzVzNwRrT0/qjsjtO', '41', 1, NULL, 'Male', 'images/1730983503.jpg', NULL, NULL, '2024-11-07', NULL, NULL, NULL, NULL, 0, 0, '2024-11-07', NULL, NULL, NULL, 'test description', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-08 03:18:17', NULL, '2024-11-07 07:15:04', '2024-11-08 03:18:17'),
(424, 0, 'nikhil', 'purohit', 'nikh@yopmail.com', NULL, '1234567890', NULL, NULL, NULL, NULL, '$2y$12$a42MI9tMzaov1kNNR0t1F.Iz21s41l4taV9A.Lr3lYNKxVLiKsoqy', '40', 1, NULL, 'Male', 'images/1730983616.jpg', NULL, NULL, '2009-06-07', NULL, NULL, NULL, NULL, 0, 0, '2024-11-07', NULL, NULL, NULL, 'test description', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-18 01:41:46', NULL, '2024-11-07 07:16:56', '2024-11-18 01:41:46'),
(425, 0, 'nikhil', 'purhit', 'Test@yopmail.com', NULL, '1234567890', NULL, NULL, NULL, NULL, '$2y$12$njmvu2VVqROpgyW2BFgHP.0b52j9/tsmu6.Y92OgD2hgqLpqSl.se', '15', 1, NULL, 'Male', 'images/1730984295.jpg', NULL, NULL, '2024-11-07', NULL, NULL, NULL, NULL, 0, 0, '2024-11-07', NULL, NULL, NULL, 'test description', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-11-08 05:25:26', NULL, '2024-11-07 07:28:15', '2024-11-08 05:25:26'),
(426, 0, 'Manmohan', 'solanki', 'manmohan222@yopmail.com', NULL, '1111', NULL, NULL, NULL, NULL, '$2y$12$AETgq/RAuSCPRW4hd5mU/eZYuCwpdQgkI1NRFg/uktXTPINMKl/Fa', '22', 1, NULL, 'Male', NULL, NULL, NULL, '2007-06-24', NULL, NULL, NULL, NULL, 0, 0, '2024-11-08', NULL, NULL, NULL, 'dsfffsd', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-08 04:32:57', NULL, '2024-11-08 04:29:46', '2024-11-08 04:32:57'),
(427, 0, 'manmohan', 'user', 'manuser@yopamil.com', NULL, '2222', NULL, NULL, NULL, NULL, '$2y$12$23MJVB8t9tUEVapbjWfec.9pfLHokaVHItO2VMeMYpn9WCydGkbs.', '15', 1, NULL, 'Male', 'images/1731060383.png', NULL, NULL, '1999-02-02', NULL, NULL, NULL, NULL, 0, 0, '2024-11-08', NULL, NULL, NULL, 'rrr', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-08 04:37:22', NULL, '2024-11-08 04:36:23', '2024-11-08 04:37:22'),
(428, 0, 'manmohan', 'sha', 'shaBrothers@yopmail.com', NULL, '2233', NULL, NULL, NULL, NULL, '$2y$12$Xl6XtoOs9MtuLaIgn0qYzuXXrWbfkUvLiv9QYny9r5cTikmIWCdXq', '15', 1, NULL, 'Male', 'images/1731060520.png', NULL, NULL, '2010-02-03', NULL, NULL, NULL, NULL, 0, 0, '2024-11-08', NULL, NULL, NULL, 'ii', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-08 04:40:13', NULL, '2024-11-08 04:38:41', '2024-11-08 04:40:13'),
(429, 0, 'manmohan', 'shaahah', 'jsjj@yopmail.com', NULL, '222', NULL, NULL, NULL, NULL, '$2y$12$JftfAW6srfmQVsos2HpnJO1KkAUa1JO4cCPwqz1NgOm2pXgxL21zW', '15', 1, NULL, 'Male', NULL, NULL, NULL, '2010-02-03', NULL, NULL, NULL, NULL, 0, 0, '2024-11-08', NULL, NULL, NULL, 'eee', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-18 01:41:41', NULL, '2024-11-08 04:42:15', '2024-11-18 01:41:41'),
(430, 0, 'first', 'name', 'name@yopmail.com', NULL, '1234567890', NULL, NULL, NULL, NULL, '$2y$12$GXzRdt2RMMNPJKtYvulxM.XfhZML0BMMFaOal9G3gF4KR9x/iFT1S', '15', 1, NULL, 'Male', 'images/1731062187.jpg', NULL, NULL, '2026-06-08', NULL, NULL, NULL, NULL, 0, 0, '2024-11-21', NULL, NULL, NULL, 'bydeafult', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-08 05:19:39', NULL, '2024-11-08 05:06:27', '2024-11-08 05:19:39'),
(431, 0, 'first', 'name', 'pass@yopmail.com', NULL, '12233445', NULL, NULL, NULL, NULL, '$2y$12$hNsGiLaNwUlugW2ZFeUrx.O6FaoMNQ64ajhhgeo74d6J/6MCvJiEq', '15', 1, NULL, 'Male', NULL, NULL, NULL, '2004-06-08', NULL, NULL, NULL, NULL, 0, 0, '2024-10-08', NULL, NULL, NULL, 'new text', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-11-08 05:19:45', NULL, '2024-11-08 05:12:03', '2024-11-08 05:19:45'),
(432, 0, 'first', 'name', 'Test@yopmail.com', NULL, '1234567890', NULL, NULL, NULL, NULL, '$2y$12$AnJjWaVpaDFaNqTAs84n0eGjDbjrtP2tycslKO8NIu8Qc60VZIJD6', '15', 1, NULL, 'Male', NULL, NULL, NULL, '2003-06-08', NULL, NULL, NULL, NULL, 0, 0, '2024-11-08', NULL, NULL, NULL, 'new text', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-11-08 05:19:50', NULL, '2024-11-08 05:13:40', '2024-11-08 05:19:50'),
(433, 0, 'first', 'name', 'test@yopmail.com', NULL, '1234567890', NULL, NULL, NULL, NULL, '$2y$12$fQB7TrVy4uWhMa5mizJrzuhHUBV1cJBkMGn/NLSoBPapqLNut3xfS', '15', 1, NULL, 'Male', 'images/1731062749.jpg', NULL, NULL, '2004-07-08', NULL, NULL, NULL, NULL, 0, 0, '2024-11-08', NULL, NULL, NULL, 'test', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-08 05:19:54', NULL, '2024-11-08 05:15:49', '2024-11-08 05:19:54'),
(434, 0, 'jay', 'sharma', 'sharma@yopmail.com', NULL, '99243515', NULL, NULL, NULL, NULL, '$2y$12$hVyBjREpitd5E81nSnwscelOtnabzOFDTjAugcOow3VYKDMmeiP96', '15', 1, NULL, 'Male', NULL, NULL, NULL, '2024-11-08', NULL, NULL, NULL, NULL, 0, 0, '2024-11-08', NULL, NULL, NULL, 'ttttttttttt', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-11-08 05:19:58', NULL, '2024-11-08 05:18:19', '2024-11-08 05:19:58'),
(436, 0, 'nikhil', 'sharma', 'nikhil@yopmail.com', NULL, '1212121212', NULL, NULL, NULL, NULL, '$2y$12$SRVawow3GpMFjKuBhn3/VuLYRX9pszKD08nsMMBLmwzFoDXL7xYXa', '20', 1, NULL, 'Male', 'images/1731066163.jpg', NULL, NULL, '2024-11-08', NULL, NULL, NULL, NULL, 0, 0, '2024-11-08', NULL, NULL, NULL, 'test', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '2024-11-08 06:12:43', '2024-11-20 07:45:00'),
(441, 0, 'testin', 'tes', 'testmo@yopmail.com', NULL, '098765432', NULL, NULL, NULL, NULL, '$2y$12$sw/whBUaHCAwL/SosMz.buSi8hX/MW12q/g/7apB8fTcFy2jxG9qC', '15', 1, NULL, 'Male', NULL, NULL, NULL, '1999-03-12', NULL, NULL, NULL, NULL, 0, 0, '2024-11-19', NULL, NULL, NULL, 'test', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-20 13:17:47', NULL, '2024-11-19 14:59:10', '2024-11-20 13:17:47'),
(446, 0, 'Parul', 'Purohit', 'Parul@yopmail.com', NULL, '837487589347', NULL, NULL, NULL, NULL, '$2y$12$GIqFp9K7V1vVMtM8d7JSQOZyMEDvR2UxMgB/lGS5oVv1X/0YqTX0W', '20', 1, NULL, 'Female', 'images/1732166456.png', NULL, NULL, '2001-05-16', NULL, NULL, NULL, NULL, 0, 0, '2024-11-21', NULL, NULL, NULL, 'TEST DATA', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-21 13:16:27', NULL, '2024-11-20 23:50:57', '2024-11-21 13:16:27'),
(450, 0, 'Test', 'Testing', 'test1@sitigym.com', NULL, '09876545', NULL, NULL, NULL, NULL, '$2y$12$0SwUUx6Xyf82TaqrUk0r8ekFCCZWl5AUbPBIHLkxSM2fam0lsi3Bi', '15', 1, NULL, 'Male', NULL, NULL, NULL, '2006-03-12', NULL, NULL, NULL, NULL, 0, 0, '2024-11-21', NULL, NULL, NULL, 'test', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2024-11-21 13:16:30', NULL, '2024-11-21 08:26:50', '2024-11-21 13:16:30'),
(451, 0, 'Virat', 'Kohali', 'virat@yopmail.com', NULL, '42342343243', NULL, NULL, NULL, NULL, '$2y$12$QIPf/P9.D26JgW1zX0uNCu/8DlxmMUCp5COnvPoBt5n5VhV/8q7T.', '15', 1, NULL, 'Male', NULL, NULL, NULL, '1997-01-01', NULL, NULL, NULL, NULL, 0, 0, '2024-11-21', NULL, NULL, NULL, 'Pass@123', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-11-21 13:16:33', NULL, '2024-11-21 08:29:21', '2024-11-21 13:16:33'),
(453, 0, 'Jama', 'Muse', 'jama@sitigym.com', NULL, '098765678', NULL, NULL, NULL, NULL, '$2y$12$V1Ss8n9/1/jJzjSuNQZzjeY2gO21h48tO7WZGIjHOlKrT9Q.B7OnG', '15', 1, NULL, 'Male', NULL, NULL, NULL, '2000-03-12', NULL, NULL, NULL, NULL, 0, 0, '2024-11-21', NULL, NULL, NULL, 'Pass@123', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, '2024-11-21 13:18:12', '2024-11-21 13:18:12'),
(454, 1001, 'Testing', 'test', NULL, '+44', '098765678', NULL, NULL, NULL, NULL, '$2y$12$6Cx97hRg0kKzbVOMiqMibedHnFcr2sEgWAU1ETJJqAgm/UVi70.RK', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-11-21', NULL, NULL, NULL, NULL, 0, 0, '2024-11-21', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 453, NULL, NULL, NULL, '2024-11-21 13:19:21', '2024-11-21 13:19:21'),
(455, 1002, 'Deve', 'aea', NULL, '+44', '54201211', NULL, NULL, NULL, NULL, '$2y$12$nnKyIO/c6TLTqVvYmyTKweKQlADBLtkVDKnLvdvsPIgNeDY1.8j3G', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-11-21', NULL, NULL, NULL, NULL, 0, 0, '2024-11-21', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2024-11-21 13:24:12', '2024-11-21 13:28:59'),
(456, 0, 'Alex', 'Grant', 'alex@citigym.com', NULL, '0987654567', NULL, NULL, NULL, NULL, '$2y$12$yaykDE624IHVm5as37bcOuUVt97Kz1b6F.Oa9syNpdE2LMN48tVmy', '42', 1, NULL, 'Male', NULL, NULL, NULL, '2005-02-23', NULL, NULL, NULL, NULL, 0, 0, '2024-11-21', NULL, NULL, NULL, 'Pass@123', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, '2024-11-21 13:40:38', '2024-11-21 13:40:38'),
(457, 1003, 'Arvind', 'Chaurasia', 'demo@yopmail.com', '+44', '07014242694', NULL, NULL, NULL, NULL, '$2y$12$LAYLIgQULI9iR.M8OU4lOuSlUkjn5FQ946jXetfskdQIrkvOFmo.W', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-11-22', NULL, '2024-11-22', '2024-12-22', NULL, 0, 0, '2024-11-22', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2024-11-21 23:43:17', '2024-11-21 23:46:30'),
(458, 1004, 'manmohan', 'solanki', NULL, '+44', '88999', NULL, NULL, NULL, NULL, '$2y$12$6OdkxKE9ns3ldMo5fuux/OR7FyoGtmJEjJqrysZksSizM3fgLLJgK', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-11-22', NULL, '2024-11-22', '2024-12-22', '2024-12-19', 4, 1, '2024-11-22', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2024-11-22 03:37:03', '2024-12-19 00:53:45'),
(459, 0, 'manmohan', 'solanki', 'maansss@yopmail.com', NULL, '99999', NULL, NULL, NULL, NULL, NULL, '15', 1, NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-11-22 04:12:13', NULL, '2024-11-22 04:12:01', '2024-11-22 04:12:13'),
(460, 0, 'manmohan', 'solanki', 'jdjd@yopkmail.com', NULL, '88888', NULL, NULL, NULL, NULL, '$2y$12$6QxvyYyKyXBxTEpl27KBZOTjP7GPyKdn92pN.ze5klPc1sdFC0Gi6', '15', 1, NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, '2024-11-22 04:13:34', NULL, '2024-11-22 04:12:52', '2024-11-22 04:13:34'),
(461, 1005, 'Rahul', 'Sharma', 'rahul@yopmail.com', '+44', '07014242694', NULL, NULL, NULL, NULL, '$2y$12$8VxhpbXTf3aoxM03LyRR..s9nflTgNWQTElfMqNkiF2vvJjkGEp1O', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-11-26', NULL, NULL, NULL, '2024-11-29', 12, 1, '2024-11-26', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2024-11-26 00:36:37', '2024-11-29 04:39:30'),
(462, 0, 'Arvind', 'Chaurasia', 'manager@yopmail.com', NULL, '07014242694', NULL, NULL, NULL, NULL, '$2y$12$H/zjKhbzPyvLcJ89FsTjIegtT8i1e8WSbBSeD8fvR7ABPqrE4GxgW', '15', 1, NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, '2024-11-26 00:38:31', '2024-11-26 00:38:31'),
(464, 1006, 'taff', 'raul', NULL, '+44', '8790989', NULL, NULL, NULL, NULL, '$2y$12$Z97ut.jyTiveGwJmocHdpuKxiUcv9caa7TO4SJ0T11iusG7r3Uu.i', NULL, 2, NULL, 'Female', NULL, NULL, NULL, '2024-11-26', NULL, '2024-11-29', '2024-12-29', '2024-11-29', 0, 2, '2024-11-26', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2024-11-26 10:37:44', '2024-11-29 07:16:52'),
(465, 1007, 'solanki', 'man', NULL, '+44', '4444', NULL, NULL, NULL, NULL, '$2y$12$Rl2fm2YphlHp96YPl.HnEudYlYRqsFEjtVOtH1ki.zN69KWkvg6n2', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-11-29', NULL, '2024-11-29', '2024-12-29', '2024-12-04', 2, 1, '2024-11-29', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2024-11-29 05:42:59', '2024-12-04 08:50:22'),
(466, 1008, 'testing', 'data', NULL, '+44', '2222', NULL, NULL, NULL, NULL, '$2y$12$yExmTm4NiRYhIbFUAEqLu.ua3AasWqH2lxnfel8WL4QcVXGMO/bkK', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-11-29', NULL, '2024-11-29', '2025-01-17', NULL, 0, 0, '2024-11-29', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, '2024-12-18 05:15:22', 1, '2024-11-29 05:57:08', '2024-11-29 07:24:19'),
(467, 1009, 'testing', 'iii', NULL, '+44', '888', NULL, NULL, NULL, NULL, '$2y$12$lAGGVPpelXKlPotbg8DV2.65Cibbdf2dI24Mdq29eG3pn49RNVd1O', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-11-29', NULL, NULL, NULL, NULL, 0, 0, '2024-11-29', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, '2024-11-29 07:14:49', 1, '2024-11-29 07:14:43', '2024-11-29 07:14:43'),
(468, 1009, 'Kabir', 'Sharma', 'kabir@yopmail.com', '+44', '07014242694', NULL, NULL, NULL, NULL, '$2y$12$C/hOdgNQrw6lRr00WffPVeIVICqM4yMLfZ33X8ijbNaQz.sa6xGCG', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-12-04', NULL, NULL, NULL, NULL, 0, 0, '2024-12-04', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2024-12-04 03:00:34', '2024-12-04 03:00:54'),
(469, 1010, 'test', 'testing', NULL, '+44', '9876789', NULL, NULL, NULL, NULL, '$2y$12$xg1kTmXD5pQeNoWbOMsKQ.KwvpSmm.dPxGvbQgLi7WH31QX/10av.', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-12-17', NULL, '2024-12-17', '2025-02-03', NULL, 0, 0, '2024-12-17', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, 1, '2024-12-17 06:10:40', '2024-12-19 10:01:32'),
(470, 1011, 'Mukesh', 'Singh', NULL, '+44', '08562846127', NULL, NULL, NULL, NULL, '$2y$12$NfIityiQ54pd7FSKvTX73uTdWE6sRdjIDoKGVRlLTHn2GH.rf985W', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2024-12-19', NULL, '2024-12-23', '2024-12-28', NULL, 0, 0, '2024-12-19', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2024-12-18 23:52:47', '2024-12-22 16:55:49'),
(473, 1012, 'ABDIHAKIIN', 'AHMED', NULL, '+44', '1234567', NULL, NULL, NULL, NULL, '$2y$12$YqQ8gJ7NV4pShFU6SDdq3efE0BZkawdATov6VZWrEOecFtBR/jm6a', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2025-01-01', NULL, '2025-01-01', '2025-01-31', NULL, 0, 0, '2025-01-01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2025-01-01 08:06:30', '2025-01-01 08:08:54'),
(474, 1013, 'fedegv', 'dvdd', NULL, '+44', '13455', NULL, NULL, NULL, NULL, '$2y$12$VTwHnx4lidOvX9A.SGoYmOveMGsZO823Lyo10DCUv/bpmLiQX4xxO', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2025-01-02', NULL, NULL, NULL, NULL, 0, 0, '2025-01-02', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2025-01-02 05:54:39', '2025-01-02 05:54:39'),
(475, 1014, 'sxrffsxxf', 'aesraes', NULL, '+44', '144455', NULL, NULL, NULL, NULL, '$2y$12$rm9hsc7yn7RMjMta5SokCuKVJ9wBNrq0KoOSHtM1BMiFwyFhZ57Wa', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2025-01-06', NULL, NULL, NULL, NULL, 0, 0, '2025-01-06', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, '2025-01-06 15:02:06', 1, '2025-01-06 07:38:47', '2025-01-06 07:39:07'),
(476, 1014, 'tertyu', 'tyui', NULL, '+44', '09876543', NULL, NULL, NULL, NULL, '$2y$12$1XnhGQpXRBxMPVy1JWK0uu7nC/nVCE3WQK9a16a2sWyEwwt/i8h1i', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2025-01-16', NULL, '2025-01-20', '2025-02-15', NULL, 0, 0, '2025-01-16', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2025-01-16 12:13:09', '2025-01-16 12:13:58'),
(477, 1015, 'test', 'test', 'test@gmail.com', '+44', '1111111111111', NULL, NULL, NULL, NULL, '$2y$12$JxeoizVyRrIp/h/AW5fNSek.4wgaz.YNWfl2ZIuD03orAHdq9hihW', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2025-01-16', NULL, '2025-01-20', '2025-01-23', NULL, 0, 0, '2025-01-16', '3', NULL, NULL, 'Some text', NULL, NULL, NULL, NULL, '2', NULL, 1, 1, NULL, NULL, '2025-01-16 12:34:32', '2025-01-16 12:36:19'),
(478, 1016, 'testing', 'jeele', NULL, '+44', '0798765467', NULL, NULL, NULL, NULL, '$2y$12$VhaFk5zL6XPlMTGz3ijtsOhcV9YmcxXIn8tqlT/X602Mvw4FyGGGm', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2025-01-16', NULL, NULL, NULL, NULL, 0, 0, '2025-01-16', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2025-01-16 12:50:26', '2025-01-16 12:50:26'),
(479, 1017, 'Testing', 'Jeele', NULL, '+44', '079876573', NULL, NULL, NULL, NULL, '$2y$12$BY7.yLOdF9rOqpFQAefsNOMCI/iuv1xR2ALL/gz2StyvhVLzCBpN.', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2025-01-16', NULL, '2025-01-01', '2025-02-15', NULL, 0, 0, '2025-01-16', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, NULL, NULL, NULL, '2025-01-16 12:53:41', '2025-01-16 12:55:26'),
(480, 1018, 'Jeele', 'Final', 'yi@gmail.com', '+44', '098767890', NULL, NULL, NULL, NULL, '$2y$12$7aj2uFrjEF3JBgRuLT0N4.pcm.JqzUiS2HpvOYHvyOmoaDU43x1WO', NULL, 2, NULL, 'Male', NULL, NULL, NULL, '2025-01-01', NULL, '2025-01-01', '2025-02-15', NULL, 0, 0, '2025-01-16', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 1, 1, NULL, NULL, '2025-01-16 12:59:59', '2025-01-16 13:11:05'),
(481, 0, 'Eric', 'Test', 'Eric@gym.com', NULL, '08978677', NULL, NULL, NULL, NULL, '$2y$12$WtjbMvWLUtPMmBLqRcoUeeGwjgbpUirEXtEAbwfBnqVkou2QcjTNi', '42', 1, NULL, 'Male', NULL, NULL, NULL, '2024-12-31', NULL, NULL, NULL, NULL, 0, 0, '2025-01-18', NULL, NULL, NULL, 'abc123', NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, NULL, NULL, '2025-01-18 05:56:24', '2025-01-18 05:56:24'),
(482, 0, 'Test', 'User', 'user@abc.com', NULL, '09876543', NULL, NULL, NULL, NULL, '$2y$12$xCEiUt1JsF/NxkYZtXO5z.rPzMWwvpUJiSKQJj7AK/wd3tKH733SG', '43', 1, NULL, 'Male', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '2025-01-21 10:19:27', '2025-01-21 10:20:41'),
(483, 1019, 'Jane', 'Doe', NULL, '+44', '09762344', NULL, NULL, NULL, NULL, '$2y$12$3be6yHDkOD2X6dJ8dlTmI.RR/CpKOAWAX2RsQwyi/iU8chPgaQTVa', NULL, 2, NULL, 'Female', NULL, NULL, NULL, '2025-01-21', NULL, '2025-01-21', '2025-02-20', NULL, 0, 0, '2025-01-21', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, 482, 482, NULL, NULL, '2025-01-21 10:21:39', '2025-01-21 10:25:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apply_coupons`
--
ALTER TABLE `apply_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billings`
--
ALTER TABLE `billings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `centers`
--
ALTER TABLE `centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_billings`
--
ALTER TABLE `client_billings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_billing_payment_histories`
--
ALTER TABLE `client_billing_payment_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `finger_devices`
--
ALTER TABLE `finger_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members_plans`
--
ALTER TABLE `members_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `occupations`
--
ALTER TABLE `occupations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `renew_packages`
--
ALTER TABLE `renew_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`name`,`guard_name`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `apply_coupons`
--
ALTER TABLE `apply_coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billings`
--
ALTER TABLE `billings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `centers`
--
ALTER TABLE `centers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;

--
-- AUTO_INCREMENT for table `client_billings`
--
ALTER TABLE `client_billings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `client_billing_payment_histories`
--
ALTER TABLE `client_billing_payment_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finger_devices`
--
ALTER TABLE `finger_devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members_plans`
--
ALTER TABLE `members_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `occupations`
--
ALTER TABLE `occupations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=933;

--
-- AUTO_INCREMENT for table `renew_packages`
--
ALTER TABLE `renew_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=484;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
