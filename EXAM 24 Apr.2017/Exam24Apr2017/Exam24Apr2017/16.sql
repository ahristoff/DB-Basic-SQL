use WMS



--SELECT
--p.PartId,
--p.Description,
--ISNULL(SUM(pn.Quantity),0) AS Required,
--ISNULL(SUM(p.StockQty),0) As [In Stock],
--ISNULL(SUM(op.Quantity),0) AS Ordered

--FROM Parts AS p

--FULL JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
--FULL JOIN Jobs AS j ON j.JobId = pn.JobId
--FULL JOIN Orders AS o ON o.JobId = j.JobId
--FULL JOIN OrderParts AS op ON op.OrderId = o.OrderId

--WHERE j.Status <> 'Finished'

--GROUP BY  p.PartId, p.Description
----HAVING ISNULL(SUM(pn.Quantity),0) > ISNULL(SUM(p.StockQty),0) + ISNULL(SUM(op.Quantity),0)

--ORDER BY PartId


-----------------------------------------------------------------------------
SELECT
P.PartId,
P.Description,
(
SELECT ISNULL(SUM(pnn.Quantity),0) FROM PartsNeeded AS pnn
WHERE pnn.PartId = p.PartId
) AS Required,

ISNULL(SUM(p.StockQty),0) As [In Stock],

(
SELECT ISNULL(SUM(oop.Quantity),0) FROM OrderParts AS oop
WHERE oop.PartId = p.PartId
) AS Ordered

FROM Parts AS p
--full JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
--full JOIN Jobs AS j ON j.JobId = pn.JobId

FULL JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
FULL JOIN Jobs AS j ON j.JobId = pn.JobId
FULL JOIN Orders AS o ON o.JobId = j.JobId
FULL JOIN OrderParts AS op ON op.OrderId = o.OrderId

WHERE j.Status <> 'Finished'

GROUP BY p.PartId, p.Description

HAVING ISNULL(SUM(pn.Quantity),0) > ISNULL(SUM(p.StockQty),0) + ISNULL(SUM(op.Quantity),0)

ORDER BY PartId
------------------------------------------------------

