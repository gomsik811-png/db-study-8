select *
from dept;

select 
    deptno as "부서번호",
    dname  "부서이름",
    loc 위치
from dept;

select *
from professor;

select 
    name ||'('|| id ||')' 교수정보,
    position,
    hiredate 업사일자,
    email 이메일
from professor;
    