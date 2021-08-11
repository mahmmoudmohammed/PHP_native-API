-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2020 at 01:18 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created`) VALUES
(1, 'computers and laptops', '2020-10-06 00:00:00'),
(2, 'electronics', '2020-10-06 00:00:00'),
(3, 'clothes', '2020-10-06 22:58:39'),
(5, 'mens', '2020-10-07 01:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `created`) VALUES
(1, 'laptop dell', 'info: Laptop dell description ', 12000, 1, '2020-10-06 00:00:00'),
(2, 'laptop  hp', 'info: Laptop hp description ', 13000, 1, '2020-10-06 00:00:00'),
(3, 'laptop acer', 'info: Laptop acer description ', 12000, 1, '2020-10-06 00:00:00'),
(4, 'laptop  samsung', 'info: Laptop samsung description ', 13000, 1, '2020-10-06 00:00:00'),
(5, 'laptop lenovo', 'info: Laptop lenovo description ', 11000, 1, '2020-10-06 00:00:00'),
(6, 'laptop  asus', 'info: Laptop asus description ', 15000, 1, '2020-10-06 00:00:00'),
(7, 'RAM', 'info: RAM 8Giga DDDR4', 1200, 2, '2020-10-06 04:14:14'),
(8, 'RAM', 'info: RAM 16Giga DDDR3', 1300, 2, '2020-10-06 05:14:13'),
(9, 'HDD 500 Giga', 'info: HDD 500 Giga description ', 800, 2, '2020-10-06 19:13:20'),
(10, 'addidas', 'info:addidas pantalon description ', 100, 3, '2020-10-06 23:33:17'),
(11, 'addidas', ' hello', 200, 3, '2020-10-07 00:59:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
