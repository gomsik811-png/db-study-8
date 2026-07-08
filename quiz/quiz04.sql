select *
from student;

select
    name 이름,
    substr(birthday,1,2) 년도,
    substr(birthday,4,2) 월,
    substr(birthday,7,2) 일,
    substr(jumin,1,2) 년도,
    substr(jumin,3,2) 월,
    substr(jumin,5,2) 일
from student;


select *
from student;

select
    name,
    tel,
    instr(tel,')') 괄호위치
from student
where deptno1 = 201;


select
    name,
    tel,
    instr(tel,3) 첫3위치
from student
where deptno1 = 101;


select
    name,
    tel,
    replace(substr(tel,1,instr(tel,')')),')','') 지역번호
    --substr(tel,1,instr(tel,')')-1)
from student
where deptno1 = 201;



  