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

DROP DATABASE football;

create user 'football'@'localhost' identified by 'password';
create database football;
grant all privileges on football.* to 'football'@'localhost';

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

use football;

-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  jeu. 07 déc. 2017 à 09:21
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `football`
--

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Entraineur`
--

CREATE TABLE `Entraineur` (
  `Id_Entraineur` int(11) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Equipe`
--

CREATE TABLE `Equipe` (
  `Id_Equipe` int(11) NOT NULL,
  `Nom` varchar(10) DEFAULT NULL,
  `Nb_joueurs` varchar(10) DEFAULT NULL,
  `Systeme_jeu` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Equipe`
--

INSERT INTO `Equipe` (`Id_Equipe`, `Nom`, `Nb_joueurs`, `Systeme_jeu`) VALUES
(0, 'CA Boulay', '25', NULL),
(1, 'CA Metz', '25', NULL),
(2, 'ES Fameck', '25', NULL),
(3, 'UL Rombas', '25', NULL),
(4, 'ES Metz', '25', NULL),
(5, 'FC Yutz', '25', NULL),
(6, 'AS Vagney', '25', NULL),
(8, 'FC Toul', '25', NULL),
(9, 'Epinal', '25', NULL),
(10, 'US Forbach', '25', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Joueur`
--

CREATE TABLE `Joueur` (
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
-- Déchargement des données de la table `Joueur`
--

INSERT INTO `Joueur` (`Id_Joueur`, `Nom`, `Prenom`, `Age`, `Taille`, `Poste`, `Status`, `Disponible`, `Position`, `Id_Equipe`) VALUES
(2, 'Benjamin', 'Lopez', 26, 166, 'G', 1, 1, 1, 1),
(3, 'Bradley', 'Richards', 31, 178, 'D', 1, 1, 3, 1),
(4, 'Castro', 'Daniel', 23, 156, 'D', 1, 1, 5, 1),
(5, 'Ingram', 'Branch', 24, 181, 'D', 1, 1, 4, 1),
(6, 'Rocha', 'Fowler', 26, 200, 'D', 2, 1, 3, 1),
(7, 'Dickson', 'Foley', 23, 180, 'D', 3, 0, 2, 1),
(8, 'Guy', 'Keller', 29, 214, 'A', 3, 1, 10, 1),
(9, 'Diaz', 'Oneill', 38, 194, 'D', 2, 1, 4, 1),
(10, 'Guerra', 'Goodwin', 38, 189, 'G', 2, 1, 1, 1),
(11, 'Sweeney', 'Schroeder', 39, 169, 'M', 1, 1, 8, 1),
(12, 'Whitaker', 'Benton', 26, 171, 'M', 1, 1, 6, 1),
(13, 'Palmer', 'Sargent', 40, 177, 'D', 2, 1, 4, 1),
(14, 'Alvarez', 'Albert', 33, 177, 'G', 3, 0, 1, 1),
(15, 'Henry', 'Wilkinson', 35, 185, 'M', 3, 1, 9, 1),
(16, 'Valencia', 'Houston', 24, 210, 'D', 3, 0, 2, 1),
(17, 'Odonnell', 'Summers', 32, 200, 'A', 3, 0, 10, 1),
(18, 'Harding', 'Cain', 26, 187, 'A', 1, 1, 10, 1),
(19, 'Goff', 'Ellis', 37, 205, 'A', 1, 1, 11, 1),
(20, 'Wagner', 'Gates', 35, 191, 'M', 1, 1, 7, 1),
(21, 'Marks', 'Schwartz', 34, 178, 'D', 1, 1, 2, 1),
(22, 'Tanner', 'Nguyen', 40, 171, 'M', 1, 1, 8, 1),
(23, 'Parks', 'Salazar', 35, 160, 'A', 3, 1, 11, 1),
(24, 'Richards', 'Estrada', 29, 169, 'A', 2, 1, 11, 1),
(25, 'Mendez', 'Pruitt', 26, 207, 'M', 2, 1, 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Statistique`
--

CREATE TABLE `Statistique` (
  `Id_stat` int(11) NOT NULL,
  `Temps_jeu` int(11) DEFAULT NULL,
  `But` int(11) DEFAULT NULL,
  `Passe_decisive` int(11) DEFAULT NULL,
  `Match_dispute` int(11) DEFAULT NULL,
  `Id_Joueur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Statistique`
--

INSERT INTO `Statistique` (`Id_stat`, `Temps_jeu`, `But`, `Passe_decisive`, `Match_dispute`, `Id_Joueur`) VALUES
(0, 180, 0, 0, 2, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Entraineur`
--
ALTER TABLE `Entraineur`
  ADD PRIMARY KEY (`Id_Entraineur`);

--
-- Index pour la table `Equipe`
--
ALTER TABLE `Equipe`
  ADD PRIMARY KEY (`Id_Equipe`);

--
-- Index pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD PRIMARY KEY (`Id_Joueur`);

--
-- Index pour la table `Statistique`
--
ALTER TABLE `Statistique`
  ADD PRIMARY KEY (`Id_stat`),
  ADD KEY `FK_Statistique_Id_Joueur` (`Id_Joueur`) USING BTREE;

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Joueur`
--
ALTER TABLE `Joueur`
  MODIFY `Id_Joueur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `Statistique`
--
ALTER TABLE `Statistique`
  MODIFY `Id_stat` int(11) NOT NULL AUTO_INCREMENT;