SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE `files` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) DEFAULT NULL,
  `taskID` int(11) DEFAULT NULL,
  `filePath` varchar(255) NOT NULL,
  PRIMARY KEY (`fileID`),
  KEY `projectID` (`projectID`),
  KEY `taskID` (`taskID`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`),
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`taskID`) REFERENCES `tasks` (`taskID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `projectFiles` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) DEFAULT NULL,
  `filePath` varchar(255) NOT NULL,
  PRIMARY KEY (`fileID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `projectFiles_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `projects` (
  `projectID` int(11) NOT NULL AUTO_INCREMENT,
  `projectName` varchar(255) NOT NULL,
  PRIMARY KEY (`projectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `taskAssignees` (
  `assigneeID` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`assigneeID`),
  KEY `taskID` (`taskID`),
  KEY `userID` (`userID`),
  CONSTRAINT `taskAssignees_ibfk_1` FOREIGN KEY (`taskID`) REFERENCES `tasks` (`taskID`),
  CONSTRAINT `taskAssignees_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `taskComments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `commentText` text NOT NULL,
  `commentDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`commentID`),
  KEY `taskID` (`taskID`),
  KEY `userID` (`userID`),
  CONSTRAINT `taskComments_ibfk_1` FOREIGN KEY (`taskID`) REFERENCES `tasks` (`taskID`),
  CONSTRAINT `taskComments_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `taskFiles` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) DEFAULT NULL,
  `filePath` varchar(255) NOT NULL,
  PRIMARY KEY (`fileID`),
  KEY `taskID` (`taskID`),
  CONSTRAINT `taskFiles_ibfk_1` FOREIGN KEY (`taskID`) REFERENCES `tasks` (`taskID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `taskHistory` (
  `historyID` int(11) NOT NULL AUTO_INCREMENT,
  `taskID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `actionType` varchar(255) NOT NULL,
  `actionDescription` text DEFAULT NULL,
  `actionDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`historyID`),
  KEY `taskID` (`taskID`),
  KEY `userID` (`userID`),
  CONSTRAINT `taskHistory_ibfk_1` FOREIGN KEY (`taskID`) REFERENCES `tasks` (`taskID`),
  CONSTRAINT `taskHistory_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `tasks` (
  `taskID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) DEFAULT NULL,
  `authorID` int(11) DEFAULT NULL,
  `taskName` varchar(255) NOT NULL,
  PRIMARY KEY (`taskID`),
  KEY `projectID` (`projectID`),
  KEY `authorID` (`authorID`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `projects` (`projectID`),
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`authorID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;