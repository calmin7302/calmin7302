/************************************************
형변환 내장함수
TO_CHAR : 문자타입으로 전환(날짜 -> 문자, 숫자 -> 문자)
TO_NUMBER : 숫자타입으로 전환(문자 -> 숫자)
TO_DATE : 날짜타입으로 전환(문자 -> 날짜)

      <- TO_NUMBER(문자)  -> TO_DATE(문자)
숫자형   ----    문자형   ----     날짜형
      -> TO_CHAR(숫자)   <- TO_CHAR(날짜)
************************************************
--날짜 -> 문자
TO_CHAR(날짜데이터, '출력형식')
<출력형식>
년도(YYYY, YY), 월(MM), 일(DD)
시간 : HH, HH12(12 시간제), HH24(24 시간제)
분(MI), 초(SS)
오전, 오후: AM, PM
년월일시분초 작성예) YYYY-MM-DD HH24:MI:SS
************************************************/





--==============================
/* TO_CHAR(숫자, '출력형식') : 숫자 -> 문자타입
<형식지정>
0(영) : 자리수를 나타내며, 자리수가 맞지 않는 경우 0을 표시
9(구) : 자리수를 나타내며, 자리수가 맞지 않는 경우 표시하지 않음
L : 지역 통화 문자 표시
.(점) : 소수점
,(콤마) : 1000단위 구분 표시 문자
**************************************/


