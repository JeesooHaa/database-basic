-- DML Data Manipulation Language
INSERT INTO classmates (name, age, address)
VALUES('홍길동', 30, '서울');
INSERT INTO classmates VALUES('김주홍', 28, '의정부');
INSERT INTO classmates VALUES('김정', 27, '서울'), ('공정배', 30, '서울');

INSERT INTO test VALUES(1, '김정'), (2, '공정배');
INSERT INTO test (name) VALUES ('김강현');

.headers on 
.mode column
SELECT * FROM classmates;
-- SQLite 는 PK 를 지정하지 않으면 rowid 를 자동으로 정의
SELECT rowid, * FROM classmates;
SELECT rowid, name FROM classmates;
SELECT rowid, name FROM classmates LIMIT 4;
-- 첫번째 하나만 가지고 오기 
SELECT rowid, name FROM classmates LIMIT 1 OFFSET 0;
SELECT rowid, name FROM classmates WHERE address='수원';
SELECT rowid, name FROM classmates WHERE age=28;
SELECT DISTINCT age FROM classmates;

-- WHERE 문 심화 
SELECT * FROM users WHERE age >= 30;
SELECT first_name, last_name FROM users WHERE age >= 30;
SELECT last_name, age FROM users WHERE age >= 30 and last_name = '김';

-- Expressions 
SELECT COUNT(*) FROM users ;
SELECT COUNT(id) FROM users WHERE age >= 30 and last_name = '김';
SELECT AVG(age) FROM users WHERE age >= 30;
SELECT MAX(balance), first_name, last_name FROM users;
SELECT MIN(balance), first_name, last_name FROM users;
SELECT AVG(balance) FROM users WHERE age >= 30;

-- LIKE (wild cards)
SELECT * FROM users WHERE age LIKE '2%';
SELECT * FROM users WHERE phone LIKE '02-%';
SELECT * FROM users WHERE first_name LIKE '%준';
SELECT * FROM users WHERE phone LIKE '%-5114-%';

-- ORDER
SELECT * FROM users ORDER BY age LIMIT 10;
-- 10명이 넘으면 pk 값을 기준으로 걸러짐 
SELECT * FROM users ORDER BY age, last_name LIMIT 10;
SELECT * FROM users ORDER BY age ASC, last_name DESC LIMIT 10;
SELECT last_name, first_name FROM users ORDER BY balance DESC LIMIT 10;

DELETE FROM classmates WHERE rowid=3;
-- insert 하면 삭제된 rowid 에 새로생김... pk 값을 재사용하지 않으려면? AUTOINCREMENT
-- AUTOINCREMENT 사용 자제 요망
-- 특별히 id 가 중요하다 생각되면 스스로 설정하는걸 추천  
-- 만약 연결되어 있는 상황이 온다면 의존하고 있는 데이터가 삭제되어야 삭제 가능 

UPDATE classmates SET address='수원' WHERE name='이신호';

-- sqlite 에 사용하는 명령어에는 ; 이 안붙음
-- sql 관련 명령어에서 ; 사용 