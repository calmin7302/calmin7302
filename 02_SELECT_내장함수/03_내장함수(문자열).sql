/****************************************************************************** 
오라클의 내장함수 - 문자열, 숫자, 날짜 관련 함수
<문자열 관련 내장함수>
UPPER : 대문자로 변경
LOWER : 소문자로 변경
INITCAP : 첫 글자만 대문자로 나머지는 소문자
LENGTH : 문자열의 길이(문자단위)
LENGTHB : 문자열의 길이(BYTE 단위)
SUBSTR(대상, 시작위치, 길이) : 문자열의 일부 추출
   (시작위치는 1부터 시작, 오른쪽에서 시작하는 경우 마이너스(-)값 사용)
INSTR(대상, 찾는문자) : 대상문자열에 찾는문자 위치값 리턴
INSTR(대상, 찾는문자, 시작위치)
INSTR(대상, 찾는문자, 시작위치, nth) : nth 찾은값의 순서값(3 : 3번째 찾은 값)
TRIM('문자열') : 양쪽 공백 제거
LTRIM('문자열') : 왼쪽에 있는 공백 제거
RTRIM('문자열') : 오른쪽에 있는 공백 제거
CONCAT(문자열1, 문자열2) : 문자열 연결 - 문자열1 || 문자열2
LPAD(대상문자열, 전체글자수, 삽입될문자) : 왼쪽에 삽입
RPAD(대상문자열, 전체글자수, 삽입될문자) : 오른쪽에 삽입
REPLACE(대상문자열, 찾을문자, 변경문자) : 문자열에서 찾은문자를 변경
******************************************************************************/
-- UPPER : 대문자로 변경
-- LOWER : 소문자로 변경
-- INITCAP : 첫 글자만 대문자로 나머지는 소문자
------------------------------------------------------------------------------
SELECT BOOKNAME, UPPER(BOOKNAME) FROM BOOK;
SELECT BOOKNAME, LOWER(BOOKNAME) FROM BOOK;
SELECT BOOKNAME, INITCAP(BOOKNAME) FROM BOOK;
SELECT INITCAP('OLYMPIC CHAMPIONS') FROM DUAL;
SELECT * FROM DUAL;
------------------------------------------------------------------------------
SELECT * FROM BOOK;
SELECT * FROM BOOK WHERE BOOKNAME = 'Olympic Champions';
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'Olympic%';
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'OLYMPIC%';
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'olympic%';
-- 저장된 데이터가 정제된(표준화)된 형태면 정해진 형태로 조회(검색)
-- 단, 영문데이터가 정제되지 않은 상태면 같은 형태로 만들고 검색
SELECT BOOKID, BOOKNAME, UPPER(BOOKNAME) FROM BOOK
WHERE UPPER(BOOKNAME) LIKE 'OLYMPIC%'
;
--=============================================================================
-- LENGTH : 문자열의 길이(문자단위)
-- LENGTHB : 문자열의 길이(BYTE 단위)
SELECT LENGTH('ABCDE123@#') FROM DUAL; -- 문자단위: 10글자
SELECT LENGTHB('ABCDE123@#') FROM DUAL; -- BYTE 단위: 10BYTE

SELECT LENGTH('홍길동') FROM DUAL; -- 문자단위: 3글자
SELECT LENGTHB('홍길동') FROM DUAL; -- BYTE 단위: 9BYTE

