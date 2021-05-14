drop table IF EXISTS Emails;

CREATE TABLE Emails(
	id int,
	email varchar(128)
);


INSERT INTO Emails Values (1, 'luru@example.com');
INSERT INTO Emails Values (2, 'test1@example.com');
INSERT INTO Emails Values (3, 'test2@example.com');
INSERT INTO Emails Values (4, 'luru@example.com');

-- 删除重复的email，有重复的情况下，保留最小的Id。
-- 性能可能有点低，但是应该是可以工作。
select 
	id, 
	email
from 
	Emails 
where 
	id in 
	(
		select 
			minId 
		from 
		(
		    select 
		    	min(Id) as minId, 
		    	email
		    from 
		    	Emails
		    group by 
		    	email
		) AS temp
	);

-- 注意从一个表中删除另外一个表的所有记录。
-- delete还可以这样用？而且语法看起来也有点奇怪，注意p1是被删除的表，后面的条件选出从p1中删除的行。
-- 看起来会改变源数据库。
-- !在postgreSQL不能运行。
DELETE 
	e1 
FROM 
	Emails e1, 
	Emails e2
WHERE
	e1.email = e2.email AND 
	e1.id > e2.id;