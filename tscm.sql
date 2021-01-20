-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 08:14 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tscm`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`, `createdAt`) VALUES
(1, 'Name', 'admin@email.com', '9893644424', 'this is a custom message for my testing db.', '2021-01-15 19:06:12'),
(2, 'Name', 'admin@email.com', '9893644424', 'this is a custom message for my testing db.', '2021-01-15 19:25:49'),
(3, 'capids', 'aman@mail.com', '9893644424', 'sakdhasldjklasjd', '2021-01-15 19:28:45'),
(4, 'EMS (Expense Management System)', 'theamanshakya@gmail.com', '9893644424', 'this is a dummy mail for testing purpose', '2021-01-18 10:39:52'),
(5, 'EMS (Expense Management System)', 'theamanshakya@gmail.com', '9893644424', 'this is a dummy mail for testing purpose', '2021-01-18 10:40:30'),
(6, 'EMS (Expense Management System)', 'theamanshakya@gmail.com', '9893644424', 'this is a dummy mail for testing purpose', '2021-01-18 10:43:36'),
(7, 'EMS (Expense Management System)', 'theamanshakya@gmail.com', '9893644424', 'this is a dummy mail for testing purpose', '2021-01-18 10:45:55'),
(8, 'EMS (Expense Management System)', 'theamanshakya@gmail.com', '9893644424', 'this is a dummy mail for testing purpose', '2021-01-18 10:50:52'),
(9, 'EMS (Expense Management System)', 'theamanshakya@gmail.com', '9893644424', 'this is a dummy mail for testing purpose', '2021-01-18 10:53:39'),
(10, 'EMS (Expense Management System)', 'theamanshakya@gmail.com', '9893644424', 'this is a dummy mail for testing purpose', '2021-01-18 11:00:24'),
(11, 'admin', 'theamanshakya@gmail.com', '9893644424', 'this is testing msg', '2021-01-18 12:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `post_slug` varchar(30) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `posted_by` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `post_slug`, `content`, `posted_by`, `date`) VALUES
(1, 'The Economics Times', 'tecotimes', 'Back in 1996 and 1997, as a poor value investor struggling to make a living, I was dependent on writing for a number of publications for the money. These included The Economic Times and The Intelligent Investor (a newspaper based out of Mumbai which is not longer in existence).\r\n\r\nThe money was not much — about INR 700 per column — but it helped put food on the table for my wife, our two-year old daughter, and me.\r\n\r\nEvery few hours, I had to write a column, print it, and fax it to the publishers. There were tight deadlines.\r\n\r\nI wrote many columns — hundreds of them — just for the money. But over time, I realised that I was learning so much because I was writing against deadlines for money…\r\n\r\nAnyway, long story short, I wrote and submitted hundreds of columns. But, after a while, the publishers said they can’t take any more columns from me. They already had too much stuff from me.\r\n\r\nI needed the money and if there’s one thing that makes you creative, it’s poverty.\r\n\r\nI created a pse', 'Aman Shakya', '2021-01-19 15:06:27'),
(7, 'Quia voluptatem quidem sequi sed.', 'quia', 'Et est qui qui magnam repudiandae in. Et ducimus ex expedita. Ut accusantium et sit temporibus qui consequatur. Veniam repudiandae facere autem et dicta aliquam.', 'Rocky Beatty', '2021-01-19 14:50:26'),
(8, 'Inventore id ut sit.', 'illum', 'Necessitatibus ab qui fugit eum perferendis delectus. Eum molestiae consequuntur dignissimos excepturi consequatur. Sequi dolore id quo.', 'Ms. Bella Hamill IV', '1981-10-05 18:47:30'),
(9, 'Corporis error necessitatibus vero.', 'quasi', 'Et velit ipsa quia aut. Eum assumenda eius magnam excepturi itaque et expedita. Fuga molestias repellat a optio minima.', 'Prof. Jake Nolan', '1973-01-20 06:23:31'),
(10, 'Doloremque ullam impedit ea.', 'et', 'Excepturi inventore sed aperiam deleniti dolore dolorem. Et aliquam reprehenderit quo. Id ab unde repudiandae eos.', 'Miss Shyanne Barton DDS', '1979-07-12 06:06:21'),
(11, 'Is there an easy way to make sessions timeout in f', 'flasksession', 'from datetime import timedelta\r\nfrom flask import session, app\r\n\r\n@app.before_request\r\ndef make_session_permanent():\r\n    session.permanent = True\r\n    app.permanent_session_lifetime = timedelta(minutes=5)', 'Aman Shakya', '2021-01-19 13:01:54'),
(12, 'World Health Assembly', 'wha', 'The World Health Assembly (WHA) is the forum through which the World Health Organization (WHO) is governed by its 194 member states. It is the world\'s highest health policy setting body and is composed of health ministers from member states.\r\n\r\nThe members of the WHA generally meet every year in May in Geneva at the Palace of Nations, the location of WHO Headquarters. The main tasks of the WHA are to decide major policy questions, as well as to approve the WHO work programme and budget and elect its Director-General (every fifth year) and annually to elect ten members to renew part of its executive board.[1] Its main functions are to determine the policies of the Organization, supervise financial policies, and review and approve the proposed programme budget. ', 'Aman Shakya', '2021-01-19 13:20:45'),
(13, 'World Health Organization', 'who', 'The World Health Organization (WHO) is a specialized agency of the United Nations responsible for international public health.[1] The WHO Constitution, which establishes the agency\'s governing structure and principles, states its main objective as \"the attainment by all peoples of the highest possible level of health.\"[2] It is headquartered in Geneva, Switzerland, with six semi-autonomous regional offices and 150 field offices worldwide.\r\n\r\nThe WHO was established by constitution on 7 April 1948,[3] which is commemorated as World Health Day.[4] The first meeting of the World Health Assembly (WHA), the agency\'s governing body, took place on 24 July 1948. The WHO incorporated the assets, personnel, and duties of the League of Nations\' Health Organisation and the Office International d\'Hygiène Publique, including the International Classification of Diseases (ICD).[5] Its work began in earnest in 1951 following a significant infusion of financial and technical resources.[6] ', 'Aman Shakya', '2021-01-19 13:27:03'),
(14, 'The Economics Times', 'tecotimes', 'Back in 1996 and 1997, as a poor value investor struggling to make a living, I was dependent on writing for a number of publications for the money. These included The Economic Times and The Intelligent Investor (a newspaper based out of Mumbai which is not longer in existence).\r\n\r\nThe money was not much — about INR 700 per column — but it helped put food on the table for my wife, our two-year old daughter, and me.\r\n\r\nEvery few hours, I had to write a column, print it, and fax it to the publishers. There were tight deadlines.\r\n\r\nI wrote many columns — hundreds of them — just for the money. But over time, I realised that I was learning so much because I was writing against deadlines for money…\r\n\r\nAnyway, long story short, I wrote and submitted hundreds of columns. But, after a while, the publishers said they can’t take any more columns from me. They already had too much stuff from me.\r\n\r\nI needed the money and if there’s one thing that makes you creative, it’s poverty.\r\n\r\nI created a pse', 'Prof. Elijah Hackett', '2021-01-19 13:28:03'),
(16, 'Indian Space Research Organisation', 'isro', 'The Indian Space Research Organisation[a] (ISRO /ˈɪsroʊ/) or (IAST : Bhāratīya Antrikṣ Anusandhān Saṅgaṭhan) is the national space agency of the Republic of India, headquartered in Bengaluru. It operates under Department of Space (DoS) which is directly overseen by the prime minister of India while chairman of ISRO acts as executive of DoS as well. ISRO is the primary agency in India to perform tasks related to space based applications, space exploration and development of related technologies.[6] It is one of six government space agencies in the world which possess full launch capabilities, deploy cryogenic engines, launch extraterrestrial missions and operate large fleets of artificial satellites.[7][b]\r\n\r\nThe Indian National Committee for Space Research (INCOSPAR) was established by Jawaharlal Nehru[8] under the Department of Atomic Energy (DAE) in 1962, with the urging of scientist Vikram Sarabhai recognising the need in space research. INCOSPAR grew and became ISRO in 1969,[9] als', 'Aman Shakya', '2021-01-19 14:38:03'),
(17, 'Space Applications Centre', 'spaceappcenter', 'The Space Applications Centre (SAC) is an institution of research in Ahmedabad under the aegis of the Indian Space Research Organisation (ISRO). It is one of the major centres of ISRO that is engaged in the research, development and demonstration of applications of space technology in the field of telecommunications, remote sensing, meteorology and satellite navigation (Sat Nav). This includes research and development of on-board systems, ground systems and end user equipment hardware and software.\r\n\r\nSome of the achievements of the Space Applications Centre include development of communication and meteorological payloads for INSAT satellites, optical and microwave payloads for IRS satellites. SAC provides its infrastructure to conduct training courses to the students of the Center for Space Science and Technology Education in Asia and The Pacific (CSSTEAP). It was founded by Dr. Vikram Sarabhai.[2] ', 'Aman Shakya', '2021-01-19 14:40:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
