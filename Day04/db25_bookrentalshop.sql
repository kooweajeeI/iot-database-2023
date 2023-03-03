/* 책대여점 데이터베이스 실습 */
-- 1. divtbl
select * from divtbl;

-- 2. bookstbl
select * from bookstbl;

-- 3. membertbl
select * from membertbl;

-- 4. rentaltbl
select * from rentaltbl;

-- 책을 봅시다
select b.Author as '저자명',
 b.Division as '장르코드',
 b.Names as '책제목', 
date_format(b.ReleaseDate, '%Y년%m월%d일') as '출판일', 
FORMAT(b.Price, '0,000') as '금액',
date_format('2023-03-03 17:05:10', '%Y년%m월%d일 %H시%i분%s초')
from bookstbl as b;


-- 회원을 봅시다.
SELECT m.Names as '회원명',
m.Levels as '등급',
m.Addr as '주소', 
m.Mobile as '연락처',
CONCAT(UPPER(SUBSTRING_INDEX(m.Email, '@', 1)), '@',
LOWER(SUBSTRING_INDEX(m.Email, '@', -1))) as '이메일'
FROM membertbl as m
ORDER BY m.Names ASC;
