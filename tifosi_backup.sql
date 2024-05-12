-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 08 mai 2024 à 10:47
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tifosi`
--
CREATE DATABASE IF NOT EXISTS `tifosi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tifosi`;

--
-- Création de l'utilisateur "tifosi" avec le mot de passe "password" et droits d'administrations
--

CREATE USER 'tifosi'@'localhost' IDENTIFIED BY 'password';
GRANT RELOAD, SHUTDOWN, PROCESS, REFERENCES, SHOW DATABASES, SUPER, LOCK TABLES, REPLICATION SLAVE, REPLICATION CLIENT, CREATE USER ON *.* TO 'tifosi'@'localhost';

-- --------------------------------------------------------

--
-- Structure de la table `achete`
--

CREATE TABLE `achete` (
  `id_achete` int(11) NOT NULL,
  `jour_achete` datetime NOT NULL DEFAULT current_timestamp(),
  `id_focaccia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `achete`
--

INSERT INTO `achete` (`id_achete`, `jour_achete`, `id_focaccia`) VALUES
(1, '2024-05-07 16:14:47', 3),
(2, '2024-05-08 07:56:35', 8),
(3, '2024-05-08 07:56:35', 2),
(4, '2024-05-08 07:56:35', 4);

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `id_boisson` int(11) NOT NULL,
  `id_marque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `appartient`
--

INSERT INTO `appartient` (`id_boisson`, `id_marque`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 3),
(11, 3),
(12, 2);

-- --------------------------------------------------------

--
-- Structure de la table `boisson`
--

CREATE TABLE `boisson` (
  `id_boisson` int(11) NOT NULL,
  `nom_boisson` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `boisson`
--

INSERT INTO `boisson` (`id_boisson`, `nom_boisson`) VALUES
(1, 'Coca-cola zéro'),
(2, 'Coca-cola original'),
(3, 'Fanta citron'),
(4, 'Fanta orange'),
(5, 'Capri-sun'),
(6, 'Pepsi'),
(7, 'Pepsi Max Zéro'),
(8, 'Lipton zéro citron'),
(9, 'Lipton Peach'),
(10, 'Monster energy ultra gold'),
(11, 'Monster energy ultra blue'),
(12, 'Eau de source ');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom_client` varchar(45) NOT NULL,
  `age_client` varchar(45) NOT NULL,
  `cp_client` varchar(45) NOT NULL,
  `id_paye` int(11) DEFAULT NULL,
  `id_achete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `age_client`, `cp_client`, `id_paye`, `id_achete`) VALUES
(1, 'Marie', '18', '34110', 1, 1),
(2, 'Sandrine', '52', '34110', 2, 2),
(3, 'Julien', '47', '34110', 3, 3),
(4, 'Isis', '11', '34110', 4, 4);

-- --------------------------------------------------------

--
-- Structure de la table `comprend`
--

CREATE TABLE `comprend` (
  `id_focaccia` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `comprend`
--

INSERT INTO `comprend` (`id_focaccia`, `id_ingredient`) VALUES
(1, 1),
(1, 3),
(1, 5),
(1, 7),
(1, 9),
(1, 13),
(1, 16),
(1, 18),
(1, 20),
(1, 25),
(2, 1),
(2, 5),
(2, 7),
(2, 9),
(2, 11),
(2, 16),
(2, 18),
(2, 20),
(3, 1),
(3, 5),
(3, 7),
(3, 9),
(3, 18),
(3, 20),
(3, 22),
(4, 6),
(4, 7),
(4, 9),
(4, 10),
(4, 15),
(4, 18),
(4, 20),
(5, 5),
(5, 7),
(5, 9),
(5, 12),
(5, 16),
(5, 17),
(5, 18),
(5, 20),
(5, 25),
(6, 2),
(6, 4),
(6, 5),
(6, 9),
(6, 16),
(6, 18),
(6, 19),
(6, 20),
(6, 25),
(7, 4),
(7, 5),
(7, 9),
(7, 16),
(7, 18),
(7, 20),
(7, 21),
(7, 25),
(8, 1),
(8, 3),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 13),
(8, 14),
(8, 16),
(8, 18),
(8, 20),
(8, 21);

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

CREATE TABLE `contient` (
  `id_boisson` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `contient`
--

INSERT INTO `contient` (`id_boisson`, `id_menu`) VALUES
(2, 2),
(2, 8),
(6, 3),
(12, 4);

-- --------------------------------------------------------

--
-- Structure de la table `est _constitue`
--

CREATE TABLE `est _constitue` (
  `id_focaccia` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `est _constitue`
--

INSERT INTO `est _constitue` (`id_focaccia`, `id_menu`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Structure de la table `focaccia`
--

CREATE TABLE `focaccia` (
  `id_focaccia` int(11) NOT NULL,
  `nom_focaccia` varchar(45) NOT NULL,
  `prix_focaccia` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `focaccia`
--

INSERT INTO `focaccia` (`id_focaccia`, `nom_focaccia`, `prix_focaccia`) VALUES
(1, 'Mozaccia', 9.8),
(2, 'Gorgonzollaccia\r\n', 10.8),
(3, 'Raclaccia', 8.9),
(4, 'Emmentalaccia', 9.8),
(5, 'Tradizione', 8.9),
(6, 'Hawaienne', 11.2),
(7, 'Américaine', 10.8),
(8, 'Paysanne', 12.8);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id_ingredient` int(11) NOT NULL,
  `nom_ingredient` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id_ingredient`, `nom_ingredient`) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chèvre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivre'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Tomate cerise'),
(25, 'Mozarella');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `idmarque` int(11) NOT NULL,
  `nom_marque` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`idmarque`, `nom_marque`) VALUES
(1, 'Coca-cola'),
(2, 'Critalline'),
(3, 'Monster'),
(4, 'Pepsico');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nom_menu` varchar(45) NOT NULL,
  `prix_menu` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id_menu`, `nom_menu`, `prix_menu`) VALUES
(1, 'Menu Mozaccia', 11.9),
(2, 'Menu Gorgonzollaccia', 12.8),
(3, 'Menu Raclaccia', 10.8),
(4, 'Menu Emmentalaccia', 11.9),
(5, 'Menu Tradizione', 10.9),
(6, 'Menu Hawaienne', 13.2),
(7, 'Menu Américaine', 12.8),
(8, 'Menu Paysanne', 14.8);

-- --------------------------------------------------------

--
-- Structure de la table `paye`
--

CREATE TABLE `paye` (
  `id_paye` int(11) NOT NULL,
  `jour_paye` datetime NOT NULL DEFAULT current_timestamp(),
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `paye`
--

INSERT INTO `paye` (`id_paye`, `jour_paye`, `id_menu`) VALUES
(1, '2024-05-07 16:40:23', 3),
(2, '2024-05-08 08:14:51', 8),
(3, '2024-05-08 08:14:51', 2),
(4, '2024-05-08 08:14:51', 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `achete`
--
ALTER TABLE `achete`
  ADD PRIMARY KEY (`id_achete`),
  ADD KEY `id_focaccia` (`id_focaccia`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`id_boisson`,`id_marque`),
  ADD KEY `id_marque` (`id_marque`);

--
-- Index pour la table `boisson`
--
ALTER TABLE `boisson`
  ADD PRIMARY KEY (`id_boisson`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `fk_client_paye` (`id_paye`),
  ADD KEY `fk_client_achete` (`id_achete`);

--
-- Index pour la table `comprend`
--
ALTER TABLE `comprend`
  ADD PRIMARY KEY (`id_focaccia`,`id_ingredient`),
  ADD KEY `id_focaccia` (`id_focaccia`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Index pour la table `contient`
--
ALTER TABLE `contient`
  ADD PRIMARY KEY (`id_boisson`,`id_menu`),
  ADD KEY `id_boisson` (`id_boisson`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Index pour la table `est _constitue`
--
ALTER TABLE `est _constitue`
  ADD PRIMARY KEY (`id_focaccia`,`id_menu`),
  ADD KEY `id_focaccia` (`id_focaccia`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Index pour la table `focaccia`
--
ALTER TABLE `focaccia`
  ADD PRIMARY KEY (`id_focaccia`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id_ingredient`);

