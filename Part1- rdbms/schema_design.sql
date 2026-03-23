-- Customers Table
CREATE TABLE IF NOT EXISTS Customers(  
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50)
);

-- Products Table
CREATE TABLE IF NOT EXISTS Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2)
);

-- Sales Representatives
CREATE TABLE IF NOT EXISTS Sales_Representatives (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(100)
);

-- Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    rep_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES Sales_Representatives(rep_id)
);

-- Order Items
CREATE TABLE IF NOT EXISTS Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);