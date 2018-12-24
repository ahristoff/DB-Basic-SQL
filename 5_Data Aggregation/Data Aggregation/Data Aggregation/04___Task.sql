USE Gringotts

SELECT TOP(2) DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize)

--SELECT DepositGroup
--FROM WizzardDeposits
--GROUP BY DepositGroup
--ORDER BY AVG(MagicWandSize)
--OFFSET 0 ROWS
--FETCH NEXT 2 ROWS ONLY