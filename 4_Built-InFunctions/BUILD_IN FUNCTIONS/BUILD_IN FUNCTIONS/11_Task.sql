USE Geography
SELECT Peaks.PeakName,Rivers.RiverName,
LOWER(STUFF(PeakName,LEN(PeakName),1,RiverName)) AS Mix
FROM Peaks,Rivers
--WHERE SUBSTRING(PeakName,LEN(PeakName),1)= SUBSTRING(RiverName,1,1)
--ORDER BY Mix


WHERE RIGHT(PeakName,1)= LEFT(RiverName,1)
ORDER BY Mix
