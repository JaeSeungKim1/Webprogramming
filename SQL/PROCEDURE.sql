/*PL/SQL (prodedural language extention to SQL 확장 절차 언어
    Procedure:리턴 값이 하나 이상인 경우
    Function: 리턴 반드시 있는 경우(input/output)
    Trigger: 특정한 이벤트 발생 자동으로 실행
    
    package: 프로시저, 함수, 변수 등을 묶어 놓은 것
 ==================================================   
    선언부
    DECLARE
        변수 상수 커서 값 선언 부분 //선택
    실행부
    BEGIN
        절자적 언어 제어문, 반복문, 함수 로직이 기술 //필수
    예외 처리부
    EXCEPTION
        예외사항 처리하는 부분 //선택
    실행문 종료부
    END
=======================================================
    DBMS_OUTPUT.PUT_LINE(출력내용)

변수명 상수지정 데이터타입 리터럴, 변수, 표현식(함수,연산자)
IDENTIFIER [CONSTANT] DATATYPE [:= | DEFAULT EXPRESSION] 을 사용하기도 함
PASSWORD CONSTANT VARCHAR2 :='23412';
PASSWORD CONSTANT VARCHAR2 DEFAULT '1234';

반복문
FOR INDEX IN 시작값..끝값 LOOP 
    실행문
    ...
END LOOP;
LOOP
    실행문
    EXIT [WHEN CONDITION] <- 안해주면 무한루프
END LOOP; */

/*CREATE OR REPLACE PROCEDURE PROCTEST3
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
END;

CREATE OR REPLACE PROCEDURE PROCTEST4 AS
BEGIN 
    FOR I IN 1..4
    LOOP
        IF MOD(I,2)=0 THEN DBMS_OUTPUT.PUT_LINE('짝수');
        ELSE DBMS_OUTPUT.PUT_LINE('홀수');
        END IF;
    END LOOP;
    FOR LIST IN(SELECT EMPNO FROM EMP)
    LOOP 
        IF MOD(LIST.EMPNO,2)=0 THEN DBMS_OUTPUT.PUT_LINE('짝수');
        ELSE DBMS_OUTPUT.PUT_LINE('홀수');
        END IF;
    END LOOP;
END;
*/


/*CREATE OR REPLACE PROCEDURE PROCTESTS5
IS
    V_NUM NUMBER :=6;
    V_SUM NUMBER :=0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('NOW'||V_NUM);
        V_NUM:=V_NUM+1;
        V_SUM:=V_SUM+V_NUM;
        EXIT WHEN V_NUM>10;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('SUM:'||V_SUM);
END PROCTESTS5;
*/
CREATE TABLE DEPT_CONST AS
SELECT * FROM DEPT WHERE 1<>1;