SELECT LENGTH('홍길동123') FROM DUAL; -- 문자단위: 6글자
SELECT LENGTHB('홍길동123') FROM DUAL; -- BYTE 단위: 12BYTE
--=============================================================================
-- SUBSTR(대상, 시작위치, 길이) : 문자열의 일부 추출
--- (시작위치는 1부터 시작, 오른쪽에서 시작하는 경우 마이너스(-)값 사용)
SELECT SUBSTR('홍길동123456', 1) FROM DUAL; -- 홍길동123456: 첫글자부터 끝까지
SELECT SUBSTR('홍길동123456', 4) FROM DUAL; -- 123456: 4번째부터 끝까지
SELECT SUBSTR('홍길동123456', 1, 3) FROM DUAL; -- 홍길동: 첫번째부터 3개
SELECT SUBSTR('홍길동123456', -3) FROM DUAL; -- 456: 뒤에서 3개
SELECT SUBSTR('홍길동123456', -6) FROM DUAL; -- 123456: 뒤에서 6개
SELECT SUBSTR('홍길동123456', -6, 3) FROM DUAL; -- 123: 뒤에서 6번째부터 3개
--=============================================================================
--INSTR(대상, 찾는문자): 대상문자열에 찾는문자 위치값 리턴
--INSTR(대상, 찾는문자, 시작위치)
--INSTR(대상, 찾는문자, 시작위치, nth) : nth 찾은값의 순서값(3: 3번째 찾은 값)
SELECT INSTR('901010-1234567', '-') FROM DUAL; --7: 위치값 7번째에 있다
SELECT INSTR('901010-1234567', '*') FROM DUAL; -- 0리턴: 없을때
SELECT INSTR('901010-1234567', '123') FROM DUAL; -- 8
SELECT INSTR('901010-1234567', '1', 7) FROM DUAL; -- 8: 7번째부터 찾기
SELECT INSTR('901010-1234567', '1', 1, 2) FROM DUAL; -- 5: 처음부터 찾고 2번째 찾은 위치
--=============================================================================
--TRIM('문자열') : 양쪽 공백 제거
--LTRIM('문자열') : 왼쪽에 있는 공백 제거
--RTRIM('문자열') : 오른쪽에 있는 공백 제거
SELECT '    TEST    ', '-'||TRIM('    TEST    ')||'-' FROM DUAL;
SELECT '    TEST    ', '-'||LTRIM('    TEST    ')||'-' FROM DUAL;
SELECT '    TEST    ', '-'||RTRIM('    TEST    ')||'-' FROM DUAL;
--=============================================================================
--CONCAT(문자열1, 문자열2): 문자열 연결 - 문자열1 || 문자열2
SELECT CONCAT('HELLO', ' WORLD') FROM DUAL;
SELECT 'HELLO' || 'WORLD' FROM DUAL;
SELECT 'HELLO' || 'WORLD' || '!!!' FROM DUAL;
SELECT CONCAT('HELLO', CONCAT(' WORLD', '!!!')) FROM DUAL;
--=============================================================================
--LPAD(대상문자열, 전체글자수, 삽입될문자) : 왼쪽에 삽입
--PAD(대상문자열, 전체글자수, 삽입될문자) : 오른쪽에 삽입
--REPLACE(대상문자열, 찾을문자, 변경문자) : 문자열에서 찾은문자를 변경
SELECT LPAD('HELLO', 10) FROM DUAL; --좌측 5개 공백(스페이스)
SELECT LPAD('HELLO', 10, '*') FROM DUAL; --*****HELLO

SELECT RPAD('HELLO', 10) FROM DUAL; --우측 5개 공백(스페이스)
SELECT RPAD('HELLO', 10, '*') FROM DUAL; --HELLO*****
SELECT RPAD('HELLO', 10, '$#') FROM DUAL; --문자열지정: HELLO$#$#$
--=============================================================================
--REPLACE(대상문자열, 찾을문자, 변경문자): 문자열에서 찾은문자를 변경
SELECT 'HELLO JAVA', REPLACE('HELLO JAVA', 'A', 'O') FROM DUAL;
SELECT 'HELLO JAVA JAVA', 
        REPLACE('HELLO JAVA JAVA', 'JAVA', 'WORLD') 
FROM DUAL;
--=============================================================================
SELECT * FROM BOOK;
SELECT BOOKNAME, REPLACE(BOOKNAME, 'Olympic', 'OLYMPIC') FROM BOOK;













