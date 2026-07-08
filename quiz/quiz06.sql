select *
from emp;

select
    ename,
    replace(ename,substr(ename,3,2),'--') replace
from emp
where deptno = 20;

select *
from student;

select
    name,
    substr(jumin,1,6)||'-/-/-' 주민뒷자리숨김
from student
where deptno1=101;

select
    name,
    tel,
    substr(tel,1,4)||'***'||substr(tel,8,5) REPALCE
from student
where deptno1 = 102;

select
    name,
    tel,
    replace(tel,substr(tel,9,4),'****') relpace
from student
where deptno1 = 101;