-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2026 at 10:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sentiel_ai`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `alert_id` int(11) DEFAULT NULL,
  `alert_type` varchar(100) NOT NULL,
  `risk_level` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alerts_logs`
--

CREATE TABLE `alerts_logs` (
  `id` int(11) NOT NULL,
  `alert_type` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alerts_logs`
--

INSERT INTO `alerts_logs` (`id`, `alert_type`, `message`, `created_at`) VALUES
(1, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 20:39:27'),
(2, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 20:39:27'),
(3, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 20:39:27'),
(4, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 20:39:28'),
(5, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 20:39:28'),
(6, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 20:57:12'),
(7, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 20:57:12'),
(8, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 20:57:12'),
(9, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 20:57:12'),
(10, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 20:57:12'),
(11, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 21:05:19'),
(12, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 21:05:19'),
(13, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 21:05:19'),
(14, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 21:05:19'),
(15, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 21:05:19'),
(16, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 21:11:48'),
(17, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 21:11:48'),
(18, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 21:11:48'),
(19, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 21:11:48'),
(20, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 21:11:49'),
(21, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 21:13:17'),
(22, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 21:13:17'),
(23, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 21:13:17'),
(24, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 21:13:17'),
(25, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 21:13:17'),
(26, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 21:25:15'),
(27, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 21:25:15'),
(28, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 21:25:15'),
(29, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 21:25:15'),
(30, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 21:25:15'),
(31, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 21:59:18'),
(32, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 21:59:18'),
(33, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 21:59:18'),
(34, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 21:59:18'),
(35, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 21:59:18'),
(36, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 22:07:18'),
(37, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 22:07:18'),
(38, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 22:07:18'),
(39, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 22:07:18'),
(40, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 22:07:18'),
(41, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 22:07:35'),
(42, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 22:07:35'),
(43, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 22:07:35'),
(44, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 22:07:35'),
(45, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 22:07:35'),
(46, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 22:12:16'),
(47, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 22:12:16'),
(48, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 22:12:16'),
(49, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 22:12:16'),
(50, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 22:12:16'),
(51, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 22:16:27'),
(52, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 22:16:27'),
(53, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 22:16:27'),
(54, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 22:16:27'),
(55, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 22:16:27'),
(56, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 22:50:43'),
(57, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 22:50:43'),
(58, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 22:50:43'),
(59, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 22:50:43'),
(60, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 22:50:43'),
(61, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 23:18:19'),
(62, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 23:18:19'),
(63, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 23:18:19'),
(64, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 23:18:19'),
(65, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 23:18:19'),
(66, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 23:29:56'),
(67, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 23:29:56'),
(68, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 23:29:56'),
(69, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 23:29:56'),
(70, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 23:29:56'),
(71, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 23:39:03'),
(72, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 23:39:03'),
(73, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 23:39:03'),
(74, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 23:39:03'),
(75, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 23:39:03'),
(76, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-09 23:39:14'),
(77, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-09 23:39:14'),
(78, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-09 23:39:14'),
(79, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-09 23:39:14'),
(80, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-09 23:39:14'),
(81, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 07:38:24'),
(82, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 07:38:24'),
(83, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 07:38:24'),
(84, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 07:38:24'),
(85, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 07:38:24'),
(86, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 07:46:24'),
(87, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 07:46:24'),
(88, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 07:46:24'),
(89, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 07:46:24'),
(90, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 07:46:24'),
(91, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 07:46:34'),
(92, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 07:46:34'),
(93, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 07:46:34'),
(94, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 07:46:34'),
(95, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 07:46:34'),
(96, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 07:46:36'),
(97, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 07:46:36'),
(98, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 07:46:36'),
(99, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 07:46:36'),
(100, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 07:46:36'),
(101, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 07:47:53'),
(102, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 07:47:53'),
(103, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 07:47:53'),
(104, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 07:47:53'),
(105, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 07:47:53'),
(106, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 07:57:56'),
(107, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 07:57:56'),
(108, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 07:57:56'),
(109, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 07:57:56'),
(110, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 07:57:56'),
(111, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 08:29:49'),
(112, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 08:29:49'),
(113, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 08:29:49'),
(114, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 08:29:50'),
(115, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 08:29:50'),
(116, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 09:27:33'),
(117, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 09:27:33'),
(118, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 09:27:33'),
(119, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 09:27:33'),
(120, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 09:27:33'),
(121, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 10:12:47'),
(122, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 10:12:47'),
(123, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 10:12:47'),
(124, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 10:12:47'),
(125, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 10:12:47'),
(126, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 10:19:53'),
(127, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 10:19:53'),
(128, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 10:19:53'),
(129, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 10:19:53'),
(130, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 10:19:53'),
(131, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 10:34:02'),
(132, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 10:34:02'),
(133, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 10:34:02'),
(134, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 10:34:02'),
(135, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 10:34:02'),
(136, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 10:36:09'),
(137, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 10:36:09'),
(138, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 10:36:09'),
(139, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 10:36:09'),
(140, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 10:36:09'),
(141, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 10:40:43'),
(142, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 10:40:43'),
(143, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 10:40:43'),
(144, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 10:40:43'),
(145, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 10:40:43'),
(146, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 13:15:14'),
(147, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 13:15:14'),
(148, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 13:15:14'),
(149, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 13:15:14'),
(150, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 13:15:14'),
(151, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 13:16:24'),
(152, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 13:16:24'),
(153, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 13:16:24'),
(154, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 13:16:24'),
(155, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 13:16:24'),
(156, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 14:13:39'),
(157, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 14:13:39'),
(158, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 14:13:39'),
(159, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 14:13:39'),
(160, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 14:13:39'),
(161, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 14:33:20'),
(162, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 14:33:20'),
(163, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 14:33:20'),
(164, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 14:33:20'),
(165, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 14:33:20'),
(166, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 14:33:22'),
(167, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 14:33:22'),
(168, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 14:33:22'),
(169, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 14:33:22'),
(170, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 14:33:22'),
(171, 'FATIGUE', 'CRITICAL FATIGUE: Worker Michael Samwel Shilinde  detected.', '2026-05-10 15:25:22'),
(172, 'FATIGUE', 'CRITICAL FATIGUE: Worker Samwel Michael Shilinde detected.', '2026-05-10 15:25:22'),
(173, 'FATIGUE', 'CRITICAL FATIGUE: Worker Chris Nyiti Damson detected.', '2026-05-10 15:25:22'),
(174, 'OVERHEATING', 'OVERHEATING: Excavator ZX870 reached 110 Celsius.', '2026-05-10 15:25:22'),
(175, 'OVERHEATING', 'OVERHEATING: Warman Slurry Pump reached 118 Celsius.', '2026-05-10 15:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `environment`
--

CREATE TABLE `environment` (
  `Env_id` int(11) NOT NULL,
  `zone` varchar(100) NOT NULL,
  `temperature` int(11) NOT NULL,
  `dust_level` int(11) NOT NULL,
  `gas_level` int(11) NOT NULL,
  `noise_level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `environment`
--

INSERT INTO `environment` (`Env_id`, `zone`, `temperature`, `dust_level`, `gas_level`, `noise_level`) VALUES
(1, 'Underground Shaft A', 42, 80, 75, 95),
(2, 'Open Pit West', 35, 45, 20, 70),
(3, 'Crushing Plant', 50, 95, 40, 110),
(4, 'Processing Plant', 39, 60, 35, 85),
(5, 'Underground Tunel B', 48, 88, 93, 100);

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `machine_id` int(11) NOT NULL,
  `machine_name` varchar(100) NOT NULL,
  `temperature` float NOT NULL,
  `vibration` float NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`machine_id`, `machine_name`, `temperature`, `vibration`, `status`) VALUES
