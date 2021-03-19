-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Feb 2021 pada 11.00
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

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
-- Struktur dari tabel `amount_transaction`
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
-- Dumping data untuk tabel `amount_transaction`
--

INSERT INTO `amount_transaction` (`id`, `idUser`, `income`, `expense`, `createdAt`, `updatedAt`) VALUES
(5, 24, NULL, 20000, '2021-02-13 08:58:48', '0000-00-00 00:00:00'),
(6, 25, 20000, NULL, '2021-02-13 08:58:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
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
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`id`, `idSender`, `idReceiver`, `amount`, `notes`, `status`, `dateTransaction`, `createdAt`, `updatedAt`) VALUES
(9, 24, 25, 20000, 'transfer aja', 'transfer', '2021-02-10 22:12:15', '2021-02-13 08:58:48', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
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
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `phoneNumber`, `pin`, `balance`, `picture`, `role`, `status`, `createdAt`, `updatedAt`) VALUES
(24, 'Abbi', ' ', 'abbisatria98@gmail.com', '$2b$10$qzT5F/Yn4alEySELsbmF4.9R2bS8qfLtWG./ePtIfhr.pN9EbuHcO', NULL, '$2b$10$1yQ4OYW1zAMbqHAG20ZW/OwFknYO.oVt51ua/4EuA2abb8od5mmVK', 100000, NULL, 2, 'active', '2021-02-13 05:01:52', '2021-02-13 08:58:48'),
(25, 'Ridho', ' ', 'ridho@gmail.com', '$2b$10$n60/HGdGkJZ/1PAWJHBRBO6jt.APnfSLlg077horI/gIshw8HG4ka', NULL, NULL, 120000, NULL, 2, 'active', '2021-02-13 08:52:47', '2021-02-13 08:53:33');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `amount_transaction`
--
ALTER TABLE `amount_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idReceiver` (`idReceiver`),
  ADD KEY `transactions_ibfk_2` (`idSender`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `amount_transaction`
--
ALTER TABLE `amount_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `amount_transaction`
--
ALTER TABLE `amount_transaction`
  ADD CONSTRAINT `amount_transaction_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`idReceiver`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`idSender`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
