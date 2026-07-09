/*----------------------------------------------------*/
기타 복수행 함수

집계

--emp 부서와 직업별 평균 급여와 사원수
select 
    deptno,
    job,
    avg(sal) 평균급여,
    count(*) 사원수
from emp
group by deptno, job;

--emp 부서별 평균 급여와 사원수
select 
    deptno,
    avg(sal) 평균급여,
    count(*) 사원수
from emp
group by deptno;

--emp 전체 사원의 평균 급여와 사원수

select
    avg(sal),
    count(*)
from emp;

--위 2개의 집계 내역을 하나로 통합
select 
    deptno,
    job,
    avg(sal) 평균급여,
    count(*) 사원수
from emp
group by deptno, job
union all
select 
    deptno,
    null,
    avg(sal) 평균급여,
    count(*) 사원수
from emp
group by deptno
union all
select
    null,
    null,
    avg(sal),
    count(*)
from emp
order by deptno,2
;

*** ROLLUP

select 
    deptno,
    job,
    avg(sal) 평균급여,
    count(*) 사원수
from emp
--group by rollup(deptno,job);
--group by rollup(job,deptno);
group by rollup( (deptno,job) );

group by rollup(deptno,job)
1) group by deptno, job 그룹화 데이터 집계
2) group by deptno, 그룹화 데이터 집계
3) () 그룹화 데이터 집계 -> 전체집계

group by ROLLUP(job, deptno)
group by job, deptno
group by job
()

group by rollup( (deptno,job) )
group by (deptno,job) 
()

1)group by rollup(empno,deptno,job)
2)empno,deptno,job
3)empno,deptno
4)empno
5)()
;

select 
    deptno,
    job,
    avg(sal) 평균급여,
    count(*) 사원수
from emp
group by deptno, job;

select 
    deptno,
    job,
    avg(sal) 평균급여,
    count(*) 사원수
from emp
group by cube(deptno, job);

ROLLUP
1) deptno, job
2) deptno
3) ()

CUBE
1)deptno, job
2)deptno
3)        job
4)  ()

/*------------------------------------------*/

순위 RANK() OVER (order by 정렬기준대상)
그룹단위 순위 RANK() OVER (partition by 그룹기준 order by 정렬기준대상)

select
    ename,
    sal
from emp
order by sal;

select
    ename,
    sal,
    rank() over (order by sal) 급여순위,
    rank() over (order by sal desc) 높은급여순위,
    dense_rank() over (order by sal desc) 높은급여순위
from emp
;

select
    name,
    height,
    rank() over (order by height desc) 키순위,
    dense_rank() over (order by height desc) 키순위,
    grade,
    height,
    rank() over (partition by grade order by height desc) 학년별키순위
from student
order by grade;







