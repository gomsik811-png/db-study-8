select *
from professor;

select
    profno,
    name,
    pay,
    bonus,
    to_char(pay*12 + nvl(bonus,0),'999,999,999') total,
    pay*12 + nvl2(bonus,bonus,0) total2,
from professor
where deptno = 201;

select
    empno,
    ename,
    nvl2(comm,comm,null) nvl2 , 
    nvl2(comm,'exist',null)jo
from emp
where deptno = 30;


select *
from emp;
    