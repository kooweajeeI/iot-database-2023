-- Active: 1677474334633@@127.0.0.1@3306@employees

-- 사용 데이터베이스 변경

USE homeplus;

-- * : all, 문장의 끝은 ;

SELECT * FROM indextbl;

SELECT * FROM homeplus.indextbl;

-- 다른 DB의 테이블에서 데이터 가져오기

select * from employees.titles;

-- 필요한 컬럼만 가져오겠다

select first_name, last_name from indextbl;

-- sqldb를 사용

USE sqldb;

-- 조건절 검색

select * from usertbl where name = '김경호';

select
    userID,
    name,
    birthYear,
    height
from usertbl
where name = '김경호';

-- 관계 연산자

select *
from usertbl
where
    birthyear >= 1970
    and height >= 182;

-- 사이의 값을 조회

select * from usertbl where name = '김경호';

select * from usertbl where height between 180 and 183;

-- IN 연산자

SELECT *
FROM usertbl
WHERE
    addr = '경남'
    OR addr = '경북'
    OR addr = '전남';

SELECT * FROM usertbl where addr in ('경남','경북','전남');

-- 문자열 검색 - 뉴스 본문 안에서 일정 단어를 검색

select * from usertbl where name like '김%';

select * from usertbl where name like '%김';

select * from usertbl where name like '%김%';

select * from usertbl where name like '김__';

-- Subquery(서브쿼리)
-- 사용위치
-- 1. 컬럼위치 2. 테이블위치 3. 조건절위치
-- WHERE절에 서브쿼리가 컬럼이 한 개이상이거나 결과가 한 개이상이면
-- 조건연산자로 조회할 수 없음

select name, height
from usertbl
where height > (
        select height
        from usertbl
        where name = '김경호'
    );

select name, height
from usertbl
where height IN (
        select height
        from usertbl
        where name LIKE '김%'
    );

-- 가상테이블

select
    u.userID,
    u.name, (2023 - u.birthYear) as age
from (
        select
            userID,
            name,
            birthYear,
            addr
        from usertbl
    ) as u
where u.birthYear > 1969;

-- 컬럼에 쓰는 서브쿼리

select b.userID as '아이디', (
        select name
        from usertbl
        where
            userID = b.userID
    ) as '이름',
    b.prodName,
    b.price * amount as '판매액'
from buytbl AS b;

-- 정렬 ORDER BY : default ASC 안적어도 오름차순

-- 내림차순 DESC

SELECT *
FROM usertbl
WHERE birthYear > 1069
ORDER BY
    birthyear asc,
    height desc;

-- 중복제거 / 중복제거할 컬럼만

SELECT DISTINCT addr FROM usertbl;

-- LIMIT 개수 제한

USE homeplus;

SELECT * FROM indextbl LIMIT 5;

-- 조회하면서 새로운 테이블 생성
-- PK / FK 제약조건은 복사 안됨
-- 일부 컬럼(열)만 복사 테이블생성 가능
USE sqlDB;

CREATE TABLE elec_buytbl_new
SELECT num, prodName, price 
FROM buytbl 
WHERE groupName = '전자';

SELECT * FROM elec_buytbl_new;