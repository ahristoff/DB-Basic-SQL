USE Bakery

SELECT TOP(10) p.Name, p.Description, AVG(f.Rate) AS AverageRate, COUNT(f.Id) 
AS FeedbacksAmount  FROM Products AS p 
JOIN Feedbacks AS f ON f.ProductId = p.Id
GROUP BY p.Name, p.Description
--, AVG(f.Rate), COUNT(f.Id)

ORDER BY AVG(f.Rate) DESC, COUNT(f.Id) DESC