/*PL/SQL (prodedural language extention to SQL Ȯ�� ���� ���
    Procedure:���� ���� �ϳ� �̻��� ���
    Function: ���� �ݵ�� �ִ� ���(input/output)
    Trigger: Ư���� �̺�Ʈ �߻� �ڵ����� ����
    
    package: ���ν���, �Լ�, ���� ���� ���� ���� ��
 ==================================================   
    �����
    DECLARE
        ���� ��� Ŀ�� �� ���� �κ� //����
    �����
    BEGIN
        ������ ��� ���, �ݺ���, �Լ� ������ ��� //�ʼ�
    ���� ó����
    EXCEPTION
        ���ܻ��� ó���ϴ� �κ� //����
    ���๮ �����
    END
=======================================================
    DBMS_OUTPUT.PUT_LINE(��³���)

������ ������� ������Ÿ�� ���ͷ�, ����, ǥ����(�Լ�,������)
IDENTIFIER [CONSTANT] DATATYPE [:= | DEFAULT EXPRESSION] �� ����ϱ⵵ ��
PASSWORD CONSTANT VARCHAR2 :='23412';
PASSWORD CONSTANT VARCHAR2 DEFAULT '1234';

�ݺ���
FOR INDEX IN ���۰�..���� LOOP 
    ���๮
    ...
END LOOP;
LOOP
    ���๮
    EXIT [WHEN CONDITION] <- �����ָ� ���ѷ���
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
        IF MOD(I,2)=0 THEN DBMS_OUTPUT.PUT_LINE('¦��');
        ELSE DBMS_OUTPUT.PUT_LINE('Ȧ��');
        END IF;
    END LOOP;
    FOR LIST IN(SELECT EMPNO FROM EMP)
    LOOP 
        IF MOD(LIST.EMPNO,2)=0 THEN DBMS_OUTPUT.PUT_LINE('¦��');
        ELSE DBMS_OUTPUT.PUT_LINE('Ȧ��');
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

