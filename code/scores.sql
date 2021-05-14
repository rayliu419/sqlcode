drop table IF EXISTS Scores;

CREATE TABLE Scores(
	Score float
);

INSERT INTO Scores Values (4.0);
INSERT INTO Scores Values (4.0);
INSERT INTO Scores Values (3.85);
INSERT INTO Scores Values (3.65);
INSERT INTO Scores Values (3.65);
INSERT INTO Scores Values (3.5);



/**
 ** 返回分数和排名。
 ** 因为(SELECT count(distinct Score) FROM Scores WHERE Score >= s.Score) as Rank 
 ** 这个子查询用到了外查询的数据，所以实际上的操作流程是从外查询拿出一条数据，然后传入子查询中查询。
 ** 例如这里从外查询拿出一条3.85的数据，传入到where的s.Score >= 3.85作为过滤条件，然后做一次并行查询集。   	 
**/
SELECT 
	Score,
	(
		SELECT 
			count(distinct Score) 
		FROM 
			Scores 
		WHERE 
			Score >= s.Score
	) as Rank
FROM Scores s
ORDER BY Score desc;