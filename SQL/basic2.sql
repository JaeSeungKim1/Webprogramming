/*CREATE TABLE TABLE_NAME(
        COLUMN_NAME DATA_TYPE(LENGTH),
        ........
        );
*/
DROP TABLE EMP_DDL;
CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
    );
DESC EMP_DDL;/* �̷��� ġ�� �ܼ�â�� ����� ���*/
CREATE TABLE DEPT_DDL   /* */
AS SELECT * FROM DEPT;    /* *�� ��ü ����  */
DESC DEPT_DDL;
DROP TABLE SALGRADE_DDL;
CREATE TABLE SALGRADE_DDL
AS SELECT * FROM SALGRADE;
DESC SALGRADE_DDL;

/* ALTER TABLE <TABLE_NAME>     <������>
    1.ADD <COLNAME> <DATATYPE>;
    2.DROP <COLNAME>;
    3.MODIFY <COLNAME> <DATATYPE>;  ����
    4.RENAME COLUMN <OLD_COLNAME> TO <NEW_COLNAME>  COLUMN ��ü TO ��ü
*/
ALTER TABLE SALGRADE_DDL
ADD PARTY VARCHAR2(20);

ALTER TABLE SALGRADE_DDL
RENAME COLUMN PARTY TO HOME;

ALTER TABLE SALGRADE_DDL
MODIFY HOME NUMBER(10);
DESC SALGRADE_DDL;

ALTER TABLE SALGRADE_DDL
DROP COLUMN HOME;

RENAME SALGRADE_DDL TO SALZIP;
DESC SALZIP;
SELECT * FROM SALZIP;   

TRUNCATE TABLE SALZIP;  /* �����͸� ������ �� */
DROP TABLE SALZIP;     /*���̺� ��ü�� ���ư��°�*/

/*
COMMENT ON TABLE <TABLE_NAME> IS <COMMENT>;
COMMENT ON COLUMN <TABLE_NAME>.<COLNAME> IS <COMMENT>;
*/
COMMENT ON TABLE DEPT_DDL IS 'DDL�������̺�';
COMMENT ON COLUMN DEPT_DDL.LOC IS '�μ���ġ';

SELECT * FROM USER_TAB_COMMENTS;
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME='DEPT_DDL';

/*�������� CONSTRAINT
    NOT NULL/UNIQUE/PRIMARY KEY/FOREIGN KEY/CHECK/DEFAULT
*/
DROP TABLE persons;

DROP TABLE persons2;

CREATE TABLE persons (
    id     VARCHAR2(4) PRIMARY KEY,
    name   VARCHAR2(20) NOT NULL UNIQUE,
    age    NUMBER(3) CHECK ( age >= 18 ),
    telnum VARCHAR2(20),
    addr   VARCHAR2(100) DEFAULT 'SEOUL',
    bday   DATE DEFAULT sysdate
);

INSERT INTO persons (
    id,
    name,
    age,
    telnum
) VALUES (
    '1000',
    'SCOTT',
    20,
    '01012345567'
);

INSERT INTO persons (
    name,
    age,
    telnum
) VALUES (
    'SCOTT',
    20,
    '010123445567'
);

CREATE TABLE persons2 (
    id     VARCHAR2(4),
    name   VARCHAR2(20) NOT NULL,
    age    NUMBER(3),
    telnum VARCHAR2(20),
    addr   VARCHAR2(100) DEFAULT 'SEOUL',
    bday   DATE DEFAULT sysdate,
    CONSTRAINT pk_person2 PRIMARY KEY ( id ),
    CONSTRAINT un_person2 UNIQUE ( name ),
    CONSTRAINT chk_person2 CHECK ( age >= 18 )
);

ALTER TABLE persons2 MODIFY
    addr DEFAULT 'PARIS';

ALTER TABLE persons2 DROP CONSTRAINT chk_person2;

ALTER TABLE persons2 ADD CONSTRAINT chk_p2 CHECK ( age > 50 );

DROP TABLE plays;

CREATE TABLE palys (
    play_id     NUMBER(10) PRIMARY KEY,
    play_result VARCHAR2(100),
    persons_id  VARCHAR2(4),
    CONSTRAINT fk_plays FOREIGN KEY ( persons_id )
        REFERENCES persons ( id )
            ON DELETE CASCADE
);
    /*�����Ǵ� �����Ͱ� �������� ���� �����ִ� �ױ׵��� ����ڴ� ��� ������� ��� �������ٴ� ���� FOREIGN KEY �������� ������ �� ����� �Ѵ�. 
    �ٸ� �ɼ� ON DELETE SET NULL �ڽ��� ������ ����� */

DROP TABLE fktable;

DROP TABLE pktable;

CREATE TABLE pktable (
    pkval VARCHAR2(10),
    CONSTRAINT pk_key PRIMARY KEY ( pkval )
);

CREATE TABLE fktable (
    pkval VARCHAR2(10),
    fkval VARCHAR2(10)
);

ALTER TABLE fktable
    ADD CONSTRAINT fk_key FOREIGN KEY ( fkval )
        REFERENCES pktable ( pkval )
            ON DELETE CASCADE;

ALTER TABLE fktable ADD CONSTRAINT fkt_pk_key PRIMARY KEY ( pkval );

INSERT INTO pktable VALUES ( 'PK1' );

INSERT INTO pktable VALUES ( 'PK2' );

INSERT INTO pktable VALUES ( 'PK3' );

SELECT
    *
FROM
    pktable;

INSERT INTO fktable VALUES (
    'PK1-VAL1',
    'PK1'
);

INSERT INTO fktable VALUES (
    'PK1-VAL2',
    'PK1'
);

INSERT INTO fktable VALUES (
    'PK2-VAL1',
    'PK2'
);

INSERT INTO fktable VALUES (
    'PK2-VAL2',
    'PK2'
);

INSERT INTO fktable VALUES (
    'PK3-VAL1',
    'PK3'
);

INSERT INTO fktable VALUES (
    'PK3-VAL2',
    'PK3'
);

SELECT
    *
FROM
    fktable;

DELETE FROM pktable
WHERE
    pkval = 'PK1';

SELECT
    *
FROM
    pktable;

SELECT
    *
FROM
    fktable;
        
    /*emp_hw table �ۼ� */
DROP TABLE emp_hw;

CREATE TABLE emp_hw (
    empno    NUMBER(4),
    ename    VARCHAR2(10),
    job      VARCHAR2(9),
    mgr      NUMBER(4),
    hiredate DATE,
    sal      NUMBER(7),
    comm     NUMBER(7),
    deptno   NUMBER(2),
    CONSTRAINT hw_pk_emp PRIMARY KEY ( empno ),
    CONSTRAINT hw_fk_deptno FOREIGN KEY ( deptno )
        REFERENCES dept ( deptno )
);
DESC EMP_HW
ADD BIGO VARCHAR2(20);

ALTER TABLE EMP_HW
MODIFY BIGO VARCHAR2(40);
DESC EMP_HW;
/* Q4 BIGO �÷��� �̸��� REMARK�� ����*/
ALTER TABLE EMP_HW
RENAME COLUMN BIGO TO REMARK;

DROP TABLE EMP_HW




