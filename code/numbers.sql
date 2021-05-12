CREATE TABLE Numbers(
	num int
);

INSERT INTO Numbers Values (1);
INSERT INTO Numbers Values (1);
INSERT INTO Numbers Values (2);
INSERT INTO Numbers Values (2);
INSERT INTO Numbers Values (3);


-- 在有可能重复的number表里找出不重复的最大值。
-- postgreSQL里面不work。
select 
	IFNULL(
	(
		select 
			MAX(num) 
		from
		(
			select 
				num 
			from 
				Numbers
			group by 
				num
			having 
				count(*)=1
		) as A
	), NULL
) as num;

-- 演示用group by去重。多个字段也是可以的。
select 
	num
from
	Numbers
group by
	num;

-- 以下的是什么意思来着？忘了。
-- 3. 奇怪的是根据2，having语句是可以工作的。
-- 所以这个动作发生的流程应该是:
-- 先将一样的contract_id合起来，使用having语句，最后符合条件的还要在group by的域上合并。

