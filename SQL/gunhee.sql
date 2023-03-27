SELECT EMPNO, ENAME, DEPT.DEPTNO,DNAME
FROM EMP, DEPT
/* FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO */
WHERE EMP.DEPTNO=DEPT.DEPTNO 
ORDER BY EMP.ENAME;

/* WHERE = ����̶� ������ �����͸� �ҷ����� �ϴ� ��
ORDER BY = ��������, ������������ �������ִ� �� */

/* DEPT ���̺�� EMP ���̺��� ���, �����, �޿�, �μ����� 0
�˻��Ͻÿ�. ��, �޿��� 2000 �̻��� ����� ���Ͽ� �޿��������� �������� ������ ��.  */

SELECT EMPNO, ENAME, SAL, DNAME
FROM DEPT JOIN EMP ON EMP.DEPTNO=DEPT.DEPTNO
WHERE SAL >=2000
ORDER BY SAL DESC;


/*DEPT ���̺�� EMP ���̺��� ���, �����, ����, �޿�, 
�μ����� �˻��Ͻÿ�. ��, ������ MANAGER�̸� �޿��� 2500 �̻��� 
����� ����, ����� �������� �������� ������ ��.*/
SELECT EMPNO, ENAME, JOB, SAL, DNAME
FROM DEPT NATURAL JOIN EMP
WHERE JOB='MANAGER' AND SAL>=2500
ORDER BY EMPNO;
/*�������� - DESC �������� - ASC*/

/*EMP ���̺�� SALGRADE ���̺��� ���, �����, �޿�,
 ����� �˻��Ͻÿ�. ��, ����� �޿���  LOSAL�� HISAL ������ ���Եǰ� ����� 4�̸�
 �޿��� �������� �������� ������ ��.*/
 SELECT EMPNO, ENAME, SAL, GRADE
 FROM EMP A JOIN SALGRADE ON A.SAL BETWEEN LOSAL AND HISAL
 WHERE GRADE=4 
 ORDER BY SAL DESC;
 
 /* DEPT ���̺�, EMP ���̺�, SALGRADE ���̺��� ���, �����, 
�μ���, �޿�, ����� �˻��Ͻÿ�. ��, ����� �޿��� LOSAL�� HISAL ������ ���ԵǸ� 
����� �������� �������� ������ ��.*/
SELECT EMPNO, ENAME,DNAME, SAL, GRADE 
FROM EMP JOIN DEPT ON EMP.DEPTNO=DEPT.DEPTNO 
        JOIN SALGRADE ON SAL BETWEEN LOSAL AND HISAL
ORDER BY SAL DESC;

/*EMP ���̺��� ������ �ش� ����� 
�����ڸ��� �˻��Ͻÿ�.*/
SELECT E.ENAME �����, M.ENAME �����ڸ�
FROM EMP E JOIN EMP M ON E.MGR = M.EMPNO;

/* EMP ���̺��� ������ �ش� ����� �����ڸ�, 
�ش� ����� �������� �����ڸ��� �˻��Ͻÿ�. */
SELECT W.ENAME, MANAGER.ENAME, U.ENAME 
FROM EMP W JOIN EMP MANAGER ON W.MGR=MANAGER.EMPNO
JOIN EMP U ON MANAGER.MGR=U.EMPNO ;
/*7�� ������� ���� �����ڰ� ���� ��� ����� �̸��� 
����� ��µǵ��� �����Ͻÿ�.*/










--Q3 �μ��� ������� ����(���� ����)
-- �μ��ڵ� �μ��� �����ȣ �̸� ���� ���� 
-- �μ���ȣ�� ����, ������� ���ķ� ǥ��
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+)=D.DEPTNO
ORDER BY D.DEPTNO DESC,E.ENAME ASC;
--Q4 �μ���
--�μ��ڵ� �μ��� ��� ����� �����ڻ��
--�ش� ����� �޿� �޿���� ��������޿� ��� �ְ�޿�
SELECT D.DEPTNO �μ���ȣ ,D.DNAME �μ���, E.EMPNO ���,E.ENAME �����, E.MGR �����ڸ�
      ,E2.ENAME AS MGR_ENAME,E.SAL, S.GRADE, S.LOSAL ��������޿�, S.HISAL ����ְ�޿�
FROM EMP E 
RIGHT OUTER JOIN DEPT D ON E.DEPTNO=D.DEPTNO 
/*LEFT OUTER JOIN SALGRADE S ON E.SAL>=S.LASAL AND E.SAL<=S.HISAL*/
LEFT OUTER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
LEFT OUTER JOIN EMP E2 ON E.MGR=E2.EMPNO
ORDER BY D.DEPTNO,E.EMPNO;

--Q1 ALLEN ����� ���ް� ������ ������� 
-- ���� ��� ����� ���� �μ��ڵ� �μ���(INLINE VIEW)
SELECT E.JOB, E.EMPNO,E.ENAME, E.SAL, D.DEPTNO, D.DNAME
FROM EMP E,DEPT D 
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB = (SELECT E1.JOB FROM EMP E1 WHERE E1.ENAME = 'ALLEN');

--Q2 ��ü ��� �޿����� ���� �޴� �����
--��� ����� �Ի���(YYYY-MM-DD) �μ��� �μ���ġ �޿� �޿����
SELECT E.EMPNO, E.ENAME,TO_CHAR(E.HIREDATE,'YYYY-MM-DD') HIREDATE
        ,D.DNAME, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.SAL>(SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC,E.ENAME;

--Q3 10�� �μ��� �ο� �� 30�� �μ��� ���� ������ ���� ������ 
--��� ����� ���� �μ��ڵ� �μ��� �μ���ġ
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.DEPTNO=10 AND NOT E.JOB /*IN*/ <>ALL
(SELECT DISTINCT E1.JOB FROM EMP E1 WHERE E1.DEPTNO=30);


--Q4 SALESMAN�� �ִ�޿����� ���� �޿��� �޴� ������� 
--��� ����� �޿� �޿����
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL>(SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');
/*��, �Ʒ� ���� �ǹ�*/
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
AND E.SAL>(SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN');
