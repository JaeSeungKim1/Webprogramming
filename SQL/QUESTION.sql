-- 1. 모든 사원의 이름(FIRST_NAME, LAST_NAME)을 조회하라.
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES;
-- 2. 모든 사원의 모든 정보를 조회하라.
SELECT * FROM EMPLOYEES;
-- 3. 모든 도시 명을 조회하라.
SELECT CITY FROM LOCATIONS;
-- 4. 이름(FIRST_NAME)이 M 으로 시작하는 사원의 모든 정보를 조회하라.
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE 'M%';
-- 5. 이름(FIRST_NAME)의 두 번째 글자가 'a'인 사원의 이름(FIRST_NAME)과 연봉을 조회하라.
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE FIRST_NAME LIKE '_a%';
-- 6. 도시 명을 오름차순 정렬하라.
SELECT CITY FROM LOCATIONS ORDER BY CITY ASC;
-- 7. 부서 명을 내림차순 정렬하라.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS ORDER BY DEPARTMENT_NAME DESC;
-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.
SELECT * FROM EMPLOYEES WHERE SALARY>=7000 ORDER BY SALARY ASC;
-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL;
-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;
-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(FIRST_NAME, LAST_NAME) 
--      그리고 부서번호를 조회하라.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
--WHERE TO_CHAR(HIRE_DATE) = '2007-06-21';
WHERE HIRE_DATE=TO_DATE('20070621','YYYYMMDD');
-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.
SELECT EMPLOYEE_ID,HIRE_DATE FROM EMPLOYEES 
WHERE HIRE_DATE>=TO_DATE('20060101','YYYYMMDD')
AND HIRE_DATE<TO_DATE('20070101','YYYYMMDD');
--ORDER BY TO_CHAR(HIRE_DATE);
-- 13. 이름(FIRST_NAME)의 길이가 5글자 이상인 사원을 조회하라.
--SELECT * FROM EMPLOYEES WHERE LENGTH (FIRST_NAME) = 5;
SELECT FIRST_NAME FROM EMPLOYEES 
WHERE FIRST_NAME LIKE '_____%';
-- 14. 부서번호별 사원수를 조회하라. (부서번호 오름차순 정렬)
--SELECT DEPARTMENT_ID 부서번호,COUNT(FIRST_NAME) 사원수 FROM EMPLOYEES
--GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID;
SELECT DEPARTMENT_ID,COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID;
-- 15. 직무 아이디별 평균 연봉을 조회하라. (직무 아이디 내림차순 정렬)
--SELECT JOB_ID 직무아이디,AVG(SALARY) 평균연봉 FROM EMPLOYEES
--GROUP BY JOB_ID ORDER BY JOB_ID DESC;
SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY JOB_ID DESC;
-- 16. 상사가 있는 사원들의 모든 정보를 조회하라.
SELECT*FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL;
-- 17. 상사가 없는 사원들의 모든 정보를 조회하라.
SELECT*FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
-- 18. 모든 사원들의 사원번호, 이름(FIRST_NAME, LAST_NAME), 부서번호 
--   그리고 부서명을 조회하라.
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME, DEPARTMENT_ID,DEPARTMENT_ID
FROM EMPLOYEES E INNER JOIN DEPARTMENTS ON E.DEPARTMENT_ID=DEPARTMENT_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, JOB_ID  FROM EMPLOYEES;
-- 19. 모든 부서의 부서명과 도시명을 조회하라.
--SELECT DEPARTMENT_NAME, CITY FROM DEPARTMENTS INNER JOIN LOCATIONS USING(LOCATION_ID);
--SELECT D.DEPARTMENT_ID,D.DEPARTMENT_NAME,L.CITY FROM DEPARTMENTS D 
--JOIN LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID;
SELECT D.DEPARTMENT_NAME,L.CITY
FROM DEPARTMENTS D, LOCATIONS L
WHERE D.LOCATION_ID=L.LOCATION_ID;
-- 20. 모든 사원들의 사원번호, 부서명, 직무명을 조회하라.
--SELECT * FROM EMPLOYEES E JOIN DEPARTMENTS using (DEPARTMENT_ID)
--JOIN JOBS J ON E.JOB_ID=J.JOB_ID;
SELECT E.EMPLOYEE_ID,D.DEPARTMENT_NAME,J.JOB_TITLE
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
AND E.JOB_ID=J.JOB_ID;
-- 21. 모든 사원들의 사원번호, 부서명, 직무명, 도시명을 조회하라.
SELECT E.EMPLOYEE_ID,D.DEPARTMENT_NAME,J.JOB_TITLE,L.CITY
FROM EMPLOYEES E, DEPARTMENTS D, JOBS J,LOCATIONS L
WHERE E.DEPARTMENT_ID=D.DEPARTMENT_ID
AND E.JOB_ID=J.JOB_ID
AND D.LOCATION_ID=L.LOCATION_ID;

