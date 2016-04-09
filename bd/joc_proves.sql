-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Temps de generació: 09-04-2016 a les 13:20:40
-- Versió del servidor: 5.5.47-0ubuntu0.14.04.1
-- Versió de PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de dades: `viatgemjunts`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `Coordinate`
--

CREATE TABLE IF NOT EXISTS `Coordinate` (
  `cor_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cor_lat` float NOT NULL,
  `cor_long` float NOT NULL,
  `cor_order` int(11) NOT NULL,
  `cor_rut_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cor_id`),
  KEY `fk_Coordinate_Route1_idx` (`cor_rut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `Route`
--

CREATE TABLE IF NOT EXISTS `Route` (
  `rut_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rut_name` varchar(45) NOT NULL,
  `rut_tra_id` bigint(20) NOT NULL,
  PRIMARY KEY (`rut_id`),
  KEY `fk_Route_Travel1_idx` (`rut_tra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de la taula `Topic`
--

CREATE TABLE IF NOT EXISTS `Topic` (
  `top_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `top_name` varchar(1000) NOT NULL,
  `top_tra_id` bigint(20) NOT NULL,
  PRIMARY KEY (`top_id`),
  KEY `fk_Topic_Travel1_idx` (`top_tra_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Bolcant dades de la taula `Topic`
--

INSERT INTO `Topic` (`top_id`, `top_name`, `top_tra_id`) VALUES
(1, 'Transport', 1),
(2, 'Allotjament', 1),
(3, 'Activitats', 1),
(4, 'Organització', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `TopicProposal`
--

CREATE TABLE IF NOT EXISTS `TopicProposal` (
  `pro_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_title` varchar(1000) NOT NULL,
  `pro_description` varchar(4000) DEFAULT NULL,
  `pro_top_id` bigint(20) NOT NULL,
  `pro_usr_id` bigint(20) NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `fk_TopicProposal_Topic1_idx` (`pro_top_id`),
  KEY `fk_TopicProposal_User1_idx` (`pro_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Bolcant dades de la taula `TopicProposal`
--

INSERT INTO `TopicProposal` (`pro_id`, `pro_title`, `pro_description`, `pro_top_id`, `pro_usr_id`) VALUES
(1, 'Bitllets avió Swiss 1000€', '1 escala', 1, 1),
(2, 'Bitllets avió Lufthanssa 999.99€', '2 escales', 1, 2),
(3, 'Bitllets avió Vueling+Easyjet+Ryanair 10€', '385 escales', 1, 3),
(4, 'Hotel "El Hacker" 500€', 'Wifi fins a la piscina, portàtils a totes les habitacions', 2, 1),
(5, 'Apartaments "Ciberespai", 400€', 'IoT a les taules del menjador', 2, 2),
(6, 'Sortida Submarinisme, 60€', 'mínim 8 persones', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `Travel`
--

CREATE TABLE IF NOT EXISTS `Travel` (
  `tra_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tra_origin` varchar(255) NOT NULL,
  `tra_destination` varchar(255) NOT NULL,
  `tra_num_days` int(11) NOT NULL,
  `tra_budget_min` float DEFAULT NULL,
  `tra_budget_max` float DEFAULT NULL,
  `tra_date` date NOT NULL,
  `tra_lat` float NOT NULL,
  `tra_long` float NOT NULL,
  `tra_planning_limit` date NOT NULL,
  `tra_persons_min` int(11) DEFAULT NULL,
  `tra_persons_max` int(11) DEFAULT NULL,
  `tra_description` varchar(4000) NOT NULL,
  `tra_usr_id` bigint(20) NOT NULL,
  PRIMARY KEY (`tra_id`),
  KEY `fk_Travel_User1_idx` (`tra_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `Travel`
--

INSERT INTO `Travel` (`tra_id`, `tra_origin`, `tra_destination`, `tra_num_days`, `tra_budget_min`, `tra_budget_max`, `tra_date`, `tra_lat`, `tra_long`, `tra_planning_limit`, `tra_persons_min`, `tra_persons_max`, `tra_description`, `tra_usr_id`) VALUES
(1, 'Barcelona', 'Sydney', 100, 3000, 6000, '2016-07-15', -33.8428, 151.131, '2016-06-17', 5, 20, 'Viatge d''aventura per Austràlia', 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `usr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usr_name` varchar(255) NOT NULL,
  `usr_surname` varchar(255) NOT NULL,
  `usr_nickname` varchar(255) NOT NULL,
  `usr_mail` varchar(255) NOT NULL,
  `usr_password` varchar(255) NOT NULL,
  `usr_birthday` date NOT NULL,
  `usr_gender` bit(1) NOT NULL,
  `usr_register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usr_avatar_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Bolcant dades de la taula `User`
--

INSERT INTO `User` (`usr_id`, `usr_name`, `usr_surname`, `usr_nickname`, `usr_mail`, `usr_password`, `usr_birthday`, `usr_gender`, `usr_register_date`, `usr_avatar_url`) VALUES
(1, 'Jordi', 'Corominas', 'jordics', 'jordics@gmail.com', '$2y$10$Guwn8MPVsMNZ6DLenDbQbeCW8aqIdm/RzwjCNTYY5FBvzJh6AuOcC', '2016-04-09', b'0', '2016-04-09 10:52:19', '$2y$10$Guwn8MPVsMNZ6DLenDbQbeCW8aqIdm/RzwjCNTYY5FBvzJh6AuOcC'),
(2, 'Oliver', 'Valls', 'tramuntanal', 'tramuntanal@gmail.com', '$2y$10$Guwn8MPVsMNZ6DLenDbQbeCW8aqIdm/RzwjCNTYY5FBvzJh6AuOcC', '2016-04-09', b'0', '2016-04-09 10:52:38', NULL),
(3, 'Pere', 'Saurina', 'pere.saurina', 'pere.saurina@gmail.com', '$2y$10$Guwn8MPVsMNZ6DLenDbQbeCW8aqIdm/RzwjCNTYY5FBvzJh6AuOcC', '2016-04-26', b'0', '2016-04-09 10:52:38', NULL),
(4, 'name', 'surname', 'jordics2', 'jordics2@gmail.com', '$2y$10$OE7Iij0k9qrtoLKF.sljlOO7VVC5DGeDFuYr6nu6JhtQOt.m47f3a', '2016-04-09', b'0', '2016-04-09 10:58:45', '$2y$10$OE7Iij0k9qrtoLKF.sljlOO7VVC5DGeDFuYr6nu6JhtQOt.m47f3a');

-- --------------------------------------------------------

--
-- Estructura de la taula `UserTravel`
--

CREATE TABLE IF NOT EXISTS `UserTravel` (
  `ust_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ust_usr_id` bigint(20) NOT NULL,
  `ust_tra_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ust_id`),
  KEY `fk_User_has_Travel_Travel1_idx` (`ust_tra_id`),
  KEY `fk_User_has_Travel_User1_idx` (`ust_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Bolcant dades de la taula `UserTravel`
--

INSERT INTO `UserTravel` (`ust_id`, `ust_usr_id`, `ust_tra_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de la taula `Vote`
--

CREATE TABLE IF NOT EXISTS `Vote` (
  `vot_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vot_usr_id` bigint(20) NOT NULL,
  `vot_pro_id` bigint(20) NOT NULL,
  PRIMARY KEY (`vot_id`),
  KEY `fk_Vote_User_idx` (`vot_usr_id`),
  KEY `fk_Vote_TopicProposal1_idx` (`vot_pro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Bolcant dades de la taula `Vote`
--

INSERT INTO `Vote` (`vot_id`, `vot_usr_id`, `vot_pro_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 3, 2),
(5, 3, 3),
(6, 1, 4),
(7, 2, 5),
(8, 3, 5),
(9, 1, 6),
(10, 2, 6),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Estructura de la taula `WallComment`
--

CREATE TABLE IF NOT EXISTS `WallComment` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_date` datetime NOT NULL,
  `com_description` varchar(1000) NOT NULL,
  `com_top_id` bigint(20) NOT NULL,
  `com_usr_id` bigint(20) NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `fk_WallComment_Topic1_idx` (`com_top_id`),
  KEY `fk_WallComment_User1_idx` (`com_usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Bolcant dades de la taula `WallComment`
--

INSERT INTO `WallComment` (`com_id`, `com_date`, `com_description`, `com_top_id`, `com_usr_id`) VALUES
(1, '2016-04-08 00:00:00', 'Hi ha escarabats a totes les habitacions', 2, 2),
(2, '2016-04-08 01:00:00', 'Sí, però he vist que només corren per les parets, al terra no n''hi ha...', 2, 3),
(3, '2016-04-08 02:00:00', 'Nois, són vinils el que veieu, és la decoració temàtica de l''habitació', 2, 1);

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
