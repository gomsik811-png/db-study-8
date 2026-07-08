select
    empno,
    ename,
    to_char(sal*12+comm,'999,999,999') SALATY
from emp
where sal = 1600;

select *
from emp;

select
    empno,
    ename,
    to_char(hiredate,'yyyy-mm-dd') hiredate,
    to_char(sal*12+comm,'999,9$9,999') SAL,
    to_char((sal*12+comm)*1.15,'9$9,999,999') "15%인상"
from emp
--where to_char(hiredate,'mm') in(02,09);
where comm is not null;
    