-- 22. 10번, 20번, 30번 부서에서 근무하는 사원들의 모든 정보를 조회하라.
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(10,20,30)
ORDER BY DEPARTMENT_ID;
-- 23. 6인 미만의 사원이 근무하는 부서의 이름을 조회하라.
SELECT D.DEPARTMENT_NAME
FROM DEPARTMENTS D,EMPLOYEES E
WHERE D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT(1)<6;

-- 24. 4인 미만의 사원이 근무하는 부서의 평균 연봉과 부서명을 조회하라.
SELECT AVG(SALARY),D.DEPARTMENT_NAME
FROM DEPARTMENTS D,EMPLOYEES E
WHERE D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME
HAVING COUNT(*)<4;
-- 25. IT 부서의 연봉 총합을 조회하라.
SELECT SUM(SALARY) FROM EMPLOYEES
WHERE JOB_ID LIKE '%IT%';
-- 26. 대륙명(REGIONS)별 도시의 개수를 조회하라.
SELECT  R.REGION_NAME, COUNT(CITY)
FROM    COUNTRIES C , REGIONS R, LOCATIONS L
WHERE   L.COUNTRY_ID = C.COUNTRY_ID
AND     R.REGION_ID = C.REGION_ID
GROUP   BY R.REGION_NAME;
-- 27. 도시명 별 부서의 개수를 조회하라.
SELECT  L.CITY ,COUNT(1)
FROM    LOCATIONS L, DEPARTMENTS D
WHERE   L.LOCATION_ID = D.LOCATION_ID
GROUP   BY L.CITY;
-- 28. 부서가 존재하지 않는 도시를 조회하라.
SELECT  L.CITY
FROM    LOCATIONS L
WHERE   L.LOCATION_ID NOT IN (SELECT  D.LOCATION_ID 
                            FROM    DEPARTMENTS D);
-- 29. 사원이 존재하지 않는 국가를 조회하라.
SELECT  COUNTRY_NAME
FROM    COUNTRIES 
WHERE   COUNTRY_ID NOT IN (
                    SELECT L.COUNTRY_ID
                    FROM LOCATIONS L, DEPARTMENTS D, EMPLOYEES E
                    WHERE  L.LOCATION_ID = D.LOCATION_ID
                    AND  D.DEPARTMENT_ID = E.DEPARTMENT_ID);
-- 30. 150번 사원보다 빨리 입사한 사원 중 가장 최신에 입사한 사원의 모든 정보를 조회하라.

-- 31. 직무를 전환한 이력이 있는 사원의 모든 정보를 조회하라.

-- 32. 부서의 메니저으로 있는 사원의 모든 정보와 부서명을 조회하라.

-- 33. 다른 사원의 상사인 사원의 모든 정보를 조회하라.

-- 34. 이름(FIRST_NAME)이 C로 시작하고 s로 끝나는 
--    사원의 부서명, 직무명, 도시명, 국가명, 대륙명을 조회하라.
SELECT  E.FIRST_NAME, D.DEPARTMENT_NAME, J.JOB_TITLE , 
    L.CITY, C.COUNTRY_NAME, R.REGION_NAME
FROM    EMPLOYEES E, DEPARTMENTS D, JOBS J, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE   E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND     J.JOB_ID = E.JOB_ID
AND     D.LOCATION_ID = L.LOCATION_ID
AND     L.COUNTRY_ID = C.COUNTRY_ID
AND     C.REGION_ID = R.REGION_ID
AND     E.FIRST_NAME LIKE 'C%s';
-- 35. 직무를 전환한 이력이 없는 사원의 모든 정보를 조회하라.

-- 36. 자신의 상사가 자신 보다 늦게 입사한 사원의 모든 정보를 조회하라.

-- 37. 100번 사원을 직속 상사로 두고 있는 사원들의 모든 정보를 조회하라.

