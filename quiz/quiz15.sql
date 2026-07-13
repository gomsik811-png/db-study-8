select s.name 학생이름,
s.grade 학생학년,
p.name 교수이름,  
p.deptno 교수학과번호, 
d.dname 교수소속학과이름
from 
student s, professor p , department d
where s. profno = p.profno
and p.deptno = d.deptno
and p.deptno not in(301);
//and p.deptno <> 301;



select s.name, s.grade,p.name,  p.deptno, d.dname
from 
student s inner join professor p 
on s.profno = p.profno
inner join department d
on p.deptno = d.deptno 
and p.deptno not in(301);


select *
from professor;

select *
from department;

select *
from student;

select *
from score;

select *
from hakjum;

select a.studno 학번,a.name 이름,b.total 점수, c.grade 학점
from 
student a, score b, hakjum c
where a.studno = b.studno
and b.total between c.min_point and c.max_point;




select a.studno 학번,a.name 이름,b.total 점수, c.grade 학점
from 
student a, score b, hakjum c
where a.studno = b.studno
and b.total between c.min_point and c.max_point
and a.deptno1 in (101,102)
order by b.total desc;





