SELECT CAST('2020-10-19 12:35:29.123' AS DATE) AS '날짜';
SELECT CAST('2020-10-19 12:35:29.123' AS TIME) AS '시간';

USE sqlDB;
SET @myVar1 = 5;
SET @myVar2 = 3;
SET @myVar3 = 4.25;
SET @myVar4 = '가수이름 -->';

SELECT @myVar1;
SELECT @myVar2 + @myVar3;
SELECT @myVar4, Name FROM userTbl WHERE height>180;

SET @myVar1 = 3;
PREPARE myQuery
from 'SELECT Name, height FROM userTbl ORDER BY height LIMIT?';
EXECUTE myQuery USING @myVar1;

use sqlDB;
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTbl;

SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buyTbl;

SELECT BIT_LENGTH('abc'), CHAR_LENGTH('abc'), LENGTH('abc'); 
SELECT BIT_LENGTH('가나다'), CHAR_LENGTH('가나다'), LENGTH('가나다');

SELECT ELT(2, '하나', '둘', '셋'), FIELD('둘', '하나', '둘', '셋'), FIND_IN_SET('둘', '하나,둘,셋'), INSTR('하나 둘셋', '둘'), LOCATE('둘', '하나둘셋');
-- ELT(): n번째 str을 반환하는 함수 --
-- field(): str의 위치를 정수로 반환하는 함수 --
-- find_in_set(): 콤마(,) 로 이루어진 문자열을 검색할 때 사용하는 함수--
-- instr(): 전체 문자열에서 비교 문자열이 존재하는지, 존재하면 위치값을 반환 --
-- locate(): 문자열의 위치를 정수로 반환, 없으면 0을 반환  --