CREATE DATABASE  IF NOT EXISTS `NEMO_DATAMART_PROD` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `NEMO_DATAMART_PROD`;
-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: codyemoffitt.com    Database: NEMO_DEV
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `AIModel`
--

DROP TABLE IF EXISTS `AIModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AIModel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionID` int(11) NOT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Accuracy` decimal(32,4) DEFAULT NULL,
  `AIFeedback` bit(1) DEFAULT NULL,
  `PredictionFeedback` tinyint(1) DEFAULT NULL,
  `AI` longblob,
  `Algorithm` varchar(255) DEFAULT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ConfusionMatrix` varchar(45) DEFAULT NULL,
  `Optimizer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idAIModel_UNIQUE` (`ID`),
  KEY `AIModelQuestionID_idx` (`QuestionID`),
  CONSTRAINT `AIModelQuestionID` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AIModelParams`
--

DROP TABLE IF EXISTS `AIModelParams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AIModelParams` (
  `AIModel` int(11) NOT NULL,
  `Param` varchar(32) NOT NULL,
  `Value` varchar(256) DEFAULT NULL,
  `param_use` varchar(32) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `AIModelParamsAIModel_idx` (`AIModel`),
  CONSTRAINT `AIModelParamsAIModel` FOREIGN KEY (`AIModel`) REFERENCES `AIModel` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AIParameter`
--

DROP TABLE IF EXISTS `AIParameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AIParameter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AIModelID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `tval_char` varchar(255) DEFAULT NULL,
  `nval_num` decimal(16,16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `AIParameterTypeID_idx` (`TypeID`),
  KEY `AIParameterAIModelID_idx` (`AIModelID`),
  CONSTRAINT `AIParameterAIModelID` FOREIGN KEY (`AIModelID`) REFERENCES `AIModel` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `AIParameterTypeID` FOREIGN KEY (`TypeID`) REFERENCES `ParameterType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IrisData`
--

DROP TABLE IF EXISTS `IrisData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IrisData` (
  `sepalLength` decimal(10,10) DEFAULT NULL,
  `sepalWidth` decimal(10,10) DEFAULT NULL,
  `petalLength` decimal(10,10) DEFAULT NULL,
  `petalWidth` decimal(10,10) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `LearnerPatients`
--

DROP TABLE IF EXISTS `LearnerPatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LearnerPatients` (
  `patient_num` int(11) NOT NULL,
  PRIMARY KEY (`patient_num`),
  UNIQUE KEY `patient_num_UNIQUE` (`patient_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ParameterType`
--

DROP TABLE IF EXISTS `ParameterType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParameterType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `concept_path` varchar(1024) DEFAULT NULL,
  `concept_cd` varchar(64) DEFAULT NULL,
  `valtype_cd` varchar(64) NOT NULL,
  `TableName` varchar(255) DEFAULT NULL,
  `TableColumn` varchar(255) DEFAULT NULL,
  `bounded` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PatientReadmittance`
--

DROP TABLE IF EXISTS `PatientReadmittance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PatientReadmittance` (
  `patient_num` int(11) NOT NULL,
  `readmitted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`patient_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `DateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `PatientJSON` varchar(4096) DEFAULT NULL,
  `Classifier` varchar(4096) DEFAULT NULL,
  `Optimizer` varchar(4096) DEFAULT NULL,
  `Prediction` varchar(256) DEFAULT NULL,
  `MakePrediction` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `QuestionUserID_idx` (`UserID`),
  KEY `QuestionStatusID_idx` (`StatusID`),
  KEY `QuestionTypeID_idx` (`TypeID`),
  KEY `QuestionEventID_idx` (`EventID`),
  CONSTRAINT `QuestionEventID` FOREIGN KEY (`EventID`) REFERENCES `QuestionEvent` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `QuestionStatusID` FOREIGN KEY (`StatusID`) REFERENCES `QuestionStatus` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `QuestionTypeID` FOREIGN KEY (`TypeID`) REFERENCES `QuestionType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `QuestionUserID` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuestionEvent`
--

