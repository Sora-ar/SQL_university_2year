SELECT name, region, population
FROM cities
WHERE population > 350000

SELECT cities.name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord'

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `cityNames`;
CREATE TABLE `cityNames` (
  `cityID` int(11) NOT NULL,
  `cityName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `connections`;
CREATE TABLE `connections` (
  `connectionID` int(11) NOT NULL,
  `stationID1` int(11) NOT NULL,
  `stationID2` int(11) NOT NULL,
  `connectionType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `lineID` int(11) NOT NULL,
  `lineName` varchar(255) NOT NULL,
  `cityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `stationID` int(11) NOT NULL,
  `stationName` varchar(255) NOT NULL,
  `lineID` int(11) NOT NULL,
  `cityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;