--CREATE DATABASE SuperMoney;
USE SuperMoney;
CREATE TABLE logs ("id" INT PRIMARY KEY IDENTITY(1,1), "user" VARCHAR(50), "message" VARCHAR(50));
INSERT INTO logs ("user","message") VALUES ('hack3r', 'Connects');
INSERT INTO logs ("user","message") VALUES ('hack3r', 'Connects');
INSERT INTO logs ("user","message") VALUES ('hack3r' , 'Erases file'); 
INSERT INTO logs ("user","message") VALUES ('hack3r', 'Connects');
INSERT INTO logs ("user","message") VALUES ('hack3r', 'Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Leaves');
INSERT INTO logs ("user","message") VALUES ('hack3r','Connects');
INSERT INTO logs ("user","message") VALUES ('hack3r','Erases file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Leaves');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Erases file');
INSERT INTO logs ("user","message") VALUES ('hack3r','Create new file');
INSERT INTO logs ("user","message") VALUES ('admin','Leaves');
INSERT INTO logs ("user","message") VALUES ('admin','Create new file');
INSERT INTO logs ("user","message") VALUES ('admin','Create new file');
INSERT INTO logs ("user","message") VALUES ('admin','Create new file');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Leaves');
INSERT INTO logs ("user","message") VALUES ('admin','Leaves');
INSERT INTO logs ("user","message") VALUES ('admin','Erases file');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Erases file');
INSERT INTO logs ("user","message") VALUES ('admin','Connects');
INSERT INTO logs ("user","message") VALUES ('admin','Leaves');
INSERT INTO logs ("user","message") VALUES ('admin','Create new file');

USE SuperMoney;
GO
BACKUP DATABASE SuperMoney
TO DISK = 'c:\users\kotto\quests\SQL\SuperMoneyDBsave.bak'
   WITH FORMAT,
      MEDIANAME = 'quests',
      NAME = 'Full Backup of SuperMoneysave'; 
GO

BEGIN TRANSACTION;
DELETE TOP (3)
FROM logs
WHERE user = 'admin';
COMMIT TRANSACTION;


BEGIN TRANSACTION; 
DELETE 
FROM logs 
WHERE EXISTS
     (SELECT user FROM logs
      WHERE user = 'hack3r')
COMMIT TRANSACTION; 