DROP TABLE IF EXISTS `QuestionEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionEvent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `concept_path` varchar(255) DEFAULT NULL,
  `concept_cd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  UNIQUE KEY `concept_path_UNIQUE` (`concept_path`),
  UNIQUE KEY `concept_cd_UNIQUE` (`concept_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuestionParameter`
--

DROP TABLE IF EXISTS `QuestionParameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionParameter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `QuestionID` int(11) NOT NULL,
  `tval_char` varchar(64) DEFAULT NULL,
  `nval_num` decimal(64,0) DEFAULT NULL,
  `concept_path` varchar(1024) DEFAULT NULL,
  `concept_cd` varchar(64) DEFAULT NULL,
  `valtype_cd` varchar(64) NOT NULL,
  `TableName` varchar(255) DEFAULT NULL,
  `TableColumn` varchar(255) DEFAULT NULL,
  `min` decimal(64,0) DEFAULT NULL,
  `max` decimal(64,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `QuestionParameterQuestionID_idx` (`QuestionID`),
  CONSTRAINT `QuestionParameterQuestionID` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuestionStatus`
--

DROP TABLE IF EXISTS `QuestionStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionStatus` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Status_UNIQUE` (`Status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `QuestionType`
--

DROP TABLE IF EXISTS `QuestionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Type_UNIQUE` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TestPatients`
--

DROP TABLE IF EXISTS `TestPatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestPatients` (
  `patient_num` int(11) NOT NULL,
  PRIMARY KEY (`patient_num`),
  UNIQUE KEY `patient_num_UNIQUE` (`patient_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserTypeID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Hash` varchar(255) NOT NULL,
  `First` varchar(255) NOT NULL,
  `Last` varchar(255) NOT NULL,
  `Affiliation` varchar(255) DEFAULT NULL,
  `Confirmed` tinyint(4) DEFAULT NULL,
  `ConfirmationHash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idUser_UNIQUE` (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Email`),
  KEY `UserUserTypeID_idx` (`UserTypeID`),
  CONSTRAINT `UserUserTypeID` FOREIGN KEY (`UserTypeID`) REFERENCES `UserType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserPrivilege`
--

DROP TABLE IF EXISTS `UserPrivilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserPrivilege` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserTypeID` int(11) NOT NULL,
  `Privilege` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Privilege_UNIQUE` (`Privilege`),
  KEY `UserTypeID_idx` (`UserTypeID`),
  KEY `UserPrivliegeUserTypeID_idx` (`UserTypeID`),
  CONSTRAINT `UserPrivilegeUserTypeID` FOREIGN KEY (`UserTypeID`) REFERENCES `UserType` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserSession`
--

DROP TABLE IF EXISTS `UserSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSession` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `LoginTime` datetime NOT NULL,
  `LastRequest` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `UserSessionUserID_idx` (`UserID`),
  CONSTRAINT `UserSessionUserID` FOREIGN KEY (`UserID`) REFERENCES `User` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserType`
--

DROP TABLE IF EXISTS `UserType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) DEFAULT NULL,
  `MaxQuestions` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UserType_UNIQUE` (`ID`),
  UNIQUE KEY `Type_UNIQUE` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `code_lookup`
--

DROP TABLE IF EXISTS `code_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `code_lookup` (
  `table_cd` varchar(100) NOT NULL,
  `column_cd` varchar(100) NOT NULL,
  `code_cd` varchar(50) NOT NULL,
  `name_char` varchar(650) DEFAULT NULL,
  `lookup_blob` longtext,
  `upload_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `download_date` datetime DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `sourcesystem_cd` varchar(50) DEFAULT NULL,
  `upload_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`table_cd`,`column_cd`,`code_cd`),
  KEY `cl_idx_name_char` (`name_char`(255)),
  KEY `cl_idx_uploadid` (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concept_dimension`
--

