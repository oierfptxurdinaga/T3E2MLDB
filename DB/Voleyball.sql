-- phpMyAdmin SQL Dump
-- version 5.2.1
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-01-2026
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `volleyball`
--
DROP DATABASE IF EXISTS `volleyball`;
CREATE DATABASE IF NOT EXISTS `volleyball` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `volleyball`;

-- --------------------------------------------------------
-- 1. CREACIÓN DE TABLAS (Estructura Básica)
-- --------------------------------------------------------

CREATE TABLE `denboraldia` (
  `denboraldia_kod` int(11) NOT NULL,
  `hasiera_data` date DEFAULT NULL,
  `amaiera_data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `denboraldia_jaurdunaldia` (
  `denboraldia_kod` int(11) NOT NULL,
  `jaurdunaldi_kod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `entrenatzailea` (
  `entrenatzaile_kod` int(11) NOT NULL,
  `izena` varchar(100) DEFAULT NULL,
  `abizena` varchar(100) DEFAULT NULL,
  `NAN` varchar(9) DEFAULT NULL,
  `telefonoa` varchar(15) DEFAULT NULL,
  `herritartasuna` varchar(50) DEFAULT NULL,
  `taldea_kod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `epailea` (
  `epailea_kod` int(11) NOT NULL,
  `izena` varchar(100) DEFAULT NULL,
  `abizena` varchar(100) DEFAULT NULL,
  `NAN` varchar(9) DEFAULT NULL,
  `herritartasuna` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `jaurdunaldia` (
  `jaurdunaldi_kod` int(11) NOT NULL,
  `hasiera_data` date DEFAULT NULL,
  `amaiera_data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `jokalariak` (
  `jokalariak_kod` int(11) NOT NULL,
  `izena` varchar(100) DEFAULT NULL,
  `abizena` varchar(100) DEFAULT NULL,
  `NAN` varchar(9) DEFAULT NULL,
  `posizioa` varchar(50) DEFAULT NULL,
  `pisua` decimal(5,2) DEFAULT NULL,
  `altuera` decimal(4,2) DEFAULT NULL,
  `herritartasuna` varchar(50) DEFAULT NULL,
  `taldea_kod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `jokalari_taldea` (
  `jokalariak_kod` int(11) NOT NULL,
  `taldea_kod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `partida` (
  `partida_kod` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `ordua` time DEFAULT NULL,
  `emaitza` varchar(20) DEFAULT NULL,
  `zigorrak` int(11) DEFAULT NULL,
  `txartelak` int(11) DEFAULT NULL,
  `epailea_kod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `partida_jaurdunaldia` (
  `partida_kod` int(11) NOT NULL,
  `jaurdunaldi_kod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `taldea` (
  `taldea_kod` int(11) NOT NULL,
  `izena` varchar(100) NOT NULL,
  `sortze_data` date DEFAULT NULL,
  `zelaia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `taldea_denboraldia` (
  `taldea_kod` int(11) NOT NULL,
  `denboraldia_kod` int(11) NOT NULL,
  `irabaziak` int(11) DEFAULT NULL,
  `galduak` int(11) DEFAULT NULL,
  `puntuak` int(11) DEFAULT NULL,
  `posizioa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `taldea_partida` (
  `taldea_kod` int(11) NOT NULL,
  `partida_kod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `zelaia` (
  `zelaia_kod` int(11) NOT NULL,
  `izena` varchar(100) NOT NULL,
  `kokapena` varchar(150) DEFAULT NULL,
  `kapazitatea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- 2. INSERCIÓN DE DATOS
-- --------------------------------------------------------

INSERT INTO `denboraldia` (`denboraldia_kod`, `hasiera_data`, `amaiera_data`) VALUES
(1, '2025-09-01', '2026-05-31');

INSERT INTO `denboraldia_jaurdunaldia` (`denboraldia_kod`, `jaurdunaldi_kod`) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10);

INSERT INTO `entrenatzailea` (`entrenatzaile_kod`, `izena`, `abizena`, `NAN`, `telefonoa`, `herritartasuna`, `taldea_kod`) VALUES
(1, 'Jon', 'García', '12345678A', '600111222', 'ESP', 1),
(2, 'Marta', 'López', '87654321B', '600222333', 'ESP', 2),
(3, 'John', 'Brown', '11223344C', '600333444', 'ENG', 3),
(4, 'Ane', 'Fernández', '44332211D', '600444555', 'ESP', 4),
(5, 'Iker', 'Pérez', '55667788E', '600555666', 'ESP', 5),
(6, 'Leire', 'González', '99887766F', '600666777', 'ESP', 6);

INSERT INTO `epailea` (`epailea_kod`, `izena`, `abizena`, `NAN`, `herritartasuna`) VALUES
(1, 'David', 'Ruiz', '11111111A', 'ESP'),
(2, 'Sara', 'Sánchez', '22222222B', 'ESP'),
(3, 'Joseba', 'Alonso', '33333333C', 'ESP'),
(4, 'Nekane', 'Jiménez', '44444444D', 'ESP'),
(5, 'Xabier', 'Ortega', '55555555E', 'ESP'),
(6, 'Michael', 'Jordan', '66666666F', 'ENG'),
(7, 'Mikel', 'Romero', '77777777G', 'ESP'),
(8, 'Olatz', 'Serrano', '88888888H', 'ESP');

INSERT INTO `jaurdunaldia` (`jaurdunaldi_kod`, `hasiera_data`, `amaiera_data`) VALUES
(1, '2025-09-15', '2025-09-15'), (2, '2025-09-22', '2025-09-22'), (3, '2025-09-29', '2025-09-29'),
(4, '2025-10-06', '2025-10-06'), (5, '2025-10-13', '2025-10-13'), (6, '2025-10-20', '2025-10-20'),
(7, '2025-10-27', '2025-10-27'), (8, '2025-11-03', '2025-11-03'), (9, '2025-11-10', '2025-11-10'),
(10, '2025-11-17', '2025-11-17');

INSERT INTO `jokalariak` (`jokalariak_kod`, `izena`, `abizena`, `NAN`, `posizioa`, `pisua`, `altuera`, `herritartasuna`, `taldea_kod`) VALUES
(1, 'Carlos', 'Etxebarria', NULL, 'Armador', 78.00, 1.82, 'ESP', 1),
(2, 'Laura', 'Ruiz', '00000002A', 'Opuesta', 70.00, 1.75, 'ESP', 1),
(3, 'David', 'Goikoetxea', '00000003B', 'Central', 85.00, 1.90, 'ESP', 1),
(4, 'Sara', 'Arrieta', '00000004C', 'Receptora/Atacante', 68.00, 1.73, 'ESP', 1),
(5, 'Javier', 'Aguirre', NULL, 'Central', 88.00, 1.92, 'ESP', 1),
(6, 'Marta', 'Larrinaga', '00000006D', 'Líbero', 65.00, 1.68, 'ESP', 1),
(7, 'Daniel', 'Zubizarreta', '00000007E', 'Armador', 76.00, 1.80, 'ESP', 1),
(8, 'Elena', 'Etxeberria', '00000008F', 'Opuesta', 69.00, 1.74, 'ESP', 1),
(9, 'John', 'Johnson', '00000009G', 'Central', 87.00, 1.91, 'ENG', 1),
(10, 'Ana', 'Mendizabal', NULL, 'Receptora/Atacante', 67.00, 1.72, 'ESP', 1),
(11, 'Alejandro', 'Laka', '00000011H', 'Central', 89.00, 1.93, 'ESP', 1),
(12, 'Cristina', 'Zabaleta', '00000012I', 'Líbero', 64.00, 1.67, 'ESP', 1),
(13, 'Miguel', 'Salazar', '00000013J', 'Armador', 77.00, 1.81, 'ESP', 2),
(14, 'Paula', 'Iglesias', '00000014K', 'Opuesta', 71.00, 1.76, 'ESP', 2),
(15, 'Raúl', 'Bilbao', NULL, 'Central', 86.00, 1.89, 'ESP', 2),
(16, 'Isabel', 'Goitia', '00000016L', 'Receptora/Atacante', 66.00, 1.71, 'ESP', 2),
(17, 'Sergio', 'Etxaniz', '00000017M', 'Central', 90.00, 1.94, 'ESP', 2),
(18, 'Lucía', 'Urkijo', '00000018N', 'Líbero', 63.00, 1.66, 'ESP', 2),
(19, 'Fernando', 'Mendizabal', '00000019O', 'Armador', 75.00, 1.79, 'ESP', 2),
(20, 'Carmen', 'Aranburu', '00000020P', 'Opuesta', 70.00, 1.75, 'ESP', 2),
(21, 'Adrián', 'Zuloaga', '00000021Q', 'Central', 88.00, 1.92, 'ESP', 2),
(22, 'Claudia', 'Altuna', '00000022R', 'Receptora/Atacante', 68.00, 1.73, 'ESP', 2),
(23, 'Rubén', 'Aristi', '00000023S', 'Central', 91.00, 1.95, 'ESP', 2),
(24, 'Sandra', 'Zubieta', '00000024T', 'Líbero', 65.00, 1.68, 'ESP', 2),
(25, 'Marcos', 'Aretxaga', '00000025U', 'Armador', 76.00, 1.80, 'ESP', 3),
(26, 'Patricia', 'Mendieta', '00000026V', 'Opuesta', 72.00, 1.77, 'ESP', 3),
(27, 'Morlesin', 'Popov', '00000027W', 'Central', 87.00, 1.91, 'ESP', 3),
(28, 'Andrea', 'Etxeondo', '00000028X', 'Receptora/Atacante', 69.00, 1.74, 'ESP', 3),
(29, 'Álvaro', 'Altuna', '00000029Y', 'Central', 90.00, 1.94, 'ESP', 3),
(30, 'Eva', 'Urresti', '00000030Z', 'Líbero', 64.00, 1.67, 'ESP', 3),
(31, 'Roberto', 'Bilbao', '00000031A', 'Armador', 78.00, 1.83, 'ESP', 3),
(32, 'María', 'Zuloaga', '00000032B', 'Opuesta', 71.00, 1.76, 'ESP', 3),
(33, 'Luis', 'Lertxundi', '00000033C', 'Central', 88.00, 1.92, 'ESP', 3),
(34, 'Natalia', 'Goiko', '00000034D', 'Receptora/Atacante', 67.00, 1.72, 'ESP', 3),
(35, 'Diego', 'Aramendi', '00000035E', 'Central', 89.00, 1.93, 'ESP', 3),
(36, 'Beatriz', 'Zubia', '00000036F', 'Líbero', 66.00, 1.69, 'ESP', 3),
(37, 'Jonathan', 'Puccini', '00000037G', 'Armador', 79.00, 1.84, 'ITA', 4),
(38, 'Rosa', 'Santisteban', '00000038H', 'Opuesta', 72.00, 1.77, 'ESP', 4),
(39, 'Francisco', 'Zabala', '00000039I', 'Central', 87.00, 1.91, 'ESP', 4),
(40, 'Silvia', 'Kortazar', '00000040J', 'Receptora/Atacante', 68.00, 1.73, 'ESP', 4),
(41, 'José', 'Uranga', '00000041K', 'Central', 90.00, 1.94, 'ESP', 4),
(42, 'Teresa', 'Eguren', '00000042L', 'Líbero', 65.00, 1.68, 'ESP', 4),
(43, 'Juan', 'Goiko', '00000043M', 'Armador', 77.00, 1.81, 'ESP', 4),
(44, 'Raquel', 'Zarate', '00000044N', 'Opuesta', 70.00, 1.75, 'ESP', 4),
(45, 'Pedro', 'Lopez', '00000045O', 'Central', 89.00, 1.93, 'ESP', 4),
(46, 'Nuria', 'Elosegi', '00000046P', 'Receptora/Atacante', 67.00, 1.72, 'ESP', 4),
(47, 'Antonio', 'Berasategi', '00000047Q', 'Central', 91.00, 1.95, 'ESP', 4),
(48, 'Inés', 'Zubiri', '00000048R', 'Líbero', 64.00, 1.67, 'ESP', 4),
(49, 'Víctor', 'Bilbao', '00000049S', 'Armador', 78.00, 1.82, 'ESP', 5),
(50, 'Concha', 'Aranburu', '00000050T', 'Opuesta', 71.00, 1.76, 'ESP', 5),
(51, 'Ramón', 'Etxeberria', '00000051U', 'Central', 90.00, 1.94, 'ESP', 5),
(52, 'Lourdes', 'Zubizarreta', '00000052V', 'Receptora/Atacante', 68.00, 1.73, 'ESP', 5),
(53, 'Alberto', 'Goitia', '00000053W', 'Central', 88.00, 1.92, 'ESP', 5),
(54, 'Angela', 'Zabaleta', '00000054X', 'Líbero', 65.00, 1.68, 'ESP', 5),
(55, 'Enrique', 'Zubia', '00000055Y', 'Armador', 76.00, 1.80, 'ESP', 5),
(56, 'Mónica', 'Odriozola', '00000056Z', 'Opuesta', 72.00, 1.77, 'ESP', 5),
(57, 'Joaquín', 'Zuloaga', '00000057A', 'Central', 89.00, 1.93, 'ESP', 5),
(58, 'Lorena', 'Arregi', '00000058B', 'Receptora/Atacante', 67.00, 1.72, 'ESP', 5),
(59, 'Ricardo', 'Lertxundi', '00000059C', 'Central', 91.00, 1.95, 'ESP', 5),
(60, 'Esther', 'Goiko', '00000060D', 'Líbero', 64.00, 1.67, 'ESP', 5),
(61, 'Aitor', 'Arrieta', '00000061E', 'Armador', 77.00, 1.81, 'ESP', 6),
(62, 'Nerea', 'Bilbao', '00000062F', 'Opuesta', 71.00, 1.76, 'ESP', 6),
(63, 'Iker', 'Mendieta', '00000063G', 'Central', 88.00, 1.92, 'ESP', 6),
(64, 'Maialen', 'Lazkano', '00000064H', 'Receptora/Atacante', 68.00, 1.73, 'ESP', 6),
(65, 'Unai', 'Etxaniz', '00000065I', 'Central', 90.00, 1.94, 'ESP', 6),
(66, 'Ane', 'Iparragirre', '00000066J', 'Líbero', 65.00, 1.68, 'ESP', 6),
(67, 'Jon', 'Aramendi', '00000067K', 'Armador', 79.00, 1.84, 'ESP', 6),
(68, 'Leire', 'Ezkurdia', '00000068L', 'Opuesta', 70.00, 1.75, 'ESP', 6),
(69, 'Ander', 'Santamaria', '00000069M', 'Central', 87.00, 1.91, 'ESP', 6),
(70, 'Irati', 'Goienola', '00000070N', 'Receptora/Atacante', 67.00, 1.72, 'ESP', 6),
(71, 'Mikel', 'Zabala', '00000071O', 'Central', 91.00, 1.95, 'ESP', 6),
(72, 'Oihana', 'Altube', '00000072P', 'Líbero', 64.00, 1.67, 'ESP', 6);

INSERT INTO `jokalari_taldea` (`jokalariak_kod`, `taldea_kod`) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1),
(13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2),
(25, 3), (26, 3), (27, 3), (28, 3), (29, 3), (30, 3), (31, 3), (32, 3), (33, 3), (34, 3), (35, 3), (36, 3),
(37, 4), (38, 4), (39, 4), (40, 4), (41, 4), (42, 4), (43, 4), (44, 4), (45, 4), (46, 4), (47, 4), (48, 4),
(49, 5), (50, 5), (51, 5), (52, 5), (53, 5), (54, 5), (55, 5), (56, 5), (57, 5), (58, 5), (59, 5), (60, 5),
(61, 6), (62, 6), (63, 6), (64, 6), (65, 6), (66, 6), (67, 6), (68, 6), (69, 6), (70, 6), (71, 6), (72, 6);

INSERT INTO `partida` (`partida_kod`, `data`, `ordua`, `emaitza`, `zigorrak`, `txartelak`, `epailea_kod`) VALUES
(1, '2025-09-15', '18:00:00', '3-1', 2, 1, 1),
(2, '2025-09-15', '20:00:00', '3-2', 3, 2, 2),
(3, '2025-09-22', '18:00:00', '3-0', 1, 0, 3),
(4, '2025-09-22', '20:00:00', '2-3', 4, 3, 4),
(5, '2025-09-29', '18:00:00', '3-1', 2, 1, 5),
(6, '2025-09-29', '20:00:00', '1-3', 3, 2, 6),
(7, '2025-10-06', '18:00:00', '3-2', 2, 1, 7),
(8, '2025-10-06', '20:00:00', '3-0', 1, 0, 8),
(9, '2025-10-13', '18:00:00', '0-3', 5, 3, 1),
(10, '2025-10-13', '20:00:00', '3-1', 2, 1, 2),
(11, '2025-10-20', '18:00:00', '2-3', 4, 2, 3),
(12, '2025-10-20', '20:00:00', '3-0', 1, 0, 4),
(13, '2025-10-27', '18:00:00', '3-2', 3, 2, 5),
(14, '2025-10-27', '20:00:00', '1-3', 2, 1, 6),
(15, '2025-11-03', '18:00:00', '3-1', 2, 1, 7);

INSERT INTO `partida_jaurdunaldia` (`partida_kod`, `jaurdunaldi_kod`) VALUES
(1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3), (7, 4), (8, 4),
(9, 5), (10, 5), (11, 6), (12, 6), (13, 7), (14, 7), (15, 8);

INSERT INTO `taldea` (`taldea_kod`, `izena`, `sortze_data`, `zelaia`) VALUES
(1, 'Matiko Txirrindulariak', '1998-01-01', 1),
(2, 'Miribilla Uhinen Jokoak', '2002-01-01', 2),
(3, 'Txurdinaga Harriak', '2000-01-01', 3),
(4, 'Usansolo Ortzadak', '2005-01-01', 4),
(5, 'Santutxu Haizeak', '1997-01-01', 5),
(6, 'Otxarkoaga Distira', '2010-01-01', 6);

INSERT INTO `taldea_denboraldia` (`taldea_kod`, `denboraldia_kod`, `irabaziak`, `galduak`, `puntuak`, `posizioa`) VALUES
(1, 1, 8, 2, 24, 1), (2, 1, 6, 4, 18, 3), (3, 1, 7, 3, 21, 2),
(4, 1, 5, 5, 15, 4), (5, 1, 3, 7, 9, 5), (6, 1, 1, 9, 3, 6);

INSERT INTO `taldea_partida` (`taldea_kod`, `partida_kod`) VALUES
(1, 1), (1, 4), (1, 6), (1, 10), (1, 13),
(2, 1), (2, 5), (2, 7), (2, 11), (2, 14),
(3, 2), (3, 4), (3, 8), (3, 12), (3, 14),
(4, 2), (4, 5), (4, 9), (4, 10), (4, 15),
(5, 3), (5, 6), (5, 8), (5, 11), (5, 13),
(6, 3), (6, 7), (6, 9), (6, 12), (6, 15);

INSERT INTO `zelaia` (`zelaia_kod`, `izena`, `kokapena`, `kapazitatea`) VALUES
(1, 'Frontón Matiko', 'Matiko', 1200),
(2, 'Polideportivo Miribilla', 'Miribilla', 3000),
(3, 'Frontón Txurdinaga', 'Txurdinaga', 1500),
(4, 'Polideportivo Usansolo', 'Usansolo', 2500),
(5, 'Frontón Santutxu', 'Santutxu', 1400),
(6, 'Polideportivo Otxarkoaga', 'Otxarkoaga', 2800);

-- --------------------------------------------------------
-- 3. CLAVES PRIMARIAS (PK)
-- --------------------------------------------------------

ALTER TABLE `denboraldia` ADD PRIMARY KEY (`denboraldia_kod`);
ALTER TABLE `denboraldia_jaurdunaldia` ADD PRIMARY KEY (`denboraldia_kod`,`jaurdunaldi_kod`);
ALTER TABLE `entrenatzailea` ADD PRIMARY KEY (`entrenatzaile_kod`);
ALTER TABLE `epailea` ADD PRIMARY KEY (`epailea_kod`);
ALTER TABLE `jaurdunaldia` ADD PRIMARY KEY (`jaurdunaldi_kod`);
ALTER TABLE `jokalariak` ADD PRIMARY KEY (`jokalariak_kod`);
ALTER TABLE `jokalari_taldea` ADD PRIMARY KEY (`jokalariak_kod`,`taldea_kod`);
ALTER TABLE `partida` ADD PRIMARY KEY (`partida_kod`);
ALTER TABLE `partida_jaurdunaldia` ADD PRIMARY KEY (`partida_kod`,`jaurdunaldi_kod`);
ALTER TABLE `taldea` ADD PRIMARY KEY (`taldea_kod`);
ALTER TABLE `taldea_denboraldia` ADD PRIMARY KEY (`taldea_kod`,`denboraldia_kod`);
ALTER TABLE `taldea_partida` ADD PRIMARY KEY (`taldea_kod`,`partida_kod`);
ALTER TABLE `zelaia` ADD PRIMARY KEY (`zelaia_kod`);

-- --------------------------------------------------------
-- 4. AUTO_INCREMENT
-- --------------------------------------------------------

ALTER TABLE `denboraldia` MODIFY `denboraldia_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
ALTER TABLE `entrenatzailea` MODIFY `entrenatzaile_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `epailea` MODIFY `epailea_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
ALTER TABLE `jaurdunaldia` MODIFY `jaurdunaldi_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
ALTER TABLE `jokalariak` MODIFY `jokalariak_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
ALTER TABLE `partida` MODIFY `partida_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
ALTER TABLE `taldea` MODIFY `taldea_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `zelaia` MODIFY `zelaia_kod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-- --------------------------------------------------------
-- 5. ÍNDICES ADICIONALES
-- --------------------------------------------------------

ALTER TABLE `denboraldia_jaurdunaldia` ADD KEY `jaurdunaldi_kod` (`jaurdunaldi_kod`);
ALTER TABLE `entrenatzailea` ADD UNIQUE KEY `taldea_kod` (`taldea_kod`);
ALTER TABLE `jokalari_taldea` ADD KEY `taldea_kod` (`taldea_kod`);
ALTER TABLE `partida` ADD KEY `epailea_kod` (`epailea_kod`);
ALTER TABLE `partida_jaurdunaldia` ADD KEY `jaurdunaldi_kod` (`jaurdunaldi_kod`);
ALTER TABLE `taldea` ADD KEY `zelaia` (`zelaia`);
ALTER TABLE `taldea_denboraldia` ADD KEY `denboraldia_kod` (`denboraldia_kod`);
ALTER TABLE `taldea_partida` ADD KEY `partida_kod` (`partida_kod`);

-- Índices extra solicitados (NAN Unique, Busquedas)
ALTER TABLE `jokalariak` ADD UNIQUE KEY `NAN` (`NAN`);
ALTER TABLE `entrenatzailea` ADD UNIQUE KEY `NAN` (`NAN`);
ALTER TABLE `epailea` ADD UNIQUE KEY `NAN` (`NAN`);
ALTER TABLE `jokalariak` ADD INDEX `idx_posizioa` (`posizioa`);
ALTER TABLE `jokalariak` ADD INDEX `idx_altuera` (`altuera`);
ALTER TABLE `jokalariak` ADD INDEX `idx_izena_abizena` (`izena`, `abizena`);

-- --------------------------------------------------------
-- 6. RESTRICCIONES (FOREIGN KEYS y CHECK)
-- --------------------------------------------------------

-- Filtros para denboraldia_jaurdunaldia
ALTER TABLE `denboraldia_jaurdunaldia`
  ADD CONSTRAINT `denboraldia_jaurdunaldia_ibfk_1` FOREIGN KEY (`denboraldia_kod`) REFERENCES `denboraldia` (`denboraldia_kod`),
  ADD CONSTRAINT `denboraldia_jaurdunaldia_ibfk_2` FOREIGN KEY (`jaurdunaldi_kod`) REFERENCES `jaurdunaldia` (`jaurdunaldi_kod`);

-- Filtros para entrenatzailea
ALTER TABLE `entrenatzailea`
  ADD CONSTRAINT `entrenatzailea_ibfk_1` FOREIGN KEY (`taldea_kod`) REFERENCES `taldea` (`taldea_kod`);

-- Filtros para jokalariak (AQUÍ ESTÁ LA CORRECCIÓN CLAVE)
ALTER TABLE `jokalariak`
  ADD CONSTRAINT `fk_taldea` FOREIGN KEY (`taldea_kod`) REFERENCES `taldea` (`taldea_kod`);

-- Filtros para jokalari_taldea
ALTER TABLE `jokalari_taldea`
  ADD CONSTRAINT `jokalari_taldea_ibfk_1` FOREIGN KEY (`jokalariak_kod`) REFERENCES `jokalariak` (`jokalariak_kod`),
  ADD CONSTRAINT `jokalari_taldea_ibfk_2` FOREIGN KEY (`taldea_kod`) REFERENCES `taldea` (`taldea_kod`);

-- Filtros para partida
ALTER TABLE `partida`
  ADD CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`epailea_kod`) REFERENCES `epailea` (`epailea_kod`);

-- Filtros para partida_jaurdunaldia
ALTER TABLE `partida_jaurdunaldia`
  ADD CONSTRAINT `partida_jaurdunaldia_ibfk_1` FOREIGN KEY (`partida_kod`) REFERENCES `partida` (`partida_kod`),
  ADD CONSTRAINT `partida_jaurdunaldia_ibfk_2` FOREIGN KEY (`jaurdunaldi_kod`) REFERENCES `jaurdunaldia` (`jaurdunaldi_kod`);

-- Filtros para taldea
ALTER TABLE `taldea`
  ADD CONSTRAINT `taldea_ibfk_1` FOREIGN KEY (`zelaia`) REFERENCES `zelaia` (`zelaia_kod`);

-- Filtros para taldea_denboraldia
ALTER TABLE `taldea_denboraldia`
  ADD CONSTRAINT `taldea_denboraldia_ibfk_1` FOREIGN KEY (`taldea_kod`) REFERENCES `taldea` (`taldea_kod`),
  ADD CONSTRAINT `taldea_denboraldia_ibfk_2` FOREIGN KEY (`denboraldia_kod`) REFERENCES `denboraldia` (`denboraldia_kod`);

-- Filtros para taldea_partida
ALTER TABLE `taldea_partida`
  ADD CONSTRAINT `taldea_partida_ibfk_1` FOREIGN KEY (`taldea_kod`) REFERENCES `taldea` (`taldea_kod`),
  ADD CONSTRAINT `taldea_partida_ibfk_2` FOREIGN KEY (`partida_kod`) REFERENCES `partida` (`partida_kod`);

-- Restricciones CHECK para jokalariak (Altura y Peso)
-- Se usan valores razonables para evitar errores
ALTER TABLE `jokalariak`
  ADD CONSTRAINT `chk_altuera` CHECK (`altuera` BETWEEN 1.50 AND 2.20),
  ADD CONSTRAINT `chk_pisua` CHECK (`pisua` BETWEEN 50 AND 120);

-- --------------------------------------------------------
-- 7. TRIGGERS
-- --------------------------------------------------------

DELIMITER $$
CREATE TRIGGER `trg_check_nan_format` BEFORE INSERT ON `jokalariak`
FOR EACH ROW
BEGIN
    IF NEW.NAN IS NOT NULL AND NOT (NEW.NAN REGEXP '^[0-9]{8}[A-Z]$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Formato NAN inválido. Debe ser 8 dígitos seguidos de 1 letra mayúscula.';
    END IF;
END$$
DELIMITER ;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;