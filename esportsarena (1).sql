-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2026 at 08:44 AM
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
-- Database: `esportsarena`
--

-- --------------------------------------------------------

--
-- Table structure for table `clan_tima`
--

CREATE TABLE `clan_tima` (
  `ID_clanstva` int(11) NOT NULL,
  `igrac_ID` int(11) DEFAULT NULL,
  `tim_ID` int(11) DEFAULT NULL,
  `uloga_ID` int(11) DEFAULT NULL,
  `datum_od` date NOT NULL,
  `datum_do` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clan_tima`
--

INSERT INTO `clan_tima` (`ID_clanstva`, `igrac_ID`, `tim_ID`, `uloga_ID`, `datum_od`, `datum_do`) VALUES
(1, 1, 1, 2, '2022-01-01', NULL),
(2, 2, 1, 3, '2020-11-06', NULL),
(3, 3, 2, 2, '2016-01-01', '2023-10-20'),
(4, 3, 6, 3, '2023-10-31', NULL),
(5, 4, 7, 8, '2013-02-01', NULL),
(6, 5, 1, 8, '2019-11-01', NULL),
(7, 6, 4, 2, '2019-04-01', NULL),
(8, 7, 9, 11, '2021-05-01', NULL),
(9, 8, 12, 11, '2022-02-15', NULL),
(10, 9, 8, 8, '2020-01-01', NULL),
(11, 10, 7, 10, '2020-11-18', NULL),
(12, 11, 7, 9, '2020-11-18', NULL),
(13, 12, 7, 6, '2020-11-18', NULL),
(14, 13, 7, 7, '2020-11-18', NULL),
(15, 14, 10, 2, '2023-01-01', NULL),
(16, 15, 6, 1, '2023-05-01', NULL),
(17, 16, 3, 3, '2021-01-01', NULL),
(18, 17, 3, 2, '2021-01-01', NULL),
(19, 18, 4, 3, '2020-01-01', '2022-01-01'),
(20, 19, 1, 3, '2020-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `igraci`
--

CREATE TABLE `igraci` (
  `ID_igrac` int(11) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `rang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `igraci`
--

INSERT INTO `igraci` (`ID_igrac`, `nickname`, `rang`) VALUES
(1, 'm0NESY', 'Global'),
(2, 'NiKo', 'Global'),
(3, 's1mple', 'Global'),
(4, 'Faker', 'Challenger'),
(5, 'Caps', 'Challenger'),
(6, 'ZywOo', 'Global'),
(7, 'TenZ', 'Radiant'),
(8, 'Aspas', 'Radiant'),
(9, 'Chovy', 'Challenger'),
(10, 'Keria', 'Challenger'),
(11, 'Gumayusi', 'Challenger'),
(12, 'Zeus', 'Challenger'),
(13, 'Oner', 'Challenger'),
(14, 'dev1ce', 'Global'),
(15, 'electronic', 'Global'),
(16, 'ropz', 'Global'),
(17, 'broky', 'Global'),
(18, 'shox', 'Global'),
(19, 'huNter-', 'Global'),
(20, 'ScreaM', 'Radiant');

-- --------------------------------------------------------

--
-- Table structure for table `igre`
--

CREATE TABLE `igre` (
  `ID_igra` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `zanr` varchar(30) DEFAULT NULL,
  `izdavac` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `igre`
--

INSERT INTO `igre` (`ID_igra`, `naziv`, `zanr`, `izdavac`) VALUES
(1, 'Counter-Strike 2', 'FPS', 'Valve'),
(2, 'League of Legends', 'MOBA', 'Riot Games'),
(3, 'Valorant', 'FPS', 'Riot Games'),
(4, 'Dota 2', 'MOBA', 'Valve'),
(5, 'Rocket League', 'Sports', 'Psyonix'),
(6, 'Apex Legends', 'Battle Royale', 'EA'),
(7, 'Rainbow Six Siege', 'Tactical FPS', 'Ubisoft'),
(8, 'Overwatch 2', 'Hero Shooter', 'Blizzard'),
(9, 'StarCraft II', 'RTS', 'Blizzard'),
(10, 'Tekken 8', 'Fighting', 'Bandai Namco'),
(11, 'Street Fighter 6', 'Fighting', 'Capcom'),
(12, 'Hearthstone', 'Card Game', 'Blizzard'),
(13, 'PUBG', 'Battle Royale', 'Krafton'),
(14, 'Fortnite', 'Battle Royale', 'Epic Games'),
(15, 'EA FC 24', 'Sports', 'EA Sports'),
(16, 'Call of Duty: MW3', 'FPS', 'Activision'),
(17, 'Halo Infinite', 'FPS', 'Xbox Game Studios'),
(18, 'Brawl Stars', 'Mobile MOBA', 'Supercell'),
(19, 'Mobile Legends', 'Mobile MOBA', 'Moonton'),
(20, 'Teamfight Tactics', 'Auto-battler', 'Riot Games');

-- --------------------------------------------------------

--
-- Table structure for table `mecevi`
--

CREATE TABLE `mecevi` (
  `ID_mec` int(11) NOT NULL,
  `turnir_ID` int(11) DEFAULT NULL,
  `tim1_ID` int(11) DEFAULT NULL,
  `tim2_ID` int(11) DEFAULT NULL,
  `rezultat` varchar(10) DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  `mapa` varchar(50) DEFAULT NULL,
  `faza` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mecevi`
--

INSERT INTO `mecevi` (`ID_mec`, `turnir_ID`, `tim1_ID`, `tim2_ID`, `rezultat`, `datum`, `mapa`, `faza`) VALUES
(1, 1, 1, 2, '2:1', '2024-03-20 18:00:00', 'Inferno', NULL),
(2, 1, 3, 4, '1:2', '2024-03-21 15:00:00', 'Mirage', NULL),
(3, 2, 7, 8, '3:0', '2024-11-10 12:00:00', 'Summoners Rift', NULL),
(4, 3, 9, 12, '2:0', '2024-08-15 17:00:00', 'Ascent', NULL),
(5, 5, 1, 3, '16:10', '2024-02-10 20:00:00', 'Nuke', NULL),
(6, 5, 10, 11, '2:0', '2024-02-11 14:00:00', 'Overpass', NULL),
(7, 8, 2, 4, '13:11', '2024-06-05 19:00:00', 'Anubis', NULL),
(8, 2, 5, 13, '3:1', '2024-10-25 16:00:00', 'Summoners Rift', NULL),
(9, 7, 14, 15, '2:1', '2024-07-12 21:00:00', 'Bind', NULL),
(10, 11, 6, 9, '2:0', '2024-04-18 13:00:00', 'Ancient', NULL),
(11, 15, 1, 5, '7:5', '2024-02-20 18:00:00', 'Clubhouse', NULL),
(12, 4, 9, 7, '1:1', '2024-10-12 10:00:00', 'Dota Map', NULL),
(13, 9, 7, 8, '2:0', '2024-03-01 11:00:00', 'Summoners Rift', NULL),
(14, 1, 2, 6, '2:0', '2024-03-25 19:30:00', 'Vertigo', NULL),
(15, 1, 1, 11, '16:14', '2024-03-26 21:00:00', 'Ancient', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statistika_igraca`
--

CREATE TABLE `statistika_igraca` (
  `ID_stat` int(11) NOT NULL,
  `mec_ID` int(11) DEFAULT NULL,
  `igrac_ID` int(11) DEFAULT NULL,
  `kills` int(11) DEFAULT 0,
  `deaths` int(11) DEFAULT 0,
  `assists` int(11) DEFAULT 0,
  `damage` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statistika_igraca`
--

INSERT INTO `statistika_igraca` (`ID_stat`, `mec_ID`, `igrac_ID`, `kills`, `deaths`, `assists`, `damage`) VALUES
(1, 1, 1, 28, 14, 5, 9500),
(2, 1, 2, 22, 18, 8, 8200),
(3, 1, 3, 25, 15, 4, 8800),
(4, 3, 4, 5, 0, 12, 15000),
(5, 3, 10, 2, 1, 25, 4000),
(6, 3, 11, 15, 2, 8, 22000),
(7, 4, 7, 21, 10, 5, 4500),
(8, 4, 8, 19, 12, 4, 4200),
(9, 5, 1, 22, 11, 3, 6000),
(10, 5, 16, 18, 19, 5, 5500),
(11, 7, 3, 30, 10, 5, 11000),
(12, 10, 15, 12, 15, 10, 4000),
(13, 14, 1, 25, 10, 2, 7000),
(14, 14, 3, 20, 22, 5, 6800),
(15, 15, 1, 32, 18, 4, 10500),
(16, 15, 2, 15, 17, 10, 5000),
(17, 2, 6, 24, 12, 6, 8900),
(18, 2, 17, 21, 15, 4, 7500),
(19, 3, 12, 10, 3, 15, 18000),
(20, 3, 13, 8, 4, 20, 14000);

-- --------------------------------------------------------

--
-- Table structure for table `timovi`
--

CREATE TABLE `timovi` (
  `ID_tim` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL,
  `regija` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timovi`
--

INSERT INTO `timovi` (`ID_tim`, `naziv`, `regija`) VALUES
(1, 'G2 Esports', 'EU'),
(2, 'NAVI', 'EU'),
(3, 'FaZe Clan', 'NA'),
(4, 'Team Vitality', 'EU'),
(5, 'Fnatic', 'EU'),
(6, 'Cloud9', 'NA'),
(7, 'T1', 'KR'),
(8, 'Gen.G', 'KR'),
(9, 'Team Liquid', 'EU'),
(10, 'Astralis', 'EU'),
(11, 'Heroic', 'EU'),
(12, 'FURIA', 'SA'),
(13, 'Karmine Corp', 'EU'),
(14, 'KOI', 'EU'),
(15, 'MOUZ', 'EU');

-- --------------------------------------------------------

--
-- Table structure for table `turniri`
--

CREATE TABLE `turniri` (
  `ID_turnir` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `igra_ID` int(11) DEFAULT NULL,
  `format` enum('Grupna','Knockout','Round Robin') DEFAULT NULL,
  `nagradni_fond` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turniri`
--

INSERT INTO `turniri` (`ID_turnir`, `naziv`, `igra_ID`, `format`, `nagradni_fond`) VALUES
(1, 'PGL Major Copenhagen', 1, 'Knockout', 1250000.00),
(2, 'LoL Worlds 2024', 2, 'Knockout', 2225000.00),
(3, 'VALORANT Champions', 3, 'Grupna', 1000000.00),
(4, 'The International', 4, 'Round Robin', 18000000.00),
(5, 'IEM Katowice', 1, 'Knockout', 1000000.00),
(6, 'LEC Winter', 2, 'Grupna', 200000.00),
(7, 'VCT Masters', 3, 'Knockout', 500000.00),
(8, 'BLAST Premier', 1, 'Grupna', 425000.00),
(9, 'LCK Spring', 2, 'Round Robin', 300000.00),
(10, 'DreamHack Winter', 5, 'Knockout', 100000.00),
(11, 'ESL Pro League', 1, 'Round Robin', 850000.00),
(12, 'Mid-Season Invitational', 2, 'Knockout', 250000.00),
(13, 'Red Bull Home Ground', 3, 'Grupna', 100000.00),
(14, 'Capcom Cup', 11, 'Knockout', 1000000.00),
(15, 'Six Invitational', 7, 'Knockout', 3000000.00);

-- --------------------------------------------------------

--
-- Table structure for table `uloge`
--

CREATE TABLE `uloge` (
  `ID_uloga` int(11) NOT NULL,
  `naziv_uloge` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `uloge`
--

INSERT INTO `uloge` (`ID_uloga`, `naziv_uloge`) VALUES
(1, 'IGL'),
(2, 'AWPer'),
(3, 'Rifler'),
(4, 'Entry Fragger'),
(5, 'Lurker'),
(6, 'Top Laner'),
(7, 'Jungler'),
(8, 'Mid Laner'),
(9, 'ADC'),
(10, 'Support'),
(11, 'Duelist'),
(12, 'Sentinel'),
(13, 'Controller'),
(14, 'Initiator'),
(15, 'Coach');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clan_tima`
--
ALTER TABLE `clan_tima`
  ADD PRIMARY KEY (`ID_clanstva`),
  ADD KEY `igrac_ID` (`igrac_ID`),
  ADD KEY `tim_ID` (`tim_ID`),
  ADD KEY `uloga_ID` (`uloga_ID`);

--
-- Indexes for table `igraci`
--
ALTER TABLE `igraci`
  ADD PRIMARY KEY (`ID_igrac`),
  ADD UNIQUE KEY `nickname` (`nickname`);

--
-- Indexes for table `igre`
--
ALTER TABLE `igre`
  ADD PRIMARY KEY (`ID_igra`);

--
-- Indexes for table `mecevi`
--
ALTER TABLE `mecevi`
  ADD PRIMARY KEY (`ID_mec`),
  ADD KEY `turnir_ID` (`turnir_ID`),
  ADD KEY `tim1_ID` (`tim1_ID`),
  ADD KEY `tim2_ID` (`tim2_ID`);

--
-- Indexes for table `statistika_igraca`
--
ALTER TABLE `statistika_igraca`
  ADD PRIMARY KEY (`ID_stat`),
  ADD KEY `mec_ID` (`mec_ID`),
  ADD KEY `igrac_ID` (`igrac_ID`);

--
-- Indexes for table `timovi`
--
ALTER TABLE `timovi`
  ADD PRIMARY KEY (`ID_tim`);

--
-- Indexes for table `turniri`
--
ALTER TABLE `turniri`
  ADD PRIMARY KEY (`ID_turnir`),
  ADD KEY `igra_ID` (`igra_ID`);

--
-- Indexes for table `uloge`
--
ALTER TABLE `uloge`
  ADD PRIMARY KEY (`ID_uloga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clan_tima`
--
ALTER TABLE `clan_tima`
  MODIFY `ID_clanstva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `igraci`
--
ALTER TABLE `igraci`
  MODIFY `ID_igrac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `igre`
--
ALTER TABLE `igre`
  MODIFY `ID_igra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `mecevi`
--
ALTER TABLE `mecevi`
  MODIFY `ID_mec` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `statistika_igraca`
--
ALTER TABLE `statistika_igraca`
  MODIFY `ID_stat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `timovi`
--
ALTER TABLE `timovi`
  MODIFY `ID_tim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `turniri`
--
ALTER TABLE `turniri`
  MODIFY `ID_turnir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `uloge`
--
ALTER TABLE `uloge`
  MODIFY `ID_uloga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clan_tima`
--
ALTER TABLE `clan_tima`
  ADD CONSTRAINT `clan_tima_ibfk_1` FOREIGN KEY (`igrac_ID`) REFERENCES `igraci` (`ID_igrac`),
  ADD CONSTRAINT `clan_tima_ibfk_2` FOREIGN KEY (`tim_ID`) REFERENCES `timovi` (`ID_tim`),
  ADD CONSTRAINT `clan_tima_ibfk_3` FOREIGN KEY (`uloga_ID`) REFERENCES `uloge` (`ID_uloga`);

--
-- Constraints for table `mecevi`
--
ALTER TABLE `mecevi`
  ADD CONSTRAINT `mecevi_ibfk_1` FOREIGN KEY (`turnir_ID`) REFERENCES `turniri` (`ID_turnir`),
  ADD CONSTRAINT `mecevi_ibfk_2` FOREIGN KEY (`tim1_ID`) REFERENCES `timovi` (`ID_tim`),
  ADD CONSTRAINT `mecevi_ibfk_3` FOREIGN KEY (`tim2_ID`) REFERENCES `timovi` (`ID_tim`);

--
-- Constraints for table `statistika_igraca`
--
ALTER TABLE `statistika_igraca`
  ADD CONSTRAINT `statistika_igraca_ibfk_1` FOREIGN KEY (`mec_ID`) REFERENCES `mecevi` (`ID_mec`),
  ADD CONSTRAINT `statistika_igraca_ibfk_2` FOREIGN KEY (`igrac_ID`) REFERENCES `igraci` (`ID_igrac`);

--
-- Constraints for table `turniri`
--
ALTER TABLE `turniri`
  ADD CONSTRAINT `turniri_ibfk_1` FOREIGN KEY (`igra_ID`) REFERENCES `igre` (`ID_igra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
