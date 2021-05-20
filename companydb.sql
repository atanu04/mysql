
DROP DATABASE IF EXISTS Company;
CREATE DATABASE Company;

-- Creating Company Schema
USE Company;

--Creating DEPARTMENT table
DROP TABLE IF EXISTS DEPARTMENT;
CREATE TABLE DEPARTMENT (
  dname        varchar(25) not null,
  dnumber      int not null,
  mgrssn      char(9) not null, 
  mgrstartdate date,
  CONSTRAINT pk_Department primary key (dnumber),
  CONSTRAINT uk_dname UNIQUE (dname) 
);

--Creating EMPLOYEE table
DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
  fname    varchar(15) not null, 
  minit    varchar(1),
  lname    varchar(15) not null,
  ssn     char(9), 
  bdate    date,
  address  varchar(50),
  sex      char,
  salary   decimal(10,2),
  superssn char(9),
  dno      int,
  CONSTRAINT pk_employee primary key (ssn),
  CONSTRAINT fk_employee_department foreign key (dno) references DEPARTMENT(dnumber)
);


--Creating DEPENDENT table
DROP TABLE IF EXISTS DEPENDENT;
CREATE TABLE DEPENDENT (
  essn           char(9),
  dependent_name varchar(15),
  sex            char,
  bdate          date,
  relationship   varchar(8),
  CONSTRAINT pk_essn_dependent_name primary key (essn,dependent_name),
  CONSTRAINT fk_dependent_employee foreign key (essn) references EMPLOYEE(ssn)
);

--Creating DEPT_LOCATIONS table
DROP TABLE IF EXISTS DEPT_LOCATIONS;
CREATE TABLE DEPT_LOCATIONS (
  dnumber   int,
  dlocation varchar(15), 
  CONSTRAINT pk_dept_locations primary key (dnumber,dlocation),
  CONSTRAINT fk_deptlocations_department foreign key (dnumber) references DEPARTMENT(dnumber)
);

--Creating PROJECT table
DROP TABLE IF EXISTS PROJECT;
CREATE TABLE PROJECT (
  pname      varchar(25) not null,
  pnumber    int,
  plocation  varchar(15),
  dnum       int not null,
  CONSTRAINT ok_project primary key (pnumber),
  CONSTRAINT uc_pnumber unique (pname),
  CONSTRAINT fk_project_department foreign key (dnum) references DEPARTMENT(dnumber)
);

--Creating WORKS_ON table
DROP TABLE IF EXISTS WORKS_ON;
CREATE TABLE WORKS_ON (
  essn   char(9),
  pno    int,
  hours  decimal(4,1),
  CONSTRAINT pk_worksOn primary key (essn,pno),
  CONSTRAINT fk_workson_employee foreign key (essn) references EMPLOYEE(ssn),
  CONSTRAINT fk_workson_project foreign key (pno) references PROJECT(pnumber)
);


--Insert values in DEPARTMENT table
INSERT INTO DEPARTMENT VALUES ('Research',5,333445555,'1988-05-22');
INSERT INTO DEPARTMENT VALUES ('Administration',4,987654321,'1995-01-01');
INSERT INTO DEPARTMENT VALUES ('Headquarters',1,888665555,'1981-06-19');


--Insert values in EMPLOYEE table
INSERT INTO EMPLOYEE VALUES ('John','B','Smith','123456789','1955-01-09','731 Fondren, Houston, TX','M','30000.00','333445555','5'); 
INSERT INTO EMPLOYEE VALUES ('Franklin','T','Wong','333445555','1945-12-08','638 Voss, Houston, TX','M','40000.00','888665555','5'); 
INSERT INTO EMPLOYEE VALUES ('Alicia','J','Zelaya','999887777','1958-07-19','3321 Castle, Spring, TX','F','25000.00','987654321','4'); 
INSERT INTO EMPLOYEE VALUES ('Jennifer','S','Wallace','987654321','1931-06-20','291 Berry, Bellaire, TX','F','43000.00','888665555','4'); 
INSERT INTO EMPLOYEE VALUES ('Ramesh','K','Narayan','666884444','1952-09-15','971 Fire Oak, Humble, TX','M','38000.00','333445555','5'); 
INSERT INTO EMPLOYEE VALUES ('Joyce','A','English','453453453','1962-07-31','5631 Rice, Houston, TX','F','25000.00','333445555','5'); 
INSERT INTO EMPLOYEE VALUES ('Ahmad','V','Jabbar','987987987','1959-03-29','980 Dallas, Houston, TX','M','25000.00','987654321','4'); 
INSERT INTO EMPLOYEE VALUES ('James','E','Borg','888665555','1927-11-10','450 Stone, Houston, TX','M','55000.00',NULL,'1'); 


