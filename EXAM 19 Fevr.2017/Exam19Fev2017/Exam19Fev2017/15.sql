use Bakery

SELECT CountryName, DistributorName
FROM
(
	SELECT 
	c.Name as CountryName, 
	d.Name as DistributorName, 
	COUNT(i.Id) AS IngridientCount,
	DENSE_RANK() OVER(PARTITION BY c.Name ORDER BY COUNT(i.Id)DESC) as Ranking
	
	FROM Countries as c
	FULL JOIN Distributors as d on d.CountryId = c.Id
	FULL JOIN Ingredients as i on d.Id = i.DistributorId
	
	GROUP BY c.Name, d.Name
) AS RankedDistributors

WHERE Ranking = 1

ORDER BY CountryName, DistributorName