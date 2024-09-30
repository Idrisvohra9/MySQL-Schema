CREATE DATABASE MARKETDB;
USE MARKETDB;

-- 1. Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, ZipCode, Country)
VALUES 
('John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Elm St', 'Springfield', 'IL', '62701', 'USA'),
('Jane', 'Smith', 'janesmith@example.com', '987-654-3210', '456 Maple Ave', 'Shelbyville', 'IL', '62563', 'USA'),
('Alice', 'Johnson', 'alicej@example.com', '555-123-4567', '789 Oak Dr', 'Capitol City', 'TX', '78701', 'USA');

-- 2. Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 699.99, 100),
('Coffee Maker', 'Appliances', 49.99, 30),
('T-shirt', 'Clothing', 19.99, 200);

-- 3. Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2024-08-01', 1049.98),
(2, '2024-08-05', 719.98),
(3, '2024-08-10', 69.99);

-- 4. OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES 
(1, 1, 1, 999.99),
(1, 3, 1, 49.99),
(2, 2, 1, 699.99),
(2, 4, 1, 19.99),
(3, 3, 1, 49.99);

-- 5. Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(50),
    ContactPhone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Suppliers (SupplierName, ContactName, ContactPhone, Address, City, State, ZipCode, Country)
VALUES 
('Tech Distributors Inc.', 'Mike Adams', '321-654-9870', '234 Tech Way', 'Silicon Valley', 'CA', '94043', 'USA'),
('Appliance Co.', 'Samantha Brown', '654-321-0987', '567 Appliance Rd', 'Metropolis', 'NY', '10001', 'USA');

-- 6. ProductSuppliers Table
CREATE TABLE ProductSuppliers (
    ProductSupplierID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    SupplierID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO ProductSuppliers (ProductID, SupplierID)
VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 1);