(1, 'CAT 777 Dump Truck', 95, 88, 'ACTIVE'),
(2, 'Komatsu Drilling Rig', 70, 40, 'ACTIVE'),
(3, 'Excavator ZX870', 110, 95, 'WARNING'),
(4, 'Sandvik LH517 Loader', 85, 65, 'ACTIVE'),
(5, 'Warman Slurry Pump', 118, 97, 'WARNING');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `worker_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `shift_hours` int(11) NOT NULL,
  `fatigue_level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`worker_id`, `full_name`, `role`, `shift_hours`, `fatigue_level`) VALUES
(1, 'Michael Samwel Shilinde ', 'Senior Exploration Technician', 14, 'HIGH'),
(2, 'John Magalaya Shilinde', 'Blasting Technician', 8, 'LOW'),
(3, 'Asha Hamis Omary', 'Underground mining Engineer', 10, 'MEDIUM'),
(4, 'Peter Jonathan Mwaikambo', 'Senior Operation Coodinator', 7, 'LOW'),
(5, 'Samwel Michael Shilinde', 'Specialist Digital Appliction', 19, 'HIGH'),
(6, 'Joyce Elia Mangi', 'Country Production Coordinator', 12, 'MEDIUM'),
(7, 'Chris Nyiti Damson', 'Drilling Supervisor', 16, 'HIGH'),
(8, 'Mabula Juma Shija', 'Mining Planner', 13, 'MEDIUM'),
(9, 'Hellen Kennedy Siao', 'Mine Director', 5, 'LOW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerts_logs`
--
ALTER TABLE `alerts_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `environment`
--
ALTER TABLE `environment`
  ADD PRIMARY KEY (`Env_id`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`machine_id`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`worker_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerts_logs`
--
ALTER TABLE `alerts_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `environment`
--
ALTER TABLE `environment`
  MODIFY `Env_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `machines`
--
ALTER TABLE `machines`
  MODIFY `machine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `worker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
