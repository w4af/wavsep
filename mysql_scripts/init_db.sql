DROP DATABASE IF EXISTS wavsepDB;

CREATE DATABASE wavsepDB;

USE wavsepDB;

DROP TABLE IF EXISTS users;

CREATE TABLE users (userid INT NOT NULL, PRIMARY KEY(userid),
  username VARCHAR(25) NOT NULL,
  password VARCHAR(25) NOT NULL,
  privilege INT);

INSERT INTO users(userid, username, password, privilege) VALUES(1,'user1','password',1);
INSERT INTO users(userid, username, password, privilege) VALUES(2,'david','goodboy',1);
INSERT INTO users(userid, username, password, privilege) VALUES(3,'admin','mastermold',5);
INSERT INTO users(userid, username, password, privilege) VALUES(4,'user4','password4',1);
INSERT INTO users(userid, username, password, privilege) VALUES(5,'user5','password5',2);
INSERT INTO users(userid, username, password, privilege) VALUES(6,'user6','password6',1);
INSERT INTO users(userid, username, password, privilege) VALUES(7,'user7','password7',1);

DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (userid INT NOT NULL, PRIMARY KEY(userid),
  account INT NOT NULL);

INSERT INTO accounts(userid, account) VALUES(1,10000);
INSERT INTO accounts(userid, account) VALUES(2,12000);
INSERT INTO accounts(userid, account) VALUES(3,30000);
INSERT INTO accounts(userid, account) VALUES(4,40000);
INSERT INTO accounts(userid, account) VALUES(5,50000);
INSERT INTO accounts(userid, account) VALUES(6,60000);
INSERT INTO accounts(userid, account) VALUES(7,70000);

DROP TABLE IF EXISTS messages;

CREATE TABLE messages (msgid INT NOT NULL, PRIMARY KEY(msgid),
  title VARCHAR(50) NOT NULL,
  message VARCHAR(50) NOT NULL);

INSERT INTO messages(msgid, title, message) VALUES(1,'Welcome to the web site','Enjoy yourself');
INSERT INTO messages(msgid, title, message) VALUES(2,'Remember to change your password','Invest in your security!');
INSERT INTO messages(msgid, title, message) VALUES(3,'Your account is about to expire','Please renew it in the next two weeks');

DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (userid INT NOT NULL, PRIMARY KEY(userid),
  transactionId INT NOT NULL,
	sum INT NOT NULL,
	description VARCHAR(50) NOT NULL,
	transactionDate DATE NOT NULL);

INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) VALUES(1,132,1000,'Simple Transaction','2010-01-01');
INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) VALUES(2,133,1200,'Simple Transaction','2010-01-01');
INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) VALUES(3,135,3000,'Simple Transaction','2010-01-01');
INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) VALUES(4,223,4000,'Simple Transaction','2010-01-01');
INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) VALUES(5,423,5000,'Simple Transaction','2010-01-01');
INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) VALUES(6,456,6000,'Simple Transaction','2010-01-01');
INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) VALUES(7,789,7012,'Expensive Transaction','2010-01-01');
INSERT INTO transactions(userid, transactionId, sum, description, transactionDate) VALUES(8,895,8000,'Expensive Transaction','2010-02-02');

DROP USER IF EXISTS 'wavsep'@'%';

CREATE USER 'wavsep'@'%' IDENTIFIED BY 'wavsepPass782';

GRANT ALL PRIVILEGES ON wavsepDB.* to 'wavsep'@'%';

FLUSH PRIVILEGES;

