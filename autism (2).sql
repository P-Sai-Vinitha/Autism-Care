-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2024 at 09:10 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autism`
--

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `parentname` text NOT NULL,
  `parentage` int(3) NOT NULL,
  `registereddate` date NOT NULL,
  `childname` text NOT NULL,
  `childage` int(3) NOT NULL,
  `childdiagnosis` varchar(50) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `profileimage` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`parentname`, `parentage`, `registereddate`, `childname`, `childage`, `childdiagnosis`, `email`, `profileimage`, `id`) VALUES
('saii', 34, '2024-01-30', 'sai', 7, 'autism', 'sai@gmail.com', 'uploads/1706625298.jpg', 1),
('v', 1, '2024-01-30', 'v', 1, 'v', 'v', 'uploads/1706625587.jpg', 2),
('h', 1, '2024-03-18', 'h', 2, 'h', 'h', 'uploads/1710740680.jpg', 3),
('a', 30, '2024-07-05', 'a', 3, 'Autism ', 'a@gmail.com', 'uploads/1720150235.jpg', 4),
('g', 1, '2024-07-05', 'g', 1, 'a', 'a', 'uploads/1720151910.jpg', 5),
('j', 1, '2024-07-17', 'j', 1, 'j', 'j', 'uploads/1721209737.jpg', 6),
('j', 1, '2024-07-17', 'j', 1, 'j', 'j', 'uploads/1721209737.jpg', 7),
('k', 2, '2024-07-17', 'k', 2, 'k', 'k', 'uploads/1721210314.jpg', 8),
('j', 7, '2024-07-17', 'j', 7, 'j', 'j', 'uploads/1721226386.jpg', 9),
('lll', 1, '2024-07-30', 'lll', 1, 'lll', 'lll', 'uploads/1722328313.jpg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `doctorlogin`
--

CREATE TABLE `doctorlogin` (
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctorlogin`
--

INSERT INTO `doctorlogin` (`email`, `password`) VALUES
('sai@gmail.com', '7777'),
('a@gmail.com', '1'),
('b', 'b'),
('a', 'a'),
('a', 'a'),
('sai@gmail.com', '777'),
('sai@gmail.com', '7777'),
('sai@gmail.com', '7777'),
('b', 'b');

-- --------------------------------------------------------

--
-- Table structure for table `handlingbehavioralissues`
--

