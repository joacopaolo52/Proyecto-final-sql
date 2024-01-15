CREATE SCHEMA IF NOT EXISTS sql_coder;

USE sql_coder;


-- TABLE CONTINENTS --

DROP TABLE IF EXISTS CONTINENTS;
CREATE TABLE IF NOT EXISTS `CONTINENTS` (
`continent_id` INT NOT NULL,
`continent_name` VARCHAR(20),
PRIMARY KEY (`continent_id`) 
 ) ;  
 
-- TABLE CONFEDERATIONS --

DROP TABLE IF EXISTS  CONFEDERATIONS;
CREATE TABLE IF NOT EXISTS `CONFEDERATIONS` (
`confederation_id` INT NOT NULL,
`confederation_name` VARCHAR(20),
`continent_id` INT,
PRIMARY KEY (`confederation_id`), FOREIGN KEY (`continent_id`) REFERENCES CONTINENTS (`continent_id`)    );

-- TABLE COUNTRY --

DROP TABLE IF EXISTS  COUNTRY;
CREATE TABLE IF NOT EXISTS `COUNTRY` (
`country_id` INT AUTO_INCREMENT,
`country_name` VARCHAR(20),
`confederation_id` INT,
PRIMARY KEY (`country_id`), FOREIGN KEY (`confederation_id`) REFERENCES CONFEDERATIONS (`confederation_id`)  );



-- TABLE CONTINENTAL_TOURNAMENTS --

DROP TABLE IF EXISTS  CONTINENTAL_TOURNAMENTS;
CREATE TABLE `CONTINENTAL_TOURNAMENTS` ( 
`continental_tournament_id` INT AUTO_INCREMENT,
`continental_tournament_name` VARCHAR(80),
`confederation_id` INT,
PRIMARY KEY (`continental_tournament_id`),  FOREIGN KEY (`confederation_id`) REFERENCES CONFEDERATIONS (`confederation_id`) );



-- TABLE TEAMS --

DROP TABLE IF EXISTS TEAMS;
CREATE TABLE IF NOT EXISTS `TEAMS` (
`team_id` INT AUTO_INCREMENT,
`team_name` VARCHAR(80),
`country_id` INT,
`continental_tournament_id` INT,
PRIMARY KEY (`team_id`), FOREIGN KEY (`country_id`) REFERENCES COUNTRY (`country_id`),
FOREIGN KEY (`continental_tournament_id`) REFERENCES CONTINENTAL_TOURNAMENTS (`continental_tournament_id`) );


-- TABLE PLAYERS --
 DROP TABLE IF EXISTS PLAYERS;
CREATE TABLE IF NOT EXISTS `PLAYERS` (
`player_id` INT AUTO_INCREMENT,
`player_name` VARCHAR(50),
`player_lastname` VARCHAR(50),
`birthdate` DATE,
`player_age` INT,
`player_position` VARCHAR(50),
`team_id` INT,
`country_id` INT,
`height` DECIMAL(3,2),
PRIMARY KEY (`player_id`),
FOREIGN KEY (`team_id`) REFERENCES TEAMS (`team_id`),
FOREIGN KEY (`country_id`) REFERENCES COUNTRY (`country_id`)
);



-- TABLE VALUE --

DROP TABLE IF EXISTS  PLAYER_VALUES;
CREATE TABLE `PLAYER_VALUES` (
`value_id` INT NOT NULL,
`market_value` INT ,
`clause` BOOLEAN ,
`clause_value` INT DEFAULT NULL,
`salary` DECIMAL (8,2) ,
`player_id` INT,
PRIMARY KEY (`value_id`), FOREIGN KEY (`player_id`) REFERENCES PLAYERS (`player_id`)   );  


-- TABLE STATISTICS --

DROP TABLE IF EXISTS  STATISTICS;
CREATE TABLE `STATISTICS` (	
`statistics_id` INT NOT NULL,
`games` INT,
`goals` INT ,
`assists` INT ,
`red_cards` INT ,
`yellow_cards` INT ,
`player_id` INT,
PRIMARY KEY (`statistics_id`), FOREIGN KEY (`player_id`) REFERENCES `PLAYERS` (`player_id`)   );
