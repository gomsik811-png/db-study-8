

select *
from emp2
where (to_char(birthday,'yy')) between '70' and  '79'; 

select
    empno 사번,
    name 이름,
    birthday 생일,
    hobby 취미,
    pay 급여,
    (pay*1.5) 성과급,
    rpad(emp_type,instr(emp_type,'t')+1)||'family'  직원분류,
    replace(emp_type,'employee','family') 직원분류2,
    tel,
    case
        when pay between 35000001 and 45000000 then '하'
        when pay between 45000001 and 60000000 then '중'
        when pay >=60000000 then '상'
        else '화이팅'
    end 급여수준
        
from emp2
where (to_char(birthday,'yy')) between '70' and  '79' and substr(tel,1,3) in('02)','031');

