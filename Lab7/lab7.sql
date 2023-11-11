SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `newsID` int(11) DEFAULT NULL,
  `commenterName` varchar(255) NOT NULL,
  `commentText` text NOT NULL,
  `commentDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`commentID`),
  KEY `newsID` (`newsID`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`newsID`) REFERENCES `news` (`newsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `news` (
  `newsID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `publicationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`newsID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ratings` (
  `ratingID` int(11) NOT NULL AUTO_INCREMENT,
  `newsID` int(11) DEFAULT NULL,
  `IPaddress` varchar(45) NOT NULL,
  `ratingValue` int(11) DEFAULT NULL CHECK (`ratingValue` between 1 and 5),
  PRIMARY KEY (`ratingID`),
  UNIQUE KEY `newsID` (`newsID`,`IPaddress`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`newsID`) REFERENCES `news` (`newsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;