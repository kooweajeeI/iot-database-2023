-- INSERT INTO SELECT
-- usertbl에서 앞의 4개 컬럽 값을 가져와서 전부 usertbl_bak에 넣어라
INSERT INTO usertbl_bak (userId, name, birthYear, addr)
select userID, name, birthYear, addr from usertbl;