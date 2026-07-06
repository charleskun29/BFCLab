-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 06, 2026 at 03:10 AM
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
-- Database: `bfclab_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocation`
--

CREATE TABLE `allocation` (
  `allocation_id` int(4) NOT NULL,
  `item_id` int(4) NOT NULL,
  `date_id` int(4) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_limits` int(4) NOT NULL,
  `stocks_on_hand` int(4) NOT NULL,
  `final_stocks` int(4) NOT NULL,
  `replenishment_needed` int(4) NOT NULL,
  `remarks` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(4) NOT NULL,
  `stocks_id` int(4) NOT NULL,
  `branch_name` varchar(255) NOT NULL,
  `branch_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches_stocks`
--

CREATE TABLE `branches_stocks` (
  `stocks_id` int(4) NOT NULL,
  `allocation_id` int(4) NOT NULL,
  `stocks_name` varchar(255) NOT NULL,
  `stocks_dosageform` enum('capsule','tablet','syrup','suspension','cream','ointment','drops','') NOT NULL,
  `quanity` int(4) NOT NULL,
  `all_item_sold` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch_orders`
--

CREATE TABLE `branch_orders` (
  `request_id` int(8) NOT NULL,
  `branch_id` int(4) NOT NULL,
  `quantity` int(8) NOT NULL,
  `status` enum('ready for dispatch','pending for dispatch','partially ready','waiting for supplier delivery','waiting for management decision','dispatched','delivered to branch') DEFAULT NULL,
  `requested_at` datetime NOT NULL,
  `resolved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dates`
--

CREATE TABLE `dates` (
  `date_id` int(4) NOT NULL,
  `product_in` int(4) NOT NULL,
  `item_sold` int(4) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(8) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `stock` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_orders`
--

CREATE TABLE `supplier_orders` (
  `order_id` int(8) NOT NULL,
  `branch_id` int(4) NOT NULL,
  `supplier_id` int(4) NOT NULL,
  `quantity` int(8) NOT NULL,
  `status` enum('purchased','supplier processing','picked up at supplier','received by rdu','checking by rdu','preparing','staging','encoding','released','received bt branch','cancelled','on hold') DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(4) NOT NULL,
  `branch_id` int(4) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('supplier','branch','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocation`
--
ALTER TABLE `allocation`
  ADD PRIMARY KEY (`allocation_id`),
  ADD KEY `fk_allocation_date` (`date_id`),
  ADD KEY `fk_allocation_item` (`item_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `fk_branch_stock` (`stocks_id`);

--
-- Indexes for table `branches_stocks`
--
ALTER TABLE `branches_stocks`
  ADD PRIMARY KEY (`stocks_id`),
  ADD KEY `fk_stock_allocation` (`allocation_id`);

--
-- Indexes for table `branch_orders`
--
ALTER TABLE `branch_orders`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `dates`
--
ALTER TABLE `dates`
  ADD PRIMARY KEY (`date_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `supplier_orders`
--
ALTER TABLE `supplier_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_branch` (`branch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocation`
--
ALTER TABLE `allocation`
  MODIFY `allocation_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches_stocks`
--
ALTER TABLE `branches_stocks`
  MODIFY `stocks_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch_orders`
--
ALTER TABLE `branch_orders`
  MODIFY `request_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dates`
--
ALTER TABLE `dates`
  MODIFY `date_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_orders`
--
ALTER TABLE `supplier_orders`
  MODIFY `order_id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `fk_allocation_date` FOREIGN KEY (`date_id`) REFERENCES `dates` (`date_id`),
  ADD CONSTRAINT `fk_allocation_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `fk_branch_stock` FOREIGN KEY (`stocks_id`) REFERENCES `branches_stocks` (`stocks_id`);

--
-- Constraints for table `branches_stocks`
--
ALTER TABLE `branches_stocks`
  ADD CONSTRAINT `fk_stock_allocation` FOREIGN KEY (`allocation_id`) REFERENCES `allocation` (`allocation_id`);

--
-- Constraints for table `branch_orders`
--
ALTER TABLE `branch_orders`
  ADD CONSTRAINT `branch_orders_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `supplier_orders`
--
ALTER TABLE `supplier_orders`
  ADD CONSTRAINT `supplier_orders_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_branch` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`branch_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