CREATE TABLE `handlingbehavioralissues` (
  `si1` int(2) NOT NULL,
  `si2` int(2) NOT NULL,
  `si3` int(2) NOT NULL,
  `si4` int(2) NOT NULL,
  `ab1` int(2) NOT NULL,
  `ab2` int(2) NOT NULL,
  `ab3` int(2) NOT NULL,
  `ab4` int(2) NOT NULL,
  `rb1` int(2) NOT NULL,
  `rb2` int(2) NOT NULL,
  `rb3` int(2) NOT NULL,
  `rb4` int(2) NOT NULL,
  `s1` int(2) NOT NULL,
  `s2` int(2) NOT NULL,
  `s3` int(2) NOT NULL,
  `s4` int(2) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `handlingbehavioralissues`
--

INSERT INTO `handlingbehavioralissues` (`si1`, `si2`, `si3`, `si4`, `ab1`, `ab2`, `ab3`, `ab4`, `rb1`, `rb2`, `rb3`, `rb4`, `s1`, `s2`, `s3`, `s4`, `email`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'v'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'h'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sai@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 's@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'g'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'j'),
(10, 4, 9, 0, 9, 9, 10, 8, 8, 7, 7, 8, 10, 9, 10, 6, 'k'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'j'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lll');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `password` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parentlogin`
--

CREATE TABLE `parentlogin` (
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playskills`
--

CREATE TABLE `playskills` (
  `pt1` int(2) NOT NULL,
  `pt2` int(2) NOT NULL,
  `pt3` int(2) NOT NULL,
  `pt4` int(2) NOT NULL,
  `np1` int(2) NOT NULL,
  `np2` int(2) NOT NULL,
  `np3` int(2) NOT NULL,
  `np4` int(2) NOT NULL,
  `pp1` int(2) NOT NULL,
  `pp2` int(2) NOT NULL,
  `pp3` int(2) NOT NULL,
  `pp4` int(2) NOT NULL,
  `r1` int(2) NOT NULL,
  `r2` int(2) NOT NULL,
  `r3` int(2) NOT NULL,
  `r4` int(2) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playskills`
--

INSERT INTO `playskills` (`pt1`, `pt2`, `pt3`, `pt4`, `np1`, `np2`, `np3`, `np4`, `pp1`, `pp2`, `pp3`, `pp4`, `r1`, `r2`, `r3`, `r4`, `email`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'v'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'h'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sai@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 's@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'g'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'j'),
(10, 10, 10, 10, 10, 10, 10, 10, 7, 6, 4, 8, 0, 0, 0, 0, 'k'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'j'),
(10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 9, 0, 0, 0, 0, 'lll');

-- --------------------------------------------------------

--
-- Table structure for table `selfhelpskills`
--

CREATE TABLE `selfhelpskills` (
  `br1` int(2) NOT NULL,
  `br2` int(2) NOT NULL,
  `br3` int(2) NOT NULL,
  `br4` int(2) NOT NULL,
  `ba1` int(2) NOT NULL,
  `ba2` int(2) NOT NULL,
  `ba3` int(2) NOT NULL,
  `ba4` int(2) NOT NULL,
  `d1` int(2) NOT NULL,
  `d2` int(2) NOT NULL,
  `d3` int(2) NOT NULL,
  `d4` int(2) NOT NULL,
  `e1` int(2) NOT NULL,
  `e2` int(2) NOT NULL,
  `e3` int(2) NOT NULL,
  `e4` int(2) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `selfhelpskills`
--

INSERT INTO `selfhelpskills` (`br1`, `br2`, `br3`, `br4`, `ba1`, `ba2`, `ba3`, `ba4`, `d1`, `d2`, `d3`, `d4`, `e1`, `e2`, `e3`, `e4`, `email`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'v'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'h'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sai@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 's@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'g'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'j'),
(0, 0, 0, 0, 0, 0, 0, 8, 6, 0, 0, 0, 8, 8, 7, 8, 'k'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'j'),
(10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 'lll');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`name`, `email`, `password`) VALUES
('sai', 'sai@gmail.com', '7777'),
('v', 'v', '1'),
('h', 'h', 'h'),
('s', 's@gmail.com', '1'),
('a', 'a@gmail.com', '2'),
('g', 'g', '1'),
('j', 'j', '1'),
('k', 'k', '2'),
('j', 'j', '7'),
('lll', 'lll', '1');

-- --------------------------------------------------------

--
-- Table structure for table `socialskills`
--

CREATE TABLE `socialskills` (
  `ec1` int(2) NOT NULL,
  `ec2` int(2) NOT NULL,
  `ec3` int(2) NOT NULL,
  `ec4` int(2) NOT NULL,
  `ps1` int(2) NOT NULL,
  `ps2` int(2) NOT NULL,
  `ps3` int(2) NOT NULL,
  `ps4` int(2) NOT NULL,
  `is1` int(2) NOT NULL,
  `is2` int(2) NOT NULL,
  `is3` int(2) NOT NULL,
  `is4` int(2) NOT NULL,
  `ja1` int(2) NOT NULL,
  `ja2` int(2) NOT NULL,
  `ja3` int(2) NOT NULL,
  `ja4` int(2) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `socialskills`
--

INSERT INTO `socialskills` (`ec1`, `ec2`, `ec3`, `ec4`, `ps1`, `ps2`, `ps3`, `ps4`, `is1`, `is2`, `is3`, `is4`, `ja1`, `ja2`, `ja3`, `ja4`, `email`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'v'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'sai@gmail.com'),
(10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 'h'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 's@gmail.com'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'a@gmail.com'),
(10, 10, 10, 10, 5, 5, 5, 5, 10, 10, 10, 10, 10, 10, 10, 10, 'g'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'j'),
(10, 10, 10, 6, 5, 5, 5, 0, 6, 6, 0, 0, 7, 0, 0, 0, 'k'),
(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'j'),
(10, 10, 10, 10, 0, 0, 0, 0, 10, 10, 10, 10, 0, 0, 0, 0, 'lll');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `i1` varchar(300) NOT NULL,
  `v1` varchar(300) NOT NULL,
  `v2` varchar(300) NOT NULL,
  `v3` varchar(300) NOT NULL,
  `v4` varchar(300) NOT NULL,
  `i2` varchar(300) NOT NULL,
  `v5` varchar(300) NOT NULL,
  `v6` varchar(300) NOT NULL,
  `v7` varchar(300) NOT NULL,
  `v8` varchar(300) NOT NULL,
  `i3` varchar(300) NOT NULL,
  `v9` varchar(300) NOT NULL,
  `v10` varchar(300) NOT NULL,
  `v11` varchar(300) NOT NULL,
  `v12` varchar(300) NOT NULL,
  `i4` varchar(300) NOT NULL,
  `v13` varchar(300) NOT NULL,
  `v14` varchar(300) NOT NULL,
  `v15` varchar(300) NOT NULL,
  `v16` varchar(300) NOT NULL,
  `id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`i1`, `v1`, `v2`, `v3`, `v4`, `i2`, `v5`, `v6`, `v7`, `v8`, `i3`, `v9`, `v10`, `v11`, `v12`, `i4`, `v13`, `v14`, `v15`, `v16`, `id`) VALUES
('videos/social.mp4', 'videos/VID-20240111-WA0000.mp4', 'videos/VID-20240111-WA0000.mp4', 'videos/1000095504.mp4', 'videos/imitation.mp4', 'videos/playskills.mp4', 'videos/playingtogether.mp4', 'videos/newplay.mp4', 'videos/practiceplay.mp4', 'videos/reinforcement.mp4', 'videos/VID-20240111-WA0000.mp4', 'videos/VID-20240111-WA0000.mp4', 'videos/bathing.mp4', 'videos/dressing.mp4', 'videos/VID-20240111-WA0000.mp4', 'videos/handlingbehavioural.mp4', 'videos/VID-20240111-WA0000.mp4', 'videos/1000056863.mp4', 'videos/VID-20240111-WA0000.mp4', 'videos/1000056863.mp4', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
