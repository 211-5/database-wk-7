-- Question 1: Transform ProductDetail table into 1NF
-- Each product for an order should be in a separate row
SELECT OrderID, CustomerName, 'Laptop' AS Product FROM ProductDetail WHERE FIND_IN_SET('Laptop', Products)
UNION ALL
SELECT OrderID, CustomerName, 'Mouse' AS Product FROM ProductDetail WHERE FIND_IN_SET('Mouse', Products)
UNION ALL
SELECT OrderID, CustomerName, 'Tablet' AS Product FROM ProductDetail WHERE FIND_IN_SET('Tablet', Products)
UNION ALL
SELECT OrderID, CustomerName, 'Keyboard' AS Product FROM ProductDetail WHERE FIND_IN_SET('Keyboard', Products)
UNION ALL
SELECT OrderID, CustomerName, 'Phone' AS Product FROM ProductDetail WHERE FIND_IN_SET('Phone', Products);

-- Question 2: Transform OrderDetails table into 2NF
-- Remove partial dependency by separating CustomerName into its own table
-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY(OrderID, Product),
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
);
