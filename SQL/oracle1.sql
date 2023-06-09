SELECT FN_GET_DEPT_NAME(20) FROM DUAL;
SELECT EMPNO, ENAME, DEPTNO, FN_GET_DEPT_NAME(DEPTNO)
FROM EMP;

CREATE TABLE EMP_TRIG
AS SELECT * FROM EMP;

INSERT INTO EMP_TRIG(EMPNO)VALUES(7777);
UPDATE EMP_TRIG SET ENAME='MIKE' WHERE EMPNO=7703;
DELETE FROM EMP_TRIG WHERE EMPNO=7703;

CREATE TABLE EMP_LOG(   /*LOG표시를 남기려고 뭐 어떤것이 실행됏는지 표시*/
    TABLENAME VARCHAR2(10),
    DML_TYPE VARCHAR2(10),
    EMPNO NUMBER(4),
    USER_NAME VARCHAR2(30),
    CHANGE_DATE DATE
);