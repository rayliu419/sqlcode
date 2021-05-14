drop table IF EXISTS Customers;

CREATE TABLE Customers(
	id int,
	name varchar(20)
);


CREATE TABLE Orders(
	customer_id int
);


INSERT INTO Customers Values (1, 'Joe');
INSERT INTO Customers Values (2, 'Rui');
INSERT INTO Customers Values (3, 'Ivy');

INSERT INTO Orders Values (3);


-- 没有买东西的人的name
select 
	c.name
from 
	Customers c
where 
	c.id not in
	(
	    select 
	    	customer_id 
	    from 
	    	Orders
	);


-- 性能更佳的一种写法，实际上，如果上述的Orders表很大，not in基本上速度不能接受。
select 
	c.Name 
from 
	Customers c 
-- left outer join 和 left join貌似没区别
left outer join 
	Orders o 
on 
	c.id = o.customer_id
where 
	o.customer_id is NULL