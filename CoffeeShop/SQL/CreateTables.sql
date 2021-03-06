USE master;

USE CoffeeShopDB
GO
	CREATE TABLE Customers(
		CustomerID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		FirstName VARCHAR(100) NOT NULL,
		LastName VARCHAR(100) NOT NULL,
		DDOB INT NOT NULL CHECK(DDOB > 0 AND DDOB < 32),
		MMOB INT NOT NULL CHECK(MMOB > 0 AND MMOB < 13),
		Race VARCHAR(10) NOT NULL,
		Email VARCHAR(100) NULL,
	);

GO
	CREATE TABLE Baristas(
		BaristaID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		FirstName VARCHAR(100) NOT NULL,
		LastName VARCHAR(30) NOT NULL,
		Rating INT CHECK (
			Rating <= 5
			AND Rating >= 1
		) NOT NULL DEFAULT 1,
	);

GO
	CREATE TABLE Orders(
		OrderID INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		OrderedBy INT NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID),
		CoffeeName VARCHAR(30) NOT NULL,
		Quantity INT NOT NULL,
		CoffeePrice SMALLMONEY NOT NULL,
		OrderAssignee INT NOT NULL FOREIGN KEY REFERENCES Baristas(BaristaID),
	);