/* -------------------------------------------- */
1. 조회하기 SELECT

SELECT 조회대상(컬럼명) FROM 테이블명;
조회대상 * : 전체컬럼 ALL

테이블 구조 확인 (Describe)
DESC 테이블명;
desc emp;

DESC DEPT;
select * from dept;
SELECT * FROM DEPT;

SELECT * FROM FRUIT; -- FRUIT 테이블의 모든 컬럼 데이터 조회
SELECT * FROM LOAN;
SELECT * FROM PRODUCT; --PRODUCT 테이블의 모든 컬럼 데이터 조회

SELECT * FROM emp;
select job from emp;
select job, hiredate, mgr from emp;

--가독성
select
    job,
    hiredate,
    mgr
from emp;

select * from emp;

select *
from emp;

/*--------------------------------*/
-- 컬럼명 별도 지정 (별칭 지정)
SELECT 
    컬럼명 AS "컬럼별칭",
    컬럼명 "컬럼별칭",
    컬럼명 컬럼별칭
FROM 테이블명;

SELECT
    EMPNO AS "사원 번호",
    ENAME "사원명",
    JOB 직업,
    SAL "급여 데이터"
FROM EMP;

select
    empno as "고기", 
    empno as "empnumber", 
    empno as "employeeno"
from emp;


/****************************/
-- 조회수데이터 리터럴 값 활용

select '문자', 123 from emp;
select '문자', 123, empno from emp;

select '문자', 123 from dept;
select * from dept;

select '문자', 123 from dual;
select * from dual;

select '문자확인' as "문자컬럼별칭",
        123+234-33 as "숫자연산결과"
from dual;

select dname, loc, '문자안녕', 12345 from dept;
select '문자''작은따옴표' from dual;
select q'[이 안에다가 문자를 '작은"큰 이렇게]' from dual;
--- q'{문자작성}'


/************************************/
-- 문자 이어 붙이기   ||

select '문자' || '이어붙이기' from dual;
select * from dept;
select deptno, dname from dept;
select deptno || dname from dept;
select 
    '부서번호 :' || deptno as "부서번호",
    deptno,
    '부서번호+500 = ' || ( deptno + 500 ) "부서번호더하기500"
from dept;


/*************************************/
-- DISTINCT 중복제거
SELECT * FROM EMP;
select job from emp;
select DISTINCT job from emp;
select DISTINCT(job) from emp;

select DISTINCT job, deptno from emp;










