-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2026 at 09:14 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trinity_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`log_id`, `staff_id`, `action`, `created_at`) VALUES
(1, NULL, 'System setup: demo users and sample data created', '2026-11-12 10:12:33'),
(2, 1, 'Logged in', '2026-11-12 10:13:05'),
(3, 1, 'Recorded payment #6 of 20000 for visit #7', '2026-11-12 10:14:38'),
(4, 1, 'Added supplier: tghj', '2026-11-12 10:17:06'),
(5, 2, 'Logged in', '2026-11-12 10:23:22'),
(6, 2, 'Logged out', '2026-11-12 10:23:43'),
(7, 3, 'Logged in', '2026-11-12 10:31:08'),
(8, 3, 'Recorded result for lab request #2', '2026-11-12 10:31:37'),
(9, 2, 'Logged in', '2026-11-12 10:37:54'),
(10, 2, 'Updated consultation notes for visit #3', '2026-11-12 10:41:12'),
(11, 4, 'Logged in', '2026-11-12 10:48:54'),
(12, 4, 'Logged in', '2026-11-13 08:11:49'),
(13, 4, 'Logged out', '2026-11-13 08:12:02'),
(14, 4, 'Logged in', '2026-11-13 08:12:12'),
(15, 4, 'Logged out', '2026-11-13 08:12:14'),
(16, 4, 'Logged in', '2026-11-13 08:12:16'),
(17, 3, 'Logged in', '2026-11-13 08:12:27'),
(18, 3, 'Logged out', '2026-11-13 08:12:43'),
(19, 1, 'Logged in', '2026-11-13 10:50:34'),
(20, 2, 'Logged in', '2026-11-13 10:51:22'),
(21, 2, 'Logged out', '2026-11-13 10:51:33'),
(22, 2, 'Logged in', '2026-11-14 22:30:28'),
(23, 2, 'Registered patient #6', '2026-11-14 22:32:03'),
(24, 2, 'Logged out', '2026-11-14 22:32:49'),
(25, 2, 'Logged in', '2026-11-17 10:11:08'),
(26, 3, 'Logged in', '2026-11-17 10:14:47'),
(27, 3, 'Logged out', '2026-11-17 10:15:04'),
(28, 3, 'Logged in', '2026-11-17 10:15:26'),
(29, 3, 'Logged out', '2026-11-17 10:15:50'),
(30, 2, 'Logged in', '2026-11-17 10:15:53'),
(31, 2, 'Logged out', '2026-11-17 10:16:28'),
(32, 3, 'Logged in', '2026-11-17 10:16:36'),
(33, 3, 'Logged out', '2026-11-17 10:16:58'),
(34, 2, 'Logged in', '2026-11-17 10:17:01'),
(35, 2, 'Started visit #8 for patient #6', '2026-11-17 10:17:49'),
(36, 2, 'Updated consultation notes for visit #8', '2026-11-17 10:17:59'),
(37, 2, 'Requested test \'malaria\' for visit #8', '2026-11-17 10:18:11'),
(38, 2, 'Logged out', '2026-11-17 10:18:21'),
(39, 3, 'Logged in', '2026-11-17 10:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(1, 'General Medicine'),
(2, 'Laboratory'),
(3, 'Radiography'),
(4, 'Dispensary'),
(5, 'Finance');

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `drug_name` varchar(100) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL DEFAULT 0,
  `reorder_level` int(11) NOT NULL DEFAULT 10,
  `unit_price` decimal(10,0) NOT NULL,
  `expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drug`
--

INSERT INTO `drug` (`drug_id`, `supplier_id`, `drug_name`, `quantity_in_stock`, `reorder_level`, `unit_price`, `expiry_date`) VALUES
(1, 1, 'Paracetamol 500mg (tablet)', 200, 50, 200, '2027-12-17'),
(2, 1, 'Amoxicillin 500mg (capsule)', 120, 40, 500, '2027-09-08'),
(3, 2, 'Artemether-Lumefantrine (course)', 30, 20, 8000, '2027-05-31'),
(4, 2, 'ORS sachet', 15, 20, 1000, '2027-02-10'),
(5, 1, 'Ciprofloxacin 500mg (tablet)', 80, 30, 700, '2026-12-02'),
(6, 2, 'Diclofenac 75mg (injection)', 12, 15, 2500, '2027-04-11'),
(7, 1, 'Cetirizine 10mg (tablet)', 0, 20, 300, '2027-05-31'),
(8, 2, 'Metformin 500mg (tablet)', 40, 20, 400, '2026-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `lab_request`
--

CREATE TABLE `lab_request` (
  `request_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `requested_by` int(11) NOT NULL,
  `test_name` varchar(100) NOT NULL,
  `result` text DEFAULT NULL,
  `status` enum('Pending','Done') DEFAULT 'Pending',
  `result_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lab_request`
--

INSERT INTO `lab_request` (`request_id`, `visit_id`, `requested_by`, `test_name`, `result`, `status`, `result_date`) VALUES
(1, 1, 2, 'Malaria test', 'Positive', 'Done', '2026-11-12 10:12:33'),
(2, 7, 2, 'Typhoid test (Widal)', 'positive', 'Done', '2026-11-12 10:31:37'),
(3, 8, 2, 'malaria', NULL, 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `gender` enum('Female','Male') NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `full_name`, `gender`, `date_of_birth`, `phone`, `address`, `created_at`) VALUES
(1, 'Sample Patient One', 'Female', '1990-03-14', '0700000001', 'Kampala', '2026-11-12 09:17:34'),
(2, 'Sample Patient Two', 'Male', '1985-07-02', '0700000002', 'Kampala', '2026-11-12 09:17:34'),
(3, 'Sample Patient Three', 'Female', '2001-11-23', '0700000003', 'Wakiso', '2026-11-12 09:17:34'),
(4, 'Sample Patient Four', 'Male', '1972-01-30', '0700000004', 'Kampala', '2026-11-12 09:17:34'),
(5, 'Sample Patient Five', 'Female', '2015-05-09', '0700000005', 'Mukono', '2026-11-12 09:17:34'),
(6, 'martha Nowembabazi', 'Female', '2005-01-23', '0799099900', 'mukono', '2026-11-14 22:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `received_by` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `method` enum('Cash','Mobile Money','Other') NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `visit_id`, `received_by`, `amount`, `method`, `payment_date`) VALUES
(1, 1, 5, 28000, 'Cash', '2026-11-06 09:30:00'),
(2, 2, 5, 27500, 'Cash', '2026-11-07 09:30:00'),
(3, 3, 5, 40000, 'Cash', '2026-11-08 09:30:00'),
(4, 4, 5, 22500, 'Cash', '2026-11-09 09:30:00'),
(5, 5, 5, 26000, 'Cash', '2026-11-10 09:30:00'),
(6, 7, 1, 20000, 'Mobile Money', '2026-11-12 10:14:38');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `visit_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `dosage` varchar(100) NOT NULL,
  `route` enum('Oral','Injection','Other') NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('Pending','Dispensed') DEFAULT 'Pending',
  `dispensed_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `visit_id`, `drug_id`, `dosage`, `route`, `quantity`, `status`, `dispensed_date`) VALUES
(1, 1, 3, '1 course over 3 days', 'Oral', 1, 'Dispensed', '2026-11-06 09:30:00'),
(2, 2, 2, '1 capsule 3 times a day', 'Oral', 15, 'Dispensed', '2026-11-07 09:30:00'),
(3, 4, 6, '1 injection', 'Injection', 1, 'Dispensed', '2026-11-09 09:30:00'),
(4, 5, 4, '1 sachet after each loose stool', 'Oral', 6, 'Dispensed', '2026-11-10 09:30:00'),
(5, 6, 1, '2 tablets 3 times a day', 'Oral', 12, 'Pending', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `service_name` varchar(80) NOT NULL,
  `fee` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `department_id`, `service_name`, `fee`) VALUES
(1, 1, 'General Consultation', 20000),
(2, 1, 'Family Planning', 10000),
(3, 1, 'Bedside Nursing', 30000),
(4, 1, 'Home Nursing', 50000),
(5, 2, 'Laboratory Services', 15000),
(6, 3, 'Abdominal Scan', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` enum('management','clinician','lab','dispensary','finance') NOT NULL,
  `username` varchar(40) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `department_id`, `full_name`, `role`, `username`, `password_hash`) VALUES
(1, NULL, 'Clinic Manager', 'management', 'admin', '$2y$12$R.kXSIjUAxHMNF/qe0djmOFhnr7yNtwfqoSmPMRrRkt8VOe7wOrs.'),
(2, 1, 'Medical Officer', 'clinician', 'clinician', '$2y$12$s7XCaO55qrLezrnyrx/dE.3it0PPrFL6/tM3qOMKI0dmtM/pjaosy'),
(3, 2, 'Lab Technician', 'lab', 'lab', '$2y$12$Is4kHDrqk.lsunVw7edrSOkqMiGLp5jmmeesvhl0Ajg4NL7ghIBvK'),
(4, 4, 'Pharmacy Officer', 'dispensary', 'pharmacy', '$2y$12$OP8wrRoaZhpakVlaffy5jOyXKnBQDivP45iY.LXJnLRZtDCsG7SxS'),
(5, 5, 'Finance Officer', 'finance', 'finance', '$2y$12$YE6A/DoAHW4Bz/zZNRWyF.Wu1sT2CCbfEkwzuv3tvcCThaP2bm9sO');

-- --------------------------------------------------------

--
-- Table structure for table `stock_movement`
--

CREATE TABLE `stock_movement` (
  `movement_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `movement_type` enum('Purchase','Dispensed','Adjustment') NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock_movement`
--

INSERT INTO `stock_movement` (`movement_id`, `drug_id`, `staff_id`, `movement_type`, `quantity`, `created_at`) VALUES
(1, 1, NULL, 'Purchase', 200, '2026-11-12 09:17:34'),
(2, 2, NULL, 'Purchase', 120, '2026-11-12 09:17:34'),
(3, 3, NULL, 'Purchase', 30, '2026-11-12 09:17:34'),
(4, 4, NULL, 'Purchase', 15, '2026-11-12 09:17:34'),
(5, 5, NULL, 'Purchase', 80, '2026-11-12 09:17:34'),
(6, 6, NULL, 'Purchase', 12, '2026-11-12 09:17:34'),
(7, 8, NULL, 'Purchase', 40, '2026-11-12 09:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `phone`, `address`) VALUES
(1, 'Sample Medical Supplies Ltd', '0700100100', 'Kampala'),
(2, 'Sample Pharma Distributors', '0700200200', 'Kampala'),
(3, 'tghj', 'vbbmn', 'sdfghj');

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `visit_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `visit_date` datetime DEFAULT current_timestamp(),
  `symptoms` text DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `next_visit_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`visit_id`, `patient_id`, `staff_id`, `service_id`, `visit_date`, `symptoms`, `diagnosis`, `next_visit_date`) VALUES
(1, 1, 2, 1, '2026-11-06 09:30:00', 'Fever and headache', 'Malaria', '2026-11-10'),
(2, 2, 2, 1, '2026-11-07 09:30:00', 'Cough and chest pain', 'Chest infection', NULL),
(3, 3, 2, 6, '2026-11-08 09:30:00', 'Stomach pain', 'Gastritis', '2026-11-17'),
(4, 4, 2, 1, '2026-11-09 09:30:00', 'Back pain', 'Muscle strain', '2026-11-19'),
(5, 5, 2, 1, '2026-11-10 09:30:00', 'Diarrhoea', 'Mild dehydration', NULL),
(6, 1, 2, 1, '2026-11-11 09:30:00', 'Headache', 'Tension headache', NULL),
(7, 2, 2, 1, '2026-11-12 09:30:00', 'Fever, body weakness', 'Waiting for lab result', '2026-11-15'),
(8, 6, 2, 6, '2026-11-17 10:17:49', 'asdf', 'sdfghj', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `lab_request`
--
ALTER TABLE `lab_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `visit_id` (`visit_id`),
  ADD KEY `requested_by` (`requested_by`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `visit_id` (`visit_id`),
  ADD KEY `received_by` (`received_by`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `visit_id` (`visit_id`),
  ADD KEY `drug_id` (`drug_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `stock_movement`
--
ALTER TABLE `stock_movement`
  ADD PRIMARY KEY (`movement_id`),
  ADD KEY `drug_id` (`drug_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`visit_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `service_id` (`service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `drug`
--
ALTER TABLE `drug`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lab_request`
--
ALTER TABLE `lab_request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stock_movement`
--
ALTER TABLE `stock_movement`
  MODIFY `movement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `visit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `drug`
--
ALTER TABLE `drug`
  ADD CONSTRAINT `drug_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `lab_request`
--
ALTER TABLE `lab_request`
  ADD CONSTRAINT `lab_request_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  ADD CONSTRAINT `lab_request_ibfk_2` FOREIGN KEY (`requested_by`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`received_by`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `stock_movement`
--
ALTER TABLE `stock_movement`
  ADD CONSTRAINT `stock_movement_ibfk_1` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  ADD CONSTRAINT `stock_movement_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  ADD CONSTRAINT `visit_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
