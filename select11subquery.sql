/*********************************----------------------*/
서브쿼리 (sub-Query)

SELECT  (쿼리: 스칼라 서브쿼리)
FROM    (쿼리: 인라인 뷰)
WHERE   (쿼리: 서브쿼리)
;

SELECT * from emp;

20번 부서 사람들만 조회

select * from emp
where  deptno = '20';

사번이 7844인 사람과 같은 부서 사람들 조회

select * from emp
where deptno = (select deptno from emp
                where empno = 7844);


select deptno from emp
where empno = 7844;



----------
select * from emp2;
select * from dept2;

포항 사무실에서 일하는 직원목록 조회
select * from dept2
where area = 'Pohang Main Office';


-- JOIN
select *
from emp2 e, dept2 d
where e.deptno = d.dcode
and d.area = 'Pohang Main Office';

--서브쿼리
select *
from emp2
where deptno in (select dcode
                from dept2
                where area = 'Pohang Main Office');

in('0001','1003','1006','1--7')


포항 사무실에서 일하는 직원목록 조회
select *
from emp2
where deptno in (select dcode
                from dept2
                where area = 'Pohang Main Office'
                 and dcode <> '0001');
                 
        
select *
from emp2
where deptno in (select dcode
                from dept2
                where area = 'Pohang Main Office')
and deptno <> '0001';


-----------------
select *
from emp2
where deptno in (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = deptno);

select *
from emp2
where EXISTS (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = deptno);
                
select *
from emp2 e2
where EXISTS (select dcode
                from dept2
                where area = 'Pohang Main Office'
                and dcode = e2.deptno);

--------------------------------------
학생 student

학번 9513 학생보다 키 작은 학생들 조회

select *from student
where height <(select height
from student
where studno = 9411);

> 2학년 학생들 기준 제일 많은 몸무게보다 (2학년 학생중 제일 무거운 학생의 몸무게) 보다
  전체학생들 중에서 더 많은 몸무게 나가는 학생 목록 조회

select * 
from student
where weight > (select max(weight)
                from student
                where grade = 2);
                
                

------ 각 학년별로 가장 큰 몸무게
select *
from student
where weight > any (select max(weight)
from student
group by grade);

select *
from student
where weight < all (select max(weight)
from student
group by grade);


    ANY ALL
    
    < ANY 83          (81 82  83  58)
    < ALL 58          (81 82  83  58)
    > ANY 58
    > ALL 83

>> 단일행 비교   =   IN
>> 다중행 비교 IN, NOT IN, >ANY ALL
>> 다중컬럼 비교  (컬럼수를 맞춰서 비교)

---- 각 학년별로 가장 큰 몸무게

-- 학년, 몸무게
select *
from student
where weight in (       --몸무게만 비교하면, 학년별 최대 몸무게 학생 추출에 문제 발생 가능성 있음
                select max(weight)
                from student
                group by grade);



select *
from student
where (grade, weight) in (select grade, max(weight)
                        from student
                        group by grade);

--emp2 기준   전체 평균급여보다 많이 받는 직원 조회
select *
from emp2
where pay > (select avg(pay)
            from emp2);
            
            
            
            
            
            
            
            
--emp2 기준   각자, 자신과 같은 직급(position)의 편균 급여보다 많이 받는 직원 조회

select *
from emp2;

select *
from emp2 a
where pay > (select avg(pay)
            from emp2 b
            where b.position = a.position);

select avg(pay)
        from emp2 b
        where b.position = 'Section head';
        
-----emp2 기준    자신과 같은 고용형태(emp_type)의 평균 급여보다 적게 받는 직원목록 조회.

select *
from emp2 a
where pay < ( --emptype 같은 평균급여
            select avg(pay)
            from emp2 b
            where b.emp_type = a.emp_type);



/*************************************************/
select * from emp2;
select * from dept2;

사원이름 부서번호 부서이름

--join

select 
    e.name,e.deptno,d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;

--subquery
select 
    e.name, 
    e.deptno,
    (select d.dname
    from dept2 d
    where d.dcode = e.deptno) dname
from emp2 e;

select 
    name, 
    deptno,
    (select dname
    from dept2
    where dcode = deptno) dname
from emp2;


select d.dname
from dept2 d
where d.dcode = '1007';


select * from panmae;
select * from product;



-- join
select
    a.p_date,
    a.p_code,
    b.p_name
from panmae a, product b
where a.p_code = b.p_code;





--subquery
select 
    a.p_date,
    a.p_code,
    (select
        b.p_name
        from product b
        where b.p_code =a.p_code) 상품명
from panmae a;

select p_code
from product
where p_code = 102;

/*************************************************/

select job, mgr, sal, comm, deptno
from emp;


select *    -- from 절에 속해있는 select 결과를 테이블(뷰)로 간주
from(
    select empno, ename, job
    from emp);


select empno, ename, job    -- from 절에 속해있는 select 결과를 테이블(뷰)로 간주
from(
    select empno, ename, job
    from emp);


--select empno, ename, job 
select enum, emp_name, jjb
from(
    select --컬럼 별칭을 설정하면 외부에서 조회시 기본 컬럼명으로 인식
    empno enum, 
    ename emp_name, 
    job jjb
    from emp);
  
  
select *  
from (  
select e.empno, e.name, e.deptno, d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode);

-----emp2 기준    자신과 같은 고용형태(emp_type)의 평균 급여보다 적게 받는 직원목록 조회.

--select avg(pay) --함수로 인식되서 컬럼선택 불가
select avg_pay
from (
    select emp_type, avg(pay) avg_pay
    from emp2
    group by emp_type
    );

select *
from 
    emp2 a,(
    select emp_type, trunc(avg(pay)) avg_pay
    from emp2
    group by emp_type
    ) b
where a.emp_type = b.emp_type
and a.pay < b.avg_pay;






