drop table IF EXISTS Persons;
drop table IF EXISTS Departments;

CREATE TABLE Persons(
	id int,
	name varchar(20),
	salary int,
	department_id int
);

CREATE TABLE Departments(
	id int,
	name varchar(20)
);

INSERT INTO Persons Values (1, 'Joe', 5000, 1);
INSERT INTO Persons Values (2, 'Henry', 4000, 2);
INSERT INTO Persons Values (3, 'Sam', 10000, 2);
INSERT INTO Persons Values (4, 'Max', 11000, 1);
INSERT INTO Persons Values (5, 'Jim', 12000, 1);
INSERT INTO Persons Values (6, 'Gary', 13000, 1);
INSERT INTO Persons Values (7, 'Xibo', 14000, 1);

INSERT INTO Departments Values (1, 'IT');
INSERT INTO Departments Values (2, 'Sales');

drop table Persons;
drop table Departments;

-- 返回每个部门工资最高的人
SELECT 
	d.name as department, 
	p.name as person, 
	p.salary 
from 
	Departments d, Persons p 
where 
	p.department_id = d.id 
and 
	p.salary = 
	(
		select 
			max(salary) 
		from 
			Persons p2 
		where 
			p2.department_id = d.id
	);

-- 返回前2的工资
select 
	d.name as department, 
	p1.name as person, 
	p1.salary
from 
	Persons p1 
join 
	Departments d
on 
	p1.department_id = d.id
where 2 > 
	(	
		select 
			count(distinct(p2.salary)) 
        from 
        	Persons p2 
        where 
        	p2.salary > p1.salary and 
        	p1.department_id = p2.department_id
);

-- 怎么把结果排序?