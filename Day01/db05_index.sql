-- employees DB의 employees 테이블에서 데이터 10만개 가져오기
create table indexTBL(
	first_name varchar(14),
    last_name varchar(16),
    hire_date date
    );
    
insert into indexTBL
	select first_name, last_name, hire_date
    from employees.employees
    limit 300000;
    
-- 조회

select count(*) from indextbl;
select * from indexTBL
	where first_name = 'Mary';
    
-- indexTBL에 first_name에 인덱스 생성
create index idx_indexTbl_firstname
on indexTBL(first_name);