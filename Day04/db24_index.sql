use tabledb;

create table TBL1(
	ID int not null primary key,
    bridge int null,
    contents varchar(5000));
    
    
-- sqldb DB의 usertbl 데이터 중 userID, name, birthYear, addr만 가져와서
-- tabledb.usertbl로 가져오기
insert into tabledb.usertbl
select userID, name, birthYear, addr
from sqldb.usertbl;

select * from usertbl where name = '김범수';