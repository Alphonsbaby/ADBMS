CREATE TABLE employe(ssn INT PRIMARY KEY,ename VARCHAR(25) NOT NULL,design VARCHAR(25),dno INT,doj  DATE ,salary INT);
CREATE TABLE department (dnumber INT PRIMARY KEY,dname VARCHAR(20),loc VARCHAR(40),mgrssn INT REFERENCES employe(ssn));
CREATE TABLE  Proj(pnumber INT PRIMARY KEY,pname varchar(15),dnum INT,FOREIGN KEY (dnum) REFERENCES department(dnumber));
CREATE TABLE  Work_in(essn INT,pno INT,hours INT,FOREIGN KEY (essn) REFERENCES employe(ssn),FOREIGN KEY (pno) REFERENCES Proj(pnumber),
FOREIGN KEY (hours) REFERENCES department(dnumber));
drop table employee1;
drop table department;
drop table Proj;
insert into department(dnumber,dname,loc)values(1,'Admin','Chennai'),(2,'HR','Chennai'),(3,'Sales','Kochi'),(4,'Finance','Delhi'),
(5,'Production','Thiruvananthapuram'); 
insert into employe (ssn,ename,design,dno,doj,salary)values (1,'Abhi','HR',2,'2009-07-12',70000),(2,'Bhama','Admin',1,'2008-03-10',75000),
(3,'Chriz','Sales',3,'2011-06-23',35000 ),(4,'Diya','Production',5,'2018-09-29',32000 ),(5,'Govind','Production',5,'1995-06-21',35000 )
,(6,'Hima','Finance',4,'2002-04-01',51000),(7,'Hima','HR',5,'2002-04-01',49000),(8,'Hima','Finance',4,'2002-04-01',45000);
select * from department;
UPDATE department SET mgrssn=2 WHERE dnumber=1;
UPDATE department SET mgrssn=1 WHERE dnumber=2; 
UPDATE department SET mgrssn=3 WHERE dnumber=3; 
UPDATE department SET mgrssn=6 WHERE dnumber=4; 
UPDATE department SET mgrssn=7 WHERE dnumber=2;
UPDATE department SET mgrssn=4 WHERE dnumber=5; 
UPDATE department SET mgrssn=5 WHERE dnumber=5;  
insert into Proj(pnumber,pname,dnum)values(11,'Bancs Trsry',3),(12,'Nielesan',5),(13,'World Bnk',1),(14,'Airlines',1),(15,'Amex',4); 
insert into Work_in(essn,pno)values(1,14),(4,13),(8,12),(6,15),(2,11),(3,13); 
select * from Work_in;
SELECT e.ename FROM employe e LEFT OUTER JOIN department d on d.dnumber=e.dno WHERE e.salary BETWEEN 30000 AND 40000 AND d.dnumber=5;
SELECT e.ename,d.dname FROM employe e LEFT OUTER JOIN department d on e.dno=d.dnumber ORDER BY d.dname ASC,e.ename ASC; 
SELECT p.pnumber,p.pname,count(e.ssn) FROM Work_in w LEFT OUTER JOIN Proj p on w.pno=p.pnumber LEFT OUTER JOIN employe e on w.essn=e.ssn GROUP BY p.pname,p.pnumber;
create VIEW emp_dept_view as select  * from employe NATURAL JOIN department;
CREATE ANY SYNONYM emp_dept for employe_dept_view;
select * from emp_dept;
Select * From employe e,department d WHERE e.dno=d.dnumber;
SELECT * FROM employe e,department d WHERE NOT(e.dno=d.dnumber);
SELECT * FROM employe e LEFT OUTER JOIN department d ON e.dno=d.dnumber; 
SELECT * FROM employe e RIGHT OUTER JOIN department d ON e.dno=d.dnumber; 
SELECT * FROM employe e INNER JOIN department d ON e.dno=d.dnumber;

