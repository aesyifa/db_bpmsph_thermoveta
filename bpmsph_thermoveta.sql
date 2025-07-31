-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2025 at 04:44 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suhu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `device_status`
--

CREATE TABLE `device_status` (
  `id` int NOT NULL,
  `device_id` varchar(50) NOT NULL,
  `alarm_status` tinyint(1) DEFAULT '0',
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

ALTER TABLE device_status ADD COLUMN threshold_suhu FLOAT DEFAULT -8.0;

--
-- Dumping data for table `device_status`
--

INSERT INTO `device_status` (`id`, `device_id`, `alarm_status`, `last_updated`) VALUES
(1, 'esp32b', 0, '2025-07-06 10:57:40');

INSERT INTO device_status (device_id, alarm_status, threshold_suhu) VALUES ('esp32a', 0, -8.0);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempt_time` datetime NOT NULL,
  `success` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `attempt_time`, `success`) VALUES
(1, '127.0.0.1', '2025-07-08 08:13:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `log_hapus`
--

CREATE TABLE `log_hapus` (
  `id` int NOT NULL,
  `data_ids` json NOT NULL,
  `data_suhu` json NOT NULL,
  `user_id` int NOT NULL,
  `waktu_hapus` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `log_hapus`
--

INSERT INTO `log_hapus` (`id`, `data_ids`, `data_suhu`, `user_id`, `waktu_hapus`) VALUES
(203, '[\"26\"]', '[{\"id\": \"26\", \"suhu\": \"-2.7\", \"waktu\": \"2025-07-06 16:59:58\", \"keterangan\": \"Melebihi Batas Aman\"}]', 1, '2025-07-06 17:55:10');

-- --------------------------------------------------------

--
-- Table structure for table `suhu_data`
--

CREATE TABLE `suhu_data` (
  `id` int NOT NULL,
  `suhu` float DEFAULT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `keterangan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suhu_data`
--

INSERT INTO `suhu_data` (`id`, `suhu`, `waktu`, `keterangan`) VALUES
(1, -12.1, '2025-07-06 09:34:58', 'Baik'),
(2, -11.8, '2025-07-06 09:35:58', 'Baik'),
(3, -11.9, '2025-07-06 09:36:58', 'Baik'),
(4, -12, '2025-07-06 09:37:58', 'Baik'),
(5, -12.2, '2025-07-06 09:38:58', 'Baik'),
(6, -12.4, '2025-07-06 09:39:58', 'Baik'),
(7, -12.8, '2025-07-06 09:40:58', 'Baik'),
(8, -13.1, '2025-07-06 09:41:58', 'Baik'),
(9, -13.4, '2025-07-06 09:42:58', 'Baik'),
(10, -13.6, '2025-07-06 09:43:58', 'Baik'),
(11, -13.9, '2025-07-06 09:44:58', 'Baik'),
(12, -14.1, '2025-07-06 09:45:58', 'Baik'),
(13, -14.2, '2025-07-06 09:46:58', 'Baik'),
(14, -14.4, '2025-07-06 09:47:58', 'Baik'),
(15, -14.5, '2025-07-06 09:48:58', 'Baik'),
(16, -14.6, '2025-07-06 09:49:58', 'Baik'),
(17, -14.7, '2025-07-06 09:50:58', 'Baik'),
(18, -14.8, '2025-07-06 09:51:58', 'Baik'),
(19, -14.9, '2025-07-06 09:52:58', 'Baik'),
(20, -14.9, '2025-07-06 09:53:58', 'Baik'),
(21, -15, '2025-07-06 09:54:58', 'Baik'),
(22, -15.1, '2025-07-06 09:55:58', 'Baik'),
(23, -15.1, '2025-07-06 09:56:58', 'Baik'),
(24, -13.5, '2025-07-06 09:57:58', 'Baik'),
(25, -8.9, '2025-07-06 09:58:58', 'Baik');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$U0DQGX27P7X48TYsuv/unu6WbJ3UPrdnwDAVhRG7c3EciQEL3Vv/W', 'a', 'admin', '2025-07-03 13:07:07'),
(58, 'user1', '$2y$10$DUJG9T5b8FttuLev7jlY9OsLlKF/DoJUmStOJH3FXQ82i09QK86r6', 'a', 'user', '2025-07-03 15:07:53'),
(59, 'user2', '$2y$10$7sIWxLttCYvjuGVaIQdyle6gGnAAqRzfX.iAFbmqob8zsBo2z3Joa', 'b', 'user', '2025-07-06 06:52:21'),
(60, 'user3', '$2y$10$ezGoelcC0D975AG0ZpUoIONAGJ739D59jt61TPqkjsFZrDd9ogpDG', 'c', 'user', '2025-07-06 06:52:31'),
(61, 'user4', '$2y$10$cj9ynFq3GMbMIXVojPjoMuP0rd9/zeISxYMaEjk4xBDPwXGlgSUYu', 'd', 'user', '2025-07-06 06:52:45'),
(62, 'user5', '$2y$10$DOklWgJHujLsTNBHE.qfsOvtnPa6ezhz/BWhJudlGMEQkiaChcAqu', 'e', 'user', '2025-07-06 06:53:05'),
(63, 'user6', '$2y$10$xvmGN/NqGwBp2829e2nHG.faER87ocvX7zwuWX7NY2tABRvuZVeli', 'f', 'user', '2025-07-06 06:53:20'),
(64, 'user7', '$2y$10$Z36J62JFWrAnfUl8Qq0ZtO7Tbbkespbl0EahialFCHtLTTAdvJ.oi', 'g', 'user', '2025-07-06 06:53:39'),
(65, 'user8', '$2y$10$hUcFfcVT8K2cVsFxkPL.Eeq9XoIwyYVWWuLIBTuoKVsK0dWCwUWTS', 'h', 'user', '2025-07-06 06:53:53'),
(66, 'user9', '$2y$10$DsoGUJx7Kve4dgn.ZYdD.eNTZ8QfGdITPRbBczRJ9.oCD/FIc8jne', 'i', 'user', '2025-07-06 06:54:09'),
(67, 'user10', '$2y$10$zQM7dUHSxqAmADBvgf/2euvLvNGKjGFOhfSQyeJXvQnXODAH.8jGi', 'j', 'user', '2025-07-06 06:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `whatsapp_recipients`
--

CREATE TABLE `whatsapp_recipients` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `suhu_terkini`
--
CREATE TABLE suhu_terkini (
  device_id VARCHAR(50) PRIMARY KEY,
  suhu FLOAT,
  waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Trigger untuk update suhu_terkini setiap insert ke suhu_data (1 device)
DELIMITER $$
CREATE TRIGGER after_insert_suhu_data
AFTER INSERT ON suhu_data
FOR EACH ROW
BEGIN
  REPLACE INTO suhu_terkini (device_id, suhu, waktu)
  VALUES ('esp32a', NEW.suhu, NEW.waktu);
END$$
DELIMITER ;

-- Indexes for dumped tables
--

--
-- Indexes for table `device_status`
--
ALTER TABLE `device_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_device` (`device_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `attempt_time` (`attempt_time`),
  ADD KEY `idx_login_attempts_ip_time` (`ip_address`,`attempt_time`);

--
-- Indexes for table `log_hapus`
--
ALTER TABLE `log_hapus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `suhu_data`
--
ALTER TABLE `suhu_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_waktu` (`waktu`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `whatsapp_recipients`
--
ALTER TABLE `whatsapp_recipients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `device_status`
--
ALTER TABLE `device_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `log_hapus`
--
ALTER TABLE `log_hapus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `suhu_data`
--
ALTER TABLE `suhu_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `whatsapp_recipients`
--
ALTER TABLE `whatsapp_recipients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
