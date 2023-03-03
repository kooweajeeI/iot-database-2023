/* OUTER JOIN */
-- stdtbl
CREATE TABLE stdtbl (
	stdName nvarchar(10) not null primary key,
    addr nchar(4) not null
);

create table clubtbl(
	clubname nvarchar(10) not null primary key,
    roomNo nchar(4) not null
);

create table stdclubtbl(
	num int auto_increment not null primary key,
    stdName nvarchar(10) not null,
    clubName nvarchar(10) not null,
    foreign key(stdName) references stdtbl(stdName),
    foreign key(clubName) references clubtbl(clubName)
);

insert into stdtbl values
('김범수','경남'),('성시경','서울'),('조용필','경기'),
('은지원','경북'),('바비킴','서울');

insert into clubtbl values
('수영','101호'),('바둑','102호'),('축구','103호'),('봉사','104호');

insert into stdclubtbl (stdName, clubName) values
('김범수','바둑'),('김범수','축구'),('조용필','축구'),('은지원','축구'),('은지원','봉사'),('바비킴','봉사');