-- 피벗

create table pivotTest
(
	uName char(3),
    season char(2),
    amount int
);

INSERT INTO sqldb.pivottest
(uName, season, amount)
VALUES
('김범수', '겨울', 10), ('윤종신', '여름', 15), ('김범수', '가을', 25), ('김범수', '봄', 3),
('김범수', '봄', 37), ('윤종신', '겨울', 40), ('김범수', '여름', 14), ('김범수', '겨울', 22), ('윤종신', '여름', 64);

-- 피벗기능
select uName,
	sum(if (season = '봄', amount, 0)) as '봄',
    sum(if (season = '여름', amount, 0)) as '여름',
    sum(if (season = '가을', amount, 0)) as '가을',
    sum(if (season = '겨울', amount, 0)) as '겨울',
    sum(amount) as '합계'
from pivottest
group by uName;