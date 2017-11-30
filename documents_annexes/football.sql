-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 27, 2017 at 10:06 PM
-- Server version: 5.5.57-0+deb8u1
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

create user 'football'@'localhost' identified by 'password';
create database football;
grant all privileges on football.* to 'football'@'localhost';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

use football;

--
-- Database: `football`
--

-- --------------------------------------------------------

--
-- Table structure for table `Coach`
--

CREATE TABLE IF NOT EXISTS `Coach` (
  `Id_Entraineur` int(11) NOT NULL,
  `Id_Equipe` int(11) NOT NULL,
  `Id_Joueur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
`id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Entraineur`
--

CREATE TABLE IF NOT EXISTS `Entraineur` (
  `Id_Entraineur` int(11) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Equipe`
--

CREATE TABLE IF NOT EXISTS `Equipe` (
  `Id_Equipe` int(11) NOT NULL,
  `Nom` varchar(10) DEFAULT NULL,
  `Nb_joueurs` varchar(10) DEFAULT NULL,
  `Systeme_jeu` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Equipe`
--

INSERT INTO `Equipe` (`Id_Equipe`, `Nom`, `Nb_joueurs`, `Systeme_jeu`) VALUES
(0, 'Sportive T', '25', NULL),
(1, 'CA Metz', '25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Joueur`
--

CREATE TABLE IF NOT EXISTS `Joueur` (
  `Id_Joueur` int(11) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Taille` int(11) DEFAULT NULL,
  `Poste` varchar(10) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Disponible` tinyint(1) DEFAULT NULL,
  `Position` int(11) DEFAULT NULL,
  `Id_Equipe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Joueur`
--

INSERT INTO `Joueur` (`Id_Joueur`, `Nom`, `Prenom`, `Age`, `Taille`, `Poste`, `Status`, `Disponible`, `Position`, `Id_Equipe`) VALUES
(0, 'Benjamin', 'Lopez', 25, 166, 'MD', 3, 1, 3, 1),
(1, 'Bradley', 'Richards', 31, 178, 'DD', 1, 0, 3, 1),
(2, 'Castro', 'Daniel', 23, 156, 'DD', 1, 0, 5, 1),
(3, 'Ingram', 'Branch', 24, 181, 'DC', 2, 1, 11, 1),
(4, 'Rocha', 'Fowler', 26, 200, 'DG', 3, 1, 3, 1),
(5, 'Dickson', 'Foley', 23, 180, 'MD', 3, 0, 2, 1),
(6, 'Guy', 'Keller', 29, 214, 'AD', 3, 1, 4, 1),
(7, 'Diaz', 'Oneill', 38, 194, 'DC', 2, 0, 6, 1),
(8, 'Guerra', 'Goodwin', 38, 189, 'AD', 2, 1, 3, 1),
(9, 'Sweeney', 'Schroeder', 39, 169, 'MD', 1, 0, 8, 1),
(10, 'Whitaker', 'Benton', 26, 171, 'MG', 1, 0, 5, 1),
(11, 'Palmer', 'Sargent', 40, 177, 'DA', 3, 1, 4, 1),
(12, 'Alvarez', 'Albert', 33, 177, 'MD', 3, 0, 8, 1),
(13, 'Henry', 'Wilkinson', 35, 185, 'MG', 3, 1, 9, 1),
(14, 'Valencia', 'Houston', 24, 210, 'DM', 3, 0, 11, 1),
(15, 'Odonnell', 'Summers', 32, 200, 'AV', 3, 0, 10, 1),
(16, 'Harding', 'Cain', 26, 187, 'DG', 1, 1, 3, 1),
(17, 'Goff', 'Ellis', 37, 205, 'MD', 2, 1, 1, 1),
(18, 'Wagner', 'Gates', 35, 191, 'DM', 2, 0, 2, 1),
(19, 'Marks', 'Schwartz', 34, 178, 'DC', 1, 0, 9, 1),
(20, 'Tanner', 'Nguyen', 40, 171, 'MD', 1, 1, 8, 1),
(21, 'Parks', 'Salazar', 35, 160, 'AD', 3, 1, 3, 1),
(22, 'Richards', 'Estrada', 29, 169, 'AG', 3, 0, 11, 1),
(23, 'Mendez', 'Pruitt', 26, 207, 'DM', 2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Statistique`
--

CREATE TABLE IF NOT EXISTS `Statistique` (
  `Id_stat` int(11) NOT NULL,
  `Temps_jeu` int(11) DEFAULT NULL,
  `But` int(11) DEFAULT NULL,
  `Passe_decisive` int(11) DEFAULT NULL,
  `Match_dispute` int(11) DEFAULT NULL,
  `Id_Joueur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Coach`
--
ALTER TABLE `Coach`
 ADD PRIMARY KEY (`Id_Entraineur`,`Id_Equipe`,`Id_Joueur`), ADD KEY `FK_Coach_Id_Equipe` (`Id_Equipe`), ADD KEY `FK_Coach_Id_Joueur` (`Id_Joueur`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Entraineur`
--
ALTER TABLE `Entraineur`
 ADD PRIMARY KEY (`Id_Entraineur`);

--
-- Indexes for table `Equipe`
--
ALTER TABLE `Equipe`
 ADD PRIMARY KEY (`Id_Equipe`);

--
-- Indexes for table `Joueur`
--
ALTER TABLE `Joueur`
 ADD PRIMARY KEY (`Id_Joueur`), ADD KEY `FK_Joueur_Id_Equipe` (`Id_Equipe`);

--
-- Indexes for table `Statistique`
--
ALTER TABLE `Statistique`
 ADD PRIMARY KEY (`Id_stat`), ADD KEY `FK_Statistique_Id_Joueur` (`Id_Joueur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Coach`
--
ALTER TABLE `Coach`
ADD CONSTRAINT `FK_Coach_Id_Entraineur` FOREIGN KEY (`Id_Entraineur`) REFERENCES `Entraineur` (`Id_Entraineur`),
ADD CONSTRAINT `FK_Coach_Id_Equipe` FOREIGN KEY (`Id_Equipe`) REFERENCES `Equipe` (`Id_Equipe`),
ADD CONSTRAINT `FK_Coach_Id_Joueur` FOREIGN KEY (`Id_Joueur`) REFERENCES `Joueur` (`Id_Joueur`);

--
-- Constraints for table `Joueur`
--
ALTER TABLE `Joueur`
ADD CONSTRAINT `FK_Joueur_Id_Equipe` FOREIGN KEY (`Id_Equipe`) REFERENCES `Equipe` (`Id_Equipe`);

--
-- Constraints for table `Statistique`
--
ALTER TABLE `Statistique`
ADD CONSTRAINT `FK_Statistique_Id_Joueur` FOREIGN KEY (`Id_Joueur`) REFERENCES `Joueur` (`Id_Joueur`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
