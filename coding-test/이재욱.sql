USE bookrentalshop;

-- 1번 문제
SELECT concat(substring(m.names,1,1), ',', substring(m.names,-2,2)) as '회원명',
	   m.Addr as '주소', 
	   m.Mobile as '폰번호',
	   upper(m.Email) as '이메일'
FROM membertbl as m;


-- 2번 문제
SELECT d.Names AS '장르',
		b.Author AS '작가',
       b.Names as '책제목'
   FROM bookstbl AS b
   INNER JOIN divtbl AS d
   ON b.Division = d.Division
   ORDER BY d.Names;

-- 3번 문제
SELECT *
  FROM divtbl;
  
INSERT INTO divtbl VALUES ('I002', '네트워크');

-- 4번 문제

-- 제출 답
UPDATE membertbl SET levels = 'D', mobile = '010-9839-9999' WHERE memberIdx = 1;

SELECT * FROM membertbl where names = '성명건';

-- 5번 문제
SELECT *
  FROM divtbl;

SELECT COALESCE(d.Names, '--합계--') AS '장르', concat(c.total, '원') AS '장르별 총합계'
FROM
	(
    SELECT b.division, (format(sum(b.price), 0)) AS total
	FROM bookstbl AS b
	GROUP BY b.division WITH ROLLUP
    ) AS c
LEFT OUTER JOIN divtbl AS d
ON c.division = d.division;

SELECT IFNULL(d.Names, '--합계--') AS '장르', concat(c.total, '원') AS '장르별 총합계'
FROM
	(
    SELECT b.division, (format(sum(b.price), 0)) AS total
	FROM bookstbl AS b
	GROUP BY b.division WITH ROLLUP
    ) AS c
LEFT OUTER JOIN divtbl AS d
ON c.division = d.division;

