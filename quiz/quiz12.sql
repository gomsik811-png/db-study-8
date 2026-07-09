select *
from student;

select 
    name,
    jumin,
    birthday,
    ceil(substr(jumin,3,2)/3)||'분기' 분기,
    CEIL(to_number(to_char(birthday,'mm'))/3)||'분기' 뷴기
from student;







select *
from emp;

select
    empno,
    ename,
    sal,
    case 
        when sal BETWEEN 1 AND 1000 then 'level 1'
        when sal<=2000 then 'level 2'
        when sal<=3000 then 'level 3'
        when sal<=4000 then 'level 4'
        else '사장님'
    end 급여등급
from emp;

    