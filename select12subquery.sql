/**------------------------------------------**/
서브쿼리...

ROWNUM 활용


select 
    rownum,
    ceil(rownum/3),
    studno,
    name
from student;

select rownum, rn, studno, name, height
    from(
        select 
            rownum rn,
            ceil(rownum/3),
            studno,
            name,
            height
        from student
    order by height);
    
    
    
select *
from student
where rownum <= 5; -- 그냥 조회 결과 5명

--키큰 사람 5명 조회

select *
from student
where rownum <= 5           --기존배정된 rownum 으로 인식 -> 정렬 이후 rownum 과 다름
order by height desc;


select rownum, s.*
from student s;


select rownum, s.*
from student s
order by height desc;

select rownum, studno, name, height
from(
select *
from student s
order by height desc
    )
where rownum <=5;


--팀 번호로 조회

select
    rownum,
    ceil(rownum/3),
    studno,
    name
from student
where ceil(rownum/3) = 3; --인식 제대로안됨

select *
from
(select
    rownum rn,
    ceil(rownum/3) team,
    studno,
    name
from student
)
where team = 3;


/*-------------------------------*/
group by 집계 -> subquery,    join

부서별 최대급여

select deptno, max(sal), ename --집계결과 + 일반 컬럼 값 동시에 표현하기 힘듬
from emp
group by deptno, ename; --집계기준으로 활용여부 -> 목적에 맞는 구룹화가 아님



select deptno, max(sal)
from emp
group by deptno;


--직원 테이블 조회 데이터 옆에 해당 부서의 최대 급여 표시
select *
from emp a, (select deptno, max(sal) max_sal
                from emp
                group by deptno) b
where a.deptno = b.deptno;

-- 부서별 최대급여 + 부서명
select deptno, max(sal)
from emp
group by deptno;



--select *
select e.deptno, d.dname, e.max_sal
from dept d, (select deptno, max(sal) max_sal
                    from emp
                    group by deptno) e
where d.deptno = e.deptno;



select deptno, max(sal), (select dname from dept where deptno = e.deptno)
from emp e
group by deptno;

select deptno, max_sal,(select dname from dept where deptno = e.deptno)
from
    (select deptno, max(sal) max_sal
                from emp
                group by deptno) e;
    
    
 
select deptno, dname, max(sal)   
from(            
select e.deptno, e.sal, d.dname
from emp e, dept d
where e.deptno = d.deptno
)
group by deptno, dname;


















