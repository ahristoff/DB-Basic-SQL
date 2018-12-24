SELECT 
p.PartId,
p.Description,
--ISNULL(SUM(pn.Quantity),0) AS Required,
--ISNULL(SUM(p.StockQty),0) As [In Stock],
--ISNULL(SUM(op.Quantity),0) AS Ordered

(select ISNULL(SUM(png.Quantity),0) from PartsNeeded AS png
where png.PartId = p.PartId) AS Requiered ,

ISNULL(SUM(p.StockQty),0) AS InStock,

(select ISNULL(SUM(opa.Quantity),0) from OrderParts AS opa
where p.PartId = opa.PartId
)AS Ordered

FROM Parts AS p

full JOIN OrderParts AS op ON p.PartId = op.PartId
--full JOIN Orders AS o ON o.OrderId = op.OrderId
--full JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
--full JOIN Jobs AS j ON j.JobId = o.JobId

--FROM Parts AS p

--FULL JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
--FULL JOIN Jobs AS j ON j.JobId = pn.JobId
--FULL JOIN Orders AS o ON o.JobId = j.JobId
--FULL JOIN OrderParts AS op ON op.OrderId = o.OrderId

where j.Status <> 'Finished'

group by p.PartId, p.Description

HAVING (select ISNULL(SUM(png.Quantity),0) from PartsNeeded AS png
where png.PartId = p.PartId) >
ISNULL(SUM(p.StockQty),0) + (select ISNULL(SUM(opa.Quantity),0) from OrderParts AS opa where p.PartId = opa.PartId)


Order by PartId




