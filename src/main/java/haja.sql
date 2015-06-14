# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.24)
# Database: haja
# Generation Time: 2015-06-14 14:17:57 +0000
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
	(1,'Via delle Baleari','00122','Roma');

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
	(1,1.2,3,1,1),
	(2,1.2,2,2,1);

/*!40000 ALTER TABLE `OrderLine` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `closingDate` datetime DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `evasionDate` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC3DF62E52EF992CD` (`user_id`),
  CONSTRAINT `FKC3DF62E52EF992CD` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `closingDate`, `creationDate`, `evasionDate`, `user_id`)
VALUES
	(1,'2015-06-02 00:00:00','2015-06-02 00:00:00','2015-06-02 00:00:00',1);

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
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `price` (`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;

INSERT INTO `Product` (`id`, `description`, `name`, `price`, `quantity`)
VALUES
	(1,'Cialda nera di caffè Ristretto','Ristretto',0.4,1000),
	(2,'Cialda oro di caffè Dulsao. Dal Brasile.','Dulsao',0.6,150),
	(3,'Cialda rossa di caffè decaffeinato','Decaffeinato',0.5,956),
	(4,'Zucchero di canna bio. Proveniente dal Guatemala','Zucchero di canna',6,48);

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
	(1,'nespressione@info.com','123456789789','Nespressione','067682341'),
	(2,'caffettao@info.com','67512567779','Caffettao','066612771');

/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Supplier_Product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Supplier_Product`;

CREATE TABLE `Supplier_Product` (
  `suppliers_id` bigint(20) NOT NULL,
  `products_id` bigint(20) NOT NULL,
  KEY `FKF375BD7CAFDF00F2` (`products_id`),
  KEY `FKF375BD7C5ECFED72` (`suppliers_id`),
  CONSTRAINT `FKF375BD7C5ECFED72` FOREIGN KEY (`suppliers_id`) REFERENCES `Supplier` (`id`),
  CONSTRAINT `FKF375BD7CAFDF00F2` FOREIGN KEY (`products_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Supplier_Product` WRITE;
/*!40000 ALTER TABLE `Supplier_Product` DISABLE KEYS */;

INSERT INTO `Supplier_Product` (`suppliers_id`, `products_id`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(2,2),
	(2,3);

/*!40000 ALTER TABLE `Supplier_Product` ENABLE KEYS */;
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
	(1,'1993-09-25','ale@gmail.com','Alessio','Zoccoli','ale','pass','2015-09-25','ROLE_ADMIN',1);

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
