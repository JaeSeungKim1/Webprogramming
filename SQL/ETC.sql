--INDEX
CREATE INDEX EMP_INDEX
ON EMP(EMPNO,ENAME);
DROP INDEX EMP_INDEX;

--DICTIONARY
SELECT * FROM DICT;
SELECT * FROM DICTIONARY
WHERE TABLE_NAME LIKE 'USER%';
/*
USER_?? 사용자 관련 객체 정보
ALL_?? 사용자 사용가능한 객체 정보
DBA_?? DB관련 정보(SYSTEM SYS)
V$_?? VIEW 관련
*/
SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES WHERE OWNER='SCOTT';
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_USERS;

SELECT * FROM USER_INDEXES;
SELECT * FROM USER_IND_COLUMNS;
SELECT * FROM OBJ;

--VIEW
CREATE VIEW VW_EMP2
AS (SELECT E.*,D.DNAME,D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO=D.DEPTNO);
    
SELECT * FROM USER_VIEWS;
SELECT * FROM VW_EMP2;
/*
SEQUENCE
    CREATE SEQUENCE [SEQ NAME]
    INCREMENT BY [NUM]
    START WITH [START NUM
    NOMINVALUE OR MINVALUE [MINNUM]
    NOMAXVALUE OR MAXVALUE [MAXNUM*
    CYCLE OR NOCYCLE
    CACHE OR NOCACHE/
*/
CREATE SEQUENCE EX_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

DROP TABEL SEQTABLE;
CREATE TABLE SEQTABLE(SEQNUM NUMBER(4),TESTTXT VARCHAR2(10));
SELECT * FROM SEQTALBEL;
INSERT INTO SEQTABLE VALUS (EX_SEQ.NEXTVAL,'TEST TEXT');
SELECT EX_SEQ.CURRVAL FROM DUAL;
SELECT EW_SEQ.NEXTVAL FROM DUAL;
ALTER SEQUENCE EX_SEQ INCREMENT BY -2;

/*줄번호*/
SELECT ROWNUM,A.*
FROM(
    SELECT E.*
    FROM EMP E
    ORDER BY E.ENAME
) A
ORDER BY A.JOB;

SELECT ROW_NUMBER() OVER(ORDER BY E.JOB,E.ENAME) ROW_NUM,
    E.*
FROM EMP E
ORDER BY E.JOB, E.ENAME;

SELECT ROW_NUMBER() OVER(PARTITION BY E.JOB ORDER BY E.JOB,E.ENAME) ROW_NUM,
    E.JOB,E.ENAME
FROM EMP E
ORDER BY E.JOB, E.ENAME;

-- OVER(PARTITION BY)
SELECT JOB,SUM(SAL)
FROM EMP
WHERE JOB IN('MANAGER','SALESMAN')
GROUP BY JOB
ORDER BY JOB;

SELECT EMPNO, ENAME,DEPTNO,JOB,SUM(SAL)
    OVER(PARTITION BY JOB,DEPTNO)
FROM EMP
WHERE JOB IN ('MANAGER','SALESMAN')
ORDER BY JOB,DEPTNO;

SELECT EMPNO,ENAME,JOB,SAL,RANK()OVER(ORDER BY SAL DESC)AS 등수
            /*직군별로 보고 싶으면 파티션 바이를 사용해서*/
    ,DENSE_RANK() OVER(ORDER BY SAL DESC) AS 등수2
            /*이건 동일 점수는 같은 등으로 하고 다음 번호 오게끔*/
FROM EMP
WHERE SAL IS NOT NULL
ORDER BY SAL DESC;

/*SYNONYM 동의어
    CREATE PUBLIC SYNONYM [NAME]
    FOR [TARGET]
*/
CREATE SYNONYM DE
FOR DEPT;
SELECT * FROM DE;
DROP SYNONYM DE;

GRANT CREATE VIEW TO SCOTT;
GRANT CREATE SYNONYM TO SCOTT;


--Q1
DROP TABLE EMPIDX;
CREATE TABLE EMPIDX
AS SELECT * FROM EMP;
--EMPIDX 테이블의 EMPNO값을 기준으로 한 인덱스 IDX_EMPIDX_EMPNO 생성
CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(EMPNO);
SELECT * FROM USER_INDEXES WHERE INDEX_NAME='IDX_EMPIDX_EMPNO';
--Q2 급여가 1500을 넘는 사람의 사번 이름 직급 급여 
--를 담은 뷰 EMPIDX_OVER15를 생성
DROP VIEW EMPIDX_OVER15;
CREATE OR REPLACE VIEW EMPIDX_OVER15
AS SELECT EMPNO, ENAME,JOB,SAL
FROM EMP
WHERE SAL>1500;
SELECT * FROM USER_VIEWS WHERE VIEW_NAME='EMPIDX_OVER15';
SELECT * FROM EMPIDX_OVER15;

--Q3
DROP TABLE DEPTSEQ;
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;
--SEQ_DEPTSEQ 시퀀스를 생성(1에서 99까지 1씩 증가 순환없음 캐쉬안씀)
CREATE SEQUENCE SEQ_DEPTSEQ
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 99
    NOCYCLE
    NOCACHE;
--SEQ_DEPTSEQ 시퀀스 삭제
DROP SEQUENCE SEQ_DEPTSEQ;
--SEQ_DEPTSEQ 시퀀스를 생성(10에서 100까지 60부터 10씩 증가 순환없음 캐쉬안씀)
CREATE SEQUENCE SEQ_DEPTSEQ
    INCREMENT BY 10
    START WITH 60
    MAXVALUE 100
    MINVALUE 10
    CYCLE
    NOCACHE; 
INSERT INTO DEPTSEQ(DEPTNO, DNAME,LOC)
VALUES(SEQ_DEPTSEQ.NEXTVAL,'DATABASE','BUSAN');
SELECT SEQ_DESTSEQ.CURRVAL FROM DUAL;

SELECT * FROM DEPTSEQ;





