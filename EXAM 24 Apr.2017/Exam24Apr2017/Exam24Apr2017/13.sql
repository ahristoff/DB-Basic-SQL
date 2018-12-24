USE WMS

SELECT j.JobId, ISNULL(SUM(p.Price * op.Quantity),0) AS [Total]
FROM OrderParts AS op
JOIN Orders AS o ON o.OrderId = op.OrderId
JOIN Parts AS p ON p.PartId = op.PartId
JOIN Jobs AS j ON j.JobId = o.JobId

WHERE j.Status = 'Finished'

group by j.JobId

ORDER BY Total DESC, j.JobId



----------------------------------------------------

SELECT j.JobId, 
(select ISNULL(SUM(p.Price * op.Quantity),0)
FROM OrderParts AS op
JOIN Orders AS o ON o.OrderId = op.OrderId
JOIN Parts AS p ON p.PartId = op.PartId
JOIN Jobs AS jo ON jo.JobId = o.JobId
WHERE jo.JobId = j.JobId) AS Total 
FROM Jobs AS j

WHERE j.Status = 'Finished'

ORDER BY Total DESC, j.JobId

