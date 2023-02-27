-- 그냥 테이블 접근
select * from membertbl;

-- 뷰 생성
create view uv_memberTBL
as
select memberName, memberAddress
from membertbl;

-- 뷰로 조회
select *
from uv_membertbl;