USE Gringotts

SELECT DepositGroup ,SUM(DepositAmount) AS TotalSum FROM WizzardDeposits
WHERE MagicWandCreator ='Ollivander family'
GROUP BY DepositGroup


--SELECT DepositGroup ,SUM(DepositAmount) AS TotalSum FROM WizzardDeposits
--GROUP BY DepositGroup,MagicWandCreator
--HAVING MagicWandCreator ='Ollivander family'

--SELECT*FROM WizzardDeposits