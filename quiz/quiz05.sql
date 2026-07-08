

select
    studno 번호,
    name 이름,
    id 아이디
from student
where height between 165 and 175
union all
select
    profno,
    name,
    id
from professor
where deptno in(101,102,103,201) and bonus is null;



select
    '이름:'||name 이름,
    '아이디:'||id 아이디,
    '주민번호:'||substr(jumin,1,6)||'-'||substr(jumin,7,13) 주민번호    
from student;

/*-----------------------------퀴즈 경계선-------------------------------------*/








    
