SELECT * FROM tab;

-- 국가정보
SELECT * FROM COUNTRIES;

-- 위치정보
SELECT * FROM LOCATIONS;

-- 부서정보
SELECT * FROM DEPARTMENTS;

-- 직원정보
SELECT * FROM EMPLOYEES;

-- 직급정보
SELECT * FROM JOBS;

-- 승진정보
SELECT * FROM JOB_HISTORY;

-- 대륙정보
SELECT * FROM REGIONS;
-- tab : tables / * : 모든

ROLLBACK;

COMMIT;
-----------------------------------------------------------
DESC LOCATIONS;

SELECT *
FROM LOCATIONS;

SELECT CITY, POSTAL_CODE
FROM LOCATIONS;


SELECT *
FROM EMPLOYEES;

-- 사원의 성, 이름, 월급, 입사일
SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY *12 AS "YEAR SALARY" ,(SALARY*12)-5000 SAL , HIRE_DATE 입사날짜
FROM EMPLOYEES;

-- 함수 호출
SELECT SUM(SALARY)/COUNT(EMPLOYEE_ID) , AVG(SALARY)   
FROM EMPLOYEES;

-- 중복제거 DISTINCT // SELECT절 안에서 하나만 사용가능, 두번이상 사용 불가 
SELECT DISTINCT DEPARTMENT_ID, EMPLOYEE_ID --, DISTINCT SALARY
FROM EMPLOYEES;


SELECT STATE_PROVINCE || ' 의 도시명은 ' || CITY 
FROM LOCATIONS;


-- WHERE
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;

-- 사원의 정보 중, 사원의 ID, 직급 JOB ID, 입사일, 월급
-- 월급이 15000이상인 사원만 출력
SELECT EMPLOYEE_ID, JOB_ID, HIRE_DATE, SALARY , DEPARTMENT_ID  
FROM EMPLOYEES
WHERE SALARY >= 8000 AND DEPARTMENT_ID =100;

-- error
SELECT EMPLOYEE_ID, JOB_ID, HIRE_DATE, SALARY , DEPARTMENT_ID  
FROM EMPLOYEES
WHERE SALARY > AVG(SALARY);


SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;

SELECT *
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;


-- 사원의 모든 정보를 가지고와서
-- 급여가 8000 이상 15000 이하
SELECT *
FROM EMPLOYEES
WHERE SALARY >=8000 AND SALARY <=15000; -- 한 column으로 사용할때

-- BETWEEN / between 이상 and 이하 -- 한 column으로 사용할때
SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 8000 AND 15000;

-- 사원의 모든 정보
-- 부서 번호가 60번 혹은 100번인 사원들
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60 OR DEPARTMENT_ID = 100;
-- IN ( , ) /// OR
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (60 , 100);

-- 사원의 모든 정보 이름이 'Austin' 
SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = 'Austin';

-- 사원의 모든 정보 2004 1월 1일 이후 입사한 사원
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE >= '2006/01/01'; -- 날짜 DATE YYYY-MM-DD / YYYY/MM/DD / YYYY,MM,DD 보통은 - 와 /로 구분

SELECT *
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%k%';

-- 사원의 급여가 높은 순 -> 낮은 순으로
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES
ORDER BY SALARY DESC, LAST_NAME ASC;
--ORDER BY 2 DESC ; -- SELECT 된 COLUMN 의 인덱스 번호로 내림차순, SELECT 된 column이 2개, '2'면 salary 컬럼이 내림차순으로 정렬

-- Last Name 기준으로 정렬, 오름차순
SELECT LAST_NAME, SALARY  
FROM EMPLOYEES
ORDER BY LAST_NAME ASC;

-- 사원의 모든 정보, 입사순
SELECT *
FROM EMPLOYEES
ORDER BY HIRE_DATE ASC;

--EX 1.
SELECT EMPLOYEE_ID , LAST_NAME , FIRST_NAME , SALARY , JOB_ID , HIRE_DATE , MANAGER_ID 
FROM EMPLOYEES;

--EX 2.
SELECT EMPLOYEE_ID, FIRST_NAME , LAST_NAME , SALARY , SALARY*12, 
SALARY*12 +100 AS "Increased Ann_Salary" , 
SALARY+100 AS "Increased Salary"
FROM EMPLOYEES;

--EX 3.
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 7000 AND 10000
--WHERE SALARY < 7000 OR SALARY > 10000
ORDER BY SALARY ASC;

