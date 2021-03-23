-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 22, 2021 at 12:37 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend-abusayap`
--

-- --------------------------------------------------------

--
-- Table structure for table `amount_transaction`
--

CREATE TABLE `amount_transaction` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `income` int(11) DEFAULT NULL,
  `expense` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `amount_transaction`
--

INSERT INTO `amount_transaction` (`id`, `idUser`, `income`, `expense`, `createdAt`, `updatedAt`) VALUES
(3, 16, 150000, 130000, '2021-02-10 15:41:05', '2021-02-14 00:14:52'),
(4, 17, 120000, 100000, '2021-02-10 15:41:05', '2021-02-13 23:41:38'),
(5, 21, 10000, 60000, '2021-02-13 23:44:27', '2021-02-14 00:14:52'),
(6, 18, 10000, NULL, '2021-02-14 00:12:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `top_up`
--

CREATE TABLE `top_up` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `idAdmin` int(11) DEFAULT NULL,
  `picture` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `dateTransaction` datetime NOT NULL,
  `createdBy` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `top_up`
--

INSERT INTO `top_up` (`id`, `idUser`, `amount`, `idAdmin`, `picture`, `status`, `dateTransaction`, `createdBy`, `updateAt`) VALUES
(1, 16, 50000, NULL, 'transfer-picture-1616400330706.jpg', 'pending', '2021-03-22 19:12:15', '2021-03-22 08:05:30', '2021-03-22 11:22:05');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `idSender` int(11) NOT NULL,
  `idReceiver` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `notes` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `dateTransaction` datetime NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `idSender`, `idReceiver`, `amount`, `notes`, `status`, `dateTransaction`, `createdAt`, `updatedAt`) VALUES
(2, 16, 17, 100000, 'transfer cuy', 'transfer', '2021-02-10 19:12:15', '2021-02-11 04:44:22', '0000-00-00 00:00:00'),
(4, 16, 17, 20000, 'transfer cuy', 'transfer', '2021-02-10 22:12:15', '2021-02-10 15:49:56', '0000-00-00 00:00:00'),
(5, 17, 16, 20000, 'transfer aja', 'transfer', '2021-02-10 22:12:15', '2021-02-10 15:52:25', '0000-00-00 00:00:00'),
(6, 17, 16, 20000, 'transfer aja', 'transfer', '2021-02-10 22:12:15', '2021-02-10 16:13:58', '0000-00-00 00:00:00'),
(7, 17, 16, 20000, 'transfer aja', 'transfer', '2021-02-10 22:12:15', '2021-02-10 16:16:54', '0000-00-00 00:00:00'),
(8, 17, 16, 20000, 'transfer aja', 'transfer', '2021-02-10 22:12:15', '2021-02-10 16:19:08', '0000-00-00 00:00:00'),
(9, 18, 16, 20000, 'coba shafa', 'transfer', '2021-02-11 12:03:38', '2021-02-11 05:04:13', '0000-00-00 00:00:00'),
(10, 17, 18, 2000, 'ngirim cuk', 'transfer', '2021-02-10 12:08:45', '2021-02-11 05:09:28', '0000-00-00 00:00:00'),
(11, 18, 16, 20000, 'shafa', 'transfer', '2021-02-09 12:13:38', '2021-02-11 05:14:36', '0000-00-00 00:00:00'),
(12, 16, 18, 20000, 'kelarrr', 'transfer', '2021-02-12 12:24:09', '2021-02-11 05:24:33', '0000-00-00 00:00:00'),
(14, 17, 16, 2000, 'dasda', 'transfer', '2021-02-07 15:36:43', '2021-02-13 08:37:08', '0000-00-00 00:00:00'),
(15, 17, 21, 7000, 'adsas', 'adsads', '2021-02-12 15:45:44', '2021-02-13 14:40:33', '0000-00-00 00:00:00'),
(16, 17, 18, 20000, 'asdsdas', '3223', '2021-02-09 15:46:50', '2021-02-13 08:47:14', '0000-00-00 00:00:00'),
(17, 17, 18, 20000, 'asdsdas', '3223', '2021-02-09 15:46:50', '2021-02-13 08:47:45', '0000-00-00 00:00:00'),
(18, 18, 17, 20000, 'asdsdas', '3223', '2021-02-09 15:46:50', '2021-02-13 08:48:08', '0000-00-00 00:00:00'),
(19, 17, 16, 20000, 'beli seblak', 'Transfer', '2021-02-14 06:40:11', '2021-02-13 23:41:38', '0000-00-00 00:00:00'),
(20, 21, 16, 50000, 'bayar pulsa', 'Transfer', '2021-02-14 06:40:11', '2021-02-13 23:44:27', '0000-00-00 00:00:00'),
(21, 21, 18, 10000, 'beli bakso', 'Transfer', '2021-02-14 06:45:41', '2021-02-14 00:12:55', '0000-00-00 00:00:00'),
(22, 16, 21, 10000, 'belia ayam', 'Transfer', '2021-02-14 06:45:41', '2021-02-14 00:14:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT ' ',
  `email` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `pin` varchar(60) DEFAULT NULL,
  `balance` int(11) NOT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `phoneNumber`, `pin`, `balance`, `picture`, `role`, `status`, `createdAt`, `updatedAt`) VALUES
(16, 'abbi', 'satria', 'abbisatria98@gmail.com', '$2b$10$L4RljZEXJ3cUJtyQ2OztFekyVxvXWD7KDaBfwWtoFsufWxL2hSkkO', '085811588248', '$2b$10$zBXudvOEGfmw84NjEw8pMOyKDH4UvdW1shLI8v6wUIDiPS5vNSfNe', 112000, 'profile-picture-1616382312434.jpg', 1, 'active', '2021-02-10 06:21:41', '2021-03-22 11:35:20'),
(17, 'ridho', 'gans', 'ridho@gmail.com', '$2b$10$5Xyoel3mC1.n.P9BEVmBSeIY17BJOHC75L/2VJAb1intOkk.v1tbi', '85811588248', '$2b$10$Ps8HTjtVCy5oZyUVivu0OuGi979PZWe80G6uC32OIQ5EIWCASmxj2', 20000, 'profile-picture-1613308132630.jpeg', 2, 'active', '2021-02-10 15:10:36', '2021-02-14 13:08:52'),
(18, 'shafa', ' aSS', 'shafa@gmail.com', '$2b$10$Po6PUYI/kzFQgH/GvnrDQ.fIpmqS6qCwOlC7j9nMXd5M5g8WEAbCa', NULL, NULL, 120000, NULL, 2, 'pending', '2021-02-11 04:12:15', '2021-03-21 10:19:17'),
(21, 'Ridho', ' ', 'ridhomujizat@gmail.com', '$2b$10$nGEUKHvl2mYPBl1tI8Rdgeq3urvZDdj25BUWO/G5ZJ4HYLbrD2xLa', '8581158828248', '$2b$10$Gr5GD9kyBqt9j3eCncfIdO0YQJwyvgrat0JHAL/aqMyCu90cebn0y', 60000, 'profile-picture-1613277397255.jpeg', 2, 'active', '2021-02-13 12:54:58', '2021-02-14 13:30:16'),
(22, 'jengkol', ' ', 'ridho1@gmail.com', '$2b$10$Tfaz9C3cYZTh0F1spbIS2eXhaIrBgljgObz6tJsXp/6RTBKOKsf8W', NULL, NULL, 120000, NULL, 2, 'pending', '2021-02-13 16:24:36', '0000-00-00 00:00:00'),
(24, 'asdasd', 'asdasd', 'user11@gmail.com', '$2b$10$YMG.kJAZR0H39GZV0oo68u00trAUD7p/q0G5l5XwYUqH1W3ag/G76', NULL, NULL, 120000, NULL, 2, 'pending', '2021-02-13 16:29:40', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `amount_transaction`
--
ALTER TABLE `amount_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `top_up`
--
ALTER TABLE `top_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idReceiver` (`idReceiver`),
  ADD KEY `transactions_ibfk_2` (`idSender`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `amount_transaction`
--
ALTER TABLE `amount_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `top_up`
--
ALTER TABLE `top_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amount_transaction`
--
ALTER TABLE `amount_transaction`
  ADD CONSTRAINT `amount_transaction_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `top_up`
--
ALTER TABLE `top_up`
  ADD CONSTRAINT `top_up_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `top_up_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`idReceiver`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`idSender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