-- 38. 100번 사원을 상사로 두고 있는 모든 사원들의 모든 정보를 조회하라.
SELECT  *FROM EMPLOYEES
WHERE MANAGER_ID = 100;
-- 38-1. 112번 사원의 상사들을 모두 조회해라
SELECT LEVEL, E.*
FROM EMPLOYEES E
START  WITH E.EMPLOYEE_ID = 112
CONNECT BY PRIOR E.MANAGER_ID = E.EMPLOYEE_ID;
-- 38-2. 150번 사원의 모든 상사들의 이름과 부서명을 조회하라

-- 39. 사원수가 가장 많은 도시의 이름을 조회하라.

-- 40. 직무의 종류가 가장 많은 부서의 이름을 조회하라.

-- 41. 담당 직무의 최대 연봉을 받고 있는 사원들의 모든 정보를 조회하라.

-- 42. 담당 직무의 최소 연봉을 받고 있는 사원들의 모든 정보를 조회하라.

-- 43. 부서와 직무별 최대연봉, 최소연봉, 사원수를 조회하라.

-- 44. 사원수가 가장 많은 도시에서 근무하는 모든 사원들의 연봉 총합을 조회하라.

-- 45. 사원수가 가장 많은 도시에서 근무하는 모든 사원들의 부서별 및 직무별 평균 연봉을 조회하라.

-- 46. 입사일이 가장 오래된 사원을 조회하라.

-- 47. 입사일이 가장 최근인 사원을 조회하라.

-- 48. 가장 최근에 입사한 사원과 가장 오래전에 입사한 사원의 일차를 계산해 조회하라.

-- 49. 가장 최근에 입사한 사원과 가장 오래전에 입사한 사원의 시간차를 계산해 조회하라.

-- 50. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.

-- 51. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.

-- 52. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.

-- 53. 2000/02/20 일부터 2010/05/01 사이에 고용된 사원들의 LAST_NAME 사번, 고용일자를 조회한다.

-- 54. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 
--   부서 번호를 알파벳순으로 조회한다.

-- 55. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 
--   사원들의 LAST_NAME 및 연봉을 조회한다.

-- 56. 2005년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.

-- 57. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.

-- 58. 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.

-- 59. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--    연봉 역순, 커미션 역순차로 정렬한다.

-- 60. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.

-- 61. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.

-- 62. 연봉이 2,500, 3,500, 7000 이 아니며 
-- 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.

-- 63.  직업이 AD_PRESS 인 사람은 A 등급을, 
--  ST_MAN 인 사람은 B 등급을, IT_PROG 인 사람은 C 등급을,
--  SA_REP 인 사람은 D 등급을, ST_CLERK 인 사람은 E 등급을 
--  기타는 0 을 부여하여 조회한다.

-- 64. 모든 사원들의 LAST_NAME, 부서 이름 및 부서 번호을 조회한다.

-- 65. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회한다. 90 부서 또한 포함한다.

-- 66. 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.

-- 66-1. 시애틀에 사는 사람 중 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.

-- 67. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 을 조회한다.

-- 68. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다.

-- 69. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.

-- 70. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.

-- 71. 동일한 직업을 가진 사원들의 총 수를 조회한다.

-- 72. 매니저로 근무하는 사원들의 총 수를 조회한다.

-- 73. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.

-- 74. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다.
--     매니저가 없는 사람들은 제외한다.
--     최소 연봉이 6000 미만인 경우는 제외한다.
--     연봉 기준 역순으로 조회한다.

-- 75. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉을 조회한다.
--     평균 연봉은 소수점 2 자리까지만 표현한다.

-- 76. 총 사원 수 및 1995, 1996, 1997, 1998 년도 별 고용된 사원들의 총 수를 다음과 같이 조회한다.

-- 77.  각 부서별 각 직업 별 연봉 총 합 및 각 부서별 연봉 총 합을 조회한다. 

-- 78. LAST_NAME 이 Zlotkey 와 동일한 부서에 근무하는 모든 사원들의 사번 및 고용날짜를 조회한다.
--     결과값에서 Zlotkey 는 제외한다.

-- 79. 회사 전체 평균 연봉보다 더 받는 사원들의 사번 및 LAST_NAME 을 조회한다.

-- 80. LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회한다.

-- 81. (VIEW 이용) LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 LAST_NAME 을 조회한다.

-- 82. 위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회한다.

-- 83. (VIEW 이용)위치 ID 가 1700 인 부서에서 근무하는 사원들의 LAST_NAME, 부서 번호 및 JOB_ID 를 조회한다.

