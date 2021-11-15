CREATE DATABASE  IF NOT EXISTS `progress` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `progress`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: progress
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `группа`
--

DROP TABLE IF EXISTS `группа`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `группа` (
  `idГруппы` smallint NOT NULL,
  `название` varchar(45) NOT NULL,
  `idФакультета` smallint NOT NULL,
  `год создания` smallint DEFAULT NULL,
  PRIMARY KEY (`idГруппы`),
  KEY `fk_группа_факультет_idx` (`idФакультета`),
  CONSTRAINT `fk_группа_факультет` FOREIGN KEY (`idФакультета`) REFERENCES `факультет` (`idФакультета`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `группа`
--

LOCK TABLES `группа` WRITE;
/*!40000 ALTER TABLE `группа` DISABLE KEYS */;
INSERT INTO `группа` VALUES (1,'МАТ-201',9,2020),(2,'МАТ-202',9,2020),(3,'КБ-201',9,2020),(4,'ПОИТ-201',9,2020),(5,'ПОИТ-202',9,2020),(6,'ПОИТ-203',9,2020),(7,'ПОИТ-204',9,2020),(8,'МАТ-211',9,2021),(9,'КБ-211',9,2021),(10,'ПОИТ-211',9,2021),(11,'ПОИТ-212',9,2021),(12,'ПОИТ-213',9,2021),(13,'ПОИТ-214',9,2021),(14,'ФИЗ-201',5,2020),(15,'ФИЗ-211',5,2021),(16,'КФ-201',5,2020),(17,'КФ-211',5,2021),(18,'ЭМ-201',2,2020),(19,'ЭМ-211',2,2021),(20,'ЭКОН-201',2,2020),(21,'ЭКОН-211',2,2021);
/*!40000 ALTER TABLE `группа` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `дисциплина`
--

DROP TABLE IF EXISTS `дисциплина`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `дисциплина` (
  `idДисциплины` smallint NOT NULL,
  `название` varchar(100) NOT NULL,
  `количество часов` smallint DEFAULT NULL,
  `idФакультета` smallint NOT NULL,
  PRIMARY KEY (`idДисциплины`),
  KEY `fk_дисциплина_факультет_idx` (`idФакультета`),
  CONSTRAINT `fk_дисциплина_факультет` FOREIGN KEY (`idФакультета`) REFERENCES `факультет` (`idФакультета`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `дисциплина`
--

LOCK TABLES `дисциплина` WRITE;
/*!40000 ALTER TABLE `дисциплина` DISABLE KEYS */;
INSERT INTO `дисциплина` VALUES (1,'Геометрия и алгебра',340,9),(2,'Иностранный язык',120,9),(3,'Иностранный язык',200,11),(4,'Иностранный язык',200,12),(5,'Иностранный язык',200,13),(6,'Математический анализ',510,9),(7,'Математический анализ',340,5),(8,'Математический анализ',340,14),(9,'Математический анализ',340,2),(10,'Основы алгоритмизации и программирования',120,9),(11,'Основы алгоритмизации и программирования',120,14),(12,'Практика программирования',60,9),(13,'Практика программирования',48,14),(14,'Физическая культура',68,1),(15,'Физическая культура',68,2),(16,'Физическая культура',68,3),(17,'Физическая культура',68,4),(18,'Физическая культура',68,5),(19,'Физическая культура',68,6),(20,'Физическая культура',68,7),(21,'Физическая культура',68,8),(22,'Физическая культура',68,9),(23,'Физическая культура',68,10),(24,'Физическая культура',68,11),(25,'Физическая культура',68,12),(26,'Физическая культура',68,13),(27,'Физическая культура',68,14),(28,'Дискретная математика',340,9),(29,'Дискретная математика',340,14),(30,'Дискретная математика',200,5),(31,'Дискретная математика',120,2),(32,'Права человека',60,1),(33,'Права человека',60,2),(34,'Права человека',80,3),(35,'Права человека',60,4),(36,'Права человека',60,5),(37,'Права человека',60,6),(38,'Права человека',60,7),(39,'Права человека',60,8),(40,'Права человека',60,9),(41,'Права человека',60,10),(42,'Права человека',80,11),(43,'Права человека',80,12),(44,'Права человека',60,13),(45,'Права человека',60,14),(46,'Вычислительные методы алгебры',158,9),(47,'Вычислительные методы алгебры',158,5),(48,'Вычислительные методы алгебры',140,14),(49,'Дифференциальные уравнения',104,9),(50,'Дифференциальные уравнения',100,2),(51,'Дифференциальные уравнения',120,5),(52,'Дифференциальные уравнения',100,8),(53,'Дифференциальные уравнения',120,14),(54,'Социология',80,1),(55,'Социология',50,2),(56,'Социология',80,3),(57,'Социология',80,4),(58,'Социология',50,5),(59,'Социология',50,6),(60,'Социология',80,7),(61,'Социология',50,8),(62,'Социология',50,9),(63,'Социология',50,10),(64,'Социология',80,11),(65,'Социология',80,12),(66,'Социология',50,13),(67,'Социология',50,14),(68,'Экономическая теория',94,1),(69,'Экономическая теория',200,2),(70,'Экономическая теория',94,3),(71,'Экономическая теория',94,4),(72,'Экономическая теория',94,5),(73,'Экономическая теория',94,6),(74,'Экономическая теория',94,7),(75,'Экономическая теория',94,8),(76,'Экономическая теория',94,9),(77,'Экономическая теория',94,10),(78,'Экономическая теория',94,11),(79,'Экономическая теория',94,12),(80,'Экономическая теория',94,13),(81,'Экономическая теория',94,14);
/*!40000 ALTER TABLE `дисциплина` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `контроль дисциплины`
--

DROP TABLE IF EXISTS `контроль дисциплины`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `контроль дисциплины` (
  `idКонтрДисциплины` smallint NOT NULL,
  `idДисциплины` smallint NOT NULL,
  `idТипа` smallint NOT NULL,
  PRIMARY KEY (`idКонтрДисциплины`),
  UNIQUE KEY `index3` (`idДисциплины`,`idТипа`) /*!80000 INVISIBLE */,
  KEY `fk_контроль_тип_idx` (`idТипа`),
  CONSTRAINT `fk_контроль_дисциплина` FOREIGN KEY (`idДисциплины`) REFERENCES `дисциплина` (`idДисциплины`),
  CONSTRAINT `fk_контроль_тип` FOREIGN KEY (`idТипа`) REFERENCES `тип контроля` (`idТипа`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `контроль дисциплины`
--

LOCK TABLES `контроль дисциплины` WRITE;
/*!40000 ALTER TABLE `контроль дисциплины` DISABLE KEYS */;
INSERT INTO `контроль дисциплины` VALUES (1,1,1),(2,1,2),(3,1,5),(4,1,6),(5,6,1),(6,6,2),(7,6,5),(8,6,6),(9,14,2),(10,15,2),(11,16,2),(12,17,2),(13,18,2),(14,19,2),(15,20,2),(16,21,2),(17,22,2),(18,23,2),(19,24,2),(20,25,2),(21,26,2),(22,27,2),(23,32,2),(24,33,2),(25,34,2),(26,35,2),(27,36,2),(28,37,2),(29,38,2),(30,39,2),(31,40,2),(32,41,2),(33,42,2),(34,43,2),(35,44,2),(36,45,2),(37,46,1),(38,47,1),(39,48,1),(40,46,7),(41,47,7),(42,48,7);
/*!40000 ALTER TABLE `контроль дисциплины` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `преподаватель`
--

DROP TABLE IF EXISTS `преподаватель`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `преподаватель` (
  `idПреподавателя` smallint NOT NULL,
  `Фамилия` varchar(100) NOT NULL,
  `Имя` varchar(45) NOT NULL,
  `Отчество` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `idФакультета` smallint NOT NULL,
  PRIMARY KEY (`idПреподавателя`),
  KEY `fk_преподаватель_факультет_idx` (`idФакультета`),
  CONSTRAINT `fk_преподаватель_факультет` FOREIGN KEY (`idФакультета`) REFERENCES `факультет` (`idФакультета`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `преподаватель`
--

LOCK TABLES `преподаватель` WRITE;
/*!40000 ALTER TABLE `преподаватель` DISABLE KEYS */;
INSERT INTO `преподаватель` VALUES (1,'Кощеева','Любава','Олеговна','natoque.penatibus.et@hotmail.edu',1),(2,'Ошуркова','Полина','Несторовна','lectus.quis.massa@hotmail.edu',2),(3,'Чебыкин','Борис','Филимонович','diam@yahoo.couk',3),(4,'Головнин','Кузьма','Евлампиевич','eget@aol.ca',4),(5,'Расторгуев','Петр','Пахомович','penatibus@google.ca',5),(6,'Яфаев','Максимильян','Эрнестович','proin.vel@protonmail.com',6),(7,'Салтанов','Марк','Сергеевич','tortor.nibh.sit@protonmail.edu',7),(8,'Быстров','Арсений','Платонович','elit.sed.consequat@yahoo.com',8),(9,'Кондратьев','Анатолий','Геннадиевич','quam@protonmail.org',9),(10,'Цейдлица','Надежда','Степановна','donec@yahoo.couk',10),(11,'Козакова','Роза','Антониновна','non@outlook.com',11),(12,'Ишеева','Жанна','Давидовна','sed.sem.egestas@aol.ca',12),(13,'Фурманова','Владлена','Владиленовна','ligula.elit.pretium@google.net',13),(14,'Полищука','Ангелина','Несторовна','facilisis.vitae.orci@protonmail.ca',14),(15,'Крюкова','Наталья','Мефодиевна','arcu@aol.ca',1),(16,'Еськов','Карл','Федотович','risus.quis@icloud.couk',2);
/*!40000 ALTER TABLE `преподаватель` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `проверочная работа`
--

DROP TABLE IF EXISTS `проверочная работа`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `проверочная работа` (
  `idРаботы` int NOT NULL,
  `дата` date NOT NULL,
  `idКонтрДисциплины` smallint NOT NULL,
  `номер зачетки` int NOT NULL,
  `оценка` tinyint NOT NULL,
  `idПреподавателя` smallint NOT NULL,
  PRIMARY KEY (`idРаботы`),
  KEY `fk_работа_студент_idx` (`номер зачетки`),
  KEY `fk_работа_преподаватель_idx` (`idПреподавателя`),
  KEY `fk_работа_контрольДисциплины_idx` (`idКонтрДисциплины`),
  CONSTRAINT `fk_работа_контрольДисциплины` FOREIGN KEY (`idКонтрДисциплины`) REFERENCES `контроль дисциплины` (`idКонтрДисциплины`),
  CONSTRAINT `fk_работа_преподаватель` FOREIGN KEY (`idПреподавателя`) REFERENCES `преподаватель` (`idПреподавателя`),
  CONSTRAINT `fk_работа_студент` FOREIGN KEY (`номер зачетки`) REFERENCES `студент` (`номер зачетки`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `проверочная работа`
--

LOCK TABLES `проверочная работа` WRITE;
/*!40000 ALTER TABLE `проверочная работа` DISABLE KEYS */;
/*!40000 ALTER TABLE `проверочная работа` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `студент`
--

DROP TABLE IF EXISTS `студент`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `студент` (
  `номер зачетки` int NOT NULL,
  `Фамилия` varchar(100) NOT NULL,
  `Имя` varchar(45) NOT NULL,
  `Отчество` varchar(45) DEFAULT NULL,
  `idГруппы` smallint NOT NULL,
  `тип обучения` varchar(45) NOT NULL,
  PRIMARY KEY (`номер зачетки`),
  KEY `fk_студент_группа_idx` (`idГруппы`),
  CONSTRAINT `fk_студент_группа` FOREIGN KEY (`idГруппы`) REFERENCES `группа` (`idГруппы`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `студент`
--

LOCK TABLES `студент` WRITE;
/*!40000 ALTER TABLE `студент` DISABLE KEYS */;
/*!40000 ALTER TABLE `студент` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `тип контроля`
--

DROP TABLE IF EXISTS `тип контроля`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `тип контроля` (
  `idТипа` smallint NOT NULL,
  `Название типа` varchar(255) NOT NULL,
  PRIMARY KEY (`idТипа`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `тип контроля`
--

LOCK TABLES `тип контроля` WRITE;
/*!40000 ALTER TABLE `тип контроля` DISABLE KEYS */;
INSERT INTO `тип контроля` VALUES (1,'Экзамен'),(2,'Зачет'),(3,'Дифференцированный зачет'),(4,'Тестирование'),(5,'Самостоятельная работа'),(6,'Контрольная работа'),(7,'Выполнение и защита практического или лабораторного задания');
/*!40000 ALTER TABLE `тип контроля` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `факультет`
--

DROP TABLE IF EXISTS `факультет`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `факультет` (
  `idФакультета` smallint NOT NULL,
  `название` varchar(255) NOT NULL,
  `Фамилия декана` varchar(45) NOT NULL,
  `Имя декана` varchar(45) NOT NULL,
  `Отчество декана` varchar(45) NOT NULL,
  PRIMARY KEY (`idФакультета`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `факультет`
--

LOCK TABLES `факультет` WRITE;
/*!40000 ALTER TABLE `факультет` DISABLE KEYS */;
INSERT INTO `факультет` VALUES (1,'Филологический','Аксенова','Кира','Данииловна'),(2,'Экономический','Александрова','Арина','Викторовна'),(3,'Юридический','Виноградова','Полина','Марковна'),(4,'Исторический','Глухов ','Егор','Фёдорович'),(5,'Физический','Дмитриев','Андрей','Ильич'),(6,'Биологический','Кузнецова','Диана','Антоновна'),(7,'Гуманитарный','Кондрашова','Мирослава','Глебовна'),(8,'Химический','Котов','Дмитрий','Даниилович'),(9,'Математический','Левин','Всеволод','Артёмович'),(10,'Географический','Мельников','Максим','Иванович'),(11,'Международных отношений','Миронова','Мирослава','Александровна'),(12,'Социокультурных коммуникаций','Морозова','Елизавета','Георгиевна'),(13,'Журналистики','Наумова','Таисия','Артемьевна'),(14,'Радиофизики','Демьянов','Мирон','Михайлович');
/*!40000 ALTER TABLE `факультет` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 11:16:36
