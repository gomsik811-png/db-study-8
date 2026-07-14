select * from student;
select * from department;

select s.name STU_NAME, deptno1, d.dname DEPT_NAME
from student s, department d
where s.deptno1 = d.deptno
order by deptno1;

select * from emp2;
select * from p_grade;

select 
    e.name , 
    e.position,
    to_char(e.pay,'999,999,999,999') pay,
    to_char(p.s_pay,'999,999,999') "LOW PAY",
    to_char(p.e_pay,'999,999,999')"HIGH PAY"
from emp2 e, p_grade p
where e.position = p.position(+)
and e.position is not null
order by e.pay;



select 
    e.name 이름,
    TRUNC((TO_DATE('2010-05-30', 'YYYY-MM-DD') - e.birthday) / 365+1)
    + CASE
        WHEN TO_CHAR(e.birthday, 'MMDD') >= '0530' THEN +1
        ELSE 0
      END AS 나이,
      e.position 지금포지션,
      p.position 그나이때에맞는포지션
from emp2 e left outer join p_grade p
on (
    TRUNC((TO_DATE('2010-05-30', 'YYYY-MM-DD') - e.birthday) / 365 + 1 )
    + CASE
        WHEN TO_CHAR(e.birthday, 'MMDD') >= '0530' THEN 1
        ELSE 0
    END) BETWEEN p.s_age AND p.e_age
order by e.birthday desc;

select * from customer;
select * from gift;

SELECT
    c.gname,
    c.point,
    g.gname
FROM customer c
JOIN gift g
ON c.point >= g.g_start
WHERE g.gname = 'Notebook';

select *
from professor;

select 
    a.profno,
    a.name, 
    a.hiredate,
    count(b.profno)
from professor a left outer join professor b
on a.hiredate > b.hiredate
group by a.profno, a.name, a.hiredate
order by count(b.profno);
----------------------------------------------------------------------------------------------------
1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여
학생이름, 1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.

select *
from student;
select *
from department;

select s.name, s.deptno1, d.dname
from student s, department d
where s.deptno1 = d.deptno; --INNER JOIN



2. emp2 테이블과 p_grade 테이블을 조회하여
현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
해당 직급의 연봉의 하한금액과 상한 금액을
아래 결과 화면과 같이 출력하세요.

select * from emp2;
select * from p_grade;


select * from emp2
where position is not null;

select
e.name,
e.position,
TO_CHAR(e.pay, '999,999,999') pay,
TO_CHAR(p.s_pay, '999,999,999') s_pay,
TO_CHAR(p.e_pay, '999,999,999') e_pay
from emp2 e, p_grade p
where e.position is not null
--and e.position = p.position; --INNER JOIN
and e.position = p.position(+); --OUTER JOIN


from emp2 e LEFT OUTER JOIN p_grade p
ON e.position = p.position; --OUTER JOIN



3. Emp2 테이블과 p_grade 테이블을 조회하여
사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.

select * from Emp2;
select * from p_grade;

--심플 한국나이
select
--birthday,
e.name,
2010 - TO_CHAR(birthday, 'YYYY') + 1 한국나이,
e.position 지금포지션,
p.position 그나이에맞는포지션
--p.*
from Emp2 e, p_grade p
--where 나이 BETWEEN p.s_age AND p.e_age;
where (2010 - TO_CHAR(birthday, 'YYYY') + 1) BETWEEN p.s_age AND p.e_age;

--조인 조건 나이 s_age e_age 사이포함

--만나이
SELECT
birthday,
TO_DATE('2010-05-30'),
TO_DATE('2010-05-30') - birthday 일단위계산,
(TO_DATE('2010-05-30') - birthday)/365,
TRUNC((TO_DATE('2010-05-30') - birthday)/365) 일단위계산나이,
MONTHS_BETWEEN(TO_DATE('2010-05-30'), birthday) 월단위차이,
MONTHS_BETWEEN(TO_DATE('2010-05-30'), birthday)/12 월단위차이계산,
TRUNC(MONTHS_BETWEEN(TO_DATE('2010-05-30'), birthday)/12) 월단위차이계산나이
from Emp2;



4 . customer 테이블과 gift 테이블을 Join하여
고객이 자기 포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때
Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.

select * from customer;
select * from gift;


select
c.gname, c.point, g.gname
--, g.*
from customer c, gift g
where c.point BETWEEN g.g_start AND g.g_end
--AND g.gname = 'Notebook';
AND g.gno = 7;


select
c.gname, c.point, g.gname
from customer c, gift g
where c.point >= g.g_start
AND g.gno = 7 --노트북
order by c.gno, g.gno;

select
c.gname, c.point, 'Notebook' -- g.gname
--,g.*
from customer c, gift g
where c.point BETWEEN g.g_start AND g.g_end
AND g.gno >= 7;

-- 조건 ? 참 : (조건 ? (조건 ? 참 : 거짓) : 거짓)

쿼리안에 쿼리 -> 서브쿼리

select ( select from where )
from ( select from where )
where ( select from where )
( select from where )
;

select *
from customer
where point >= (select g_start
from gift
where gno = 7);

select g_start
from gift
where gno = 7;






5. professor 테이블에서
교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요.
단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

select *
from professor;

--85/09/18
select COUNT(*)
from professor
where hiredate < '85/09/18';

--select *
select
p1.profno, p1.name, p1.hiredate,
p2.profno, p2.name, p2.hiredate
from professor p1, professor p2
where p1.hiredate > p2.hiredate;

select
p1.profno, p1.name, p1.hiredate,
p2.profno, p2.name, p2.hiredate
from professor p1, professor p2
where p1.hiredate > p2.hiredate(+);


select
p1.profno, p1.name, p1.hiredate,
COUNT(p2.profno) count
--COUNT(*) count
from professor p1, professor p2
--where p1.hiredate > p2.hiredate --INNER JOIN 조인조건에 맞는게 없으면 제외
where p1.hiredate > p2.hiredate(+) --제일 먼저 입사한 머피가 사라지지 않도록 OUTER
group by p1.profno, p1.name, p1.hiredate
order by 4;
--order by count;

--순위 입사일자 빠른거 기준으로 순위 RANK

SELECT
profno, name, hiredate,
RANK() OVER (order by hiredate) - 1 AS "COUNT"
from professor;


6. emp 테이블에서 사원번호,
사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요.
단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.

select *
from emp;

select e1.empno, e1.ename, e1.hiredate, COUNT(e2.empno) COUNT
from emp e1, emp e2
where e1.hiredate > e2.hiredate(+) --OUTER JOIN
group by e1.empno, e1.ename, e1.hiredate
order by e1.hiredate
;

select empno, ename, hiredate,
RANK() OVER (order by hiredate)-1 COUNT
from emp;