-- 84. King 을 매니저로 두고 있는 모든 사원들의 LAST_NAME 및 연봉을 조회한다.

-- 85. EXECUTIVE 부서에 근무하는 모든 사원들의 부서 번호, LAST_NAME, JOB_ID 를 조회한다.

-- 86. 회사 전체 평균 연봉 보다 더 버는 사원들 중 LAST_NAME 에 u 가 있는 사원들이
--       근무하는 부서에서 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.

-- 87. (VIEW 이용)회사 전체 평균 연봉 보다 더 버는 사원들 중 LAST_NAME 에 u 가 있는 사원들이
--       근무하는 부서에서 근무하는 사원들의 사번, LAST_NAME 및 연봉을 조회한다.

-- 88. ST_CLERK 인 직업 ID 를 가진 사원이 없는 부서 ID 를 조회한다.
--       NULL 값은 제외한다. (NOT EXISTS 사용)

-- 89. ST_CLERK 인 직업 ID 를 가진 사원이 있는 부서 ID 를 조회한다.
--       NULL 값은 제외한다. (NOT EXISTS 사용)

-- 90. 위치한 부서가 없는 국가 ID 및 국가 이름을 조회힌다.(NOT EXISTS 사용)

-- 91. 위치한 부서가 있는 국가 ID 및 국가 이름을 조회힌다.(EXISTS 사용)

-- 92. 기존의 직업을 여전히 가지고 있는 사원들의 사번 및 JOB_ID 를 조회한다.

-- 93. 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.

-- 94. 위치 ID 가 1700 인 사원들의 연봉과 커미션이 동일한 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.

-- 95. LAST_NAME 이 'Kochhar' 인 사원과 동일한 연봉 및 커미션을 버는 사원들의 LAST_NAME, 부서 번호 및 연봉을 조회한다.

-- 96. 직업 ID 가 SA_MAN 인 사원들이 받을 수 있는 최대 연봉 보다 높게 받는 사원들의 LAST_NAME, JOB_ID 및 연봉을 조회한다.

-- 97. 도시 이름이 T 로 시작하는 지역에 사는 사원들의 사번, LAST_NAME 및 부서 번호를 조회한다.

-- 98.  각 부서별 평균 연봉보다 더 받는 동일부서 근무사원들의
--      LAST_NAME, 연봉, 부서번호 및 해당 부서의 평균 연봉을 조회한다.
--      결과는 부서별 연봉을 기준으로 정렬한다.

-- 99. 소속부서의 평균 연봉보다 적게 버는 사원들의 last_name 을 조회한다.

-- 100. 각 사원 별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원이 존재하는 모든 사원들의 last_name 을 조회한다.

--101. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 
--   출력 시 년도를 기준으로 오름차순 정렬하시오. 

--102. 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
--   평균급여가 가장 낮은 도시부터 도시명(city)과 평균연봉, 해당 도시의 직원수를 출력하시오. 
--   단, 도시에 근 무하는 직원이 10명 이상인 곳은 제외하고 조회하시오.

--103. ‘Public  Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하시오. 
--   (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려 하지 않는다.)      
--   이름은 first_name, last_name을 아래의 실행결과와 같이 출력한다.

--104. 자신의 매니저보다 연봉(salary)를 많이 받는 직원들의 성(last_name)과 연봉(salary)를 출 력하시오. 

--105. 2007년에 입사(hire_date)한 직원들의 사번(employee_id), 이름(first_name), 성(last_name), 
--   부서명(department_name)을 조회합니다.  
--   이때, 부서에 배치되지 않은 직원의 경우, ‘<Not Assigned>’로 출력하시오. 

--106. 업무명(job_title)이 ‘Sales Representative’인 직원 중에서 연봉(salary)이 9,000이상, 10,000 이하인 
--   직원들의 이름(first_name), 성(last_name)과 연봉(salary)를 출력하시오

--107. 부서별로 가장 적은 급여를 받고 있는 직원의 이름, 부서이름, 급여를 출력하시오. 
--   이름은 last_name만 출력하며, 부서이름으로 오름차순 정렬하고, 
--   부서가 같은 경우 이름을 기준 으로 오름차순 정렬하여 출력합니다. 

--108. EMPLOYEES 테이블에서 급여를 많이 받는 순서대로 조회했을 때 결과처럼 6번째부터 10 번째까지 
--   5명의 last_name, first_name, salary를 조회하는 sql문장을 작성하시오.

