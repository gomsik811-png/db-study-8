select *
from professor;

select 
    deptno,
    name,
    decode(name,'Audie Murphy','BEST!',null) DECODE
from professor;



select
    deptno,
    name,
    DECODE(name,'Audie Murphy', 'BEST!',DECODE(deptno,101, 'GOOD!',NULL))  비고,
    CASE 
        WHEN name = 'Audie Murphy' THEN 'BEST!'
        WHEN deptno = 101 THEN 'GOOD!'
        ELSE null
    END AS "비고"
from professor;

select
    deptno,
    name,
    decode(name,'Audie Murphy','BEST!',DECODE(deptno,101,'GOOD!','N/A')) AS 오리고기,
    CASE 
        WHEN name = 'Audie Murphy' THEN 'BEST!'
        WHEN deptno = 101 THEN 'GOOD!'
        ELSE 'N/A'
    END AS "비고"
from professor;



select *
from student;

select 
    name,
    jumin,
    case
        when substr(jumin,7,1) = 1 then '남자'
        else '여자'
    end 성별,
    decode(substr(jumin,7,1),'1','남자','여자') 디꼬두 
from student
where deptno1 = 101;

select 
    name,
    tel,
    decode(substr(tel,1,3),'02)','SEOUL','031','GYEONGGI','051','BUSAN','052','ULSAN','055','GYEONGNAM') 지역명,
    case
        when substr(tel,1,3) = '02)' then '서울'
        when substr(tel,1,3) = '031' then '경기'
        when substr(tel,1,3) = '051' then '부산'
        when substr(tel,1,3) = '052' then '울산'
        when substr(tel,1,3) = '055' then '경남'
        else '외계인'
    end 지욕묭
    
from student
where deptno1 = 101;
    



















