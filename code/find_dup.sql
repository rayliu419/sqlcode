
CREATE TABLE Dups(
	id int,
	name varchar(20),
	salary int,
	manager_id int
);

INSERT INTO Dups Values (1, 'Joe', 5000, 3);
INSERT INTO Dups Values (2, 'Henry', 4000, 4);
INSERT INTO Dups Values (1, 'Joe', 5000, null);
INSERT INTO Dups Values (1, 'Joe', 5000, null);
INSERT INTO Dups Values (2, 'Henry', 4000, 4);

DROP table Dups;

-- 想根据哪些列来看重复，就将那些列放到select + group by。
-- 重复行，有的时候select以后变成了重复行。用这个来check。
-- 重复行容易引起各种问题。
select 
	id,
	name,
	manager_id
from
	Dups
group by
	id,
	name,
	manager_id
having
	count(*) > 1;