--109. 사원의 부서가 속한 도시(city)가 ‘Seattle’인 사원의 이름, 해당 사원의 매니저 이름, 사원 의 부서이름을 출력하시오. 
--   이때 사원의 매니저가 없을 경우 ‘<없음>’이라고 출력하시오. 이름은 last_name만 출력하며, 
--   사원의 이름을 오름차순으로 정렬하시오. 

--110. 각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다. 연봉 총합이 가장 높은 업무부터 
--    업무명(job_title)과 연봉 총합을 조회하시오. 단 연봉총합이 30,000보다 큰 업무만 출력하시오. 

--111. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 업무명(job_title), 
--    부서 명(department_name)을 조회하시오. 
--    단 도시명(city)이 ‘Seattle’인 지역(location)의 부서 (department)에 근무하는 직원을 사원번호 오름차순순으로 출력하시오.

--112. 2001~20003년사이에 입사한 직원의 이름(first_name), 입사일(hire_date), 관리자사번 (employee_id), 
--    관리자 이름(fist_name)을 조회합니다. 단, 관리자가 없는 사원정보도 출력 결과에 포함시켜 출력한다.

--113. ‘Sales’ 부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)을 조회하시오. 
--    단, 급여는 100번 부서의 평균보다 적게 받는 직원 정보만 출력되어야 한다. 

--114. Employees 테이블에서 입사한달(hire_date)별로 인원수를 조회하시오.

--115. 부서별 직원들의 최대, 최소, 평균급여를 조회하되, 
--    평균급여가 ‘IT’ 부서의 평균급여보다 많고, ‘Sales’ 부서의 평균보다 적은 부서 정보만 출력하시오. 

--116. 각 부서별로 직원이 한명만 있는 부서만 조회하시오. 
--    단, 직원이 없는 부서에 대해서는 ‘<신생부서>’라는 문자열이 출력되도록 하고,
--    출력결과는 다음과 같이 부서명이 내림차순 으로 정렬되어야한다. 

--117. 부서별 입사월별 직원수를 출력하시오. 
--    단, 직원수가 5명 이상인 부서만 출력되어야 하며 출력결과는 부서이름 순으로 한다.

--118. 국가(country_name) 별 도시(city)별 직원수를 조회하시오. 
--    단, 부서에 속해있지 않은 직원 이 있기 때문에 106명의 직원만 출력이 된다. 
--    부서정보가 없는 직원은 국가명과 도시명 대신에 ‘<부서없음>’이 출력되도록 하여 107명 모두 출력되게 한다.

--119. 각 부서별 최대 급여자의 아이디(employee_id), 이름(first_name), 급여(salary)를 출력하시오. 
--    단, 최대 급여자가 속한 부서의 평균급여를 마지막으로 출력하여 평균급여와 비교할 수 있게 할 것.

--120. 커미션(commission_pct)별 직원수를 조회하시오. 
--    커미션은 아래실행결과처럼 0.2, 0.25는 모두 .2로, 0.3, 0.35는 .3 형태로 출력되어야 한다. 
--    단, 커미션 정보가 없는 직원들도 있는 데 커미션이 없는 직원 그룹은 ‘<커미션 없음>’이 출력되게 한다.

--121. 커미션(commission_pct)을 가장 많이 받은 상위 4명의 부서명(department_name), 
--    직원명 (first_name), 급여(salary), 커미션(commission_pct) 정보를 조회하시오. 
--    출력결과는 커미션 을 많이 받는 순서로 출력하되 동일한 커미션에 대해서는 급여가 높은 직원이 먼저 출력 되게 한다.

--Q1 부서명, 직원명(first_name),급여,커미션 컬럼을 갖는 뷰를 작성하시요.
--단 커미션 포인트가 없을 경우 0으로 반환

--Q2 부서명, 직책, 직원명, 입사일을 갖는 뷰를 작성하시오.

--Q3 부서테이블을 복사하여 새 테이블을 만들고 그 테이블에 직원수 컬럼을 추가하고 초기값을 셋팅한 후 
--직원의 입사 및 퇴사시 직원수 컬럼을 조정하는 트리거를 작성하시오

--Q4 부서ID를 입력하면 부서명을 반환하는 함수를 작성하시오.

--Q5 부서ID를 입력하면 해당 부서의 직원 목록을 출력하는 프로시저를 작성하시오.