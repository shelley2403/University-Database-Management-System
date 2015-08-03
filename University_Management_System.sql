CREATE DATABASE  IF NOT EXISTS `universitymanagementsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `universitymanagementsystem`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: universitymanagementsystem
-- ------------------------------------------------------
-- Server version	5.6.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administration`
--

DROP TABLE IF EXISTS `administration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administration` (
  `administratorID` int(11) NOT NULL,
  `designation` varchar(45) NOT NULL,
  PRIMARY KEY (`administratorID`),
  CONSTRAINT `fk_administratorID_admin` FOREIGN KEY (`administratorID`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administration`
--

LOCK TABLES `administration` WRITE;
/*!40000 ALTER TABLE `administration` DISABLE KEYS */;
INSERT INTO `administration` VALUES (4006,'Director of Counseling and Health Services'),(4008,'Director of Finance Department');
/*!40000 ALTER TABLE `administration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advisor` (
  `advisorID` int(11) NOT NULL,
  PRIMARY KEY (`advisorID`),
  CONSTRAINT `fk_advisorID` FOREIGN KEY (`advisorID`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES (4000),(4001),(4007);
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `assignmentID` int(11) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  `deadlineDate` date NOT NULL,
  `deadlineTime` time NOT NULL,
  `possiblePoints` tinyint(4) NOT NULL,
  PRIMARY KEY (`assignmentID`),
  KEY `fk_sectionID_idx` (`sectionID`),
  CONSTRAINT `fk_sectionID_assignment` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (2000050,20000,'aed1hw','2014-04-18','23:59:59',100),(2001050,20010,'wd1hw','2014-04-19','23:59:59',100),(2001150,20011,'wd2hw','2014-04-20','00:00:00',100),(2002050,20020,'ba1hw','2014-04-21','23:00:00',50),(2003050,20030,'db1hw','2014-04-22','23:59:59',100),(2004050,20040,'wt1hw','2014-04-22','23:59:59',100),(2005050,20050,'ne1hw','2014-04-23','23:59:59',100);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `authorID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `authorDetails` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (909091,'Russell','Hibbeler','Published Engineering Mechanics'),(909092,'Bjarne','Stroustrup','Published C++'),(909093,'James','Kurose','Published Computer Networking'),(909094,'Keith','Ross','Published Computer Networking'),(909095,'Abi','Aghayere','Published Structural Steel Design'),(909096,'Jason','Vigil','Published Structural Steel Design'),(909097,'Susan','Reidel','Published Electric Circuits and C++');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_has_copies`
--

DROP TABLE IF EXISTS `book_has_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_has_copies` (
  `copyNo` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`copyNo`),
  KEY `fk_bookID_copies` (`bookID`),
  CONSTRAINT `fk_bookID_copies` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_has_copies`
--

LOCK TABLES `book_has_copies` WRITE;
/*!40000 ALTER TABLE `book_has_copies` DISABLE KEYS */;
INSERT INTO `book_has_copies` VALUES (8080801,808080,NULL),(8080802,808080,NULL),(8080811,808081,NULL),(8080821,808082,NULL),(8080831,808083,NULL),(8080841,808084,'Available');
/*!40000 ALTER TABLE `book_has_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `bookID` int(11) NOT NULL,
  `bookName` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`bookID`),
  KEY `book_Idx` (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (808080,'C++ Programming Launguage','For IS and CS'),(808081,'Engineering Mechanics','For ME'),(808082,'Computer Networking','For TSM'),(808083,'Electric Circuits','For EC'),(808084,'Structural Steel Design','For Civil');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_has_author`
--

DROP TABLE IF EXISTS `books_has_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_has_author` (
  `books_bookID` int(11) NOT NULL,
  `author_authorID` int(11) NOT NULL,
  PRIMARY KEY (`books_bookID`,`author_authorID`),
  KEY `fk_books_has_author_author1_idx` (`author_authorID`),
  KEY `fk_books_has_author_books1_idx` (`books_bookID`),
  CONSTRAINT `fk_books_has_author_books1` FOREIGN KEY (`books_bookID`) REFERENCES `books` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_author_author1` FOREIGN KEY (`author_authorID`) REFERENCES `author` (`authorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_has_author`
--

LOCK TABLES `books_has_author` WRITE;
/*!40000 ALTER TABLE `books_has_author` DISABLE KEYS */;
INSERT INTO `books_has_author` VALUES (808081,909091),(808080,909092),(808082,909093),(808082,909094),(808084,909095),(808084,909096),(808080,909097),(808083,909097);
/*!40000 ALTER TABLE `books_has_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `buildingID` int(11) NOT NULL,
  `buildingName` varchar(45) NOT NULL,
  PRIMARY KEY (`buildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (50,'Richards Hall'),(51,'Dodge Hall'),(52,'Shillman Hall'),(53,'Snell Engineering Center'),(54,'Marino Center');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coop`
--

DROP TABLE IF EXISTS `coop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coop` (
  `coopID` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `hours` smallint(6) NOT NULL,
  `position` varchar(45) NOT NULL,
  `companyName` varchar(45) NOT NULL,
  PRIMARY KEY (`coopID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coop`
--

LOCK TABLES `coop` WRITE;
/*!40000 ALTER TABLE `coop` DISABLE KEYS */;
INSERT INTO `coop` VALUES (500,'4 months',40,'Software Developer','Communispace'),(501,'8 month',40,'Software Engineer','Akamai'),(502,'6 month',40,'Web Developer','Amazon'),(503,'6 month',40,'Front End Developer','A10'),(504,'8 month',40,'Network Engineer','Juniper');
/*!40000 ALTER TABLE `coop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(45) NOT NULL,
  `credits` smallint(6) NOT NULL,
  `hours` smallint(6) NOT NULL,
  `description` varchar(45) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `No_of_Classes` smallint(6) NOT NULL,
  `No_of_Seats` smallint(6) NOT NULL,
  PRIMARY KEY (`courseID`),
  KEY `fk_departmentID_idx` (`departmentID`),
  KEY `course_Idx` (`courseID`),
  CONSTRAINT `fk_departmentID_course` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (2000,'Application Engineering',4,60,'AED',100,10,120),(2001,'Web Design',4,60,'WD',100,20,30),(2002,'Business Analysis',4,60,'BA',101,12,40),(2003,'Database Management',4,70,'DB',100,11,80),(2004,'Web Tools',4,80,'WT',102,22,60),(2005,'Network Engineering',4,40,'NE',101,18,100),(2006,'Project Management',4,75,'PM',100,25,40);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_has_prerequisite`
--

DROP TABLE IF EXISTS `course_has_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_has_prerequisite` (
  `courseID` int(11) NOT NULL,
  `prerequisiteID` int(11) NOT NULL,
  PRIMARY KEY (`courseID`,`prerequisiteID`),
  KEY `fk_course_has_prerequisite_prerequisite1_idx` (`prerequisiteID`),
  KEY `fk_course_has_prerequisite_course1_idx` (`courseID`),
  CONSTRAINT `fk_course_has_prerequisite_course1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_has_prerequisite_prerequisite1` FOREIGN KEY (`prerequisiteID`) REFERENCES `prerequisite` (`prerequisiteID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_has_prerequisite`
--

LOCK TABLES `course_has_prerequisite` WRITE;
/*!40000 ALTER TABLE `course_has_prerequisite` DISABLE KEYS */;
INSERT INTO `course_has_prerequisite` VALUES (2004,2001),(2006,2002),(2000,2003),(2005,2003);
/*!40000 ALTER TABLE `course_has_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL,
  `departmentName` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `budget` varchar(45) NOT NULL,
  `officeNo` varchar(15) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (100,'College of Engineering','This is a Graduate School.','10000','2541369857'),(101,'College of Computer Science','This is a Graduate School','20000','6541232589'),(102,'College of Professional Studies','Thsi is an Undergraduate and Graduate School','30000','5412879632'),(103,'Department of Finance','Maintains staff and student Finance records','1000','7531598524'),(104,'Department of Registrar','Maintain student and staff record','1000','3571598745'),(105,'Department of Health Services','Maintain insurance record of students','3000','1233211232'),(106,'Library Affairs','Library maintainance','10000','1235245232');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_has_advisor`
--

DROP TABLE IF EXISTS `department_has_advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_has_advisor` (
  `advisorID` int(11) NOT NULL,
  `departmentID` int(11) NOT NULL,
  PRIMARY KEY (`advisorID`,`departmentID`),
  KEY `fk_advisor_has_department_department1_idx` (`departmentID`),
  KEY `fk_advisor_has_department_advisor1_idx` (`advisorID`),
  CONSTRAINT `fk_advisor_has_department_advisor1` FOREIGN KEY (`advisorID`) REFERENCES `advisor` (`advisorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_advisor_has_department_department1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_has_advisor`
--

LOCK TABLES `department_has_advisor` WRITE;
/*!40000 ALTER TABLE `department_has_advisor` DISABLE KEYS */;
INSERT INTO `department_has_advisor` VALUES (4000,100),(4001,101),(4001,102),(4007,102);
/*!40000 ALTER TABLE `department_has_advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diningservices`
--

DROP TABLE IF EXISTS `diningservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diningservices` (
  `diningID` int(11) NOT NULL,
  `date_of_bill` date NOT NULL,
  `studentID` int(11) NOT NULL,
  `totalAmount` float NOT NULL,
  `amountPaid` float NOT NULL,
  PRIMARY KEY (`diningID`,`date_of_bill`),
  KEY `fk_studentID_dining_idx` (`studentID`),
  CONSTRAINT `fk_studentID_dining` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diningservices`
--

LOCK TABLES `diningservices` WRITE;
/*!40000 ALTER TABLE `diningservices` DISABLE KEYS */;
INSERT INTO `diningservices` VALUES (505050,'2014-01-01',1907894,500,400),(505051,'2013-02-02',1907898,500,500),(505052,'2012-03-01',1907900,600,500),(505053,'2012-06-01',1907899,550,5250.5);
/*!40000 ALTER TABLE `diningservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebill`
--

DROP TABLE IF EXISTS `ebill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebill` (
  `billID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `date_of_payment` date NOT NULL,
  `description` varchar(45) NOT NULL,
  `totalAmount` float NOT NULL,
  `semester` varchar(45) NOT NULL,
  `year` year(4) NOT NULL,
  `amountPaid` float NOT NULL,
  PRIMARY KEY (`billID`),
  KEY `fk_studentID_idx` (`studentID`),
  CONSTRAINT `fk_studentID_bill` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebill`
--

LOCK TABLES `ebill` WRITE;
/*!40000 ALTER TABLE `ebill` DISABLE KEYS */;
INSERT INTO `ebill` VALUES (900000,1907894,'2013-07-07','sem 1',10000,'fall',2013,10000),(900001,1907894,'2014-05-05','sem 3',12000,'summer',2014,2000),(900002,1907895,'2013-07-25','sem 2',11250,'spring',2014,11250),(900003,1907896,'2012-07-23','sem 1',10050,'fall',2012,10000),(900004,1907897,'2012-07-16','sem 1',10050,'fall',2012,10050);
/*!40000 ALTER TABLE `ebill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebill_backup`
--

DROP TABLE IF EXISTS `ebill_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebill_backup` (
  `billID` int(11) NOT NULL,
  `totalAmount` float NOT NULL,
  `semester` varchar(45) NOT NULL,
  `year` year(4) NOT NULL,
  `amountPaid` float NOT NULL,
  `amountDue` float NOT NULL,
  `studentID` int(11) NOT NULL,
  `date_of_payment` date NOT NULL,
  PRIMARY KEY (`billID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebill_backup`
--

LOCK TABLES `ebill_backup` WRITE;
/*!40000 ALTER TABLE `ebill_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ebill_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employeeID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `contactNo` varchar(15) NOT NULL,
  `address` varchar(45) NOT NULL,
  `hiringDate` date NOT NULL,
  `ssn` varchar(9) NOT NULL,
  `departmentID` int(11) NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `fk_departmentID_idx` (`departmentID`),
  CONSTRAINT `fk_departmentID_employee` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (4000,'Lino','Lemelin',NULL,'1474147414','Mumbai','2013-12-12','147414741',100),(4001,'Kandra','Kellems',NULL,'2587412587','Delhi','2012-03-26','258741258',101),(4002,'Micha','Matsui',NULL,'7898789878','Bangaluru','2011-08-08','258741255',102),(4003,'Jessia','July',NULL,'1020304050','Chennai','2010-09-09','102030101',103),(4004,'Torri','Toledo',NULL,'6541230145','Kolkata','2009-02-02','654123010',100),(4005,'Catherina','Clement',NULL,'9515951595','Indore','2008-06-06','159515951',104),(4006,'Lindsey','Legendre',NULL,'7535753575','Bhopal','2007-12-12','125634785',105),(4007,'Lorine','Larger',NULL,'4569852369','Shimla','2006-04-04','412563254',102),(4008,'James','Johanson',NULL,'5874587458','Pune','2013-06-28','785478547',105);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_salarydetails`
--

DROP TABLE IF EXISTS `employee_salarydetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_salarydetails` (
  `accountID` int(11) NOT NULL,
  `date_on_bill` date NOT NULL,
  `employeeID` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `salary` float NOT NULL,
  `deductions` float NOT NULL,
  `tax` float NOT NULL,
  PRIMARY KEY (`accountID`,`date_on_bill`),
  KEY `fk_employeeID_salary_idx` (`employeeID`),
  CONSTRAINT `fk_employeeID_salary` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salarydetails`
--

LOCK TABLES `employee_salarydetails` WRITE;
/*!40000 ALTER TABLE `employee_salarydetails` DISABLE KEYS */;
INSERT INTO `employee_salarydetails` VALUES (125,'2014-02-02',4002,'santander',110000,0,13),(258,'2013-02-01',4001,'citizen',100000,25,12.25),(745,'2012-11-14',4000,'boa',119500,0,13.75),(745,'2012-12-12',4000,'boa',120000,75,13.75);
/*!40000 ALTER TABLE `employee_salarydetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeesalary_backup`
--

DROP TABLE IF EXISTS `employeesalary_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeesalary_backup` (
  `accountID` int(11) NOT NULL,
  `date_on_bill` date NOT NULL,
  `employeeID` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `salary` float NOT NULL,
  `deductions` float NOT NULL,
  `tax` float NOT NULL,
  PRIMARY KEY (`accountID`,`date_on_bill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeesalary_backup`
--

LOCK TABLES `employeesalary_backup` WRITE;
/*!40000 ALTER TABLE `employeesalary_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeesalary_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gradereport`
--

DROP TABLE IF EXISTS `gradereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradereport` (
  `reportID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `attempt` tinyint(4) NOT NULL DEFAULT '1',
  `letterGrade` enum('A','A-','B+','B','B-','C+','C','F') NOT NULL,
  `numericGrade` float NOT NULL,
  `semester` varchar(45) NOT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`reportID`),
  KEY `fk_studentID_idx` (`studentID`),
  KEY `fk_courseID_idx` (`courseID`),
  CONSTRAINT `fk_courseID_report` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_studentID_report` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradereport`
--

LOCK TABLES `gradereport` WRITE;
/*!40000 ALTER TABLE `gradereport` DISABLE KEYS */;
INSERT INTO `gradereport` VALUES (101010,2000,1907894,1,'C',2.4,'Fall',2013),(101011,2000,1907894,2,'A-',3.7,'Spring',2014),(101012,2001,1907894,1,'B+',3.4,'Fall',2013),(101013,2001,1907895,1,'B',3,'Fall',2012),(101014,2002,1907896,1,'A-',3.7,'Summer',2013),(101015,2002,1907897,1,'A',4,'Fall ',2013),(101016,2002,1907898,1,'A',4,'Fall',2014),(101017,2003,1907898,1,'A-',3.7,'Fall',2014),(101018,2004,1907899,1,'B',3,'Fall',2014),(101019,2005,1907900,1,'A',4,'Fall',2014);
/*!40000 ALTER TABLE `gradereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian`
--

DROP TABLE IF EXISTS `guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardian` (
  `guardianID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `address` varchar(45) NOT NULL,
  `contactNo` varchar(15) NOT NULL,
  PRIMARY KEY (`guardianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian`
--

LOCK TABLES `guardian` WRITE;
/*!40000 ALTER TABLE `guardian` DISABLE KEYS */;
INSERT INTO `guardian` VALUES (1000,'Donna','Kinnear',NULL,'Boston','7894561373'),(1001,'Carlo','Kensinger','Sam','Seattle','9874563215'),(1002,'Oliver','Fondren',NULL,'Chicago','7412589632'),(1003,'Claris','Spotts','Samuel','Miami','6547893215'),(1004,'Tona','Doxey',NULL,'Cambridge','3214568524'),(1005,'Nakesha','Michael',NULL,'Waltham','7413698524');
/*!40000 ALTER TABLE `guardian` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER backup_guardian BEFORE DELETE ON guardian
FOR EACH ROW
BEGIN
    INSERT INTO 
    GuardianBackUp(guardianID, firstName, middleName, lastName, address, contactNo) 
	values(OLD.guardianID, OLD.firstName, OLD.middleName, OLD.lastName, OLD.address, OLD.contactNo);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `guardianbackup`
--

DROP TABLE IF EXISTS `guardianbackup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guardianbackup` (
  `guardianID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `address` varchar(45) NOT NULL,
  `contactNo` varchar(15) NOT NULL,
  PRIMARY KEY (`guardianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardianbackup`
--

LOCK TABLES `guardianbackup` WRITE;
/*!40000 ALTER TABLE `guardianbackup` DISABLE KEYS */;
INSERT INTO `guardianbackup` VALUES (1006,'Tonus','Doxeyy',NULL,'Boston','9871231456');
/*!40000 ALTER TABLE `guardianbackup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `instructorID` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`instructorID`),
  CONSTRAINT `fk_instructorID` FOREIGN KEY (`instructorID`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (4000,'lino@gmail.com'),(4001,'kandra@gmail.com'),(4002,'micha@aol.com'),(4004,'torri@yahoo.com'),(4007,'lorine@gmail.com');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_has_books`
--

DROP TABLE IF EXISTS `instructor_has_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_has_books` (
  `instructorID` int(11) NOT NULL,
  `copyNo` int(11) NOT NULL,
  `issueDate` date NOT NULL,
  `returnDate` date DEFAULT NULL,
  PRIMARY KEY (`instructorID`,`copyNo`),
  KEY `fk_instructor_has_books_instructor1_idx` (`instructorID`),
  KEY `fk_copyNo_has_idx` (`copyNo`),
  CONSTRAINT `fk_instructor_has_books_instructor1` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_copyNo_has` FOREIGN KEY (`copyNo`) REFERENCES `book_has_copies` (`copyNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_has_books`
--

LOCK TABLES `instructor_has_books` WRITE;
/*!40000 ALTER TABLE `instructor_has_books` DISABLE KEYS */;
INSERT INTO `instructor_has_books` VALUES (4001,8080821,'2014-04-01',NULL),(4001,8080841,'2014-03-12','2014-03-24'),(4007,8080831,'2013-12-15',NULL);
/*!40000 ALTER TABLE `instructor_has_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurancerecord`
--

DROP TABLE IF EXISTS `insurancerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurancerecord` (
  `insuranceID` int(11) NOT NULL,
  `issueDate` date NOT NULL,
  `expiryDate` date NOT NULL,
  `amountCovered` float NOT NULL,
  `studentID` int(11) NOT NULL,
  PRIMARY KEY (`insuranceID`),
  KEY `fk_insuranceRecord_student1_idx` (`studentID`),
  CONSTRAINT `fk_studentID_insurance` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurancerecord`
--

LOCK TABLES `insurancerecord` WRITE;
/*!40000 ALTER TABLE `insurancerecord` DISABLE KEYS */;
INSERT INTO `insurancerecord` VALUES (321456,'2014-05-05','2017-05-05',10000,1907894),(321457,'2014-03-03','2018-03-03',20000,1907895),(321458,'2014-01-01','2019-01-01',30000,1907896),(321459,'2013-06-06','2020-06-06',40000,1907897);
/*!40000 ALTER TABLE `insurancerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issirecord`
--

DROP TABLE IF EXISTS `issirecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issirecord` (
  `recordID` int(11) NOT NULL,
  `permAddress` varchar(45) NOT NULL,
  `permContact` varchar(15) NOT NULL,
  `i20_No` int(11) NOT NULL,
  `visaNo` varchar(15) NOT NULL,
  `visaStatus` varchar(45) NOT NULL,
  `studentID` int(11) NOT NULL,
  PRIMARY KEY (`recordID`),
  KEY `fk_issiRecord_student1_idx` (`studentID`),
  CONSTRAINT `fk_studentID_issi` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issirecord`
--

LOCK TABLES `issirecord` WRITE;
/*!40000 ALTER TABLE `issirecord` DISABLE KEYS */;
INSERT INTO `issirecord` VALUES (700000,'India','9874569857',700000,'abc100','F1',1907894),(700001,'China','7896544565',700001,'abc101','H1',1907895),(700002,'France','4565874589',700002,'abc102','F1',1907896),(700003,'Italy','2587456925',700003,'abc103','H1',1907897),(700004,'US','2145214452',700004,'abc104','US Citizen',1907898);
/*!40000 ALTER TABLE `issirecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian` (
  `librarianID` int(11) NOT NULL,
  PRIMARY KEY (`librarianID`),
  CONSTRAINT `fk_librarianID` FOREIGN KEY (`librarianID`) REFERENCES `employee` (`employeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (4004),(4005);
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian_maintains_bookstock`
--

DROP TABLE IF EXISTS `librarian_maintains_bookstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `librarian_maintains_bookstock` (
  `librarianID` int(11) NOT NULL,
  `bookID` int(11) NOT NULL,
  `purchasedFrom` varchar(45) NOT NULL,
  `amount` float NOT NULL,
  `quantity` mediumint(9) NOT NULL,
  PRIMARY KEY (`librarianID`,`bookID`),
  KEY `fk_bookID_idx` (`bookID`),
  CONSTRAINT `fk_bookID_maintains` FOREIGN KEY (`bookID`) REFERENCES `books` (`bookID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_librarianID_maintains` FOREIGN KEY (`librarianID`) REFERENCES `librarian` (`librarianID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian_maintains_bookstock`
--

LOCK TABLES `librarian_maintains_bookstock` WRITE;
/*!40000 ALTER TABLE `librarian_maintains_bookstock` DISABLE KEYS */;
INSERT INTO `librarian_maintains_bookstock` VALUES (4004,808080,'abc',20.2,2),(4004,808081,'qwe',14.5,1),(4005,808082,'hnm',18,1);
/*!40000 ALTER TABLE `librarian_maintains_bookstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majordepartment`
--

DROP TABLE IF EXISTS `majordepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `majordepartment` (
  `majorID` int(11) NOT NULL,
  PRIMARY KEY (`majorID`),
  CONSTRAINT `fk_majorID` FOREIGN KEY (`majorID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majordepartment`
--

LOCK TABLES `majordepartment` WRITE;
/*!40000 ALTER TABLE `majordepartment` DISABLE KEYS */;
INSERT INTO `majordepartment` VALUES (100),(101);
/*!40000 ALTER TABLE `majordepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minordepartment`
--

DROP TABLE IF EXISTS `minordepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minordepartment` (
  `minorID` int(11) NOT NULL,
  PRIMARY KEY (`minorID`),
  CONSTRAINT `fk_minorID` FOREIGN KEY (`minorID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minordepartment`
--

LOCK TABLES `minordepartment` WRITE;
/*!40000 ALTER TABLE `minordepartment` DISABLE KEYS */;
INSERT INTO `minordepartment` VALUES (102);
/*!40000 ALTER TABLE `minordepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parttimejob`
--

DROP TABLE IF EXISTS `parttimejob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parttimejob` (
  `jobID` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `hours` smallint(6) NOT NULL,
  `position` varchar(45) NOT NULL,
  `companyName` varchar(45) NOT NULL,
  PRIMARY KEY (`jobID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parttimejob`
--

LOCK TABLES `parttimejob` WRITE;
/*!40000 ALTER TABLE `parttimejob` DISABLE KEYS */;
INSERT INTO `parttimejob` VALUES (600,'Cashier',35,'Cashier','Wollaston'),(601,'Rso',40,'Proctor','RSO'),(602,'Tech Support',40,'Technical Support','NEU IT desk'),(603,'Waitor',40,'Waitor','Arbor Pain'),(604,'Librarian assistance',40,'Librarian','NEU Library');
/*!40000 ALTER TABLE `parttimejob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisite`
--

DROP TABLE IF EXISTS `prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prerequisite` (
  `prerequisiteID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) NOT NULL,
  `credits` tinyint(4) NOT NULL,
  PRIMARY KEY (`prerequisiteID`),
  CONSTRAINT `fk_prerequisiteID` FOREIGN KEY (`prerequisiteID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisite`
--

LOCK TABLES `prerequisite` WRITE;
/*!40000 ALTER TABLE `prerequisite` DISABLE KEYS */;
INSERT INTO `prerequisite` VALUES (2001,'WD','2001 required for 2004',4),(2002,'BA','2002 required for 2006',4),(2003,'DB','2003 required for 2000 and 2005',4);
/*!40000 ALTER TABLE `prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `roomID` smallint(6) NOT NULL,
  `roomName` varchar(45) NOT NULL,
  `buildingID` int(11) NOT NULL,
  `capacity` tinyint(4) NOT NULL,
  PRIMARY KEY (`roomID`),
  KEY `fk_buildingID_idx` (`buildingID`),
  CONSTRAINT `fk_buildingID_room` FOREIGN KEY (`buildingID`) REFERENCES `building` (`buildingID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (500,'room1',50,50),(510,'room1',51,50),(520,'room1',52,60),(521,'room2',52,80),(530,'room1',53,100);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section` (
  `sectionID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `sectionName` varchar(45) NOT NULL,
  `instructorID` int(11) NOT NULL,
  PRIMARY KEY (`sectionID`),
  KEY `fk_courseID_idx` (`courseID`),
  KEY `fk_instructorID_idx` (`instructorID`),
  KEY `section_Idx` (`sectionID`),
  CONSTRAINT `fk_courseID_section` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_instructorID_section` FOREIGN KEY (`instructorID`) REFERENCES `instructor` (`instructorID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (20000,2000,'AED1',4000),(20010,2001,'WD1',4000),(20011,2001,'WD2',4000),(20020,2002,'BA1',4001),(20030,2003,'DB1',4004),(20040,2004,'WT1',4007),(20050,2005,'NE1',4001);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_dayslot`
--

DROP TABLE IF EXISTS `section_dayslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_dayslot` (
  `day` varchar(10) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  PRIMARY KEY (`day`,`sectionID`),
  KEY `fk_sectionID_idx` (`sectionID`),
  CONSTRAINT `fk_sectionID_slot` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_dayslot`
--

LOCK TABLES `section_dayslot` WRITE;
/*!40000 ALTER TABLE `section_dayslot` DISABLE KEYS */;
INSERT INTO `section_dayslot` VALUES ('Fri',20000,'14:00:00','15:00:00'),('Fri',20011,'13:30:00','15:30:00'),('Mon',20010,'14:00:00','16:00:00'),('Tue',20011,'13:30:00','15:30:00'),('Wed',20010,'14:00:00','16:00:00');
/*!40000 ALTER TABLE `section_dayslot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_in_building`
--

DROP TABLE IF EXISTS `section_in_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_in_building` (
  `sectionID` int(11) NOT NULL,
  `buildingID` int(11) NOT NULL,
  PRIMARY KEY (`sectionID`,`buildingID`),
  KEY `fk_section_has_building_building1_idx` (`buildingID`),
  KEY `fk_section_has_building_section1_idx` (`sectionID`),
  CONSTRAINT `fk_section_has_building_building1` FOREIGN KEY (`buildingID`) REFERENCES `building` (`buildingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_building_section1` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_in_building`
--

LOCK TABLES `section_in_building` WRITE;
/*!40000 ALTER TABLE `section_in_building` DISABLE KEYS */;
INSERT INTO `section_in_building` VALUES (20000,50),(20030,50),(20010,51),(20040,51),(20011,52),(20020,53);
/*!40000 ALTER TABLE `section_in_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) NOT NULL,
  `ssn` varchar(9) DEFAULT NULL,
  `dob` date NOT NULL,
  `currentAddress` varchar(45) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `currentPhoneNo` varchar(15) NOT NULL,
  `email` varchar(45) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `guadianID` int(11) NOT NULL,
  PRIMARY KEY (`studentID`),
  KEY `fk_departmentID_idx` (`departmentID`),
  KEY `fk_guardianID_idx` (`guadianID`),
  KEY `student_Idx` (`studentID`),
  CONSTRAINT `fk_departmentID_student` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_guardianID_student` FOREIGN KEY (`guadianID`) REFERENCES `guardian` (`guardianID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1907894,'Celia',NULL,'Moore',NULL,'1990-03-12','Boston','Female','1236541256','celia@neu.edu',101,1000),(1907895,'Randal',NULL,'Morace',NULL,'1991-12-25','Cambridge','Female','5478547854','randal@neu.edu',101,1001),(1907896,'Mayra','','Bengtson',NULL,'1992-06-06','Waltham','Female','1233214565','mayra@neu.edu',102,1002),(1907897,'Tona',NULL,'Bengtson',NULL,'1985-05-05','Waltham','Female','4566544569','tona@neu.edu',102,1002),(1907898,'Maria',NULL,'Spiker',NULL,'1992-07-25','Beijing','Female','5412145632','maria@neu.edu',101,1003),(1907899,'Wilbur',NULL,'Burditt',NULL,'1993-08-08','Paris','Male','2585258525','wilbur@neu.edu',100,1004),(1907900,'Chong','Sal','Larimer','789654123','1994-02-01','Rome','Male','7458963215','chong@neu.edu',101,1005),(1907901,'Shelley',NULL,'Bhatnagar','654456987','1991-03-24','Boston','Female','6544569877','shelley@neu.edu',100,1005);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER backup_student BEFORE UPDATE ON student
FOR EACH ROW
BEGIN
    INSERT INTO 
    student_Backup(studentID, firstName, middleName, lastName, address, phoneNo, guardianID) 
	values(Old.studentID,Old.firstName,Old.middleName,Old.lastName,Old.currentAddress,Old.currentPhoneNo,Old.guadianID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_academicrecord`
--

DROP TABLE IF EXISTS `student_academicrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_academicrecord` (
  `studentID` int(11) NOT NULL,
  `pastMajor` varchar(45) NOT NULL,
  `greScore` mediumint(9) NOT NULL,
  `toeflScore` mediumint(9) NOT NULL,
  `pastGPA` float NOT NULL,
  `workEx` varchar(20) NOT NULL DEFAULT '0',
  `currentGPA` float NOT NULL,
  PRIMARY KEY (`studentID`),
  KEY `fk_student_academicRecord_student1_idx` (`studentID`),
  CONSTRAINT `fk_studentID_acads` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_academicrecord`
--

LOCK TABLES `student_academicrecord` WRITE;
/*!40000 ALTER TABLE `student_academicrecord` DISABLE KEYS */;
INSERT INTO `student_academicrecord` VALUES (1907894,'EC',100,100,3.2,'0',3.4),(1907895,'CS',115,105,3.1,'1 year',3.3),(1907896,'IT',112,102,3.5,'2.5 years',3.5),(1907897,'CS',114,105,3.6,'2 years',3.6),(1907898,'IT',107,99,3.4,'0',3.7),(1907899,'CS',109,109,3.1,'3 years',3.8),(1907900,'Civil',114,98,3.4,'0',3.7);
/*!40000 ALTER TABLE `student_academicrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_backup`
--

DROP TABLE IF EXISTS `student_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_backup` (
  `studentID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `middleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) NOT NULL,
  `phoneNo` varchar(15) NOT NULL,
  `address` varchar(45) NOT NULL,
  `guardianID` int(11) NOT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_backup`
--

LOCK TABLES `student_backup` WRITE;
/*!40000 ALTER TABLE `student_backup` DISABLE KEYS */;
INSERT INTO `student_backup` VALUES (1907894,'Celia',NULL,'Moore','1236541256','Boston',1000);
/*!40000 ALTER TABLE `student_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_coop`
--

DROP TABLE IF EXISTS `student_has_coop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_coop` (
  `student_studentID` int(11) NOT NULL,
  `coop_coopID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `salary` float NOT NULL,
  PRIMARY KEY (`student_studentID`,`coop_coopID`),
  KEY `fk_student_has_coop_coop1_idx` (`coop_coopID`),
  KEY `fk_student_has_coop_student1_idx` (`student_studentID`),
  CONSTRAINT `fk_student_has_coop_coop1` FOREIGN KEY (`coop_coopID`) REFERENCES `coop` (`coopID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_coop_student1` FOREIGN KEY (`student_studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_coop`
--

LOCK TABLES `student_has_coop` WRITE;
/*!40000 ALTER TABLE `student_has_coop` DISABLE KEYS */;
INSERT INTO `student_has_coop` VALUES (1907894,500,'2013-02-25','2013-10-25',35),(1907895,501,'2013-05-05','2013-11-05',30),(1907896,502,'2013-04-04','2013-10-04',32),(1907897,503,'2012-03-20','2012-09-20',28);
/*!40000 ALTER TABLE `student_has_coop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_part_time_job`
--

DROP TABLE IF EXISTS `student_has_part_time_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_has_part_time_job` (
  `studentID` int(11) NOT NULL,
  `jobID` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `salary` float NOT NULL,
  PRIMARY KEY (`studentID`,`jobID`),
  KEY `fk_jobID_idx` (`jobID`),
  CONSTRAINT `fk_jobID_parttime` FOREIGN KEY (`jobID`) REFERENCES `parttimejob` (`jobID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_studentID_parttime` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_part_time_job`
--

LOCK TABLES `student_has_part_time_job` WRITE;
/*!40000 ALTER TABLE `student_has_part_time_job` DISABLE KEYS */;
INSERT INTO `student_has_part_time_job` VALUES (1907896,602,'2014-03-03',NULL,9.2),(1907898,600,'2013-08-05',NULL,8.75),(1907899,601,'2014-02-01',NULL,9.99),(1907900,602,'2013-10-20','2014-03-24',7.45);
/*!40000 ALTER TABLE `student_has_part_time_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_issues_books`
--

DROP TABLE IF EXISTS `student_issues_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_issues_books` (
  `copyNo` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `issueDate` date NOT NULL,
  `returnDate` date DEFAULT NULL,
  PRIMARY KEY (`copyNo`,`studentID`),
  KEY `fk_book_has_copies_has_student_student1_idx` (`studentID`),
  KEY `fk_book_has_copies_has_student_book_has_copies1_idx` (`copyNo`),
  CONSTRAINT `fk_book_has_copies_has_student_book_has_copies1` FOREIGN KEY (`copyNo`) REFERENCES `book_has_copies` (`copyNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_has_copies_has_student_student1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_issues_books`
--

LOCK TABLES `student_issues_books` WRITE;
/*!40000 ALTER TABLE `student_issues_books` DISABLE KEYS */;
INSERT INTO `student_issues_books` VALUES (8080801,1907901,'2013-12-12','2014-01-12'),(8080802,1907900,'2014-01-11','2014-01-21'),(8080811,1907894,'2014-02-02',NULL),(8080821,1907894,'2014-01-25',NULL),(8080841,1907894,'2014-01-12','2014-04-14');
/*!40000 ALTER TABLE `student_issues_books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER statusUpdate_books AFTER INSERT ON student_issues_books
FOR EACH ROW
BEGIN
   if(NEW.returnDate = 0000-00-00) THEN
update book_has_copies
set status = 'Unavailable'
where copyNo = New.copyNo;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER statusReturn_books AFTER UPDATE ON student_issues_books
FOR EACH ROW
BEGIN
   if(NEW.returnDate > OLD.returnDate) THEN
update book_has_copies
set status = 'Available'
where copyNo = New.copyNo;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_maintains_attendance`
--

DROP TABLE IF EXISTS `student_maintains_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_maintains_attendance` (
  `studentID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `date` date NOT NULL,
  `count` smallint(6) NOT NULL,
  PRIMARY KEY (`studentID`,`courseID`,`date`),
  KEY `fk_courseID_idx` (`courseID`),
  CONSTRAINT `fk_courseID_attendance` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_studentID_attendance` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_maintains_attendance`
--

LOCK TABLES `student_maintains_attendance` WRITE;
/*!40000 ALTER TABLE `student_maintains_attendance` DISABLE KEYS */;
INSERT INTO `student_maintains_attendance` VALUES (1907894,2000,'2013-07-07',7),(1907894,2000,'2014-08-25',9),(1907894,2001,'2013-09-25',18),(1907895,2001,'2013-09-12',19);
/*!40000 ALTER TABLE `student_maintains_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_registers_courses`
--

DROP TABLE IF EXISTS `student_registers_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_registers_courses` (
  `studentID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  `registrationDate` date NOT NULL,
  PRIMARY KEY (`studentID`,`courseID`,`registrationDate`),
  KEY `fk_student_has_course_course1_idx` (`courseID`),
  KEY `fk_student_has_course_student1_idx` (`studentID`),
  CONSTRAINT `fk_student_has_course_student1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_course_course1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_registers_courses`
--

LOCK TABLES `student_registers_courses` WRITE;
/*!40000 ALTER TABLE `student_registers_courses` DISABLE KEYS */;
INSERT INTO `student_registers_courses` VALUES (1907894,2000,'2013-04-07'),(1907894,2000,'2014-05-10'),(1907894,2001,'2013-04-07'),(1907895,2001,'2013-04-23'),(1907896,2002,'2012-06-28'),(1907897,2002,'2013-08-17'),(1907898,2002,'2014-05-22'),(1907898,2003,'2014-05-21'),(1907899,2004,'2014-05-20'),(1907900,2005,'2014-04-29');
/*!40000 ALTER TABLE `student_registers_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_submit_assignment`
--

DROP TABLE IF EXISTS `student_submit_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_submit_assignment` (
  `assignmentID` int(11) NOT NULL,
  `studentID` int(11) NOT NULL,
  `evaluationDate` date DEFAULT NULL,
  `pointsObtained` tinyint(4) DEFAULT NULL,
  `writtenEvaluation` varchar(45) DEFAULT '-',
  `submissionDate` date NOT NULL,
  `submissionTime` time NOT NULL,
  PRIMARY KEY (`assignmentID`,`studentID`),
  KEY `fk_studentID_idx` (`studentID`),
  CONSTRAINT `fk_assignmentID_submit` FOREIGN KEY (`assignmentID`) REFERENCES `assignment` (`assignmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_studentID_submit` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_submit_assignment`
--

LOCK TABLES `student_submit_assignment` WRITE;
/*!40000 ALTER TABLE `student_submit_assignment` DISABLE KEYS */;
INSERT INTO `student_submit_assignment` VALUES (2000050,1907894,'2014-04-19',99,'great job','2014-04-18','23:00:00'),(2000050,1907895,'2014-04-11',100,'-','2014-04-19','22:00:00'),(2000050,1907896,NULL,NULL,'-','2014-04-10','21:00:00'),(2001050,1907895,'2014-04-20',90,'null pointer in q1','2014-04-19','22:20:20'),(2001050,1907896,'2014-04-20',92,'null pointer in q2','2014-04-20','12:20:20'),(2002050,1907897,'2014-04-25',45,'-','2014-04-21','23:00:01'),(2002050,1907898,NULL,NULL,'-','2014-04-22','05:05:05'),(2005050,1907897,'2014-04-30',95,'-','2014-04-23','23:59:58');
/*!40000 ALTER TABLE `student_submit_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `student_view`
--

DROP TABLE IF EXISTS `student_view`;
/*!50001 DROP VIEW IF EXISTS `student_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `student_view` (
  `firstName` tinyint NOT NULL,
  `courseName` tinyint NOT NULL,
  `sectionID` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `student_view`
--

/*!50001 DROP TABLE IF EXISTS `student_view`*/;
/*!50001 DROP VIEW IF EXISTS `student_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_view` AS (select `s`.`firstName` AS `firstName`,`c`.`courseName` AS `courseName`,`se`.`sectionID` AS `sectionID`,`a`.`description` AS `description`,`sma`.`count` AS `count` from (((((`student` `s` join `student_registers_courses`) join `course` `c`) join `section` `se`) join `assignment` `a`) join `student_maintains_attendance` `sma`) where ((`s`.`studentID` = `student_registers_courses`.`studentID`) and (`student_registers_courses`.`courseID` = `c`.`courseID`) and (`c`.`courseID` = `se`.`courseID`) and (`se`.`sectionID` = `a`.`sectionID`) and (`sma`.`studentID` = `s`.`studentID`) and (`sma`.`courseID` = `c`.`courseID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-20 23:41:27
