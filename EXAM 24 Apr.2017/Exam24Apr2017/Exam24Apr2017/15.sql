
SELECT 
--TOP 1 WITH TIES
m.Name AS Model,

COUNT(j.JobId) AS [Times Serviced], 

(
SELECT ISNULL(SUM(p.Price * op.Quantity),0) 
  
FROM Jobs AS jo
JOIN Orders AS o ON o.JobId = jo.JobId
JOIN OrderParts AS op ON op.OrderId = o.OrderId
JOIN Parts AS p ON p.PartId = op.PartId
WHERE m.ModelId = jo.ModelId
) AS [Parts Total]

FROM Models AS m
JOIN Jobs AS j ON m.ModelId = j.ModelId

group by m.Name, m.ModelId

order by [Times Serviced] DESC


---------------------------------------------------------

--s RANK

--SELECT Model,  [Times Serviced], [Parts Total] FROM
--(
--SELECT m.Name AS Model

--, COUNT(j.JobId) AS [Times Serviced], 

--(SELECT ISNULL(SUM(p.Price * op.Quantity),0)  FROM Jobs AS j
--JOIN Orders AS o ON o.JobId = j.JobId
--JOIN OrderParts AS op ON op.OrderId = o.OrderId
--JOIN Parts AS p ON p.PartId = op.PartId
--WHERE m.ModelId = j.ModelId) AS [Parts Total],

--DENSE_RANK() OVER (order by COUNT(j.JobId) DESC) AS RANKING 

--FROM Models AS m
--JOIN Jobs AS j ON m.ModelId = j.ModelId


--group by m.Name, m.ModelId
--) AS df
--WHERE RANKING = 1

--------------------------------------------------------------
--drugia pokasatel v subquery - > dobaviam order by parts total desc

select 
top 1 with ties
m.Name AS Model,
--COUNT(j.JobId)AS [Times Serviced],
(
SELECT COUNT(jn.JobId) FROM Jobs AS jn
WHERE m.ModelId = jn.ModelId
) AS [Times Serviced],

ISNULL(SUM(p.Price*op.Quantity),0) AS [Parts Total]

from Models AS m
full JOIN Jobs AS j ON j.ModelId = m.ModelId
full JOIN Orders AS o ON j.JobId = o.JobId
full JOIN OrderParts AS op ON op.OrderId = o.OrderId
full JOIN Parts AS p ON p.PartId = op.PartId

group by m.Name, m.ModelId

order by [Times Serviced] DESC,[Parts Total]desc

------------------------------------------------------------------------

SELECT 
--TOP 1 WITH TIES
m.Name AS Model,

(
SELECT COUNT(jn.JobId) FROM Jobs AS jn
WHERE m.ModelId = jn.ModelId
) AS [Times Serviced], 

(
SELECT ISNULL(SUM(p.Price * op.Quantity),0) 
  
FROM Jobs AS jo
JOIN Orders AS o ON o.JobId = jo.JobId
JOIN OrderParts AS op ON op.OrderId = o.OrderId
JOIN Parts AS p ON p.PartId = op.PartId
WHERE m.ModelId = jo.ModelId
) AS [Parts Total]

FROM Models AS m

group by m.Name, m.ModelId

order by [Times Serviced] DESC,[Parts Total]desc