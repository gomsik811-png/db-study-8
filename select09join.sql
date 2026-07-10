/*-------------------------------------------------*/
JOIN 조인

--JOIN 기준 -> 어떤 것 (컬럼/값)을 기준으로 테이블 데이터를 합쳐서(연결) 조회

select * from emp;  --deptno 컬럼 부서번호
select * from dept; -- 부서정보 테이블 deptno 컬럼(식별자)


select *
from emp ,dept 
where emp.deptno = dept.deptno; 


--select *
--from emp A, dept B
select
    empno,
    ename,
    dname,
    loc,
    e.deptno,
    d.deptno
from emp e,dept d
where e.deptno = d.deptno; --join 기준



select
    empno,
    ename,
    dname,
    loc,
    e.deptno,
    d.deptno
from emp e INNER JOIN dept d
ON e.deptno = d.deptno; -- inner join으로 사용시 where 대신 on이 들어감.

-- emp, dopt 조인 + 부서번호 20, 30 번 부서만 조회


-- 오라클 방식
--select *
select e.empno, e.ename,d.dname,d.loc
from emp e, dept d
where e.deptno = d.deptno 
and e.deptno in(20,30);

--ANSIJOIN 쿼리

select e.empno, e.ename,d.dname,d.loc, e.deptno, d.deptno
from emp e inner join dept d
on e.deptno = d.deptno 
where e.deptno in(20,30);

/*-------------------*/
select *
from emp e , dept d; -- 조인 조건 누락 -> 카티션 곱


-------------------------------------

select * from student;      --profno 교수번호 컬럼
select * from professor;    --profno 교수번호 컬럼


select s.name 학생명, p.name 교수명, s.studno, p.profno, p.email
--select *
from student s, professor p
where s.profno = p.profno;


select s.name 학생명, p.name 교수명, s.studno, p.profno, p.email
--select *
from student s inner join professor p
on s.profno = p.profno;



/*------------------------------------*/

INNER JOIN VS OUTER JOIN


select s.name 학생명, p.name 교수명, s.studno, p.profno, p.email
from student s, professor p
where s.profno = p.profno;
--학생X교수 -> 15개

select count(*) from student;       --20명
select count(*) from professor;     --16명

-- INNER JOIN 수행 -> 조인기중에 따라서 합침 ( profno 가 같은가?) -> profno null이면 비교불가 -> 제외

select *
from student s, professor p
--where s. profno = p.profno;
where s. profno = p.profno(+);
--where p.profno(+)= s. profno;
--where s.profno(+) = p.profno;
--where p.profno = s.profno(+);


select s.studno, s.name,nvl2(s.profno,'지도교수배정완료','지도교수배정요망') 배정여부,   --  DECODE  CASE WHEN
s.profno,p.profno, p.name
--select *
from student s LEFT OUTER JOIN professor p
--from  professor p LEFT OUTER JOIN student s
--from student s RIGHT OUTER JOIN professor p
--from  professor p RIGHT OUTER JOIN student s
ON s. profno = p.profno;



/*-----------------------------*/
JOIN 결과 갯수

--INNER 15개
select COUNT(*)
from student s, professor p
where s.profno = p.profno;
-->> 15개 학생 20 교수16 학생에 교수배정 NULL 5개 -> 제외
                --이너조인으로 연결 가능한 대상 15개 -> 경과 15개


-- OUTER
select COUNT(*)
from student s, professor p
where s.profno = p.profno(+);
-->>20개     학생기준 OUTERJOIN
            --학생기준 -> NULL 이어도 유지 -> 결과 20개


select *
--select count(*)
from professor p,student s 
where p.profno = s.profno(+);
-->> 22개        교수갯수 16개 -> 학생 20개 학생 null





-- 지도 학생이 없는 교수의 수는?
select count(*)
--select *
from professor p,student s 
where p.profno = s.profno(+)
and s.studno is null;



