-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: g7sims_db
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `addmarks`
--

DROP TABLE IF EXISTS `addmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addmarks` (
  `sid` varchar(45) NOT NULL,
  `oop` varchar(45) NOT NULL,
  `se` varchar(45) NOT NULL,
  `dms` varchar(45) NOT NULL,
  `cn` varchar(45) NOT NULL,
  `ossa` varchar(45) NOT NULL,
  `credits` varchar(45) NOT NULL,
  `gpa` varchar(45) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CourseID` int NOT NULL AUTO_INCREMENT,
  `CourseDuration` int DEFAULT NULL,
  `CourseFee` int DEFAULT NULL,
  `CourseLevel` enum('Degree','Diploma','Certificate') DEFAULT NULL,
  `CourseDiscription` tinytext,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `ExamID` int NOT NULL AUTO_INCREMENT,
  `ExamName` varchar(25) DEFAULT NULL,
  `ExamDate` date DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  PRIMARY KEY (`ExamID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `ManagementID` int NOT NULL AUTO_INCREMENT,
  `ManagementRole` varchar(20) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`ManagementID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `NoticeID` int NOT NULL AUTO_INCREMENT,
  `NoticeTitle` varchar(100) DEFAULT NULL,
  `NoticeDate` date DEFAULT NULL,
  `NoticeContent` mediumtext,
  `NoticeImage` varchar(50) DEFAULT NULL,
  `NoticeGroup` enum('Student','Staff','All') DEFAULT NULL,
  `ManagementID` int DEFAULT NULL,
  PRIMARY KEY (`NoticeID`),
  KEY `ManagementID` (`ManagementID`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`ManagementID`) REFERENCES `management` (`ManagementID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `PaymentDate` date DEFAULT NULL,
  `PaymentStatus` varchar(10) DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  `PaymentType` varchar(20) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_ishini`
--

DROP TABLE IF EXISTS `payment_ishini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_ishini` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `fees` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `ResultID` int NOT NULL AUTO_INCREMENT,
  `ExamID` int DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `SubjectID` int DEFAULT NULL,
  `ResultMark` int DEFAULT NULL,
  `ResultGrade` char(3) DEFAULT NULL,
  PRIMARY KEY (`ResultID`),
  KEY `StudentID` (`StudentID`),
  KEY `ExamID` (`ExamID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `student` (`StudentID`),
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`ExamID`) REFERENCES `exam` (`ExamID`),
  CONSTRAINT `result_ibfk_3` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `StudentFirstName` varchar(50) DEFAULT NULL,
  `StudentLastName` varchar(50) DEFAULT NULL,
  `StudentEmail` varchar(50) DEFAULT NULL,
  `StudentRegDate` date DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `SubjectID` int NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(100) DEFAULT NULL,
  `SubjectDiscription` tinytext,
  `CourseID` int DEFAULT NULL,
  PRIMARY KEY (`SubjectID`),
  KEY `CourseID` (`CourseID`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `TeacherID` int NOT NULL AUTO_INCREMENT,
  `TeacherFirstName` varchar(50) DEFAULT NULL,
  `TeacherLastName` varchar(50) DEFAULT NULL,
  `TeacherEmail` varchar(50) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `SubjectID` int DEFAULT NULL,
  PRIMARY KEY (`TeacherID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_shakya`
--

DROP TABLE IF EXISTS `teacher_shakya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_shakya` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `lecture` varchar(255) DEFAULT NULL,
  `recording` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tute`
--

DROP TABLE IF EXISTS `tute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tute` (
  `TuteID` int NOT NULL AUTO_INCREMENT,
  `TuteNumber` int DEFAULT NULL,
  `TuteTitle` varchar(100) DEFAULT NULL,
  `TuteContent` mediumtext,
  `TuteAttachment` varchar(50) DEFAULT NULL,
  `TeacherID` int DEFAULT NULL,
  `SubjectID` int DEFAULT NULL,
  PRIMARY KEY (`TuteID`),
  KEY `TeacherID` (`TeacherID`),
  KEY `SubjectID` (`SubjectID`),
  CONSTRAINT `tute_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`TeacherID`),
  CONSTRAINT `tute_ibfk_2` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `UserType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-27 20:17:02
