USE WMS
GO

CREATE FUNCTION udf_GetCost(@JobId INT)
RETURNS DECIMAL(6, 2)
AS
BEGIN



DECLARE @total DECIMAL (6, 2)= (SELECT ISNULL(SUM(p.Price * op.Quantity),0) FROM Jobs AS j
JOIN Orders AS o ON o.JobId = j.JobId
JOIN OrderParts AS op ON op.OrderId = o.OrderId
JOIN Parts AS p ON p.PartId = op.PartId
where j.JobId = @JobId)

RETURN @total

END

GO
SELECT dbo.udf_GetCost(3)