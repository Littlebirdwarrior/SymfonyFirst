-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour symfonyfirst
CREATE DATABASE IF NOT EXISTS `symfonyfirst` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `symfonyfirst`;

-- Listage de la structure de la table symfonyfirst. doctrine_migration_versions
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_bin NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table symfonyfirst.doctrine_migration_versions : ~0 rows (environ)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20230421091921', '2023-04-21 09:19:54', 239);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table symfonyfirst. employe
CREATE TABLE IF NOT EXISTS `employe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8_bin NOT NULL,
  `date_naissance` datetime DEFAULT NULL,
  `date_embauche` datetime NOT NULL,
  `ville` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F804D3B93256915B` (`relation_id`),
  CONSTRAINT `FK_F804D3B93256915B` FOREIGN KEY (`relation_id`) REFERENCES `entreprise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table symfonyfirst.employe : ~3 rows (environ)
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` (`id`, `relation_id`, `nom`, `prenom`, `date_naissance`, `date_embauche`, `ville`) VALUES
	(1, 1, 'Grogu', 'Din', '2023-04-21 13:52:32', '2023-04-21 13:52:34', 'Nullpart'),
	(2, 2, 'Kahtan', 'Boh', '2023-04-21 13:53:16', '2023-04-21 13:53:18', 'Nullpart'),
	(3, 2, 'Djarin', 'Din', '2023-04-21 14:28:26', '2023-04-21 14:28:28', 'Mandalore');
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;

-- Listage de la structure de la table symfonyfirst. entreprise
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raison_sociale` varchar(50) COLLATE utf8_bin NOT NULL,
  `date_creation` datetime NOT NULL,
  `adresse` varchar(100) COLLATE utf8_bin NOT NULL,
  `cp` varchar(11) COLLATE utf8_bin NOT NULL,
  `ville` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table symfonyfirst.entreprise : ~2 rows (environ)
/*!40000 ALTER TABLE `entreprise` DISABLE KEYS */;
INSERT INTO `entreprise` (`id`, `raison_sociale`, `date_creation`, `adresse`, `cp`, `ville`) VALUES
	(1, 'Entreprise 1', '2023-04-21 11:20:50', '1, rue du Nimp', '67100', 'Nimp'),
	(2, 'Entreprise 2', '2023-04-21 11:21:54', '2, rue du Bla', '67200', 'Nimp');
/*!40000 ALTER TABLE `entreprise` ENABLE KEYS */;

-- Listage de la structure de la table symfonyfirst. messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8_bin NOT NULL,
  `headers` longtext COLLATE utf8_bin NOT NULL,
  `queue_name` varchar(190) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Listage des données de la table symfonyfirst.messenger_messages : ~0 rows (environ)
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
