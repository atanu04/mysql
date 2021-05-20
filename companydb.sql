
DROP DATABASE IF EXISTS Company;
CREATE DATABASE Company;


-- Creating Company Schema
USE Company;

DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT (
  dname        varchar(25) not null,
  dnumber      int not null,
  mgrssn      char(9) not null, 
  mgrstartdate date,
  CONSTRAINT pk_Department primary key (dnumber),
  CONSTRAINT uk_dname UNIQUE (dname) 
);

--Insert values in DEPARTMENT table
INSERT INTO DEPARTMENT VALUES ('Research',5,333445555,'1988-05-22');
INSERT INTO DEPARTMENT VALUES ('Administration',4,987654321,'1995-01-01');
INSERT INTO DEPARTMENT VALUES ('Headquarters',1,888665555,'1981-06-19');
