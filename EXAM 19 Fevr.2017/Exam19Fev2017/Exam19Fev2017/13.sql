USE Bakery

SELECT d.Name AS DistributorName, i.Name AS IngredientName, p.Name AS ProductName,
AVG(f.Rate) AS AverageRate  
FROM ProductsIngredients AS pd
JOIN Ingredients AS i ON pd.IngredientId = i.Id
JOIN Products AS p ON pd.ProductId = p.Id
JOIN Feedbacks AS f ON p.Id = f.ProductId
JOIN Distributors AS d ON d.Id = i.DistributorId

GROUP BY d.Name, i.Name, p.Name
HAVING AVG(f.Rate) BETWEEN 5 AND 8

ORDER BY DistributorName, IngredientName, ProductName
 