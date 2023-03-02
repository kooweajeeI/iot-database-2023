-- 변수 사용
use sqldb;

set @myVar1 = 5;
select @myVar1;

set @myVar2 = '가수이름 --> ';
select @myVar2, name from usertbl
where height > 170;

select name, height + @myVar1
from usertbl;

-- 형변환
select cast(birthyear as char) from usertbl;
select cast(convert(birth, char) as signed integer) from usertbl;

select convert(birthyear, char) from usertbl;

select cast('1000' as decimal);

-- 암시적 형변환
select 200 + 300;
select concat('Hello ', 'World');
select '200' + '300'; -- MySQL 이외에서는 '200300';
select concat(200,'300');


/* 내장함수 리스트 */
-- 흐름함수
-- 100>200 ? '참' : '거짓'
select if(100>200, '참', '거짓');

-- NULL은 계산이 오류(결과도 NULL)
select ifnull(null, '널입니다.');

-- NULLIF는 많이 사용안됨
select nullif(100,100);

-- 쿼리작성할 때 많이 사용
select name, birthyear, addr,
case addr 
when'서울' then '수도권' 
when'경기' then '수도권'
when'한양' then '조선권'
when'부산' then '광역권'
else'지역권' end as '권역'
from usertbl;

-- 문자열함수
select ascii('A'), char(65), ascii('a');
select ascii('안'), char(236);	-- 한글은 사용하면 안됨
-- CHAR_LENGTH : 글자길이, LENGTH : 바이트
select char_length('ABC'), length('ABC');


select char_length('가나다'), length('가나다');	-- 한글 한글자당 3bytes

select replace('Hello World', 'Hello', 'Byebye');

-- DB는 인덱스를 1부터 시작
select instr('안녕하세요, 여러분', '여');

-- left, right
select left ('abcdefghijklmn', 3), right('abcdefghijklmn', 3);

-- LTRIM, RTRIM, TRIM
select ltrim('                    Hello World!                           ') AS 'ltrim',
	   rtrim('                    Hello World!                           ') AS 'rtrim',
        trim('                    Hello World!                           ') AS 'trim';
        
-- 'Hello' * 3
select repeat('Hello', 3);

-- upper, lower
select upper('Hello World'), lower('Hello World');

-- substring
select substring('대한민국만세', 5, 2);

-- 수학함수
-- 절대값
select abs(-10);

-- 올림 내림 반올림
select ceiling(4.3), floor(4.9), round(4.4);

select mod(157, 10);

-- RANDOM
select rand(), floor(1 + (RAND() * 6));		-- 주사위놀이

-- 날짜 및 시간함수
select now();
select adddate('2023-03-02', interval -10 day);

select year(now());
select hour(now());
select date(now());
select time(now());
select dayofweek(now());
select last_day(now());
select last_day('2023-02-01');

-- 시스템 함수
select user();
select database();

-- ROW_COUNT()
use sqldb;
update buytbl set price = price * 2;
select row_count();

select version();