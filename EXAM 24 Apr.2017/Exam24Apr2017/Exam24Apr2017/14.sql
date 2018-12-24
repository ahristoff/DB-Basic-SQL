USE WMS

SELECT m.ModelId, 
m.Name, 
CONCAT(AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate)),' ' , 'days')
AS [Average Service Time] 
FROM Jobs AS j
JOIN Models AS m ON m.ModelId = j.ModelId

group by m.ModelId, m.Name
ORDER BY [Average Service Time]


--------------------------------------------------------------
--SELECT AVG(DATEDIFF(DAY, jo.IssueDate, jo.FinishDate)) FROM Jobs AS jo
--WHERE m.ModelId = 