DROP TABLE IF EXISTS `concept_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_dimension` (
  `concept_path` varchar(700) NOT NULL,
  `concept_cd` varchar(50) DEFAULT NULL,
  `name_char` varchar(2000) DEFAULT NULL,
  `concept_blob` longtext,
  `update_date` datetime DEFAULT NULL,
  `download_date` datetime DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `sourcesystem_cd` varchar(50) DEFAULT NULL,
  `upload_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_path`(255)),
  KEY `cd_idx_uploadid` (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `observation_fact`
--

DROP TABLE IF EXISTS `observation_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observation_fact` (
  `encounter_num` int(11) NOT NULL,
  `patient_num` int(11) NOT NULL,
  `concept_cd` varchar(50) NOT NULL,
  `provider_id` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `modifier_cd` varchar(100) NOT NULL DEFAULT '@',
  `instance_num` int(11) NOT NULL DEFAULT '1',
  `valtype_cd` varchar(50) DEFAULT NULL,
  `tval_char` varchar(255) DEFAULT NULL,
  `nval_num` decimal(18,5) DEFAULT NULL,
  `valueflag_cd` varchar(50) DEFAULT NULL,
  `quantity_num` decimal(18,5) DEFAULT NULL,
  `units_cd` varchar(50) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `location_cd` varchar(50) DEFAULT NULL,
  `observation_blob` longtext,
  `confidence_num` decimal(18,5) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `download_date` datetime DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `sourcesystem_cd` varchar(50) DEFAULT NULL,
  `upload_id` int(11) DEFAULT NULL,
  `text_search_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_num`,`concept_cd`,`modifier_cd`,`start_date`,`encounter_num`,`instance_num`,`provider_id`),
  KEY `of_idx_allobservation_fact` (`encounter_num`,`patient_num`,`concept_cd`,`provider_id`,`start_date`,`modifier_cd`,`instance_num`,`valtype_cd`,`tval_char`,`nval_num`,`valueflag_cd`,`quantity_num`,`units_cd`,`end_date`,`location_cd`,`confidence_num`),
  KEY `of_idx_clusteredconcept` (`concept_cd`),
  KEY `of_idx_encounter_patient` (`encounter_num`,`patient_num`,`instance_num`),
  KEY `of_idx_modifier` (`modifier_cd`),
  KEY `of_idx_sourcesystem_cd` (`sourcesystem_cd`),
  KEY `of_idx_start_date` (`patient_num`,`start_date`),
  KEY `of_idx_uploadid` (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `patient_dimension`
--

DROP TABLE IF EXISTS `patient_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_dimension` (
  `patient_num` int(11) NOT NULL,
  `vital_status_cd` varchar(50) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `death_date` datetime DEFAULT NULL,
  `sex_cd` varchar(50) DEFAULT NULL,
  `age_in_years_num` int(11) DEFAULT NULL,
  `language_cd` varchar(50) DEFAULT NULL,
  `race_cd` varchar(50) DEFAULT NULL,
  `marital_status_cd` varchar(50) DEFAULT NULL,
  `religion_cd` varchar(50) DEFAULT NULL,
  `zip_cd` varchar(10) DEFAULT NULL,
  `statecityzip_path` varchar(700) DEFAULT NULL,
  `income_cd` varchar(50) DEFAULT NULL,
  `patient_blob` longtext,
  `update_date` datetime DEFAULT NULL,
  `download_date` datetime DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `sourcesystem_cd` varchar(50) DEFAULT NULL,
  `upload_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_num`),
  KEY `pa_idx_uploadid` (`upload_id`),
  KEY `pd_idx_allpatientdim` (`patient_num`,`vital_status_cd`,`birth_date`,`death_date`,`sex_cd`,`age_in_years_num`,`language_cd`,`race_cd`,`marital_status_cd`,`religion_cd`,`zip_cd`,`income_cd`),
  KEY `pd_idx_dates` (`patient_num`,`vital_status_cd`,`birth_date`,`death_date`),
  KEY `pd_idx_statecityzip` (`patient_num`,`statecityzip_path`(255))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_dimension`
--

DROP TABLE IF EXISTS `provider_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_dimension` (
  `provider_id` varchar(50) NOT NULL,
  `provider_path` varchar(700) NOT NULL,
  `name_char` varchar(850) DEFAULT NULL,
  `provider_blob` longtext,
  `update_date` datetime DEFAULT NULL,
  `download_date` datetime DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `sourcesystem_cd` varchar(50) DEFAULT NULL,
  `upload_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`provider_path`(255),`provider_id`),
  KEY `pd_idx_name_char` (`provider_id`,`name_char`(255)),
  KEY `pd_idx_uploadid` (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visit_dimension`
--

DROP TABLE IF EXISTS `visit_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_dimension` (
  `encounter_num` int(11) NOT NULL,
  `patient_num` int(11) NOT NULL,
  `active_status_cd` varchar(50) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `inout_cd` varchar(50) DEFAULT NULL,
  `location_cd` varchar(50) DEFAULT NULL,
  `location_path` varchar(900) DEFAULT NULL,
  `length_of_stay` int(11) DEFAULT NULL,
  `visit_blob` longtext,
  `update_date` datetime DEFAULT NULL,
  `download_date` datetime DEFAULT NULL,
  `import_date` datetime DEFAULT NULL,
  `sourcesystem_cd` varchar(50) DEFAULT NULL,
  `upload_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`encounter_num`,`patient_num`),
  KEY `vd_idx_allvisitdim` (`encounter_num`,`patient_num`,`start_date`,`end_date`,`inout_cd`,`location_cd`,`length_of_stay`),
  KEY `vd_idx_dates` (`encounter_num`,`start_date`,`end_date`),
  KEY `vd_idx_uploadid` (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-01 17:09:02


-- INSERT DATA

-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: codyemoffitt.com    Database: NEMO_DEV
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Dumping data for table `QuestionEvent`
--

LOCK TABLES `QuestionEvent` WRITE;
/*!40000 ALTER TABLE `QuestionEvent` DISABLE KEYS */;
INSERT INTO `QuestionEvent` VALUES (1,'Readmittance','dummy path','dummy cd');
/*!40000 ALTER TABLE `QuestionEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `QuestionStatus`
--

LOCK TABLES `QuestionStatus` WRITE;
/*!40000 ALTER TABLE `QuestionStatus` DISABLE KEYS */;
INSERT INTO `QuestionStatus` VALUES (3,'Awaiting Feedback'),(4,'Not Enough Data'),(1,'Queued'),(2,'Running'), (5, 'Error');
/*!40000 ALTER TABLE `QuestionStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `QuestionType`
--

LOCK TABLES `QuestionType` WRITE;
/*!40000 ALTER TABLE `QuestionType` DISABLE KEYS */;
INSERT INTO `QuestionType` VALUES (1,'Chance of');
/*!40000 ALTER TABLE `QuestionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `UserType`
--

LOCK TABLES `UserType` WRITE;
/*!40000 ALTER TABLE `UserType` DISABLE KEYS */;
INSERT INTO `UserType` VALUES (1,'Super',10),(2,'Normal',5);
/*!40000 ALTER TABLE `UserType` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-01 17:14:07
