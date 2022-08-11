/******************************************************************************
날짜관련 내장함수
날짜값 연산가능
DATE타입 + 숫자(정수) : 숫자만큼 일자 증가
DATE타입 - 숫자(정수) : 숫자만큼 일자 감소

ADD_MONTHS(날짜, 개월수) : 개월수 만큼 월이 증가 또는 감수
LAST_DAY(날짜) : 날짜가 속한 달의 마지막 날짜 구하기
NEXT_DAY(날짜, 요일) : 요일 날짜 구하기, 날짜 다음에 오는 첫번째 요일날짜(일) 구하기
MONTHS_BETWEEN(날짜1, 날짜2) : 기간 구하기(개월) 연산방식(날짜1 - 날짜2)
******************************************************************************/
-- 날짜 데이터 타입과 숫자 연산 가능(+, -), 숫자 1은 하루를 의미
SELECT SYSDATE, SYSDATE +  1, SYSDATE - 1 FROM DUAL;
SELECT ORDERID, ORDERDATE, ORDERDATE + 1 FROM ORDERS;
--=============================================================================
-- ADD_MONTHS(날짜, 개월수) : 개월수 만큼 월이 증가 또는 감수
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) FROM DUAL;-- 2개월 후(뒤)
SELECT SYSDATE, ADD_MONTHS(SYSDATE, -2) FROM DUAL;-- 2개월 전(앞)
--=============================================================================
-- LAST_DAY(날짜) : 날짜가 속한 달의 마지막 날짜 구하기
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;
SELECT SYSDATE, LAST_DAY(ADD_MONTHS(SYSDATE, 1)) FROM DUAL; -- 다음달 마지막날
SELECT SYSDATE, LAST_DAY(ADD_MONTHS(SYSDATE, -6)) FROM DUAL;

SELECT SYSDATE, LAST_DAY(ADD_MONTHS(SYSDATE, -1))+1 FROM DUAL; -- 이번달의 첫날
--=============================================================================
-- NEXT_DAY(날짜, 요일) : 요일 날짜 구하기, 날짜 다음에 오는 첫번째 요일날짜(일) 구하기
SELECT SYSDATE, NEXT_DAY(SYSDATE, '화') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '토') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '토요일') FROM DUAL;
--=============================================================================
-- MONTHS_BETWEEN(날짜1, 날짜2) : 기간 구하기(개월) 연산방식(날짜1 - 날짜2)
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 2) FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE, 2)) FROM DUAL; -- -2개월
SELECT MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 2), SYSDATE) FROM DUAL; -- 2개월

SELECT SYSDATE, ADD_MONTHS(SYSDATE - 3, 2) FROM DUAL;
SELECT MONTHS_BETWEEN(ADD_MONTHS(SYSDATE - 3, 2), SYSDATE) FROM DUAL;
--=============================================================================
-- 1 : 1일 -> 24시간, 1시간 : 1일 / 24시간 --> 1시간
-- 1시간 : 60분 ---> 1시간 / 60분 ---> 1분 :::: 1 / 24 / 60 --> 1분
-- 1분 : 60초 ---> 1분 / 60초 -> 1초 :::: 1 / 24 / 60 / 60 --> 1초
------------------------------------------------------------------------------
SELECT 24 * 60, 24 * 60 * 60 FROM DUAL; -- 1일: 1440분, 1일: 86400초
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') 
   , TO_CHAR(SYSDATE + (1/24), 'YYYY-MM-DD HH24:MI:SS') -- 하루 뒤
    , TO_CHAR(SYSDATE + (1/24), 'YYYY-MM-DD HH24:MI:SS') -- 1시간 뒤
    , TO_CHAR(SYSDATE + (1/24) * 5, 'YYYY-MM-DD HH24:MI:SS') -- 5시간 뒤
FROM DUAL;

------------------------------------------------------------------------------
-- 1일: 86400초, 1440분
SELECT 1 * 60 AS "1분(초)", -- 1분 : 60초
       1 * 60 * 60 AS  "1시간(초)", -- 1시간 : 3600초
       24 * 60 * 60 AS "1일(초)", -- 1일 : 86400초
       24 * 60 AS "1일(분)" -- 1일 : 1440분
FROM DUAL;
------------------------------------------------------------------------------
-- 1일, 1시간, 1분, 1초
SELECT 1, 1/24, 1/24/60, 1/24/60/60 FROM DUAL;
SELECT 1, 1/24, 1/(24*60), 1/(24*60*60) FROM DUAL;
SELECT 1, 1/24, 1/1440, 1/86400 FROM DUAL;
--=============================================================================
SELECT ABS(-15) FROM DUAL; -- 절댓값
SELECT CEIL(15.7) FROM DUAL; -- 올림
SELECT  COS(3.14159) FROM DUAL; -- COS
SELECT FLOOR(15.7) FROM DUAL; -- 내림
SELECT LOG(10, 100) FROM DUAL; -- LOG(지수, 진수)
SELECT MOD(11, 4) FROM DUAL; -- 나머지
SELECT POWER(3, 2) FROM DUAL; -- 제곱함수 (3^2)
SELECT ROUND(15.7) FROM DUAL; -- 반올림(소수점 지정가능)
SELECT SIGN(-15) FROM DUAL; -- 양수/음수/0 구분
SELECT TRUNC(15.7) FROM DUAL; -- 절사
SELECT CHR(67) FROM DUAL; -- 문자 > 아스키
SELECT CONCAT('HAPPY', 'Birthday') FROM DUAL; -- 문자열 연결
SELECT LOWER('Birthday') FROM DUAL; -- 소문자 변환
SELECT LPAD('Page 1', 15, '*.') FROM DUAL; -- LPAD(대상문자열, 전체글자수, 삽입될문자) : 왼쪽에 삽입
SELECT LTRIM('Page 1','ae') FROM DUAL;
SELECT REPLACE('JACK', 'J', 'BL') FROM DUAL; -- 교체
SELECT RPAD('Page 1', 15, '*.') FROM DUAL;
SELECT RTRIM('Page 1', 'ae') FROM DUAL;
SELECT SUBSTR('ABCDEFG', 3, 4) FROM DUAL;
SELECT TRIM(LEADING 0 FROM '00AA00') FROM DUAL;
SELECT UPPER('Birthday') FROM DUAL;
SELECT ASCII('A') FROM DUAL;
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) FROM DUAL;
SELECT LENGTH('Birthday') FROM DUAL;
SELECT ADD_MONTHS('14/05/21', 1) FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT NEXT_DAY(SYSDATE, '화') FROM DUAL;
SELECT ROUND(SYSDATE) FROM DUAL;
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(123) FROM DUAL;
SELECT TO_DATE('12 05 2014', 'DD MM YYYY') FROM DUAL;
SELECT TO_NUMBER('12.3') FROM DUAL;
SELECT DECODE(1, 1, 'aa', 'bb') FROM DUAL;
SELECT NULLIF(123, 345) FROM DUAL;
SELECT NVL(NULL, 123) FROM DUAL;

