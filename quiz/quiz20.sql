--1. professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의
--교수번호와 이름, 학과명을 출력하세요
--(입사일 순으로 오름차순 정렬)

select * from professor;
select * from department;


select p.name, a.dname
from professor p,
(
    select s.deptno,
           d.dname,
           min(s.hiredate) hiredate
    from professor s, department d
    where s.deptno = d.deptno
    group by s.deptno, d.dname
) a
where p.deptno = a.deptno
and p.hiredate = a.hiredate
order by p.hiredate;


--2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
--(연봉순으로 오름차순 정렬)

select * from emp2;

select e.name, d.position, d.max_pay
from
(select position, max(pay) max_pay
from emp2
where position is not null
group by position) d, emp2 e
where d.max_pay = e.pay
order by max_pay;



