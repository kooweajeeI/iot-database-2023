-- 집계함수를 사용하기 위해서 / 그룹핑
USE sqldb;

-- GROUP BY에 작성된 컬럼명만 SELECT에 쓸 수 있음
select userID as '아이디',
	   sum(amount) as '구매개수'
from buytbl
group by userID;

select userID as '아이디',
	   avg(amount) as '평균구매개수'
from buytbl
group by userID;

-- HAVING은 집계함수 등의 결과값을 필터링 하기 위함
select userID,
	   sum(price * amount) as '합산'
from buytbl
group by userID
having 합산 >= 100;


-- Rollup
select userID,
	   sum(price * amount) as '합산'
from buytbl
group by userID
with rollup;
