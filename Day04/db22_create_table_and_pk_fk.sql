create database tabledb;

use tabledb;

create table usertbl(
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr VARCHAR(10)
);

CREATE TABLE buytbl(
	num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName VARCHAR(10) NOT NULL,
    price INT,
    FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

create table prodtbl(
	prodCode char(3) not null,
    prodID char(4) not null,
    prodDate datetime not null,
    prodCur varchar(10) null,
    constraint pk_prodtbl_prodCode_prodId
    primary key (prodCode, prodID)
);

create table membertbl(
	userID char(8) not null primary key,
	name varchar(10) not null,
	email VARCHAR(50) null unique -- 유니크 제약조건
);

create table stdtbl(
	userID char(8) not null primary key,
    name varchar(10),
    grade int check (grade >= 1 and grade <= 4),
    constraint CK_name check (name is not null)
);