/*-------------------------------------*/
단일행 함수


NVL 함수
값이 null 일때 기본값 처리
NVL(대상, null일때기본값)


select 
    sal,
    comm,
    (sal*12)+comm,
    nvl(comm, 123),
    nvl(comm,0),
    (sal*12) + nvl(comm,0)
from emp;

select
    sal,
    comm,
    sal*12 +comm 연봉
from emp
where comm is not null
union all
select
    sal,
    comm,
    sal*12
from emp
where comm is null;

NVL(대상값,있을,없을)

select
    nvl(null, 10),
    nvl(20, 10),
    nvl2(null,'있다','없다'),
    nvl2(1234,'있다','없다'),
    nvl2(1234,'1234','없다')   
from dual;

select 
    sal,
    comm,
    (sal*12) + nvl(comm,0),
    nvl2(comm,comm,0),
    sal*12 + nvl2(comm,comm,0),
     nvl2(comm, sal*12+comm, sal*12)
from emp;

***DECODE

DECODE(대상,비교값,'같다','다르다')
DECODE(대상,비교값,'같다'(DECODE(대상,비교값,'같다','다르다')) )
DECODE(대상,비교값1,'같다',비교값2,'같다2',비교값3,'같다3','다르다')
DECODE(대상,비교값1,'같다',비교값2,'같다2',비교값3,'같다3') -> 마지막 다르다 생략 -> NULL


select
    DECODE(10, 10, '같다','다르다'),
    DECODE(10, 20, '같다','다르다'),
    DECODE(10, 10, '같다'),
    DECODE(10, 20, '같다'),
    DECODE(10, 20, '같다',null),
    DECODE(10, 10, '10이다',20,'20이다',30,'30이다',40,'40이다','아니다'),
    DECODE(30, 10, '10이다',20,'20이다',30,'30이다',40,'40이다'),
    DECODE(40, 10, '10이다',20,'20이다',30,'30이다',40,'40이다',NULL),
    DECODE(99, 10, '10이다',20,'20이다',30,'30이다',40,'40이다',NULL)
from dual;

swith(20):
    case 20: '20이다'
    case 30: ...
    
    
select
    name,
    deptno,
    decode(deptno,101,'컴공',102,'전기',103,'기계',201,'물리',202,'화학',203,'수학','기타전공') 학과이름,
    '전공학과:'||decode(deptno,101,'컴공',102,'전기',103,'기계',201,'물리',202,'화학',203,'수학','기타전공') 학과이름
from professor;




***CASE 문

select *
from student;
--학년 1 2 3 4
-- 학년구분 -> 컬럼
-- 1 2 저학년
-- 3 4 고학년

select
    grade,
    decode(grade,1,'저학년',2,'저학년',3,'고학년',4,'고학년','범위벗어남') 구분,
    CASE grade
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
        ELSE '범위벗어남'
    END AS "구분CASE",
    CASE
        WHEN grade in (1,2) then '저학년'
        when grade in (3,4) then '고학년'
        else '크앙'
    END 구분case2
from student;


--------------
연본계산

select
     sal,
     comm,
     sal*12+comm 연봉1,
     sal*12 + nvl(comm, 0) 연봉2,
     sal*12 + nvl2(comm, comm, 0) 연봉3,
     nvl2(comm, sal*12+comm, sal*12) 연봉4,
     sal*12 + decode(comm, null, 0, comm) 연봉5,
     case comm
        when null then (sal*12) -- comm = null   comm is null
        else (sal*12+comm)
    end 연봉6,
    case
        when comm is null then (sal*12)
        when comm is not null then (sal*12 + comm)
    end 연봉7
from emp;



    
    
    
    
    