use WMS

SELECT ISNULL(SUM(p.Price * op.Quantity),0) AS [Parts Total] FROM OrderParts AS op
FULL JOIN Orders AS o ON o.OrderId = op.OrderId
FULL JOIN Parts AS p ON p.PartId = op.PartId

WHERE DATEDIFF(Week, o.IssueDate, '2017-04-24') <= 3
---------------------------------------------------------------
--trjabva da se vnimava da niama NULL


--SELECT * FROM Orders


