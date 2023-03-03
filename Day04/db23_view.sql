-- 뷰
use sqldb;

create view uv_potentialUser
as
select u.*, b.num, b.prodName, b.price, b.amount
from usertbl as u
left outer join buytbl as b
on u.userID = b.userID
where b.userID is null;

SELECT * FROM sqldb.uv_potentialuser;

create view uv_usertbl
as
select u.userId,
	   u.name,
       u.birthYear,
       u.addr
from usertbl as u;

select * from uv_usertbl;
insert into uv_usertbl values('KKK', '케케케', 1988, '제주');

select * from uv_potentialuser;
insert into uv_potentialUser values('TTT', '티티티', 1990, '서울', '010', '89898989', 190, '2023-01-01');