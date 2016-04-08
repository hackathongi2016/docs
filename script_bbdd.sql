-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Temps de generació: 08-04-2016 a les 18:07:03
-- Versió del servidor: 5.6.26
-- Versió de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `viatgemjunts`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `Coordinate`
--

CREATE TABLE IF NOT EXISTS `Coordinate` (
  `cor_id` bigint(20) NOT NULL,
  `cor_lat` float NOT NULL,
  `cor_long` float NOT NULL,
  `cor_order` int(11) NOT NULL,
  `cor_rut_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `Route`
--

CREATE TABLE IF NOT EXISTS `Route` (
  `rut_id` bigint(20) NOT NULL,
  `rut_name` varchar(45) NOT NULL,
  `rut_tra_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `Topic`
--

CREATE TABLE IF NOT EXISTS `Topic` (
  `top_id` bigint(20) NOT NULL,
  `top_name` varchar(1000) NOT NULL,
  `top_tra_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `TopicProposal`
--

CREATE TABLE IF NOT EXISTS `TopicProposal` (
  `pro_id` bigint(20) NOT NULL,
  `pro_title` varchar(1000) NOT NULL,
  `pro_description` varchar(4000) DEFAULT NULL,
  `pro_top_id` bigint(20) NOT NULL,
  `pro_usr_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `Travel`
--

CREATE TABLE IF NOT EXISTS `Travel` (
  `tra_id` bigint(20) NOT NULL,
  `tra_origin` varchar(255) NOT NULL,
  `tra_destination` varchar(255) NOT NULL,
  `tra_num_days` int(11) NOT NULL,
  `tra_budget_min` float DEFAULT NULL,
  `tra_budget_max` float DEFAULT NULL,
  `tra_date` date NOT NULL,
  `tra_planning_limit` date NOT NULL,
  `tra_persons_min` int(11) DEFAULT NULL,
  `tra_persons_max` int(11) DEFAULT NULL,
  `tra_description` varchar(4000) NOT NULL,
  `tra_usr_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `usr_id` bigint(20) NOT NULL,
  `usr_name` varchar(255) NOT NULL,
  `usr_surname` varchar(255) NOT NULL,
  `usr_nickname` varchar(255) NOT NULL,
  `usr_mail` varchar(255) NOT NULL,
  `usr_password` varchar(255) NOT NULL,
  `usr_birthday` date NOT NULL,
  `usr_gender` bit(1) NOT NULL,
  `usr_register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usr_avatar_url` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `UserTravel`
--

CREATE TABLE IF NOT EXISTS `UserTravel` (
  `ust_id` bigint(20) NOT NULL,
  `ust_usr_id` bigint(20) NOT NULL,
  `ust_tra_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `Vote`
--

CREATE TABLE IF NOT EXISTS `Vote` (
  `vot_id` bigint(20) NOT NULL,
  `vot_usr_id` bigint(20) NOT NULL,
  `vot_pro_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de la taula `WallComment`
--

CREATE TABLE IF NOT EXISTS `WallComment` (
  `com_id` int(11) NOT NULL,
  `com_description` varchar(1000) NOT NULL,
  `com_top_id` bigint(20) NOT NULL,
  `com_usr_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexos per taules bolcades
--

--
-- Index de la taula `Coordinate`
--
ALTER TABLE `Coordinate`
  ADD PRIMARY KEY (`cor_id`),
  ADD KEY `fk_Coordinate_Route1_idx` (`cor_rut_id`);

--
-- Index de la taula `Route`
--
ALTER TABLE `Route`
  ADD PRIMARY KEY (`rut_id`),
  ADD KEY `fk_Route_Travel1_idx` (`rut_tra_id`);

--
-- Index de la taula `Topic`
--
ALTER TABLE `Topic`
  ADD PRIMARY KEY (`top_id`),
  ADD KEY `fk_Topic_Travel1_idx` (`top_tra_id`);

--
-- Index de la taula `TopicProposal`
--
ALTER TABLE `TopicProposal`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `fk_TopicProposal_Topic1_idx` (`pro_top_id`),
  ADD KEY `fk_TopicProposal_User1_idx` (`pro_usr_id`);

--
-- Index de la taula `Travel`
--
ALTER TABLE `Travel`
  ADD PRIMARY KEY (`tra_id`),
  ADD KEY `fk_Travel_User1_idx` (`tra_usr_id`);

--
-- Index de la taula `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`usr_id`);

--
-- Index de la taula `UserTravel`
--
ALTER TABLE `UserTravel`
  ADD PRIMARY KEY (`ust_id`),
  ADD KEY `fk_User_has_Travel_Travel1_idx` (`ust_tra_id`),
  ADD KEY `fk_User_has_Travel_User1_idx` (`ust_usr_id`);

--
-- Index de la taula `Vote`
--
ALTER TABLE `Vote`
  ADD PRIMARY KEY (`vot_id`),
  ADD KEY `fk_Vote_User_idx` (`vot_usr_id`),
  ADD KEY `fk_Vote_TopicProposal1_idx` (`vot_pro_id`);

--
-- Index de la taula `WallComment`
--
ALTER TABLE `WallComment`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `fk_WallComment_Topic1_idx` (`com_top_id`),
  ADD KEY `fk_WallComment_User1_idx` (`com_usr_id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `Coordinate`
--
ALTER TABLE `Coordinate`
  MODIFY `cor_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `Route`
--
ALTER TABLE `Route`
  MODIFY `rut_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `Topic`
--
ALTER TABLE `Topic`
  MODIFY `top_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `TopicProposal`
--
ALTER TABLE `TopicProposal`
  MODIFY `pro_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `Travel`
--
ALTER TABLE `Travel`
  MODIFY `tra_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `User`
--
ALTER TABLE `User`
  MODIFY `usr_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `UserTravel`
--
ALTER TABLE `UserTravel`
  MODIFY `ust_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `Vote`
--
ALTER TABLE `Vote`
  MODIFY `vot_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `WallComment`
--
ALTER TABLE `WallComment`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `Coordinate`
--
ALTER TABLE `Coordinate`
  ADD CONSTRAINT `fk_Coordinate_Route1` FOREIGN KEY (`cor_rut_id`) REFERENCES `Route` (`rut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per la taula `Route`
--
ALTER TABLE `Route`
  ADD CONSTRAINT `fk_Route_Travel1` FOREIGN KEY (`rut_tra_id`) REFERENCES `Travel` (`tra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per la taula `Topic`
--
ALTER TABLE `Topic`
  ADD CONSTRAINT `fk_Topic_Travel1` FOREIGN KEY (`top_tra_id`) REFERENCES `Travel` (`tra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per la taula `TopicProposal`
--
ALTER TABLE `TopicProposal`
  ADD CONSTRAINT `fk_TopicProposal_Topic1` FOREIGN KEY (`pro_top_id`) REFERENCES `Topic` (`top_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TopicProposal_User1` FOREIGN KEY (`pro_usr_id`) REFERENCES `User` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per la taula `Travel`
--
ALTER TABLE `Travel`
  ADD CONSTRAINT `fk_Travel_User1` FOREIGN KEY (`tra_usr_id`) REFERENCES `User` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per la taula `UserTravel`
--
ALTER TABLE `UserTravel`
  ADD CONSTRAINT `fk_User_has_Travel_Travel1` FOREIGN KEY (`ust_tra_id`) REFERENCES `Travel` (`tra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_User_has_Travel_User1` FOREIGN KEY (`ust_usr_id`) REFERENCES `User` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per la taula `Vote`
--
ALTER TABLE `Vote`
  ADD CONSTRAINT `fk_Vote_TopicProposal1` FOREIGN KEY (`vot_pro_id`) REFERENCES `TopicProposal` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Vote_User` FOREIGN KEY (`vot_usr_id`) REFERENCES `User` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restriccions per la taula `WallComment`
--
ALTER TABLE `WallComment`
  ADD CONSTRAINT `fk_WallComment_Topic1` FOREIGN KEY (`com_top_id`) REFERENCES `Topic` (`top_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_WallComment_User1` FOREIGN KEY (`com_usr_id`) REFERENCES `User` (`usr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