--Insert values in DEPENDENT table
INSERT INTO DEPENDENT VALUES ('333445555','Alice','F','1976-04-05','Daughter'); 
INSERT INTO DEPENDENT VALUES ('333445555','Theodore','M','1973-10-25','Son'); 
INSERT INTO DEPENDENT VALUES ('333445555','Joy','F','1948-05-03','Spouse'); 
INSERT INTO DEPENDENT VALUES ('987654321','Abner','M','1932-02-29','Spouse'); 
INSERT INTO DEPENDENT VALUES ('123456789','Michael','M','1978-01-01','Son'); 
INSERT INTO DEPENDENT VALUES ('123456789','Alice','F','1978-12-31','Daughter'); 
INSERT INTO DEPENDENT VALUES ('123456789','Elizabeth','F','1967-05-06','Spouse');


--Insert values in DEPT_LOCATIONS table
INSERT INTO DEPT_LOCATIONS VALUES ('1','Houston'); 
INSERT INTO DEPT_LOCATIONS VALUES ('4','Stafford'); 
INSERT INTO DEPT_LOCATIONS VALUES ('5','Bellaire'); 
INSERT INTO DEPT_LOCATIONS VALUES ('5','Houston'); 
INSERT INTO DEPT_LOCATIONS VALUES ('5','Sugarland');


--Insert values to PROJECT table
INSERT INTO PROJECT VALUES ('ProductX','1','Bellaire','5'); 
INSERT INTO PROJECT VALUES ('ProductY','2','Sugarland','5'); 
INSERT INTO PROJECT VALUES ('ProductZ','3','Houston','5'); 
INSERT INTO PROJECT VALUES ('Computerization','10','Stafford','4'); 
INSERT INTO PROJECT VALUES ('Reorganization','20','Houston','1'); 
INSERT INTO PROJECT VALUES ('Newbenefits','30','Stafford','4');


--Insert values to WORKS_ON table
INSERT INTO WORKS_ON VALUES ('123456789','1','32.5'); 
INSERT INTO WORKS_ON VALUES ('123456789','2','7.5'); 
INSERT INTO WORKS_ON VALUES ('666884444','3','40.0'); 
INSERT INTO WORKS_ON VALUES ('453453453','1','20.0'); 
INSERT INTO WORKS_ON VALUES ('453453453','2','20.0'); 
INSERT INTO WORKS_ON VALUES ('333445555','2','10.0'); 
INSERT INTO WORKS_ON VALUES ('333445555','3','10.0'); 
INSERT INTO WORKS_ON VALUES ('333445555','10','10.0'); 
INSERT INTO WORKS_ON VALUES ('333445555','20','10.0'); 
INSERT INTO WORKS_ON VALUES ('999887777','30','30.0'); 
INSERT INTO WORKS_ON VALUES ('999887777','10','10.0'); 
INSERT INTO WORKS_ON VALUES ('987987987','10','35.0'); 
INSERT INTO WORKS_ON VALUES ('987987987','30','5.0'); 
INSERT INTO WORKS_ON VALUES ('987654321','30','20.0'); 
INSERT INTO WORKS_ON VALUES ('987654321','20','15.0'); 
INSERT INTO WORKS_ON VALUES ('888665555','20','0.0');


-- Adding FK constraint after loading data into system
Alter table EMPLOYEE
ADD CONSTRAINT fk_employee_employee foreign key (superssn) references EMPLOYEE(ssn);


--Select and show each table
SELECT * FROM DEPARTMENT;
SELECT * FROM DEPENDENT;
SELECT * FROM DEPT_LOCATIONS;
SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
SELECT * FROM WORKS_ON;


--Selection based on condition

--Q1-Select the Fname, address and salary for all female emplyess.
SELECT fname, address, salary FROM EMPLOYEE WHERE sex='F';


--Q2-Select the Dname, Mnr_SSN for employees with Dnumber = 5;
SELECT dname, mgrssn FROM DEPARTMENT WHERE dnumber=5;


--Q3-Delete from the table employee any employee whose salary is more than 80.000.
DELETE FROM EMPLOYEE WHERE salary > 80000


--Q4-Use alter table tp add a new column to Department table, say Production_details.
Alter table DEPARTMENT
ADD COLUMN Production_details varchar(50);


--Q5-Find the Dependent _name for employee with Fname = X
SELECT dependent_name FROM dependent,employee WHERE(employee.ssn=dependent.essn and fname='X');
