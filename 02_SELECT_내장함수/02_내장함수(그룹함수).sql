/****************************************************************************** 
내장함수 : 오라클 DBMS에서 제공하는 함수(FUNCTION)
그룹함수 : 하나 이상의 행을 그룹으로 묶어서 연산
COUNT(*) : 데이터 갯수 조회(전체 컬럼에 대하여)
COUNT(컬럼명) : 데이터 갯수 조회(지정된 컬럼만 대상으로)
SUM(컬럼명) : 합계값 구하기
AVG(컬럼명) : 평균값 구하기
MAX(컬럼명) : 최대값 구하기
MIN(컬럼명) : 최소값 구하기
******************************************************************************/

SELECT COUNT(*) FROM BOOK; -- 테이블 데이터 건수 확인

SELECT * FROM CUSTOMER;
SELECT COUNT(*)FROM CUSTOMER; -- 5건 조회(전체 데이터 데이터 건수)
SELECT COUNT(NAME)FROM CUSTOMER; -- 5건 조회
SELECT COUNT(PHONE)FROM CUSTOMER; -- 4건 조회(NULL값은 제외됨)
------------------------------------------------------------------------------
-- SUM(컬럼명) : 합계값 구하기
SELECT * FROM BOOK;
SELECT SUM(PRICE) FROM BOOK;
-- (실습) 대한미디어, 이상미디어 출판사에서 출판한 모든 책 금액 합계
SELECT SUM(PRICE) 
FROM BOOK
WHERE PUBLISHER IN ('대한미디어', '이상미디어')
;
------------------------------------------------------------------------------
-- AVG(컬럼명) : 평균값 구하기
SELECT AVG(PRICE) FROM BOOK; -- 14450
SELECT COUNT(*), SUM(PRICE), AVG(PRICE) FROM BOOK;
-- (실습) 대한미디어, 이상미디어 출판사에서 출판한 책의 평균금액
SELECT AVG(PRICE) 
FROM BOOK
WHERE PUBLISHER IN ('대한미디어', '이상미디어')
;
SELECT COUNT(*), COUNT(PRICE) FROM BOOK;
SELECT SUM(PRICE), COUNT(PRICE),
       SUM(PRICE)/COUNT(PRICE),
       SUM(PRICE)/COUNT(*),
       AVG(PRICE)
FROM BOOK;
------------------------------------------------------------------------------
-- MAX(컬럼명) : 최대값 구하기
-- MIN(컬럼명) : 최소값 구하기

SELECT * FROM BOOK;
SELECT MAX(PRICE), MIN(PRICE) FROM BOOK;
-- (실습) 굿스포츠 출판한 책중 최고가, 최저가 구하기
SELECT MAX(PRICE), MIN(PRICE) 
FROM BOOK
WHERE PUBLISHER = '굿스포츠'
;
------------------------------------------------------------------------------
SELECT COUNT(*), SUM(PRICE), AVG(PRICE), MAX(PRICE), MIN(PRICE)
FROM BOOK;

--=============================================================================
-- (실습문제)
-- 1. 출판된 책 전체 조회(정렬 : 출판사, 금액순)
SELECT * FROM BOOK 
ORDER BY PUBLISHER, PRICE;
-- 2. 굿스포츠에서 출판한 책을 책 제목 순으로 조회
SELECT * FROM BOOK 
WHERE PUBLISHER = '굿스포츠'
ORDER BY BOOKNAME
;
-- 3. 출판된 책 중 10000원 이상인 책(가격순-큰금액부터)
SELECT * FROM BOOK
WHERE PRICE >= 10000
ORDER BY PRICE DESC
;
-- 4. 박지성의 총 구매액(CUSTID = 1)
SELECT CUSTID 
FROM CUSTOMER 
WHERE NAME = '박지성'; -- CUSTID : 1

SELECT SUM(SALEPRICE) 
FROM ORDERS
WHERE CUSTID = 1 --(SELECT CUSTID FROM CUSTOMER WHERE NAME = '박지성')
;
-- 5. 박지성이 구매한 도서의 수
SELECT COUNT (*) 
FROM ORDERS
WHERE CUSTID = 1
;
-- 6. 성이 '김'씨인 고객의 이름과 주소
SELECT NAME, ADDRESS 
FROM CUSTOMER
WHERE NAME LIKE '김%'
;
-- 7. 성이 '박'이고 이름이 '성'으로 끝나는 고객의 이름과 주소
SELECT NAME, ADDRESS 
FROM CUSTOMER
WHERE NAME LIKE '박%성'
;
-- 8. 책 제목이 '야구'부터 '축구'까지를 검색하기(책제목으로 정렬)
-- (단, '역도' 관련도서는 제외)
SELECT * FROM BOOK
WHERE BOOKNAME >= '야구' AND BOOKNAME <= '축구' 
AND BOOKNAME NOT LIKE '%역도%'
ORDER BY BOOKNAME -- '축구'까지이기 때문에 '축구%'인 데이터들은 검색X
;