--EX 4.
SELECT * 
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%e%' AND  LAST_NAME LIKE '%o%';

--EX 5.
SELECT LAST_NAME , FIRST_NAME , SALARY , JOB_ID , COMMISSION_PCT 
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
ORDER BY SALARY DESC , COMMISSION_PCT DESC;

SELECT * FROM DEPARTMENTS WHERE LOCATION_ID = 20;


SELECT *
FROM LOCATIONS  
WHERE STREET_ADDRESS LIKE '%ab%';

SELECT EMPLOYEE_ID , FIRST_NAME , LAST_NAME , JOB_ID , DEPARTMENT_ID , HIRE_DATE 
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;

SELECT *
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;




----
-- 100번 부서에 근무하는 사원들의 평균 급여와, 해당 부서에 급여가 제일 많은 사람과 적은 사람의 금액
SELECT AVG(SALARY), MAX(SALARY), MIN(SALARY) 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 100;

SELECT * FROM EMPLOYEES;
-- 부서별
-- 평균 급여, 큰 금액, 적은 금액
-- 평균 급여가 10000 이상 
SELECT DEPARTMENT_ID, AVG(SALARY), MAX(SALARY), MIN(SALARY) 
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY DEPARTMENT_ID 
HAVING AVG(SALARY)<10000 --그룹에 조건을 둘 때 HAVING 사용
ORDER BY AVG(SALARY) ASC;

-- 매니저별 사원수
SELECT MANAGER_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
-- WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID 
HAVING MANAGER_ID IS NOT NULL
ORDER BY MANAGER_ID ASC ;
--------------------------INSERT -----------------------------
-- 1. INSERT INTO 테이블명 (컬럼1, 컬럼2,...) values(값1,값2,...)
SELECT * FROM  REGIONS;
INSERT INTO REGIONS (REGION_ID, REGION_NAME)
VALUES (4, 'Test');
-- SQL Error [1] [23000]: ORA-00001: 무결성 제약 조건(HR.REG_ID_PK)에 위배됩니다 


INSERT INTO REGIONS (REGION_NAME, REGION_ID)
VALUES ('Test2', 6);

INSERT INTO REGIONS (REGION_ID, REGION_NAME)
VALUES (7, null);
-- 나중에 데이터 넣으려고 할때 null 입력 / 제약조건.. null을 넣으면 에러가 나는 경우가 있음 PK.

INSERT INTO REGIONS (REGION_ID)
VALUES (8);

-- 갯수를 맞춰야 함 error
--INSERT INTO REGIONS (REGION_ID, REGION_NAME)
--VALUES (9);

--INSERT INTO REGIONS (REGION_ID, REGION_NAME)
--VALUES (NULL,null);

INSERT INTO REGIONS 
VALUES (9, 'Test3');

INSERT INTO REGIONS 
VALUES (10, null);

-- error
--INSERT INTO REGIONS 
--VALUES (11);

ROLLBACK;

SELECT * FROM REGIONS;
---------------------- DELETE -----------------------
DELETE REGIONS WHERE REGION_ID = 5;
-- REGION_ID 7,8,10 지우는 방법 
DELETE REGIONS WHERE REGION_ID = 7 OR region_id = 8 OR region_id = 10;
DELETE REGIONS WHERE REGION_ID IN (7,8,10);
DELETE REGIONS WHERE REGION_NAME IS NULL; --REGION_NAME 이 셋다 NULL이라 NAME으로 지정하여 삭제
-- 데이터 값이 많을 때 NULL값을 지우는 경우에 유용함.!

DELETE REGIONS WHERE REGION_NAME LIKE '%Test%';

SELECT * FROM COUNTRIES;

INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('ZZ', 'Test', 2);

--INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
--VALUES ('ZZA', 'Test2', 2);

--INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
--VALUES ('ZA', 'Test2', 10);
--SQL Error [2291] [23000]: ORA-02291: 무결성 제약조건(HR.COUNTR_REG_FK)이 위배되었습니다- 부모 키가 없습니다
-- FK 참조해서 사용해라, 

SELECT * FROM REGIONS; 

--DELETE REGIONS WHERE REGION_ID =2;

SELECT * FROM DEPARTMENTS;
--PK : 중복x, NULL x
--FK : 참조된아이들이있음 맘대로 삭제ㄴㄴ

