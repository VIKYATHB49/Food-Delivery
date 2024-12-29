CREATE DATABASE IF NOT EXISTS food_delivery;
USE food_delivery;
CREATE TABLE users (
    name VARCHAR(20) NOT NULL,
    mobile VARCHAR(10) NOT NULL PRIMARY KEY,
    pincode VARCHAR(6) NOT NULL,
    dob DATE NOT NULL,
    address VARCHAR(20) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    password VARCHAR(20),
    alt_phone VARCHAR(10),
    address_type VARCHAR(50) NOT NULL,
    email VARCHAR(50)            
);
CREATE TABLE item (
    item_name VARCHAR(20) PRIMARY KEY,
    price DECIMAL(10, 2) NOT NULL
);
INSERT INTO item (item_name,price) VALUES 
('Biryani', 700),
('Kadhai Chicken', 180),
('Butter Naan', 40),
('Noodles', 150),
('Paneer 65', 250),
('Coke', 50);
CREATE TABLE addresses (  
    mobile VARCHAR(10) NOT NULL,                            
    address VARCHAR(100) NOT NULL,                            
    FOREIGN KEY (mobile) REFERENCES users(mobile) 
);
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,       
    mobile VARCHAR(10) NOT NULL,                     
    date DATE NOT NULL,                                                                              
    Bill DECIMAL(10, 2) NOT NULL,                   
    FOREIGN KEY (mobile) REFERENCES users(mobile) 
);


