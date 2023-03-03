-- 쇼핑몰에 가입하고 물건을 한번도 구매하지 않은 회원까지 모두 출력
select u.*,
       b.prodName,
       b.groupName,
       b.price,
       b.amount
from usertbl as u
left outer join buytbl as b
on u.userid = b.userid
where b.userID is null;


-- 학생 중에 동아리에 가입하지 않은 학생
select s.stdName, s.addr, j.num, c.clubname, c.roomno
from stdtbl as s0
left outer join stdclubtbl as j
on s.stdname = j.stdname
left outer join clubtbl as c 
on c.clubname = j.clubName
union
select s.stdName, s.addr, j.num, c.clubname, c.roomno
from stdtbl as s
right outer join stdclubtbl as j
on s.stdname = j.stdname
right outer join clubtbl as c 
on c.clubname = j.clubName;

-- inner join의 약식표현(권하지 않음)
select u.*, b.userID, b.prodName, b.groupName, b.price, b.amount
from usertbl as u, buytbl as b
where u.userid = b.userid;


select name, height
from usertbl
where height in (select height from usertbl where name like '김경호&');