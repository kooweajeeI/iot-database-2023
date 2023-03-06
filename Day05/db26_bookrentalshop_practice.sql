/* BookRentalShop 연습 */
SELECT * FROM membertbl;

-- 서브쿼리 - 성능이 떨어지는 영향
SELECT b.Author as '저자',		-- 1
       -- b.Division as '장르',	-- 2
	   (SELECT Names FROM divtbl WHERE Division = b.Division) as '장르',
       b.Names as '책제목',
       b.ISBN,
       b.Price as '금액'
	FROM bookstbl as b
	ORDER BY 3 asc;		-- 첵제목, b.Names 대신 쓸 수 있음
    
-- 조인 - 서브쿼리 쓸 바에는 조인으로
SELECT b.Author AS '저자',
	   b.Division,
       d.Names AS '장르',
       b.ISBN,
       b.Price AS '금액'
   FROM bookstbl AS b
   INNER JOIN divtbl AS d
   ON b.Division = d.Division
   ORDER BY b.Names;
   
-- 서브쿼리 - 장르로 그룹핑
SELECT (SELECT Names 
		FROM divtbl 
        WHERE Division = bb.Division) AS '장르', bb.총합 
FROM (
		SELECT b.Division, SUM(b.Price) AS '총합'
		FROM bookstbl as b
		GROUP BY b.Division
	 )
AS bb;

-- 조인
SELECT m.Names AS 이름,
	   m.Addr AS 주소,
       m.Mobile AS 번호,
       r.rentalIdx,
       r.rentalDate AS 대여일자,
       r.returnDate AS 반납일자, 
       b.Names AS 책제목, 
       d.Names AS 장르, 
       b.Price AS 금액
FROM membertbl AS m
INNER JOIN rentaltbl AS r
ON m.memberIdx = r.memberIdx
INNER JOIN bookstbl as b
ON r.bookIdx = b.bookIdx
INNER JOIN divtbl AS d
ON b.Division = d.Division;

-- 외부조인
SELECT m.Names AS 이름,
	   m.Addr AS 주소,
       m.Mobile AS 번호,
       r.rentalDate AS 대여일자,
       -- IFNULL(r.returnDate, '미반납') AS 반납일자,
       r.returnDate AS 반납일자, 
       b.Names AS 책제목, 
       d.Names AS 장르, 
       b.Price AS 금액
FROM membertbl AS m
LEFT OUTER JOIN rentaltbl AS r
ON m.memberIdx = r.memberIdx
LEFT OUTER JOIN bookstbl as b
ON r.bookIdx = b.bookIdx
LEFT OUTER JOIN divtbl AS d
ON b.Division = d.Division
WHERE r.rentalIdx is null;

-- 책을 두 권이상 출판한 저자
select bb.author, bb.division, d.Names as 장르, bb.출판권수, bb.합계금액
from (
	select b.author, b.division, count(b.author) as 출판권수, sum(b.price) as 합계금액
	from bookstbl as b
	group by b.author, b.division
	having count(b.author) >= 2
    ) 
as bb
inner join divtbl as d
on bb.division = d.division
order by bb.출판권수 desc;