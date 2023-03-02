-- INSERT

INSERT INTO usertbl
	   (userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES ('SMG', '성명건', 1976, '부산', '010', '66887777', 179, '2023-03-02');

-- 입력안할 컬럼은 NULL로 지정
INSERT INTO usertbl
	   (userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES ('HGS', '홍길순', 2000, '한양', null, null, null, null);

-- NULL 컬럼 생략가능
INSERT INTO usertbl
	   (userID, name, birthYear, addr)
VALUES ('HMS', '손흥민', 1991, '런던');

-- 컬럼 지정 생략가능 (단, 입력순서와 컬럼순서 일치)
INSERT INTO usertbl
VALUES ('SJW', '손정웅', 1969, '서울', '010', '55667788', null, null);

-- AUTO_INCREMENT의 경우 필드값을 입력하지 않아도됨
INSERT INTO buytbl
(num, userID, prodName, groupName, price, amount)
VALUES
(13, 'SMG', '노트북', '전자', 5000000, 1);