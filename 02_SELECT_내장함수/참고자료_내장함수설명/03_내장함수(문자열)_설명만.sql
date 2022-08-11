/******************************* 
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
********************************/

