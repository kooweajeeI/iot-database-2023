-- 조인
-- inner join
select b.num, b.userID, b.prodName,
       u.name, u.addr, u.birthyear
from buytbl as b
inner join usertbl as u
on b.userid = u.userid
order by b.num desc;
 
 ## where u.userid = 'jyp';