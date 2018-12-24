USE WMS

SELECT CONCAT(FirstName, ' ', LastName)AS Available
FROM Mechanics as m
WHERE m.MechanicId NOT IN
(
SELECT DISTINCT j.MechanicId 
FROM Jobs as j
WHERE j.MechanicId IS NOT NULL AND j.Status <> 'Finished'
)
------------------------------------------------------------------
--subquery -(vsichki mechanizi koito imat rabota) ,
-- i kazvame ne vzimai tezi koito ne sa v tozi spisak
-- ima mechanici s jobove Finished i Activni jobs ednovremenno


--SELECT * FROM Jobs
--ORDER BY MechanicId
