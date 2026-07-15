--student, department 테이블 활용
--학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.

select * from student;
select * from department;


select d.dname, d.max_height,s.name,d.max_height
from 
        (select  max(s.height) max_height , d.deptno, d.dname
        from student s, department d
        where s.deptno1 = d.deptno
        group by d.deptno, d.dname) d, student s
where d.max_height = s.height
and s.deptno1 = d.deptno
order by d.max_height desc
;





--2.
--student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
--해당 학년의 평균 키를 출력 하세요.
--(학년 컬럼으로 오름차순 정렬해서 출력하세요)


select * from student;


select s.grade,s.name, s.height,d.avg_height
from student s,
(select avg(height) avg_height, grade
from student
group by grade) d
where s.grade = d.grade
and  s.height > d.avg_height
order by s.grade asc;