SELECT * FROM SEQ;

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)
VALUES (DEPARTMENTS_SEQ.NEXTVAL, 'Test', NULL, 1700);

ROLLBACK;
COMMIT;

-------------------------------- UPDATE -----------------------------------------
SELECT * FROM DEPARTMENTS;

UPDATE DEPARTMENTS SET MANAGER_ID = 200 WHERE DEPARTMENT_ID = 120;

UPDATE DEPARTMENTS SET DEPARTMENT_NAME = 'ITTest', MANAGER_ID = NULL
WHERE DEPARTMENT_ID =290;


---------------------------------- SUM -------------------------------------------
SELECT SALARY, COMMISSION_PCT  FROM EMPLOYEES;
--error SELECT SALARY, SUM(SALARY) FROM EMPLOYEES;
SELECT SUM(SALARY) FROM EMPLOYEES; 

SELECT SUM(SALARY),AVG(SALARY) FROM EMPLOYEES;
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES; 
SELECT SUM(COMMISSION_PCT), AVG(COMMISSION_PCT), COUNT(COMMISSION_PCT) FROM EMPLOYEES;

SELECT SUM(COMMISSION_PCT)/COUNT(EMPLOYEE_ID), AVG(COMMISSION_PCT)  FROM EMPLOYEES; 
SELECT COUNT(COMMISSION_PCT) FROM EMPLOYEES;

SELECT MAX(SALARY), MIN(SALARY) FROM EMPLOYEES; 

SELECT MAX(HIRE_DATE), MIN(HIRE_DATE) FROM EMPLOYEES;
SELECT MAX(LAST_NAME), MIN(LAST_NAME) FROM EMPLOYEES;
-- SELECT AVG(HIRE_DATE) FROM EMPLOYEES;

---------------------------------------2. 단일함수 --------------------------------
-- Null 함수
SELECT * FROM DEPARTMENTS;

SELECT  DEPARTMENT_NAME, NVL(MANAGER_ID, 200)
FROM DEPARTMENTS;

SELECT SUM(COMMISSION_PCT)/COUNT(EMPLOYEE_ID), AVG(COMMISSION_PCT) 
FROM EMPLOYEES;

SELECT SUM(COMMISSION_PCT)/COUNT(EMPLOYEE_ID), AVG(NVL(COMMISSION_PCT, 0))  
FROM EMPLOYEES;

SELECT DEPARTMENT_NAME , NVL2(MANAGER_ID, 100, 200)
FROM DEPARTMENTS;

-- 숫자 함수
SELECT ABS(-2.3) FROM DUAL; 
SELECT FLOOR(3.723) FROM DUAL; 
SELECT ROUND(3.723,1) FROM DUAL; 

-- 문자 함수
SELECT DEPARTMENT_ID , UPPER(DEPARTMENT_NAME), LOWER(DEPARTMENT_NAME), INITCAP(DEPARTMENT_NAME), LENGTH(DEPARTMENT_NAME), LENGTHB(DEPARTMENT_NAME), SUBSTR(DEPARTMENT_NAME,1,3) 
FROM DEPARTMENTS;

SELECT RPAD('abc',10,'*') A , LPAD('abc',10,'*') B FROM DUAL;
SELECT LPAD('abc',10,'*') FROM DUAL; 

-- 'myData'
--m*****
SELECT RPAD(SUBSTR('myData',1,1),LENGTH('myData'),'*') FROM DUAL;

SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID , RPAD(SUBSTR(FIRST_NAME,0,1),LENGTH(FIRST_NAME),'*') FROM EMPLOYEES;  

--------날짜함수
SELECT SYSDATE , SYSTIMESTAMP , CURRENT_DATE , CURRENT_TIMESTAMP FROM DUAL;

SELECT SYSDATE , SYSDATE+3, SYSDATE -2 FROM DUAL ;
SELECT ADD_MONTHS(SYSDATE,-1) FROM DUAL ; 

--사원들이 입사한 달 부터 현재까지 몇개월이 지났는지
SELECT HIRE_DATE, FLOOR(MONTHS_BETWEEN(SYSDATE , HIRE_DATE)) 
FROM EMPLOYEES;

SELECT NEXT_DAY(SYSDATE,'수') FROM DUAL;
SELECT NEXT_DAY(SYSDATE, 4) FROM DUAL;

SELECT LAST_DAY(SYSDATE) FROM DUAL;

