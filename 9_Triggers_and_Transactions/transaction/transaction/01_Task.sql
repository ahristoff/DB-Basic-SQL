USE Bank

GO

CREATE TABLE Logs(
LogId INT PRIMARY KEY IDENTITY(1, 1),
AccountId INT FOREIGN KEY REFERENCES Accounts(Id) NOT NULL,
OldSum DECIMAL(15, 2),
NewSum DECIMAL(15, 2)
)

GO

CREATE TRIGGER tr_UpdateTransaction ON Accounts
FOR UPDATE
AS
	BEGIN
		INSERT INTO Logs(AccountId, OldSum, NewSum)
		SELECT deleted.Id, deleted.Balance, inserted.Balance FROM inserted
		JOIN deleted ON deleted.Id = inserted.Id
	END

	UPDATE Accounts
	SET Balance += 200
	WHERE AccountHolderId = 8


	SELECT*FROM Accounts

	SELECT * FROM Logs

