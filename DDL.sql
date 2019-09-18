-- DDL Data Definition Language
/* 여기는 주석 */
DROP TABLE classmates;
CREATE TABLE classmates (
    name TEXT,
    age INT, 
    address TEXT
);

CREATE TABLE classmates (
    id INTEGER PRIMARY KEY, -- AUTOINCREMENT 
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL
); 

CREATE TABLE test (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT NOT NULL
); 


.mode csv
.import users.csv users 


CREATE TABLE articles (
    title TEXT NOT NULL,
    content TEXT NOT NULL
);

-- Table 이름 변경
ALTER TABLE articles RENAME TO news;
-- Error 
ALTER TABLE news ADD COLUMN created_at DATETIME NOT NULL;
-- 1. NOT NULL 조건 삭제
ALTER TABLE news ADD COLUMN created_at DATETIME;
INSERT INTO news VALUES ('2번', 'Bye DB', datetime('now', 'localtime'));
-- 2. DEFAULT 추가
ALTER TABLE news ADD COLUMN subtitle TEXT NOT NULL DEFAULT 1;


-- csv text -> int
-- 새로 table 만든 후에 옮김 