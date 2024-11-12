-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le : Dim 01 mai 2022 à 22:07
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `biblio`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

DROP TABLE IF EXISTS `abonne`;
CREATE TABLE IF NOT EXISTS `abonne` (
  `idab` int(11) NOT NULL,
  `nomab` varchar(100) NOT NULL,
  PRIMARY KEY (`idab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `abonne`
--

INSERT INTO `abonne` (`idab`, `nomab`) VALUES
(1, 'Bochra Hamda'),
(2, 'Abir Hamda'),
(3, 'Joulen Kriz'),
(4, 'Tesnim Mdeda'),
(5, 'Lyna Youssef'),
(6, 'Mohammed Ben Amer'),
(7, 'Salah Gouja'),
(8, 'ahmed abdallah'),
(9, 'mootaz bouazra'),
(11, 'mahdi ben nasr'),
(12, 'selem boujneh'),
(13, 'yesmine sghayer'),
(14, 'yosr jabeur'),
(15, 'emame barkallah'),
(16, 'chikh tijani'),
(17, 'hamza hamza'),
(18, 'nadine baatout'),
(19, 'dali dali'),
(20, 'ameni laayouni'),
(21, 'oumeima rouis'),
(22, 'youssef beln taleb');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `idlivre` int(11) NOT NULL,
  `titre` varchar(90) NOT NULL,
  `disponible` varchar(10) NOT NULL,
  `idabonne` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlivre`),
  KEY `fk1` (`idabonne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`idlivre`, `titre`, `disponible`, `idabonne`) VALUES
(1, 'java', 'NON', 19),
(3, 'le soleil des independance', 'OUI', NULL),
(5, 'The Da Vinci Code', 'NON', 4),
(6, ' L’Alchimiste', 'NON', 5),
(7, 'histoire d’une âme', 'OUI', NULL),
(8, 'java', 'OUI', NULL),
(9, 'contes', 'NON', 9),
(10, 'le pere gorio', 'NON', 20),
(11, 'fictions', 'OUI', NULL),
(12, 'etranger', 'NON', 15),
(13, 'la belle mére', 'NON', 1),
(14, 'amour impossible', 'NON', 18),
(15, 'skam', 'OUI', NULL),
(16, 'la vie en rose', 'OUI', NULL),
(17, 'addiction', 'OUI', NULL),
(18, 'danger', 'OUI', NULL),
(19, 'life', 'OUI', NULL),
(20, 'buble', 'OUI', NULL),
(21, 'riverdale', 'OUI', NULL);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `pret`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `pret`;
CREATE TABLE IF NOT EXISTS `pret` (
`idlivre` int(11)
,`titre` varchar(90)
,`nomab` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure de la vue `pret`
--
DROP TABLE IF EXISTS `pret`;

DROP VIEW IF EXISTS `pret`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pret`  AS  select `livre`.`idlivre` AS `idlivre`,`livre`.`titre` AS `titre`,`abonne`.`nomab` AS `nomab` from (`livre` join `abonne` on((`livre`.`idabonne` = `abonne`.`idab`))) where (`livre`.`disponible` = 'NON') ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`idabonne`) REFERENCES `abonne` (`idab`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
