UPDATE Jobs
SET MechanicId = 3
WHERE Status ='Pending'

UPDATE Jobs
SET Status ='In Progress'
WHERE Status ='Pending'



-----------------------------------------
SELECT COUNT(*)
FROM Jobs
WHERE [Status] = 'Pending'

SELECT COUNT(JobId)
FROM Jobs
WHERE [Status] = 'In Progress'

select * from Jobs
order by MechanicId