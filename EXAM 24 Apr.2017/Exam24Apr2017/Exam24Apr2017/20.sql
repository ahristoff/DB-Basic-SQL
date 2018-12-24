USE WMS

GO

WITH CTE_1
AS
(
SELECT m.MechanicId, sum(op.Quantity) AS Partss FROM Mechanics AS m
JOIN Jobs AS j        ON j.MechanicId = m.MechanicId
JOIN Orders AS o      ON o.JobId = j.JobId
JOIN OrderParts AS op ON op.OrderId = o.OrderId
JOIN Parts AS p       ON p.PartId = op.PartId
JOIN Vendors AS v     ON v.VendorId = p.VendorId

GROUP BY m.MechanicId, v.VendorId
)


SELECT 
CONCAT(m.FirstName, ' ', LastName) AS Mechanic,
v.Name AS Vendor,
c.Partss AS Parts
CONCAT(CAST(COUNT(p.PartId) / CAST(CTE_1.Parts AS DECIMAL(6, 2)) *100 AS INT),'%' ) 
AS Preference
FROM CTE_1 AS c
JOIN Jobs AS j        ON j.MechanicId = CTE_1.MechanicId
JOIN Orders AS o      ON o.JobId = j.JobId
JOIN OrderParts AS op ON op.OrderId = o.OrderId
JOIN Parts AS p       ON p.PartId = op.PartId
JOIN Vendors AS v     ON v.VendorId = p.VendorId
JOIN Mechanics AS m   ON CTE_1.MechanicId = m.MechanicId

GROUP BY CONCAT(m.FirstName, ' ', LastName), v.Name,CTE_1.Parts

ORDER BY Mechanic, Parts DESC, v.Name