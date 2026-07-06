select * from student;

--문제 1
select 
    name || q'['s ID:]'||
    id  || q'[, WEIGHT is ]'||WEIGHT||q'[kg]' as "ID AND WEIGHT(무개)"
    from student;
    
    
--문제 2    
select 
    ENAME|| '('|| JOB || '),' ||
    ename ||q'[']' || job ||q'[']'  as "NAME AND JOB"
from emp;
    
--select * from emp;
    
        
    
-- 문제 3   
 
--select * from emp;

select 
    ename||q'['s sal is]' ||'$'||sal as "Name and Sal"
from emp;