-- To_CHAR
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY MM DD DAY') FROM DUAL; 
SELECT TO_CHAR(1234, '9,999,999') FROM DUAL ;

-- To_NUMBER
SELECT TO_NUMBER('123')*2 FROM DUAL ;
SELECT TO_NUMBER('1,234','9,999')*2 FROM DUAL ;
SELECT TO_NUMBER('1.23')*2 FROM DUAL ;

-- TO_DATE
SELECT TO_DATE('2022.3.12') FROM DUAL ;

-- LAST_NAME King 이 근무하는 부서명
SELECT DEPARTMENT_ID 
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

SELECT DEPARTMENT_NAME 
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 90;

--

SELECT DEPARTMENT_NAME 
FROM DEPARTMENTS
WHERE DEPARTMENT_ID =

(SELECT DEPARTMENT_ID 
FROM EMPLOYEES
WHERE LAST_NAME = 'Austin');

--king이 근무하는 부서가 있는 대륙은 어디?
SELECT  LOCATION_ID 
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 90;

SELECT COUNTRY_ID 
FROM LOCATIONS
WHERE LOCATION_ID = 1700;

SELECT REGION_ID 
FROM COUNTRIES
WHERE COUNTRY_ID = 'US';

SELECT REGION_NAME 
FROM REGIONS
WHERE REGION_ID =2;


SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = (
SELECT DEPARTMENT_ID
FROM EMPLOYEES
WHERE LAST_NAME = 'Austin')


--- 사원들의 정보 평균 급여보다 많이 받는 사원들의 정보
SELECT *
FROM EMPLOYEES
WHERE SALARY > ( 
	SELECT AVG(SALARY) 
	FROM EMPLOYEES);


--- first_name john의 manager의 first_name
SELECT FIRST_NAME 
FROM EMPLOYEES 
WHERE EMPLOYEE_ID  = 
		(	SELECT MANAGER_ID
			FROM EMPLOYEES
			WHERE FIRST_NAME = 'Lex'	);

-- 사원들 중에서 급여를 제일 많이 받는 사원과 
--같은 부서에 근무하는 사원들의 평균 급여
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (
	SELECT DEPARTMENT_ID  
	FROM EMPLOYEES
	WHERE SALARY =(
		SELECT MAX(SALARY) 
		FROM EMPLOYEES)
		);
		
-- 신입사원 이름, 가장 오래된 사원의 이름-------------------------
SELECT
	(
	SELECT FIRST_NAME 
	FROM EMPLOYEES
	WHERE HIRE_DATE = (
					SELECT MAX(HIRE_DATE)
					FROM EMPLOYEES))
					,
	(
	SELECT FIRST_NAME 
	FROM EMPLOYEES  
	WHERE HIRE_DATE = (
					SELECT MIN(HIRE_DATE)
					FROM EMPLOYEES))
FROM DUAL;
---------------------------------------------------------
SELECT *
FROM REGIONS;

SELECT * FROM REGIONS
INSERT INTO REGIONS (REGION_ID, REGION_NAME)
VALUES ((SELECT MAX(REGION_ID)+1 FROM REGIONS) , 'Mars');
-------------------------------------------------------------


SELECT A.SALARY *2 FROM
(SELECT LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES) A;



-- 다중행 서브쿼리 Multi-row---------------------
SELECT DEPARTMENT_NAME 
FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN ( -- = 같다라는 의미를 IN으로 바꿔서 
	(
		SELECT DEPARTMENT_ID 
		FROM EMPLOYEES
		WHERE LAST_NAME = 'King'
	)
);



-- 도시명 시에틀에 근무하는 사원들의 모든 정보
SELECT LOCATION_ID  --1700
FROM LOCATIONS
WHERE CITY = 'Seattle';

SELECT DEPARTMENT_ID 
FROM DEPARTMENTS
WHERE LOCATION_ID =1700;

SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10,30,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,290);

---Austin이 부서 대륙

SELECT DEPARTMENT_ID --60
FROM EMPLOYEES
WHERE LAST_NAME = 'Austin'

SELECT LOCATION_ID --1400
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = 60;

SELECT COUNTRY_ID 
FROM LOCATIONS
WHERE LOCATION_ID =1400;

SELECT REGION_ID --2
FROM COUNTRIES
WHERE COUNTRY_ID = 'US';

