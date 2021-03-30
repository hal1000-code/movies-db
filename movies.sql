-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS movies;

CREATE DATABASE IF NOT EXISTS movies;
USE movies;
--
-- Table structure for table `Actors`
--

DROP TABLE IF EXISTS `Actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actors` (
  `Actor_ID` tinyint(4) NOT NULL DEFAULT '0',
  `FirstName` varchar(8) DEFAULT NULL,
  `LastName` varchar(9) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
	PRIMARY KEY (`Actor_ID`),
	KEY `idx_Actor_ID` (`Actor_ID`),
    	FOREIGN KEY (CountryCode) 
        REFERENCES Country(CountryCode)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actors`
--

LOCK TABLES `Actors` WRITE;
/*!40000 ALTER TABLE `Actors` DISABLE KEYS */;
INSERT INTO `Actors` VALUES (1,'Clark','Gable','US'),(2,'Vivien','Leigh','GB'),(3,'Laurence','Olivier','GB'),(4,'Merle','Oberon','GB'),(5,'Cary','Grant','GB'),(6,'Eva','Saint','US'),(7,'Marlon','Brando','US'),(8,'Al','Pacino','US'),(9,'Diane','Keaton','US'),(10,'Henry','Fonda','US'),(11,'Jane','Darwell','US'),(12,'John','Carradine','US'),(16,'Sean','Connery','GB'),(17,'Honor','Blackman','GB'),(18,'Gert','Frobe','DE'),(19,'Michael','Douglas','US'),(20,'Glenn','Close','US'),(21,'Yun-Fat','Chow','CN'),(22,'Ziyi','Zhang','CN'),(23,'Keanu','Reeves','CA'),(24,'Lawrence','Fishburne','US');
/*!40000 ALTER TABLE `Actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `CountryCode` varchar(2) NOT NULL DEFAULT '',
  `CountryName` varchar(13) DEFAULT NULL,
	PRIMARY KEY (`CountryCode`),
	KEY `idx_CountryCode` (`CountryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES ('US','United States'),('GB','Great Britain'),('IT','Italy'),('FR','France'),('DE','Germany'),('CN','China'),('TW','Taiwan'),('CA','Canada');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Directors`
--

DROP TABLE IF EXISTS `Directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Directors` (
  `Director_ID` tinyint(4) NOT NULL DEFAULT '0',
  `FirstName` varchar(7) DEFAULT NULL,
  `LastName` varchar(9) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
	PRIMARY KEY (`Director_ID`),
	KEY `idx_Director_ID` (`Director_ID`),
    	FOREIGN KEY (CountryCode) 
        REFERENCES Country(CountryCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Directors`
--

LOCK TABLES `Directors` WRITE;
/*!40000 ALTER TABLE `Directors` DISABLE KEYS */;
INSERT INTO `Directors` VALUES (1,'John','Ford','US'),(2,'Francis','Coppola','US'),(3,'Alfred','Hitchcock','GB'),(4,'Victor','Fleming','US'),(5,'William','Wyler','US'),(6,'Guy','Hamilton','FR'),(7,'Adrian','Lyne','GB'),(8,'Ang','Lee','TW'),(9,'Andy','Wachowski','US');
/*!40000 ALTER TABLE `Directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Language`
--

DROP TABLE IF EXISTS `Language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Language` (
  `LanguageCode` varchar(2) NOT NULL DEFAULT '',
  `LanguageName` varchar(9) DEFAULT NULL,
	PRIMARY KEY (`LanguageCode`),
	KEY `idx_LanguageCode` (`LanguageCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Language`
--

LOCK TABLES `Language` WRITE;
/*!40000 ALTER TABLE `Language` DISABLE KEYS */;
INSERT INTO `Language` VALUES ('SP','Spanish'),('IT','Italian'),('FR','French'),('MN','Mandarin'),('CT','Cantonese'),('EN','English');
/*!40000 ALTER TABLE `Language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie_Actor`
--

DROP TABLE IF EXISTS `Movie_Actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie_Actor` (
  `Actor_ID` tinyint(4) NOT NULL DEFAULT '0',
  `Movie_ID` tinyint(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`Actor_ID`,`Movie_ID`),
	KEY `idx_Actor_ID` (`Actor_ID`),
	KEY `idx_Movie_ID` (`Movie_ID`),
    	FOREIGN KEY (Actor_ID) 
        REFERENCES Actors(Actor_ID),
    	FOREIGN KEY (Movie_ID) 
        REFERENCES Movies(Movie_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie_Actor`
--

LOCK TABLES `Movie_Actor` WRITE;
/*!40000 ALTER TABLE `Movie_Actor` DISABLE KEYS */;
INSERT INTO `Movie_Actor` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,4),(10,5),(11,5),(12,5),(16,7),(17,7),(18,7),(19,8),(20,8),(21,9),(22,9),(23,10),(24,10);
/*!40000 ALTER TABLE `Movie_Actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie_Director`
--

DROP TABLE IF EXISTS `Movie_Director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movie_Director` (
  `Movie_ID` tinyint(4) NOT NULL DEFAULT '0',
  `Director_ID` tinyint(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`Movie_ID`,`Director_ID`),
	KEY `idx_Movie_ID` (`Movie_ID`),
	KEY `idx_Director_ID` (`Director_ID`),
    	FOREIGN KEY (Movie_ID) 
        REFERENCES Movies(Movie_ID),
    	FOREIGN KEY (Director_ID) 
        REFERENCES Directors(Director_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie_Director`
--

LOCK TABLES `Movie_Director` WRITE;
/*!40000 ALTER TABLE `Movie_Director` DISABLE KEYS */;
INSERT INTO `Movie_Director` VALUES (1,4),(2,5),(3,3),(4,2),(5,1),(7,6),(8,7),(9,8),(10,9);
/*!40000 ALTER TABLE `Movie_Director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movies`
--

DROP TABLE IF EXISTS `Movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Movies` (
  `Movie_ID` tinyint(4) NOT NULL DEFAULT '0',
  `MovieName` varchar(30) DEFAULT NULL,
  `CountryCode` varchar(2) DEFAULT NULL,
  `LanguageCode` varchar(2) DEFAULT NULL,
  `ReleaseDate` varchar(19) DEFAULT NULL,
  `StudioCode` varchar(3) DEFAULT NULL,
	PRIMARY KEY (`Movie_ID`),
	KEY `idx_Movie_ID` (`Movie_ID`),
    	FOREIGN KEY (CountryCode) 
        REFERENCES Country(CountryCode),
    	FOREIGN KEY (LanguageCode) 
        REFERENCES Language(LanguageCode),
    	FOREIGN KEY (StudioCode) 
        REFERENCES Studios(StudioCode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movies`
--

LOCK TABLES `Movies` WRITE;
/*!40000 ALTER TABLE `Movies` DISABLE KEYS */;
INSERT INTO `Movies` VALUES (1,'Gone with the Wind','US','EN','1939-01-01 00:00:00','MGM'),(2,'Wuthering Heights','US','EN','1939-01-01 00:00:00','SGS'),(3,'North by Northwest','US','EN','1959-01-01 00:00:00','MGM'),(4,'The Godfather','US','EN','1972-01-01 00:00:00','PMT'),(5,'The Grapes of Wrath','US','EN','1940-01-01 00:00:00','20F'),(7,'Goldfinger','GB','EN','1965-01-01 00:00:00','MGM'),(8,'Fatal Attraction','US','EN','1987-01-01 00:00:00','PMT'),(9,'Crouching Tiger, Hidden Dragon','CN','MN','2000-01-01 00:00:00','CPT'),(10,'The Matrix','US','EN','1999-01-01 00:00:00','WBS');
/*!40000 ALTER TABLE `Movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Studios`
--

DROP TABLE IF EXISTS `Studios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Studios` (
  `StudioCode` varchar(3) NOT NULL DEFAULT '',
  `StudioName` varchar(21) DEFAULT NULL,
	PRIMARY KEY (`StudioCode`),
	KEY `idx_StudioCode` (`StudioCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Studios`
--

LOCK TABLES `Studios` WRITE;
/*!40000 ALTER TABLE `Studios` DISABLE KEYS */;
INSERT INTO `Studios` VALUES ('MGM','Metro-Goldwyn-Mayer'),('SGS','Samuel Goldwyn Studio'),('PMT','Paramount Pictures'),('20F','20th Century Fox'),('CPT','Columbia Pictures'),('WBS','Warner Brothers');
/*!40000 ALTER TABLE `Studios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-22 15:20:26
