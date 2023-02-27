create table producttbl(
	productname NVARCHAR(20) primary key,
    cost int not null,
    makedate date,
    company nvarchar(20),
    amount int not null
);