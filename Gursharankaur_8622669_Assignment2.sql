/* Gursharan kaur 8622669  Assignment 2 Dated: 05.02.2020*/
/*Query 1*/
SELECT OrderNumber,SUM(QuotedPrice*QuantityOrdered) AS Revenue FROM `order_details` GROUP BY OrderNumber;
/*Query 2*/
SELECT EmpFirstName,EmpLastName,TIMESTAMPDIFF(YEAR,EmpBirthDate, NOW()) as age from employees ORDER BY age;
/*Query 3*/
SELECT EmpFirstName,EmpLastName FROM employees WHERE EmpFirstName LIKE '%r%' AND EmpLastName NOT LIKE '%q%';

/*Query 4*/
-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2020 at 09:43 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gursharankaur_assignment2`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `Product_ID` int(10) NOT NULL,
  `Product_Name` varchar(100) NOT NULL,
  `Product_Description` varchar(100) DEFAULT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_table`
--

INSERT INTO `product_table` (`Product_ID`, `Product_Name`, `Product_Description`, `Price`) VALUES
(1011, 'Computer', 'Computer comes with keyboard and monitor', 1200),
(1012, 'Phone', 'mobile phones', 1600),
(1013, 'Power Cables', 'power cods cat5', 100),
(1014, 'Hair Care', 'wide range of hair care', 30),
(1015, 'Shampoo', 'wide range of shampoo', 50),
(1016, 'Dye', 'Hair Dye', 20),
(1017, 'Combs', 'Hair combs', 10);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_product_table`
--

CREATE TABLE `vendor_product_table` (
  `Product_ID` int(10) NOT NULL,
  `Vendor_ID` int(10) NOT NULL,
  `BulkPrice` float NOT NULL,
  `Expected_Delivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_product_table`
--

INSERT INTO `vendor_product_table` (`Product_ID`, `Vendor_ID`, `BulkPrice`, `Expected_Delivery`) VALUES
(1011, 101, 2000, '2020-02-15'),
(1012, 101, 1000, '0000-00-00'),
(1012, 101, 1000, NULL),
(1012, 101, 1000, NULL),
(1013, 101, 1000, NULL),
(1013, 101, 1000, NULL),
(1014, 102, 1000, NULL),
(1014, 102, 1000, NULL),
(1015, 102, 1200, NULL),
(1015, 102, 1200, NULL),
(1016, 102, 1400, NULL),
(1016, 102, 1400, NULL),
(1017, 102, 1500, NULL),
(1017, 102, 1500, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_table`
--

CREATE TABLE `vendor_table` (
  `Vendor_Id` int(10) NOT NULL,
  `Company_Name` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` char(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor_table`
--

INSERT INTO `vendor_table` (`Vendor_Id`, `Company_Name`, `Address`, `Email`, `Phone`) VALUES
(101, 'Telle.co', '12 Dirk St.', 'Rep@telle.com', '519-555-4410'),
(102, 'Barba.co', '133 Shep St.', 'rep@barb.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `vendor_product_table`
--
ALTER TABLE `vendor_product_table`
  ADD KEY `FK2` (`Vendor_ID`),
  ADD KEY `Product_ID` (`Product_ID`) USING BTREE;

--
-- Indexes for table `vendor_table`
--
ALTER TABLE `vendor_table`
  ADD PRIMARY KEY (`Vendor_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `Product_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1018;

--
-- AUTO_INCREMENT for table `vendor_table`
--
ALTER TABLE `vendor_table`
  MODIFY `Vendor_Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vendor_product_table`
--
ALTER TABLE `vendor_product_table`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`Product_ID`) REFERENCES `product_table` (`Product_ID`),
  ADD CONSTRAINT `FK2` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendor_table` (`Vendor_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*Query 5*/
SELECT DISTINCT CustFirstName,CustPhoneNumber,products.ProductName FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID
JOIN order_details
ON orders.OrderNumber=order_details.OrderNumber
JOIN products
ON order_details.ProductNumber=products.ProductNumber
WHERE products.ProductName LIKE '%helmet%';

/*Query 6*/
SELECT CustFirstName,EmpFirstName FROM `customers`
JOIN employees
on customers.CustFirstName=employees.EmpFirstName;

/* Query 7*/
SELECT customers.CustomerID ,SUM(QuantityOrdered*QuotedPrice*2) AS TOTAL,customers.CustState FROM `order_details`
join orders
on order_details.OrderNumber=orders.OrderNumber
JOIN customers
on orders.CustomerID=customers.CustomerID
where customers.CustState ="OR"
GROUP BY customers.CustomerID



