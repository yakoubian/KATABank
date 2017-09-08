-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 07 Septembre 2017 à 17:47
-- Version du serveur: 5.1.52
-- Version de PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `banque_kata`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `code_client` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`code_client`, `nom_client`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `type_cpte` varchar(2) NOT NULL,
  `code_compte` varchar(255) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `solde` double NOT NULL,
  `taux` double DEFAULT NULL,
  `decouvert` double DEFAULT NULL,
  `code_cli` bigint(20) DEFAULT NULL,
  `code_emp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`code_compte`),
  KEY `FK2hw4shqsxc782lychpkr52lmv` (`code_cli`),
  KEY `FKbm21kemcgkptyq3x0ge8ciaqu` (`code_emp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`type_cpte`, `code_compte`, `date_creation`, `solde`, `taux`, `decouvert`, `code_cli`, `code_emp`) VALUES
('CC', 'CC1', NULL, 522100, NULL, 0, NULL, NULL),
('CC', 'CC2', '2017-08-22 13:08:04', 537800, NULL, 3000, NULL, NULL),
('CE', 'CE1', '2017-08-22 13:10:14', 520000, 30, NULL, NULL, NULL),
('CE', 'CE2', '2017-08-22 13:12:49', 520000, 30, NULL, 1, NULL),
('CE', 'CE3', '2017-08-22 13:15:41', 52011, 377, NULL, 1, NULL),
('CE', 'CCCE', '2017-08-25 16:01:42', 99898, 5.5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `code_emplye` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom_emplye` varchar(255) DEFAULT NULL,
  `code_emp_sup` bigint(20) DEFAULT NULL,
  `nom_employe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_emplye`),
  KEY `FKhsh3jgj0ctoiewmr371xmvby5` (`code_emp_sup`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`code_emplye`, `nom_emplye`, `code_emp_sup`, `nom_employe`) VALUES
(1, NULL, NULL, NULL),
(2, NULL, NULL, NULL),
(3, NULL, NULL, NULL),
(4, NULL, NULL, 'E3');

-- --------------------------------------------------------

--
-- Structure de la table `employe_groupes`
--

DROP TABLE IF EXISTS `employe_groupes`;
CREATE TABLE IF NOT EXISTS `employe_groupes` (
  `employes_code_emplye` bigint(20) NOT NULL,
  `groupes_code_groupe` bigint(20) NOT NULL,
  KEY `FKrkburbdrjio4s2e7v49gk5gq3` (`groupes_code_groupe`),
  KEY `FKircedqai3a9r1wrm5od5rd50r` (`employes_code_emplye`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employe_groupes`
--


-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `code_groupe` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom_groupe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code_groupe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `groupe`
--


-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

DROP TABLE IF EXISTS `operation`;
CREATE TABLE IF NOT EXISTS `operation` (
  `dtype` varchar(1) NOT NULL,
  `numero_operation` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_operaion` datetime DEFAULT NULL,
  `montant` double NOT NULL,
  `code_cpte` varchar(255) DEFAULT NULL,
  `code_emp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`numero_operation`),
  KEY `FKkr9nfjf0ipqrw5xwcf9jqq6gv` (`code_cpte`),
  KEY `FK88rq579v3pyf0y6v3p9wvhjo7` (`code_emp`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `operation`
--

INSERT INTO `operation` (`dtype`, `numero_operation`, `date_operaion`, `montant`, `code_cpte`, `code_emp`) VALUES
('V', 1, '2017-08-22 17:37:46', 500, 'CC1', 1),
('V', 2, '2017-09-07 11:43:54', 12000, 'CC2', 1),
('V', 3, '2017-09-07 11:54:43', 4000, 'CC2', 1),
('V', 4, '2017-09-07 11:57:18', 5000, 'CC2', 1),
('R', 5, '2017-09-07 11:57:23', 5000, 'CC2', 1),
('R', 6, '2017-09-07 11:58:02', 1000, 'CC2', 1),
('V', 7, '2017-09-07 12:25:23', 0, 'CC2', 1),
('R', 8, '2017-09-07 12:35:05', 25600, 'CC2', 1),
('V', 9, '2017-09-07 12:36:21', 1000, 'CC2', 1),
('V', 10, '2017-09-07 12:58:59', 58000, 'CC2', 1),
('R', 11, '2017-09-07 12:59:27', 9000, 'CC2', 1),
('V', 12, '2017-09-07 13:00:07', 5000, 'CC2', 1),
('R', 13, '2017-09-07 14:59:34', 2500, 'CC2', 1),
('V', 14, '2017-09-07 14:59:34', 2500, NULL, 1),
('R', 15, '2017-09-07 15:03:24', 2600, 'CC2', 1),
('V', 16, '2017-09-07 15:03:24', 2600, 'CC1', 1);
COMMIT;
