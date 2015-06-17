# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.24)
# Database: haja
# Generation Time: 2015-06-16 18:09:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Address`;

CREATE TABLE `Address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_line` varchar(255) NOT NULL,
  `cap` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;

INSERT INTO `Address` (`id`, `address_line`, `cap`, `city`)
VALUES
	(1,'Via delle Vie 14','00120','Roma'),
	(2,'Viale Roma 34','21030','Milano');

/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table OrderLine
# ------------------------------------------------------------

DROP TABLE IF EXISTS `OrderLine`;

CREATE TABLE `OrderLine` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `orders_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK60177442A877D570` (`orders_id`),
  KEY `FK6017744271365587` (`product_id`),
  CONSTRAINT `FK6017744271365587` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`),
  CONSTRAINT `FK60177442A877D570` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `OrderLine` WRITE;
/*!40000 ALTER TABLE `OrderLine` DISABLE KEYS */;

INSERT INTO `OrderLine` (`id`, `price`, `quantity`, `product_id`, `orders_id`)
VALUES
	(4,0.4,2,1,2),
	(5,0.6,2,2,2),
	(6,0.4,1,3,2);

/*!40000 ALTER TABLE `OrderLine` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `closingDate` date NOT NULL,
  `creationDate` date NOT NULL,
  `evasionDate` date DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3DF62E52EF992CD` (`user_id`),
  CONSTRAINT `FKC3DF62E52EF992CD` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `closingDate`, `creationDate`, `evasionDate`, `state`, `user_id`)
VALUES
	(2,'2015-06-16','2015-06-16','2015-06-16','active',2);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;

INSERT INTO `Product` (`id`, `description`, `name`, `price`, `quantity`)
VALUES
	(1,'Cialda di caffè Ristretto','Ristretto',0.4,10098),
	(2,'Cialda di caffè Dulsao','Dulsao',0.6,242),
	(3,'Cialda di caffè Decaffeinato','Decaffeinato',0.4,1999),
	(4,'Zucchero di canna Bio. Proveniente dal Perù','Zucchero di canna',6,79);

/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Supplier`;

CREATE TABLE `Supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `iva` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;

INSERT INTO `Supplier` (`id`, `email`, `iva`, `name`, `phone`)
VALUES
	(1,'nespressione@info.it','45786543456789','Nespressione s.p.a','025614564'),
	(2,'caffeenonsolo@info.it','75825358536439','Caffe&NonSolo s.r.l',NULL);

/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birthDate` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `registrationDate` date NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `password` (`password`),
  KEY `FK285FEB26B23B67` (`address_id`),
  CONSTRAINT `FK285FEB26B23B67` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`id`, `birthDate`, `email`, `firstName`, `lastName`, `nickname`, `password`, `registrationDate`, `role`, `address_id`)
VALUES
	(1,'1993-11-11','admin@haja.com','admin','admin','admin','admin','2015-04-01','ROLE_ADMIN',1),
	(2,'1993-09-11','john@gmail.com','John','Red','johnny','password','2015-11-11','ROLE_USER',2);

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
