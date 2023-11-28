-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for answers
CREATE DATABASE IF NOT EXISTS `answers` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `answers`;

-- Dumping structure for table answers.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `question_id` int DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table answers.answers: ~0 rows (approximately)

-- Dumping structure for table answers.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table answers.questions: ~0 rows (approximately)

-- Dumping structure for table answers.quiz_data
CREATE TABLE IF NOT EXISTS `quiz_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `correctAnswer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table answers.quiz_data: ~24 rows (approximately)
INSERT INTO `quiz_data` (`id`, `question`, `answer1`, `answer2`, `correctAnswer`) VALUES
	(1, 'Vai ara snieg?', 'ja', 'ne', 'answer2'),
	(2, 'Vai ara snieg?', 'ja', 'ne', 'answer2'),
	(3, 'Vai ara snieg?', 'ja', 'ne', 'answer2'),
	(4, 'Vai ara snieg?', 'ja', 'ne', 'answer2'),
	(5, 'ara list', 'ja', 'ne', 'answer2'),
	(6, 'ara list', 'ja', 'ne', 'answer2'),
	(7, 'Mana masina ir zila', 'ja', 'ne', 'answer2'),
	(8, 'Mana masina ir zila', 'ja', 'ne', 'answer2'),
	(9, 'Mana masina ir zila', 'ja', 'ne', 'answer2'),
	(10, 'Mana masina ir zila', 'ja', 'ne', 'answer2'),
	(11, 'Ara ir nakts', 'ja', 'ne', 'answer2'),
	(12, 'Ara ir nakts', 'ja', 'ne', 'answer2'),
	(13, 'Vai ara snieg?', 'ja', 'ne', 'answer2'),
	(14, 'Vai ara snieg?', 'ja', 'ne', 'answer2'),
	(15, 'Ara ir nakts', 'ja', 'ne', 'answer2'),
	(16, 'Man ir zili mati', 'Ja', 'Ne', 'answer2'),
	(17, 'Es redzu zilu masinu', 'ja', 'ne', 'answer2'),
	(18, 'Ara ir vasara', 'ja', 'ne', 'answer2'),
	(19, 'Ara ir saule', 'ja', 'ne', 'answer1'),
	(20, 'Man ir blakus telefons', 'ja', 'ne', 'ja'),
	(21, 'Man ir blakus telefons', 'ja', 'ne', 'answer1'),
	(22, 'Man ir blakus telefons', 'ja', 'ne', 'answer1'),
	(23, 'Man ir melni mati', 'ja', 'ne', 'answer1'),
	(24, 'Man ir melni mati', 'ja', 'ne', 'answer1');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
