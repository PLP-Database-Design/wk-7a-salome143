-- Question 1: Transform ProductDetail into 1NF
-- Create a new table OrderProducts where each row represents a single product per order
CREATE TABLE OrderProducts (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50),
    PRIMARY KEY (OrderID, Product)
);

-- Insert transformed data (each product in a separate row)
INSERT INTO OrderProducts (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Laptop');
INSERT INTO OrderProducts (OrderID, CustomerName, Product) VALUES (101, 'John Doe', 'Mouse');
INSERT INTO OrderProducts (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO OrderProducts (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO OrderProducts (OrderID, CustomerName, Product) VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO OrderProducts (OrderID, CustomerName, Product) VALUES (103, 'Emily Clark', 'Phone');

-- Question 2: Transform OrderDetails into 2NF
-- Create Orders table to store order-level details
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert distinct order records
INSERT INTO Orders (OrderID, CustomerName) VALUES (101, 'John Doe');
INSERT INTO Orders (OrderID, CustomerName) VALUES (102, 'Jane Smith');
INSERT INTO Orders (OrderID, CustomerName) VALUES (103, 'Emily Clark');

-- Create OrderItems table to store product-level details for each order
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert transformed product records
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (101, 'Laptop', 2);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (101, 'Mouse', 1);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Tablet', 3);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Keyboard', 1);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (102, 'Mouse', 2);
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES (103, 'Phone', 1);
