DROP DATABASE IF EXISTS ORDERBOOKTEST;

CREATE DATABASE ORDERBOOKTEST;

USE ORDERBOOKTEST;

CREATE TABLE stock(
	id INT PRIMARY KEY AUTO_INCREMENT,
	symbol VARCHAR(5) UNIQUE,
	name VARCHAR(30) NOT NULL);	
    
CREATE TABLE mpidinfo(
	id INT PRIMARY KEY AUTO_INCREMENT,
	mpid VARCHAR(4) NOT NULL,
	name VARCHAR(50) NOT NULL);    
    
CREATE TABLE orders(
	id int AUTO_INCREMENT PRIMARY KEY,
	mpidid INT NOT NULL,
    	buyorsell ENUM("BUY","SELL") NOT NULL, 
    	stockid INT NOT NULL, 
    	price FLOAT NOT NULL,
    	size INT NOT NULL,
	time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	complete BOOLEAN DEFAULT FALSE,
    
    FOREIGN KEY (stockid) REFERENCES stock(id)ON DELETE CASCADE,	/*MANY TO ONE RELATIONSHIP */
    FOREIGN KEY(mpidid) REFERENCES mpidinfo(id) ON DELETE CASCADE); /* MANY TO ONE RELATIONSHIP */
	
CREATE TABLE userinfo(
	id int AUTO_INCREMENT PRIMARY KEY ,
	username varchar(30) NOT NULL UNIQUE,
	password varchar(30) NOT NULL); 
    
CREATE TABLE trades(
	id INT AUTO_INCREMENT PRIMARY KEY,
	userid int NOT NULL, 
	buyid INT NOT NULL,
	askid INT NOT NULL,
	size INT NOT NULL,
	time DATETIME NOT NULL,
	
	FOREIGN KEY (userid) REFERENCES userinfo(id),
	FOREIGN KEY (askid) REFERENCES orders(id) ON DELETE CASCADE, /*ONE TO ONE RELATIONSHIP */
    FOREIGN KEY (buyid) REFERENCES orders(id) ON DELETE CASCADE);/* ONE TO ONE RELATIONSHIP */


		        
	
	
