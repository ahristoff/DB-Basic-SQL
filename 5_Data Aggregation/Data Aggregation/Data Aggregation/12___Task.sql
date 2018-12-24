USE Gringotts

SELECT SUM([Output].[WizzardDepositDifference]) AS 'SumDifference'
FROM (SELECT [DepositAmount] - (SELECT [DepositAmount]
                                  FROM [WizzardDeposits]
                                 WHERE [Id] = [OddIdWizzardDeposit].[Id] + 1) AS [WizzardDepositDifference]
          FROM WizzardDeposits AS [OddIdWizzardDeposit]) AS [Output];





SELECT SUM(DepositAmount - GuestDeposit) AS SumDifference
FROM (
	SELECT DepositAmount,
		LEAD(DepositAmount) OVER(ORDER BY Id) AS GuestDeposit
	FROM WizzardDeposits
) AS Deposits

