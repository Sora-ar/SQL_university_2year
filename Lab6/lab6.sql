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

DROP TABLE IF EXISTS `city_names`;
CREATE TABLE `cityNames` (
  `cityID` int(11) NOT NULL,
  `cityName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `connections`;
CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `station_id1` int(11) NOT NULL,
  `station_id2` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `line_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  FOREIGN KEY (`city_id`) REFERENCES `city_names` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;