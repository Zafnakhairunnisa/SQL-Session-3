-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 29, 2024 at 11:57 PM
-- Server version: 8.3.0
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_db`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `getSiswaByBorn`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSiswaByBorn` (IN `tempat_lahir` VARCHAR(100))   BEGIN
    SELECT * FROM Siswa WHERE TTL LIKE CONCAT('%', tempat_lahir, '%');
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `getJmlByGender`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getJmlByGender` (`gender_input` CHAR(1)) RETURNS INT DETERMINISTIC BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM Siswa WHERE gender = gender_input;
    RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
CREATE TABLE IF NOT EXISTS `nilai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siswa_id` int DEFAULT NULL,
  `nilai_IPA` float DEFAULT NULL,
  `nilai_IPS` float DEFAULT NULL,
  `nilai_MTK` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `siswa_id` (`siswa_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `siswa_id`, `nilai_IPA`, `nilai_IPS`, `nilai_MTK`) VALUES
(1, 1, 85.5, 78, 90),
(2, 2, 92, 88.5, 95.5),
(3, 3, 78.5, 82, 80),
(4, 4, 88, 90.5, 87.5),
(5, 5, 95.5, 91, 93);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
CREATE TABLE IF NOT EXISTS `siswa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NIS` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TTL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('L','P') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `NIS` (`NIS`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `NIS`, `nama`, `TTL`, `gender`, `alamat`) VALUES
(1, '1001', 'Budi', 'Jakarta, 15 Mei 2005', 'L', 'Jl. Merdeka No. 123, Jakarta'),
(2, '1002', 'Ani=', 'Surabaya, 22 Juli 2004', 'P', 'Jl. Pahlawan No. 45, Surabaya'),
(3, '1003', 'Citra=', 'Bandung, 10 Januari 2005', 'P', 'Jl. Asia Afrika No. 78, Bandung'),
(4, '1004', 'Doni', 'Semarang, 5 Maret 2004', 'L', 'Jl. Pemuda No. 56, Semarang'),
(5, '1005', 'Putri', 'Yogyakarta, 30 September 2005', 'P', 'Jl. Malioboro No. 90, Yogyakarta');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
