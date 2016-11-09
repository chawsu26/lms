/*
SQLyog Community v9.63 
MySQL - 5.5.8 : Database - lms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `lms`;

/*Table structure for table `student_info` */

DROP TABLE IF EXISTS `student_info`;

CREATE TABLE `student_info` (
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student_info` */

insert  into `student_info`(`email`,`name`) values ('aungaung@gmail.com','aungaung'),('ayeaye@gmail.com','aye'),('chaw@gmail.com','chaw'),('khinlay@gmail.com','khinlay'),('kyawkyaw@gmail.com','kyaw'),('ngrlay@gmail.com','ngrlay'),('smm@gmail.com','sumyat'),('sulay@gmail.com','sulay');

/*Table structure for table `time_table` */

DROP TABLE IF EXISTS `time_table`;

CREATE TABLE `time_table` (
  `class_name` varchar(50) NOT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `time_table` */

insert  into `time_table`(`class_name`,`file_name`) values ('Section-A','a.jpg'),('Section-B','b.jpg'),('Section-C','c.jpg'),('Section-D','d.jpg'),('Section-E','e.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
