--CREATE DATABASE QuetejointuresDB; 

USE QuetejointuresDB;  

BEGIN TRANSACTION; 
CREATE TABLE continent
(
id_continent INT PRIMARY KEY IDENTITY(1,1), 
nom_continent  VARCHAR(50) NOT NULL 

);   

INSERT INTO continent (nom_continent) 
VALUES ('Terre'); 

CREATE TABLE terrien
(
id_terrien INT PRIMARY KEY IDENTITY(1,1), 
nom_terrien  VARCHAR(50) NOT NULL ,
id_continent INT NOT NULL,
CONSTRAINT fk_continent FOREIGN KEY (id_continent) 
REFERENCES continent (id_continent) 
ON DELETE CASCADE  
);

INSERT INTO terrien (nom_terrien, id_continent) 
VALUES ('Paul', 1),('Luc', 1); 


CREATE TABLE empereur  
(
id_empereur INT PRIMARY KEY IDENTITY(1,1), 
nom_empereur  VARCHAR(50) NOT NULL 

); 

INSERT INTO empereur (nom_empereur) 
VALUES ('Zabor');  

CREATE TABLE basemartien
(
id_base_martien INT PRIMARY KEY IDENTITY(1,1),
nom_base_martien  VARCHAR(50) NOT NULL

); 

INSERT INTO basemartien (nom_base_martien) 
VALUES ('Sabe'),('Natira'); 

CREATE TABLE martien
(
id_martien INT PRIMARY KEY IDENTITY(1,1),
nom_martien  VARCHAR(50) NOT NULL
id_terrien INT NOT NULL,
id_base_martien INT NOT NULL,
id_empereur INT NULL, 
CONSTRAINT fk_terrien FOREIGN KEY (id_terrien)
REFERENCES terrien (id_terrien) 
ON DELETE CASCADE
CONSTRAINT fk_base_martien FOREIGN KEY (id_base_martien)
REFERENCES basemartien (id_base_martien) 
ON DELETE CASCADE
CONSTRAINT fk_empereur FOREIGN KEY (id_empereur)
REFERENCES empereur (id_empereur)  
ON DELETE CASCADE  
); 

INSERT INTO martien (nom_martien, id_terrien, id_base_martien) 
VALUES ('Azan', 1, 2), ('Salagus', 2, 1);   
COMMIT TRANSACTION;


SELECT m.nom_martien, base.nom_base_martien, t.nom_terrien, c.nom_continent
FROM martien AS m
INNER JOIN basemartien AS base ON base.id_base_martien = m.id_base_martien 
INNER JOIN terrien AS t ON t.id_terrien = m.id_terrien  
INNER JOIN continent AS c ON c.id_continent = t.id_continent 
WHERE c.nom_continent = 'Terre';