-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 13, 2025 at 12:33 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `electstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int NOT NULL,
  `Firstname` varchar(25) DEFAULT NULL,
  `LastName` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `Firstname`, `LastName`, `City`, `username`, `password`) VALUES
(1, 'Maria', 'Cruz', 'Quezon City', 'jbernz11', '123j'),
(2, 'Jose', 'Dela Cruz', 'Manila', 'jbernz', '123j'),
(3, 'Ricardo', 'Garcia', 'Cebu City', 'joanab', '123joanab'),
(4, 'Sofia', 'Reyes', 'Davao City', 'jjbernz', '456jjbernz'),
(5, 'Emmanuel', 'López', 'Makati', NULL, NULL),
(6, 'Elena', 'Gonzales', 'Baguio City', NULL, NULL),
(7, 'Miguel', 'Pascual', 'Quezon City', NULL, NULL),
(8, 'Carmen', 'Torres', 'Iloilo City', NULL, NULL),
(9, 'Fidel', 'Castro', 'Taguig', NULL, NULL),
(10, 'Aisha', 'Ramos', 'Cebu City', NULL, NULL),
(11, 'Benigno', 'Aquino', 'Bacoor', NULL, NULL),
(12, 'Gloria', 'Macaraeg', 'San Fernando', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `ProductID`, `OrderDate`, `Quantity`) VALUES
(1001, 1, 101, '2025-01-01', 1),
(1002, 1, 102, '2025-01-01', 2),
(1003, 2, 103, '2025-01-05', 1),
(1004, 3, 104, '2025-01-06', 5),
(1005, 4, 105, '2025-01-07', 1),
(1006, 2, 101, '2025-01-10', 1),
(1007, 5, 106, '2025-01-11', 1),
(1008, 6, 107, '2025-01-12', 1),
(1009, 7, 102, '2025-01-15', 3),
(1010, 8, 109, '2025-01-16', 1),
(1011, 9, 108, '2025-01-16', 2),
(1012, 10, 110, '2025-01-17', 4),
(1013, 7, 101, '2025-01-18', 1),
(1014, 11, 103, '2025-01-19', 2),
(1015, 12, 107, '2025-01-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(25) DEFAULT NULL,
  `Category` varchar(25) DEFAULT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Category`, `Price`) VALUES
(101, 'Laptop Pinoy', 'Electronics', 45000),
(102, 'Baybayin Keyboard', 'Accessories', 1250),
(103, 'Philippine History Book', 'Books', 899.5),
(104, 'Tsinelas', 'Home Goods', 150),
(105, 'Mobile Legend Skins', 'Software', 500),
(106, 'Ergonomic Chair', 'Furniture', 8000),
(107, '4K TV Set', 'Electronics', 28000),
(108, 'Filipino Cookbook', 'Books', 650),
(109, 'Powerbank', 'Accessories', 950),
(110, 'Abaka Mat', 'Home Goods', 300);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
