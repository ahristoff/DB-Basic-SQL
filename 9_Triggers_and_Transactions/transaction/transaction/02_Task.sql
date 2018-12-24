USE Bank

GO

CREATE TABLE NotificationEmails 
( 
Id INT IDENTITY PRIMARY KEY, 
Recipient VARCHAR(100), 
Subject NVARCHAR(100), 
Body NVARCHAR(MAX) 
) 
GO 


CREATE TRIGGER tr_EmailNotification 
ON Logs 
FOR INSERT
AS 
BEGIN 
	INSERT INTO NotificationEmails(Recipient, Subject, Body) 
	SELECT inserted.AccountId,  
			CONCAT('Balance change for account: ', inserted.AccountId),  
			CONCAT('On ', GETDATE(), ' your balance was changed from ', inserted.OldSum, ' to ', inserted.NewSum) 
	FROM inserted 
END 

-------------------------------------------------------------------------


GO

CREATE TABLE NotificationEmails(
Id INT PRIMARY KEY IDENTITY,
Recipient INT FOREIGN KEY REFERENCES Logs(AccountId)
Subject NVARCHAR(max) DATETIME,
Body NVARCHAR(max) 
)

GO

CREATE TRIGGER tr_LogsEmail ON Logs
FOR INSERT
AS
	BEGIN

		INSERT INTO NotificationEmails(Recipient, Subject, Body)
		SELECT inserted.AccountId, 
		'Balance change for account: ' + inserted.AccountId, 
		'On ' + CONVERT(DATETIME, GETDATE()) + ' your balance was changed from ' + inserted.OldSum + ' to ' + inserted.NewSum
		FROM inserted 
	END

	-----------------------------------------------------------------

	UPDATE Accounts
	SET Balance -= 200
	WHERE AccountHolderId = 8



	SELECT*FROM Accounts

	SELECT * FROM Logs

	SELECT * FROM NotificationEmails