SELECT REGION_NAME 
FROM REGIONS
WHERE REGION_ID =(
	SELECT REGION_ID --2
	FROM COUNTRIES
	WHERE COUNTRY_ID =(
		SELECT COUNTRY_ID 
		FROM LOCATIONS
		WHERE LOCATION_ID = (
			SELECT LOCATION_ID 
			FROM DEPARTMENTS
			WHERE DEPARTMENT_ID = (
				SELECT DEPARTMENT_ID --60
				FROM EMPLOYEES
				WHERE LAST_NAME = 'Austin'
			)
		)
	)
); 

--------------------------서브쿼리 실습 ------------------------
--1.
SELECT *
FROM REGIONS
WHERE REGION_ID = (
		SELECT REGION_ID 
		FROM COUNTRIES
		WHERE COUNTRY_ID = (
			SELECT COUNTRY_ID 
			FROM LOCATIONS
			WHERE LOCATION_ID = (
			 	SELECT LOCATION_ID 
				FROM DEPARTMENTS 
				WHERE DEPARTMENT_ID = (
					SELECT DEPARTMENT_ID 
				FROM EMPLOYEES
				WHERE EMPLOYEE_ID =198
				)
			)));
				
--2. Last_name이 Khoo인 사람의 근무하는 부서명
		
SELECT DEPARTMENT_NAME 
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = (
		SELECT DEPARTMENT_ID 
		FROM EMPLOYEES 
		WHERE LAST_NAME ='Khoo'		
);
		
		
--3. 사원번호가 199번인 사원의 매니저가 근무하는 부서가 있는 나라명 출력
SELECT COUNTRY_NAME 
FROM COUNTRIES
WHERE COUNTRY_ID = (
			SELECT COUNTRY_ID 
			FROM LOCATIONS
			WHERE LOCATION_ID = (
				SELECT LOCATION_ID 
				FROM DEPARTMENTS
				WHERE DEPARTMENT_ID = (
					SELECT DEPARTMENT_ID 
					FROM EMPLOYEES
					WHERE EMPLOYEE_ID = (
						SELECT MANAGER_ID 
						FROM DEPARTMENTS
						WHERE DEPARTMENT_ID = (
							SELECT DEPARTMENT_ID 
							FROM EMPLOYEES
							WHERE EMPLOYEE_ID =199)
						))));	

--4. 사원들 중에서 월급이 가장 적은 사원이 근무하는 도시명
					
SELECT  CITY 
FROM LOCATIONS 
WHERE LOCATION_ID = (

			SELECT LOCATION_ID 
			FROM DEPARTMENTS
			WHERE DEPARTMENT_ID =(

				SELECT DEPARTMENT_ID 
				FROM EMPLOYEES 
				WHERE EMPLOYEE_ID =(

					SELECT EMPLOYEE_ID 
					FROM EMPLOYEES
					WHERE SALARY = (SELECT MIN(SALARY)
									FROM EMPLOYEES)
									)));
								
								

--5. 부서명이 IT인 부서에 근무하는 사원들의 모든 정보 출력
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID =(
			SELECT DEPARTMENT_ID  
			FROM DEPARTMENTS
			WHERE DEPARTMENT_NAME = 'IT');

--6. Employees 테이블에서 LAST_NAME이 Greenberg 사원보다 급여를 더 많이 받고 있는 사원정보들 출력
		
SELECT *
FROM EMPLOYEES
WHERE SALARY > ALL (
		SELECT SALARY 
		FROM EMPLOYEES  
		WHERE LAST_NAME = 'Greenberg');
			
-- 7. 부서별 최소급여를 받고 있는 사원의 정보출력
	
SELECT *
FROM EMPLOYEES
WHERE (DEPARTMENT_ID ,SALARY) IN (
		SELECT DEPARTMENT_ID , MIN(SALARY)
		FROM EMPLOYEES 
		GROUP BY DEPARTMENT_ID
	) ;

SELECT *
FROM DEPARTMENTS

-- 8. 도시이름이 'S'로 시작하는 지역에 근무하는 사원의 정보 출력

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (
		SELECT EMPLOYEE_ID  
		FROM DEPARTMENTS 
		WHERE DEPARTMENT_ID = (
			SELECT  DEPARTMENT_ID 
			FROM LOCATIONS 
			WHERE LOCATION_ID = (
				SELECT LOCATION_ID  
				FROM LOCATIONS 
				WHERE CITY LIKE 'S%')));

COMMIT;	