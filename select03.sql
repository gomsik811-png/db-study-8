/*------------------------------------------*/
집합연산자
합집합 UNION       (합치면서 중복제거)
      UNION ALL   (전부다 합치기 중보제거x)
교집합 INTERSECT   
차집합 MINUS

* 제약조건
1. 컬럼 갯수 동일
2. 컬럼 데이터타입 동일
3. 컬럼명은 달라도 상관없음


--학생 101학과 학생 + 102학과 학생 정보 총합 조회
select *
from student
where deptno1 in (101, 102);

select 
    *
from student
where deptno1 = 101
union all
select 
    *
from student
where deptno1 = 102;


--학생들 데이터
-- 101번 학과 학생 + 102학과 학생 중 키 170 넘는 학생
select 
*
from student
where deptno1 = 101
union all
select 
*
from student
where deptno1 = 102 and height > 170;

select 
    *
from student
where deptno1 = 101 or (deptno1 = 102 and height > 170);

-- 101번 학과에 속한 학생들 + 101번 학과에 재직중인 교수들 한번에 조회
select
    studno,
    name,
    deptno1
from student            --12개
where deptno1 = 101
union all
select
    profno,
    name,
    deptno
from  professor         --10개
where deptno = 101;


select
    studno 식별번호,
    name 이름,
    deptno1 학과
from student            --12개
where deptno1 = 101
union all
select
    profno,
    name,
    deptno
from  professor         --10개
where deptno = 101;



select
    studno 식별번호,
    name 이름,
    deptno1 학과
from student            --12개
where deptno1 = 101
union all
select
    profno,
    name,
    deptno
from  professor         --10개
where deptno = 101
order by 2;
--order by 이름;
--order by name;


select
    studno 식별번호,
    name 이름,
    deptno1 학과,
    tel 연란처
from student            --12개
where deptno1 = 101
union all
select
    profno,
    name,
    deptno,
    null
from  professor         --10개
where deptno = 101
order by 2;

--교집합
select 
    *
from student
where deptno1 = 101
intersect
select 
    *
from student
where deptno2 = 201;

--where deptno1 = 101 and deptno2 = 201


--차집합
select 
    *
from emp
where job = 'SALESMAN' and comm > 0
minus
--차집합 이전 수상자
select 
    *
from emp
where hiredate < '1982-01-01';

 where (job = 'SALESMAN' and comm > 0) and (hiredate >= '1982-01-01')
 where (job = 'SALESMAN' and comm > 0) and not (hiredate < '1982-01-01')