--
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`idmarque`);

--
-- Index pour la table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Index pour la table `paye`
--
ALTER TABLE `paye`
  ADD PRIMARY KEY (`id_paye`),
  ADD KEY `fk_paye_menu_idx` (`id_menu`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `achete`
--
ALTER TABLE `achete`
  MODIFY `id_achete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `boisson`
--
ALTER TABLE `boisson`
  MODIFY `id_boisson` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `focaccia`
--
ALTER TABLE `focaccia`
  MODIFY `id_focaccia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `idmarque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `paye`
--
ALTER TABLE `paye`
  MODIFY `id_paye` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `achete`
--
ALTER TABLE `achete`
  ADD CONSTRAINT `fk_achete_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `fk_appartient_boisson` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_appartient_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`idmarque`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_achete` FOREIGN KEY (`id_achete`) REFERENCES `achete` (`id_achete`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_client_paye` FOREIGN KEY (`id_paye`) REFERENCES `paye` (`id_paye`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `comprend`
--
ALTER TABLE `comprend`
  ADD CONSTRAINT `comprend_ibfk_1` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`),
  ADD CONSTRAINT `comprend_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  ADD CONSTRAINT `fk_comprend_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comprend_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `contient_ibfk_1` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`),
  ADD CONSTRAINT `contient_ibfk_2` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`),
  ADD CONSTRAINT `fk_contient_boisson` FOREIGN KEY (`id_boisson`) REFERENCES `boisson` (`id_boisson`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contient_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `est _constitue`
--
ALTER TABLE `est _constitue`
  ADD CONSTRAINT `fk_est_constitue_focaccia` FOREIGN KEY (`id_focaccia`) REFERENCES `focaccia` (`id_focaccia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_est_constitue_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `paye`
--
ALTER TABLE `paye`
  ADD CONSTRAINT `fk_paye_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
