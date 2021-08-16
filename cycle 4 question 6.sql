CREATE TABLE customer(cid INT PRIMARY KEY,cname VARCHAR(25) NOT NULL,loc VARCHAR(25),sex VARCHAR(25),dob  DATE );
CREATE TABLE bank_brn
	(bcode   INT PRIMARY KEY,bloc VARCHAR(25) NOT NULL,bstate VARCHAR(25) NOT NULL);
CREATE TABLE deposit
	(Dacno   INT PRIMARY KEY,ddate DATE NOT NULL,damt   INT NOT NULL, dtype VARCHAR(25) NOT NULL);
CREATE TABLE loan
	(Lacno   INT PRIMARY KEY,ldate DATE NOT NULL,lamt   INT NOT NULL, ltype VARCHAR(25) NOT NULL);
CREATE TABLE accounts_in
	(cid   INT NOT NULL, Bcode INT NOT NULL, FOREIGN KEY(Bcode) REFERENCES bank_brn(bcode), FOREIGN KEY(cid) REFERENCES customer(cid));

CREATE TABLE depositor
	(cid   INT NOT NULL, dacno INT NOT NULL, FOREIGN KEY(dacno) REFERENCES deposit(Dacno), FOREIGN KEY(cid) REFERENCES customer(cid));
CREATE TABLE borrower
	(cid   INT NOT NULL, lacno INT NOT NULL, FOREIGN KEY(lacno) REFERENCES loan(Lacno), FOREIGN KEY(cid) REFERENCES customer(cid));
DESCRIBE borrower;

DESCRIBE customer;
DESCRIBE bank.borrower;
show tables;
 DESCRIBE loan;
 DESCRIBE accounts_in;
drop table customer,borrower,accounts_in,depositor;
