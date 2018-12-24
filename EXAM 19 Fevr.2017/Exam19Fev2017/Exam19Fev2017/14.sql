USE Bakery

SELECT CountryName,  FeedbackRate FROM

(
SELECT  co.Name AS CountryName,
AVG(f.Rate) AS FeedbackRate,
RANK() OVER(ORDER BY AVG(f.Rate)DESC) AS RANKING
FROM Feedbacks AS f
JOIN Customers AS cu ON f.CustomerId = cu.Id
JOIN Countries AS co ON cu.CountryId = co.Id

GROUP BY co.Name
) AS VB

WHERE RANKING = 1
ORDER BY FeedbackRate DESC

---------------------------------------------------------------------------

SELECT top(1) with ties
co.Name AS CountryName,
AVG(f.Rate) AS FeedbackRate
FROM Feedbacks AS f
JOIN Customers AS cu ON f.CustomerId = cu.Id
JOIN Countries AS co ON cu.CountryId = co.Id

GROUP BY co.Name

order by FeedbackRate DESC

