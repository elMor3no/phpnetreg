-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 20-03-2015 a las 00:21:32
-- Versión del servidor: 5.5.41
-- Versión de PHP: 5.4.36-0+deb7u3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Area`
--

CREATE TABLE IF NOT EXISTS `Area` (
  `idArea` int(11) NOT NULL AUTO_INCREMENT,
  `Nombrearea` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `CLibertad_idCLibertad` int(11) NOT NULL,
  PRIMARY KEY (`idArea`),
  KEY `fk_Area_CLibertad` (`CLibertad_idCLibertad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `Area`
--

INSERT INTO `Area` (`idArea`, `Nombrearea`, `descripcion`, `CLibertad_idCLibertad`) VALUES
(2, 'TVE', '', 1),
(3, 'Laboratorio1', '', 2),
(4, 'Laboratorio', '', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLibertad`
--

CREATE TABLE IF NOT EXISTS `CLibertad` (
  `idCLibertad` int(11) NOT NULL AUTO_INCREMENT,
  `local` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idCLibertad`),
  UNIQUE KEY `local_unique` (`local`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `CLibertad`
--

INSERT INTO `CLibertad` (`idCLibertad`, `local`, `descripcion`) VALUES
(1, 'Edificio Central', 'Edificio Central'),
(2, 'Flex', 'Facultad de Lenguas Extranjeras'),
(3, 'Infantil', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dispositivo`
--

CREATE TABLE IF NOT EXISTS `Dispositivo` (
  `idDispositivo` int(11) NOT NULL AUTO_INCREMENT,
  `NombDisp` varchar(45) DEFAULT NULL,
  `mac` varchar(45) DEFAULT NULL,
  `responsable` varchar(45) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `finsercion` date DEFAULT NULL,
  `fcaducidad` date DEFAULT NULL,
  `feliminacion` date DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `VRectoria_idVRectoria` int(11) NOT NULL,
  `TipoDispositivo_idTipoDispositivo` int(11) NOT NULL,
  `Area_idArea` int(11) NOT NULL,
  `IP_idIP` int(11) NOT NULL,
  PRIMARY KEY (`idDispositivo`,`VRectoria_idVRectoria`,`TipoDispositivo_idTipoDispositivo`,`Area_idArea`,`IP_idIP`),
  UNIQUE KEY `NombDisp_UNIQUE` (`NombDisp`),
  UNIQUE KEY `mac_UNIQUE` (`mac`),
  KEY `fk_Dispositivo_VRectoria1` (`VRectoria_idVRectoria`),
  KEY `fk_Dispositivo_TipoDispositivo1` (`TipoDispositivo_idTipoDispositivo`),
  KEY `fk_Dispositivo_Area1` (`Area_idArea`),
  KEY `fk_Dispositivo_IP1` (`IP_idIP`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `Dispositivo`
--

INSERT INTO `Dispositivo` (`idDispositivo`, `NombDisp`, `mac`, `responsable`, `observacion`, `finsercion`, `fcaducidad`, `feliminacion`, `disponible`, `VRectoria_idVRectoria`, `TipoDispositivo_idTipoDispositivo`, `Area_idArea`, `IP_idIP`) VALUES
(1, 'mipc', '00:01:02:03:04:05', 'Pablo Mestre', 'Adminsitrador de red', '2015-03-20', NULL, NULL, 1, 2, 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `IP`
--

CREATE TABLE IF NOT EXISTS `IP` (
  `idIP` int(11) NOT NULL AUTO_INCREMENT,
  `ipnum` varchar(45) DEFAULT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `Subnet_idSubnet` int(11) NOT NULL,
  PRIMARY KEY (`idIP`),
  UNIQUE KEY `ipnum_UNIQUE` (`ipnum`),
  KEY `fk_IP_Subnet1` (`Subnet_idSubnet`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1017 ;

--
-- Volcado de datos para la tabla `IP`
--

INSERT INTO `IP` (`idIP`, `ipnum`, `used`, `Subnet_idSubnet`) VALUES
(1, '167837953', 0, 5),
(2, '167837954', 1, 5),
(3, '167837955', 0, 5),
(4, '167837956', 0, 5),
(5, '167837957', 1, 5),
(6, '167837958', 0, 5),
(7, '167837959', 0, 5),
(8, '167837960', 0, 5),
(9, '167837961', 0, 5),
(10, '167837962', 0, 5),
(11, '167837963', 0, 5),
(12, '167837964', 0, 5),
(13, '167837965', 0, 5),
(14, '167837966', 0, 5),
(15, '167837967', 0, 5),
(16, '167837968', 0, 5),
(17, '167837969', 0, 5),
(18, '167837970', 0, 5),
(19, '167837971', 0, 5),
(20, '167837972', 0, 5),
(21, '167837973', 0, 5),
(22, '167837974', 0, 5),
(23, '167837975', 0, 5),
(24, '167837976', 0, 5),
(25, '167837977', 0, 5),
(26, '167837978', 0, 5),
(27, '167837979', 0, 5),
(28, '167837980', 0, 5),
(29, '167837981', 0, 5),
(30, '167837982', 0, 5),
(31, '167837983', 0, 5),
(32, '167837984', 0, 5),
(33, '167837985', 0, 5),
(34, '167837986', 0, 5),
(35, '167837987', 0, 5),
(36, '167837988', 0, 5),
(37, '167837989', 0, 5),
(38, '167837990', 0, 5),
(39, '167837991', 0, 5),
(40, '167837992', 0, 5),
(41, '167837993', 0, 5),
(42, '167837994', 0, 5),
(43, '167837995', 0, 5),
(44, '167837996', 0, 5),
(45, '167837997', 0, 5),
(46, '167837998', 0, 5),
(47, '167837999', 0, 5),
(48, '167838000', 0, 5),
(49, '167838001', 0, 5),
(50, '167838002', 0, 5),
(51, '167838003', 0, 5),
(52, '167838004', 0, 5),
(53, '167838005', 0, 5),
(54, '167838006', 0, 5),
(55, '167838007', 0, 5),
(56, '167838008', 0, 5),
(57, '167838009', 0, 5),
(58, '167838010', 0, 5),
(59, '167838011', 0, 5),
(60, '167838012', 0, 5),
(61, '167838013', 0, 5),
(62, '167838014', 0, 5),
(63, '167838015', 0, 5),
(64, '167838016', 0, 5),
(65, '167838017', 0, 5),
(66, '167838018', 0, 5),
(67, '167838019', 0, 5),
(68, '167838020', 0, 5),
(69, '167838021', 0, 5),
(70, '167838022', 0, 5),
(71, '167838023', 0, 5),
(72, '167838024', 0, 5),
(73, '167838025', 0, 5),
(74, '167838026', 0, 5),
(75, '167838027', 0, 5),
(76, '167838028', 0, 5),
(77, '167838029', 0, 5),
(78, '167838030', 0, 5),
(79, '167838031', 0, 5),
(80, '167838032', 0, 5),
(81, '167838033', 0, 5),
(82, '167838034', 0, 5),
(83, '167838035', 0, 5),
(84, '167838036', 0, 5),
(85, '167838037', 0, 5),
(86, '167838038', 0, 5),
(87, '167838039', 0, 5),
(88, '167838040', 0, 5),
(89, '167838041', 0, 5),
(90, '167838042', 0, 5),
(91, '167838043', 0, 5),
(92, '167838044', 0, 5),
(93, '167838045', 0, 5),
(94, '167838046', 0, 5),
(95, '167838047', 0, 5),
(96, '167838048', 0, 5),
(97, '167838049', 0, 5),
(98, '167838050', 0, 5),
(99, '167838051', 0, 5),
(100, '167838052', 0, 5),
(101, '167838053', 0, 5),
(102, '167838054', 0, 5),
(103, '167838055', 0, 5),
(104, '167838056', 0, 5),
(105, '167838057', 0, 5),
(106, '167838058', 0, 5),
(107, '167838059', 0, 5),
(108, '167838060', 0, 5),
(109, '167838061', 0, 5),
(110, '167838062', 0, 5),
(111, '167838063', 0, 5),
(112, '167838064', 0, 5),
(113, '167838065', 0, 5),
(114, '167838066', 0, 5),
(115, '167838067', 0, 5),
(116, '167838068', 0, 5),
(117, '167838069', 0, 5),
(118, '167838070', 0, 5),
(119, '167838071', 0, 5),
(120, '167838072', 0, 5),
(121, '167838073', 0, 5),
(122, '167838074', 0, 5),
(123, '167838075', 0, 5),
(124, '167838076', 0, 5),
(125, '167838077', 0, 5),
(126, '167838078', 0, 5),
(127, '167838079', 0, 5),
(128, '167838080', 0, 5),
(129, '167838081', 0, 5),
(130, '167838082', 0, 5),
(131, '167838083', 0, 5),
(132, '167838084', 0, 5),
(133, '167838085', 0, 5),
(134, '167838086', 0, 5),
(135, '167838087', 0, 5),
(136, '167838088', 0, 5),
(137, '167838089', 0, 5),
(138, '167838090', 0, 5),
(139, '167838091', 0, 5),
(140, '167838092', 0, 5),
(141, '167838093', 0, 5),
(142, '167838094', 0, 5),
(143, '167838095', 0, 5),
(144, '167838096', 0, 5),
(145, '167838097', 0, 5),
(146, '167838098', 0, 5),
(147, '167838099', 0, 5),
(148, '167838100', 0, 5),
(149, '167838101', 0, 5),
(150, '167838102', 0, 5),
(151, '167838103', 0, 5),
(152, '167838104', 0, 5),
(153, '167838105', 0, 5),
(154, '167838106', 0, 5),
(155, '167838107', 0, 5),
(156, '167838108', 0, 5),
(157, '167838109', 0, 5),
(158, '167838110', 0, 5),
(159, '167838111', 0, 5),
(160, '167838112', 0, 5),
(161, '167838113', 0, 5),
(162, '167838114', 0, 5),
(163, '167838115', 0, 5),
(164, '167838116', 0, 5),
(165, '167838117', 0, 5),
(166, '167838118', 0, 5),
(167, '167838119', 0, 5),
(168, '167838120', 0, 5),
(169, '167838121', 0, 5),
(170, '167838122', 0, 5),
(171, '167838123', 0, 5),
(172, '167838124', 0, 5),
(173, '167838125', 0, 5),
(174, '167838126', 0, 5),
(175, '167838127', 0, 5),
(176, '167838128', 0, 5),
(177, '167838129', 0, 5),
(178, '167838130', 0, 5),
(179, '167838131', 0, 5),
(180, '167838132', 0, 5),
(181, '167838133', 0, 5),
(182, '167838134', 0, 5),
(183, '167838135', 0, 5),
(184, '167838136', 0, 5),
(185, '167838137', 0, 5),
(186, '167838138', 0, 5),
(187, '167838139', 0, 5),
(188, '167838140', 0, 5),
(189, '167838141', 0, 5),
(190, '167838142', 0, 5),
(191, '167838143', 0, 5),
(192, '167838144', 0, 5),
(193, '167838145', 0, 5),
(194, '167838146', 0, 5),
(195, '167838147', 0, 5),
(196, '167838148', 0, 5),
(197, '167838149', 0, 5),
(198, '167838150', 0, 5),
(199, '167838151', 0, 5),
(200, '167838152', 0, 5),
(201, '167838153', 0, 5),
(202, '167838154', 0, 5),
(203, '167838155', 0, 5),
(204, '167838156', 0, 5),
(205, '167838157', 0, 5),
(206, '167838158', 0, 5),
(207, '167838159', 0, 5),
(208, '167838160', 0, 5),
(209, '167838161', 0, 5),
(210, '167838162', 0, 5),
(211, '167838163', 0, 5),
(212, '167838164', 0, 5),
(213, '167838165', 0, 5),
(214, '167838166', 0, 5),
(215, '167838167', 0, 5),
(216, '167838168', 0, 5),
(217, '167838169', 0, 5),
(218, '167838170', 0, 5),
(219, '167838171', 0, 5),
(220, '167838172', 0, 5),
(221, '167838173', 0, 5),
(222, '167838174', 0, 5),
(223, '167838175', 0, 5),
(224, '167838176', 0, 5),
(225, '167838177', 0, 5),
(226, '167838178', 0, 5),
(227, '167838179', 0, 5),
(228, '167838180', 0, 5),
(229, '167838181', 0, 5),
(230, '167838182', 0, 5),
(231, '167838183', 0, 5),
(232, '167838184', 0, 5),
(233, '167838185', 0, 5),
(234, '167838186', 0, 5),
(235, '167838187', 0, 5),
(236, '167838188', 0, 5),
(237, '167838189', 0, 5),
(238, '167838190', 0, 5),
(239, '167838191', 0, 5),
(240, '167838192', 0, 5),
(241, '167838193', 0, 5),
(242, '167838194', 0, 5),
(243, '167838195', 0, 5),
(244, '167838196', 0, 5),
(245, '167838197', 0, 5),
(246, '167838198', 0, 5),
(247, '167838199', 0, 5),
(248, '167838200', 0, 5),
(249, '167838201', 0, 5),
(250, '167838202', 0, 5),
(251, '167838203', 0, 5),
(252, '167838204', 0, 5),
(253, '167838205', 0, 5),
(254, '167838206', 0, 5),
(255, '167838209', 0, 6),
(256, '167838210', 0, 6),
(257, '167838211', 0, 6),
(258, '167838212', 0, 6),
(259, '167838213', 0, 6),
(260, '167838214', 0, 6),
(261, '167838215', 0, 6),
(262, '167838216', 0, 6),
(263, '167838217', 0, 6),
(264, '167838218', 0, 6),
(265, '167838219', 0, 6),
(266, '167838220', 0, 6),
(267, '167838221', 0, 6),
(268, '167838222', 0, 6),
(269, '167838223', 0, 6),
(270, '167838224', 0, 6),
(271, '167838225', 0, 6),
(272, '167838226', 0, 6),
(273, '167838227', 0, 6),
(274, '167838228', 0, 6),
(275, '167838229', 0, 6),
(276, '167838230', 0, 6),
(277, '167838231', 0, 6),
(278, '167838232', 0, 6),
(279, '167838233', 0, 6),
(280, '167838234', 0, 6),
(281, '167838235', 0, 6),
(282, '167838236', 0, 6),
(283, '167838237', 0, 6),
(284, '167838238', 0, 6),
(285, '167838239', 0, 6),
(286, '167838240', 0, 6),
(287, '167838241', 0, 6),
(288, '167838242', 0, 6),
(289, '167838243', 0, 6),
(290, '167838244', 0, 6),
(291, '167838245', 0, 6),
(292, '167838246', 0, 6),
(293, '167838247', 0, 6),
(294, '167838248', 0, 6),
(295, '167838249', 0, 6),
(296, '167838250', 0, 6),
(297, '167838251', 0, 6),
(298, '167838252', 0, 6),
(299, '167838253', 0, 6),
(300, '167838254', 0, 6),
(301, '167838255', 0, 6),
(302, '167838256', 0, 6),
(303, '167838257', 0, 6),
(304, '167838258', 0, 6),
(305, '167838259', 0, 6),
(306, '167838260', 0, 6),
(307, '167838261', 0, 6),
(308, '167838262', 0, 6),
(309, '167838263', 0, 6),
(310, '167838264', 0, 6),
(311, '167838265', 0, 6),
(312, '167838266', 0, 6),
(313, '167838267', 0, 6),
(314, '167838268', 0, 6),
(315, '167838269', 0, 6),
(316, '167838270', 0, 6),
(317, '167838271', 0, 6),
(318, '167838272', 0, 6),
(319, '167838273', 0, 6),
(320, '167838274', 0, 6),
(321, '167838275', 0, 6),
(322, '167838276', 0, 6),
(323, '167838277', 0, 6),
(324, '167838278', 0, 6),
(325, '167838279', 0, 6),
(326, '167838280', 0, 6),
(327, '167838281', 0, 6),
(328, '167838282', 0, 6),
(329, '167838283', 0, 6),
(330, '167838284', 0, 6),
(331, '167838285', 0, 6),
(332, '167838286', 0, 6),
(333, '167838287', 0, 6),
(334, '167838288', 0, 6),
(335, '167838289', 0, 6),
(336, '167838290', 0, 6),
(337, '167838291', 0, 6),
(338, '167838292', 0, 6),
(339, '167838293', 0, 6),
(340, '167838294', 0, 6),
(341, '167838295', 0, 6),
(342, '167838296', 0, 6),
(343, '167838297', 0, 6),
(344, '167838298', 0, 6),
(345, '167838299', 0, 6),
(346, '167838300', 0, 6),
(347, '167838301', 0, 6),
(348, '167838302', 0, 6),
(349, '167838303', 0, 6),
(350, '167838304', 0, 6),
(351, '167838305', 0, 6),
(352, '167838306', 0, 6),
(353, '167838307', 0, 6),
(354, '167838308', 0, 6),
(355, '167838309', 0, 6),
(356, '167838310', 0, 6),
(357, '167838311', 0, 6),
(358, '167838312', 0, 6),
(359, '167838313', 0, 6),
(360, '167838314', 0, 6),
(361, '167838315', 0, 6),
(362, '167838316', 0, 6),
(363, '167838317', 0, 6),
(364, '167838318', 0, 6),
(365, '167838319', 0, 6),
(366, '167838320', 0, 6),
(367, '167838321', 0, 6),
(368, '167838322', 0, 6),
(369, '167838323', 0, 6),
(370, '167838324', 0, 6),
(371, '167838325', 0, 6),
(372, '167838326', 0, 6),
(373, '167838327', 0, 6),
(374, '167838328', 0, 6),
(375, '167838329', 0, 6),
(376, '167838330', 0, 6),
(377, '167838331', 0, 6),
(378, '167838332', 0, 6),
(379, '167838333', 0, 6),
(380, '167838334', 0, 6),
(381, '167838335', 0, 6),
(382, '167838336', 0, 6),
(383, '167838337', 0, 6),
(384, '167838338', 0, 6),
(385, '167838339', 0, 6),
(386, '167838340', 0, 6),
(387, '167838341', 0, 6),
(388, '167838342', 0, 6),
(389, '167838343', 0, 6),
(390, '167838344', 0, 6),
(391, '167838345', 0, 6),
(392, '167838346', 0, 6),
(393, '167838347', 0, 6),
(394, '167838348', 0, 6),
(395, '167838349', 0, 6),
(396, '167838350', 0, 6),
(397, '167838351', 0, 6),
(398, '167838352', 0, 6),
(399, '167838353', 0, 6),
(400, '167838354', 0, 6),
(401, '167838355', 0, 6),
(402, '167838356', 0, 6),
(403, '167838357', 0, 6),
(404, '167838358', 0, 6),
(405, '167838359', 0, 6),
(406, '167838360', 0, 6),
(407, '167838361', 0, 6),
(408, '167838362', 0, 6),
(409, '167838363', 0, 6),
(410, '167838364', 0, 6),
(411, '167838365', 0, 6),
(412, '167838366', 0, 6),
(413, '167838367', 0, 6),
(414, '167838368', 0, 6),
(415, '167838369', 0, 6),
(416, '167838370', 0, 6),
(417, '167838371', 0, 6),
(418, '167838372', 0, 6),
(419, '167838373', 0, 6),
(420, '167838374', 0, 6),
(421, '167838375', 0, 6),
(422, '167838376', 0, 6),
(423, '167838377', 0, 6),
(424, '167838378', 0, 6),
(425, '167838379', 0, 6),
(426, '167838380', 0, 6),
(427, '167838381', 0, 6),
(428, '167838382', 0, 6),
(429, '167838383', 0, 6),
(430, '167838384', 0, 6),
(431, '167838385', 0, 6),
(432, '167838386', 0, 6),
(433, '167838387', 0, 6),
(434, '167838388', 0, 6),
(435, '167838389', 0, 6),
(436, '167838390', 0, 6),
(437, '167838391', 0, 6),
(438, '167838392', 0, 6),
(439, '167838393', 0, 6),
(440, '167838394', 0, 6),
(441, '167838395', 0, 6),
(442, '167838396', 0, 6),
(443, '167838397', 0, 6),
(444, '167838398', 0, 6),
(445, '167838399', 0, 6),
(446, '167838400', 0, 6),
(447, '167838401', 0, 6),
(448, '167838402', 0, 6),
(449, '167838403', 0, 6),
(450, '167838404', 0, 6),
(451, '167838405', 0, 6),
(452, '167838406', 0, 6),
(453, '167838407', 0, 6),
(454, '167838408', 0, 6),
(455, '167838409', 0, 6),
(456, '167838410', 0, 6),
(457, '167838411', 0, 6),
(458, '167838412', 0, 6),
(459, '167838413', 0, 6),
(460, '167838414', 0, 6),
(461, '167838415', 0, 6),
(462, '167838416', 0, 6),
(463, '167838417', 0, 6),
(464, '167838418', 0, 6),
(465, '167838419', 0, 6),
(466, '167838420', 0, 6),
(467, '167838421', 0, 6),
(468, '167838422', 0, 6),
(469, '167838423', 0, 6),
(470, '167838424', 0, 6),
(471, '167838425', 0, 6),
(472, '167838426', 0, 6),
(473, '167838427', 0, 6),
(474, '167838428', 0, 6),
(475, '167838429', 0, 6),
(476, '167838430', 0, 6),
(477, '167838431', 0, 6),
(478, '167838432', 0, 6),
(479, '167838433', 0, 6),
(480, '167838434', 0, 6),
(481, '167838435', 0, 6),
(482, '167838436', 0, 6),
(483, '167838437', 0, 6),
(484, '167838438', 0, 6),
(485, '167838439', 0, 6),
(486, '167838440', 0, 6),
(487, '167838441', 0, 6),
(488, '167838442', 0, 6),
(489, '167838443', 0, 6),
(490, '167838444', 0, 6),
(491, '167838445', 0, 6),
(492, '167838446', 0, 6),
(493, '167838447', 0, 6),
(494, '167838448', 0, 6),
(495, '167838449', 0, 6),
(496, '167838450', 0, 6),
(497, '167838451', 0, 6),
(498, '167838452', 0, 6),
(499, '167838453', 0, 6),
(500, '167838454', 0, 6),
(501, '167838455', 0, 6),
(502, '167838456', 0, 6),
(503, '167838457', 0, 6),
(504, '167838458', 0, 6),
(505, '167838459', 0, 6),
(506, '167838460', 0, 6),
(507, '167838461', 0, 6),
(508, '167838462', 0, 6),
(509, '167841537', 0, 7),
(510, '167841538', 0, 7),
(511, '167841539', 0, 7),
(512, '167841540', 0, 7),
(513, '167841541', 0, 7),
(514, '167841542', 0, 7),
(515, '167841543', 0, 7),
(516, '167841544', 0, 7),
(517, '167841545', 0, 7),
(518, '167841546', 0, 7),
(519, '167841547', 0, 7),
(520, '167841548', 0, 7),
(521, '167841549', 0, 7),
(522, '167841550', 0, 7),
(523, '167841551', 0, 7),
(524, '167841552', 0, 7),
(525, '167841553', 0, 7),
(526, '167841554', 0, 7),
(527, '167841555', 0, 7),
(528, '167841556', 0, 7),
(529, '167841557', 0, 7),
(530, '167841558', 0, 7),
(531, '167841559', 0, 7),
(532, '167841560', 0, 7),
(533, '167841561', 0, 7),
(534, '167841562', 0, 7),
(535, '167841563', 0, 7),
(536, '167841564', 0, 7),
(537, '167841565', 0, 7),
(538, '167841566', 0, 7),
(539, '167841567', 0, 7),
(540, '167841568', 0, 7),
(541, '167841569', 0, 7),
(542, '167841570', 0, 7),
(543, '167841571', 0, 7),
(544, '167841572', 0, 7),
(545, '167841573', 0, 7),
(546, '167841574', 0, 7),
(547, '167841575', 0, 7),
(548, '167841576', 0, 7),
(549, '167841577', 0, 7),
(550, '167841578', 0, 7),
(551, '167841579', 0, 7),
(552, '167841580', 0, 7),
(553, '167841581', 0, 7),
(554, '167841582', 0, 7),
(555, '167841583', 0, 7),
(556, '167841584', 0, 7),
(557, '167841585', 0, 7),
(558, '167841586', 0, 7),
(559, '167841587', 0, 7),
(560, '167841588', 0, 7),
(561, '167841589', 0, 7),
(562, '167841590', 0, 7),
(563, '167841591', 0, 7),
(564, '167841592', 0, 7),
(565, '167841593', 0, 7),
(566, '167841594', 0, 7),
(567, '167841595', 0, 7),
(568, '167841596', 0, 7),
(569, '167841597', 0, 7),
(570, '167841598', 0, 7),
(571, '167841599', 0, 7),
(572, '167841600', 0, 7),
(573, '167841601', 0, 7),
(574, '167841602', 0, 7),
(575, '167841603', 0, 7),
(576, '167841604', 0, 7),
(577, '167841605', 0, 7),
(578, '167841606', 0, 7),
(579, '167841607', 0, 7),
(580, '167841608', 0, 7),
(581, '167841609', 0, 7),
(582, '167841610', 0, 7),
(583, '167841611', 0, 7),
(584, '167841612', 0, 7),
(585, '167841613', 0, 7),
(586, '167841614', 0, 7),
(587, '167841615', 0, 7),
(588, '167841616', 0, 7),
(589, '167841617', 0, 7),
(590, '167841618', 0, 7),
(591, '167841619', 0, 7),
(592, '167841620', 0, 7),
(593, '167841621', 0, 7),
(594, '167841622', 0, 7),
(595, '167841623', 0, 7),
(596, '167841624', 0, 7),
(597, '167841625', 0, 7),
(598, '167841626', 0, 7),
(599, '167841627', 0, 7),
(600, '167841628', 0, 7),
(601, '167841629', 0, 7),
(602, '167841630', 0, 7),
(603, '167841631', 0, 7),
(604, '167841632', 0, 7),
(605, '167841633', 0, 7),
(606, '167841634', 0, 7),
(607, '167841635', 0, 7),
(608, '167841636', 0, 7),
(609, '167841637', 0, 7),
(610, '167841638', 0, 7),
(611, '167841639', 0, 7),
(612, '167841640', 0, 7),
(613, '167841641', 0, 7),
(614, '167841642', 0, 7),
(615, '167841643', 0, 7),
(616, '167841644', 0, 7),
(617, '167841645', 0, 7),
(618, '167841646', 0, 7),
(619, '167841647', 0, 7),
(620, '167841648', 0, 7),
(621, '167841649', 0, 7),
(622, '167841650', 0, 7),
(623, '167841651', 0, 7),
(624, '167841652', 0, 7),
(625, '167841653', 0, 7),
(626, '167841654', 0, 7),
(627, '167841655', 0, 7),
(628, '167841656', 0, 7),
(629, '167841657', 0, 7),
(630, '167841658', 0, 7),
(631, '167841659', 0, 7),
(632, '167841660', 0, 7),
(633, '167841661', 0, 7),
(634, '167841662', 0, 7),
(635, '167841663', 0, 7),
(636, '167841664', 0, 7),
(637, '167841665', 0, 7),
(638, '167841666', 0, 7),
(639, '167841667', 0, 7),
(640, '167841668', 0, 7),
(641, '167841669', 0, 7),
(642, '167841670', 0, 7),
(643, '167841671', 0, 7),
(644, '167841672', 0, 7),
(645, '167841673', 0, 7),
(646, '167841674', 0, 7),
(647, '167841675', 0, 7),
(648, '167841676', 0, 7),
(649, '167841677', 0, 7),
(650, '167841678', 0, 7),
(651, '167841679', 0, 7),
(652, '167841680', 0, 7),
(653, '167841681', 0, 7),
(654, '167841682', 0, 7),
(655, '167841683', 0, 7),
(656, '167841684', 0, 7),
(657, '167841685', 0, 7),
(658, '167841686', 0, 7),
(659, '167841687', 0, 7),
(660, '167841688', 0, 7),
(661, '167841689', 0, 7),
(662, '167841690', 0, 7),
(663, '167841691', 0, 7),
(664, '167841692', 0, 7),
(665, '167841693', 0, 7),
(666, '167841694', 0, 7),
(667, '167841695', 0, 7),
(668, '167841696', 0, 7),
(669, '167841697', 0, 7),
(670, '167841698', 0, 7),
(671, '167841699', 0, 7),
(672, '167841700', 0, 7),
(673, '167841701', 0, 7),
(674, '167841702', 0, 7),
(675, '167841703', 0, 7),
(676, '167841704', 0, 7),
(677, '167841705', 0, 7),
(678, '167841706', 0, 7),
(679, '167841707', 0, 7),
(680, '167841708', 0, 7),
(681, '167841709', 0, 7),
(682, '167841710', 0, 7),
(683, '167841711', 0, 7),
(684, '167841712', 0, 7),
(685, '167841713', 0, 7),
(686, '167841714', 0, 7),
(687, '167841715', 0, 7),
(688, '167841716', 0, 7),
(689, '167841717', 0, 7),
(690, '167841718', 0, 7),
(691, '167841719', 0, 7),
(692, '167841720', 0, 7),
(693, '167841721', 0, 7),
(694, '167841722', 0, 7),
(695, '167841723', 0, 7),
(696, '167841724', 0, 7),
(697, '167841725', 0, 7),
(698, '167841726', 0, 7),
(699, '167841727', 0, 7),
(700, '167841728', 0, 7),
(701, '167841729', 0, 7),
(702, '167841730', 0, 7),
(703, '167841731', 0, 7),
(704, '167841732', 0, 7),
(705, '167841733', 0, 7),
(706, '167841734', 0, 7),
(707, '167841735', 0, 7),
(708, '167841736', 0, 7),
(709, '167841737', 0, 7),
(710, '167841738', 0, 7),
(711, '167841739', 0, 7),
(712, '167841740', 0, 7),
(713, '167841741', 0, 7),
(714, '167841742', 0, 7),
(715, '167841743', 0, 7),
(716, '167841744', 0, 7),
(717, '167841745', 0, 7),
(718, '167841746', 0, 7),
(719, '167841747', 0, 7),
(720, '167841748', 0, 7),
(721, '167841749', 0, 7),
(722, '167841750', 0, 7),
(723, '167841751', 0, 7),
(724, '167841752', 0, 7),
(725, '167841753', 0, 7),
(726, '167841754', 0, 7),
(727, '167841755', 0, 7),
(728, '167841756', 0, 7),
(729, '167841757', 0, 7),
(730, '167841758', 0, 7),
(731, '167841759', 0, 7),
(732, '167841760', 0, 7),
(733, '167841761', 0, 7),
(734, '167841762', 0, 7),
(735, '167841763', 0, 7),
(736, '167841764', 0, 7),
(737, '167841765', 0, 7),
(738, '167841766', 0, 7),
(739, '167841767', 0, 7),
(740, '167841768', 0, 7),
(741, '167841769', 0, 7),
(742, '167841770', 0, 7),
(743, '167841771', 0, 7),
(744, '167841772', 0, 7),
(745, '167841773', 0, 7),
(746, '167841774', 0, 7),
(747, '167841775', 0, 7),
(748, '167841776', 0, 7),
(749, '167841777', 0, 7),
(750, '167841778', 0, 7),
(751, '167841779', 0, 7),
(752, '167841780', 0, 7),
(753, '167841781', 0, 7),
(754, '167841782', 0, 7),
(755, '167841783', 0, 7),
(756, '167841784', 0, 7),
(757, '167841785', 0, 7),
(758, '167841786', 0, 7),
(759, '167841787', 0, 7),
(760, '167841788', 0, 7),
(761, '167841789', 0, 7),
(762, '167841790', 0, 7),
(763, '167839489', 0, 8),
(764, '167839490', 0, 8),
(765, '167839491', 0, 8),
(766, '167839492', 0, 8),
(767, '167839493', 0, 8),
(768, '167839494', 0, 8),
(769, '167839495', 0, 8),
(770, '167839496', 0, 8),
(771, '167839497', 0, 8),
(772, '167839498', 0, 8),
(773, '167839499', 0, 8),
(774, '167839500', 0, 8),
(775, '167839501', 0, 8),
(776, '167839502', 0, 8),
(777, '167839503', 0, 8),
(778, '167839504', 0, 8),
(779, '167839505', 0, 8),
(780, '167839506', 0, 8),
(781, '167839507', 0, 8),
(782, '167839508', 0, 8),
(783, '167839509', 0, 8),
(784, '167839510', 0, 8),
(785, '167839511', 0, 8),
(786, '167839512', 0, 8),
(787, '167839513', 0, 8),
(788, '167839514', 0, 8),
(789, '167839515', 0, 8),
(790, '167839516', 0, 8),
(791, '167839517', 0, 8),
(792, '167839518', 0, 8),
(793, '167839519', 0, 8),
(794, '167839520', 0, 8),
(795, '167839521', 0, 8),
(796, '167839522', 0, 8),
(797, '167839523', 0, 8),
(798, '167839524', 0, 8),
(799, '167839525', 0, 8),
(800, '167839526', 0, 8),
(801, '167839527', 0, 8),
(802, '167839528', 0, 8),
(803, '167839529', 0, 8),
(804, '167839530', 0, 8),
(805, '167839531', 0, 8),
(806, '167839532', 0, 8),
(807, '167839533', 0, 8),
(808, '167839534', 0, 8),
(809, '167839535', 0, 8),
(810, '167839536', 0, 8),
(811, '167839537', 0, 8),
(812, '167839538', 0, 8),
(813, '167839539', 0, 8),
(814, '167839540', 0, 8),
(815, '167839541', 0, 8),
(816, '167839542', 0, 8),
(817, '167839543', 0, 8),
(818, '167839544', 0, 8),
(819, '167839545', 0, 8),
(820, '167839546', 0, 8),
(821, '167839547', 0, 8),
(822, '167839548', 0, 8),
(823, '167839549', 0, 8),
(824, '167839550', 0, 8),
(825, '167839551', 0, 8),
(826, '167839552', 0, 8),
(827, '167839553', 0, 8),
(828, '167839554', 0, 8),
(829, '167839555', 0, 8),
(830, '167839556', 0, 8),
(831, '167839557', 0, 8),
(832, '167839558', 0, 8),
(833, '167839559', 0, 8),
(834, '167839560', 0, 8),
(835, '167839561', 0, 8),
(836, '167839562', 0, 8),
(837, '167839563', 0, 8),
(838, '167839564', 0, 8),
(839, '167839565', 0, 8),
(840, '167839566', 0, 8),
(841, '167839567', 0, 8),
(842, '167839568', 0, 8),
(843, '167839569', 0, 8),
(844, '167839570', 0, 8),
(845, '167839571', 0, 8),
(846, '167839572', 0, 8),
(847, '167839573', 0, 8),
(848, '167839574', 0, 8),
(849, '167839575', 0, 8),
(850, '167839576', 0, 8),
(851, '167839577', 0, 8),
(852, '167839578', 0, 8),
(853, '167839579', 0, 8),
(854, '167839580', 0, 8),
(855, '167839581', 0, 8),
(856, '167839582', 0, 8),
(857, '167839583', 0, 8),
(858, '167839584', 0, 8),
(859, '167839585', 0, 8),
(860, '167839586', 0, 8),
(861, '167839587', 0, 8),
(862, '167839588', 0, 8),
(863, '167839589', 0, 8),
(864, '167839590', 0, 8),
(865, '167839591', 0, 8),
(866, '167839592', 0, 8),
(867, '167839593', 0, 8),
(868, '167839594', 0, 8),
(869, '167839595', 0, 8),
(870, '167839596', 0, 8),
(871, '167839597', 0, 8),
(872, '167839598', 0, 8),
(873, '167839599', 0, 8),
(874, '167839600', 0, 8),
(875, '167839601', 0, 8),
(876, '167839602', 0, 8),
(877, '167839603', 0, 8),
(878, '167839604', 0, 8),
(879, '167839605', 0, 8),
(880, '167839606', 0, 8),
(881, '167839607', 0, 8),
(882, '167839608', 0, 8),
(883, '167839609', 0, 8),
(884, '167839610', 0, 8),
(885, '167839611', 0, 8),
(886, '167839612', 0, 8),
(887, '167839613', 0, 8),
(888, '167839614', 0, 8),
(889, '167839615', 0, 8),
(890, '167839616', 0, 8),
(891, '167839617', 0, 8),
(892, '167839618', 0, 8),
(893, '167839619', 0, 8),
(894, '167839620', 0, 8),
(895, '167839621', 0, 8),
(896, '167839622', 0, 8),
(897, '167839623', 0, 8),
(898, '167839624', 0, 8),
(899, '167839625', 0, 8),
(900, '167839626', 0, 8),
(901, '167839627', 0, 8),
(902, '167839628', 0, 8),
(903, '167839629', 0, 8),
(904, '167839630', 0, 8),
(905, '167839631', 0, 8),
(906, '167839632', 0, 8),
(907, '167839633', 0, 8),
(908, '167839634', 0, 8),
(909, '167839635', 0, 8),
(910, '167839636', 0, 8),
(911, '167839637', 0, 8),
(912, '167839638', 0, 8),
(913, '167839639', 0, 8),
(914, '167839640', 0, 8),
(915, '167839641', 0, 8),
(916, '167839642', 0, 8),
(917, '167839643', 0, 8),
(918, '167839644', 0, 8),
(919, '167839645', 0, 8),
(920, '167839646', 0, 8),
(921, '167839647', 0, 8),
(922, '167839648', 0, 8),
(923, '167839649', 0, 8),
(924, '167839650', 0, 8),
(925, '167839651', 0, 8),
(926, '167839652', 0, 8),
(927, '167839653', 0, 8),
(928, '167839654', 0, 8),
(929, '167839655', 0, 8),
(930, '167839656', 0, 8),
(931, '167839657', 0, 8),
(932, '167839658', 0, 8),
(933, '167839659', 0, 8),
(934, '167839660', 0, 8),
(935, '167839661', 0, 8),
(936, '167839662', 0, 8),
(937, '167839663', 0, 8),
(938, '167839664', 0, 8),
(939, '167839665', 0, 8),
(940, '167839666', 0, 8),
(941, '167839667', 0, 8),
(942, '167839668', 0, 8),
(943, '167839669', 0, 8),
(944, '167839670', 0, 8),
(945, '167839671', 0, 8),
(946, '167839672', 0, 8),
(947, '167839673', 0, 8),
(948, '167839674', 0, 8),
(949, '167839675', 0, 8),
(950, '167839676', 0, 8),
(951, '167839677', 0, 8),
(952, '167839678', 0, 8),
(953, '167839679', 0, 8),
(954, '167839680', 0, 8),
(955, '167839681', 0, 8),
(956, '167839682', 0, 8),
(957, '167839683', 0, 8),
(958, '167839684', 0, 8),
(959, '167839685', 0, 8),
(960, '167839686', 0, 8),
(961, '167839687', 0, 8),
(962, '167839688', 0, 8),
(963, '167839689', 0, 8),
(964, '167839690', 0, 8),
(965, '167839691', 0, 8),
(966, '167839692', 0, 8),
(967, '167839693', 0, 8),
(968, '167839694', 0, 8),
(969, '167839695', 0, 8),
(970, '167839696', 0, 8),
(971, '167839697', 0, 8),
(972, '167839698', 0, 8),
(973, '167839699', 0, 8),
(974, '167839700', 0, 8),
(975, '167839701', 0, 8),
(976, '167839702', 0, 8),
(977, '167839703', 0, 8),
(978, '167839704', 0, 8),
(979, '167839705', 0, 8),
(980, '167839706', 0, 8),
(981, '167839707', 0, 8),
(982, '167839708', 0, 8),
(983, '167839709', 0, 8),
(984, '167839710', 0, 8),
(985, '167839711', 0, 8),
(986, '167839712', 0, 8),
(987, '167839713', 0, 8),
(988, '167839714', 0, 8),
(989, '167839715', 0, 8),
(990, '167839716', 0, 8),
(991, '167839717', 0, 8),
(992, '167839718', 0, 8),
(993, '167839719', 0, 8),
(994, '167839720', 0, 8),
(995, '167839721', 0, 8),
(996, '167839722', 0, 8),
(997, '167839723', 0, 8),
(998, '167839724', 0, 8),
(999, '167839725', 0, 8),
(1000, '167839726', 0, 8),
(1001, '167839727', 0, 8),
(1002, '167839728', 0, 8),
(1003, '167839729', 0, 8),
(1004, '167839730', 0, 8),
(1005, '167839731', 0, 8),
(1006, '167839732', 0, 8),
(1007, '167839733', 0, 8),
(1008, '167839734', 0, 8),
(1009, '167839735', 0, 8),
(1010, '167839736', 0, 8),
(1011, '167839737', 0, 8),
(1012, '167839738', 0, 8),
(1013, '167839739', 0, 8),
(1014, '167839740', 0, 8),
(1015, '167839741', 0, 8),
(1016, '167839742', 0, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `idroles` int(11) NOT NULL AUTO_INCREMENT,
  `nombrol` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idroles`),
  UNIQUE KEY `nombrol_UNIQUE` (`nombrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idroles`, `nombrol`, `descripcion`) VALUES
(1, 'admin', 'administrador'),
(7, 'gestor', 'Gestor de datos'),
(9, 'visitante', 'Visitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Subnet`
--

CREATE TABLE IF NOT EXISTS `Subnet` (
  `idSubnet` int(11) NOT NULL AUTO_INCREMENT,
  `mask` int(11) NOT NULL COMMENT 'Mascara de red',
  `ipaddr` int(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSubnet`),
  UNIQUE KEY `rango_UNIQUE` (`ipaddr`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `Subnet`
--

INSERT INTO `Subnet` (`idSubnet`, `mask`, `ipaddr`, `descripcion`) VALUES
(5, -256, 167837952, 'Nodo'),
(6, -256, 167838208, 'Vicerrectoria'),
(7, -256, 167841536, 'Wifi'),
(8, -256, 167839488, 'Museo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TipoDispositivo`
--

CREATE TABLE IF NOT EXISTS `TipoDispositivo` (
  `idTipoDispositivo` int(11) NOT NULL AUTO_INCREMENT,
  `TipoDispositivo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoDispositivo`),
  UNIQUE KEY `TipoDispositivo_UNIQUE` (`TipoDispositivo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `TipoDispositivo`
--

INSERT INTO `TipoDispositivo` (`idTipoDispositivo`, `TipoDispositivo`, `descripcion`) VALUES
(1, 'Laptop', 'Ordenador Portatil'),
(2, 'PC', 'Ordenador de Mesa'),
(3, 'Tablet', 'Ipad, Tableta'),
(4, 'Celular', 'Telefono Celular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de usuario',
  `user` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) NOT NULL,
  `roles_idroles` int(11) NOT NULL,
  PRIMARY KEY (`idusuarios`,`roles_idroles`),
  UNIQUE KEY `idusuarios_UNIQUE` (`idusuarios`),
  UNIQUE KEY `user_UNIQUE` (`user`),
  KEY `fk_usuarios_roles` (`roles_idroles`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `user`, `password`, `nombre`, `apellido`, `descripcion`, `roles_idroles`) VALUES
(2, 'pedro', '123456', 'Pedro', 'Jose', '', 7),
(10, 'ale', '123', 'Alejandro', 'Mestre', '', 1),
(12, 'pablomd', 'sfahdjtggdj', 'Alejandro', 'Mestre', '', 9),
(14, 'pepe', 'e10adc3949ba59abbe56e057f20f883e', 'Pepe', 'Adoracion', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VRectoria`
--

CREATE TABLE IF NOT EXISTS `VRectoria` (
  `idVRectoria` int(11) NOT NULL AUTO_INCREMENT,
  `VRNombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idVRectoria`),
  UNIQUE KEY `VRNombre_UNIQUE` (`VRNombre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `VRectoria`
--

INSERT INTO `VRectoria` (`idVRectoria`, `VRNombre`, `descripcion`) VALUES
(1, 'VR Tecnologia Educativa', ''),
(2, 'VR Economia', '');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Area`
--
ALTER TABLE `Area`
  ADD CONSTRAINT `fk_Area_CLibertad` FOREIGN KEY (`CLibertad_idCLibertad`) REFERENCES `CLibertad` (`idCLibertad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `Dispositivo`
--
ALTER TABLE `Dispositivo`
  ADD CONSTRAINT `fk_Dispositivo_Area1` FOREIGN KEY (`Area_idArea`) REFERENCES `Area` (`idArea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Dispositivo_IP1` FOREIGN KEY (`IP_idIP`) REFERENCES `IP` (`idIP`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Dispositivo_TipoDispositivo1` FOREIGN KEY (`TipoDispositivo_idTipoDispositivo`) REFERENCES `TipoDispositivo` (`idTipoDispositivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Dispositivo_VRectoria1` FOREIGN KEY (`VRectoria_idVRectoria`) REFERENCES `VRectoria` (`idVRectoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `IP`
--
ALTER TABLE `IP`
  ADD CONSTRAINT `fk_IP_Subnet1` FOREIGN KEY (`Subnet_idSubnet`) REFERENCES `Subnet` (`idSubnet`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_roles` FOREIGN KEY (`roles_idroles`) REFERENCES `roles` (`idroles`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
