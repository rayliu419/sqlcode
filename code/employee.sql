drop table IF EXISTS Employee;

CREATE TABLE Employee(
	id int,
	name varchar(20),
	salary int,
	manager_id int
);

INSERT INTO Employee Values (1, 'Joe', 5000, 3);
INSERT INTO Employee Values (2, 'Henry', 4000, 4);
INSERT INTO Employee Values (3, 'Sam', 10000, null);
INSERT INTO Employee Values (4, 'Max', 11000, null);
INSERT INTO Employee Values (1, 'Rui', 15000, 3);



/**
 ** 表自Join
 **/
select 
	e1.name as Employee
from 
	Employee e1 
left join 
	Employee e2 
on 
	e1.manager_id = e2.id
where 
	e1.salary > e2.salary;


/**
 ** 某个属性是NULL的时候，对其进行数学运算或者比较运算符都会有问题。
 ** 要取某个属性是NULL，要使用专门的IS NULL来做。
 ** 在替换not in 为left join + is null时也容易犯这个错误。
 **/
select 
	*
from 
	Employee e
where 
	e.manager_id = null;

select 
	*
from 
	Employee e
where 
	e.manager_id is null;

-- COUNT 函数的结果根据参数的不同而不同。COUNT(*) 会得到包含 NULL 的数据 行数，
-- 而 COUNT(< 列名 >) 会得到 NULL 之外的数据行数。
-- 其他聚合函数会将 NULL 排除在外。但 COUNT(*) 例外，并不会排除 NULL。

-- return 5
select 
	count(*)
from 
	Employee;

-- return 3
select 
	count(Employee.manager_id)
from 
	Employee;

-- 总之要注意有null的时候的运算。感觉最好的办法是要对某列做运算时，查查看此列是否有null!
