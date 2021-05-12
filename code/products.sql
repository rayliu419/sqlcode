CREATE TABLE Products(
	id int,
	name varchar(128),
	product_type varchar(128),
	regist_date Date
);


INSERT INTO Products Values (1, 'T恤', '衣服', '2009-09-20');
INSERT INTO Products Values (2, '打孔器', '办公用品', '2009-09-11');
INSERT INTO Products Values (3, '运动T恤', '衣服', null);
INSERT INTO Products Values (4, '菜刀', '厨具', '2009-09-11');
INSERT INTO Products Values (5, '铁锅', '厨具', '2009-09-11');
INSERT INTO Products Values (6, '冲锋衣', '衣服', null);

select 
	*
from 
	Products;


-- distinct作用在多列时，使用的多列一起相等才满足条件。
-- id=6的null和id=3的null也被认为是一样了。
-- 返回的时候好像不一定从前到后的。
select 
	distinct product_type, regist_date
from
	Products;

-- 强行增加列。
select 
	'商品' as string, 
	1 as constant, 
	'2009-02-24' as overide_date, 
	id, 
	name
from 
	Products;
