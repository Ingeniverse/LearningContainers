-- Create database
CREATE DATABASE IF NOT EXISTS user_database;
USE user_database;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Create address table
CREATE TABLE IF NOT EXISTS address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    street VARCHAR(150) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert 30 example users
INSERT INTO users (name, email) VALUES
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com'),
('Carol Williams', 'carol.williams@example.com'),
('David Brown', 'david.brown@example.com'),
('Eve Davis', 'eve.davis@example.com'),
('Frank Miller', 'frank.miller@example.com'),
('Grace Wilson', 'grace.wilson@example.com'),
('Henry Moore', 'henry.moore@example.com'),
('Ivy Taylor', 'ivy.taylor@example.com'),
('Jack Anderson', 'jack.anderson@example.com'),
('Karen Thomas', 'karen.thomas@example.com'),
('Leo Jackson', 'leo.jackson@example.com'),
('Mona White', 'mona.white@example.com'),
('Nina Harris', 'nina.harris@example.com'),
('Oscar Martin', 'oscar.martin@example.com'),
('Paula Thompson', 'paula.thompson@example.com'),
('Quinn Garcia', 'quinn.garcia@example.com'),
('Rita Martinez', 'rita.martinez@example.com'),
('Sam Robinson', 'sam.robinson@example.com'),
('Tina Clark', 'tina.clark@example.com'),
('Uma Rodriguez', 'uma.rodriguez@example.com'),
('Victor Lewis', 'victor.lewis@example.com'),
('Wendy Lee', 'wendy.lee@example.com'),
('Xander Walker', 'xander.walker@example.com'),
('Yara Hall', 'yara.hall@example.com'),
('Zane Allen', 'zane.allen@example.com'),
('Amy Young', 'amy.young@example.com'),
('Brian King', 'brian.king@example.com'),
('Cathy Wright', 'cathy.wright@example.com'),
('Derek Scott', 'derek.scott@example.com');

-- Insert 30 example addresses (one for each user)
INSERT INTO address (user_id, street, city, country) VALUES
(1, '123 Maple St', 'Springfield', 'USA'),
(2, '456 Oak Ave', 'Riverside', 'USA'),
(3, '789 Pine Rd', 'Greenville', 'USA'),
(4, '321 Cedar Blvd', 'Hilltown', 'USA'),
(5, '654 Birch Ln', 'Lakeview', 'USA'),
(6, '987 Elm Dr', 'Brookside', 'USA'),
(7, '135 Spruce Ct', 'Fairview', 'USA'),
(8, '246 Willow Way', 'Sunnyvale', 'USA'),
(9, '357 Aspen Pl', 'Meadowbrook', 'USA'),
(10, '468 Poplar Cir', 'Woodland', 'USA'),
(11, '579 Chestnut St', 'Clearwater', 'USA'),
(12, '680 Walnut Ave', 'Parkside', 'USA'),
(13, '791 Hickory Rd', 'Ridgefield', 'USA'),
(14, '802 Sycamore Blvd', 'Bayview', 'USA'),
(15, '913 Magnolia Ln', 'Cedarville', 'USA'),
(16, '124 Dogwood Dr', 'Elmwood', 'USA'),
(17, '235 Redwood Ct', 'Pinecrest', 'USA'),
(18, '346 Palm Way', 'Mapleton', 'USA'),
(19, '457 Cypress Pl', 'Riverbend', 'USA'),
(20, '568 Fir Cir', 'Stonebridge', 'USA'),
(21, '679 Larch St', 'Oakridge', 'USA'),
(22, '780 Alder Ave', 'Willowbrook', 'USA'),
(23, '891 Beech Rd', 'Lakeshore', 'USA'),
(24, '902 Juniper Blvd', 'Forestview', 'USA'),
(25, '103 Laurel Ln', 'Summit', 'USA'),
(26, '214 Sequoia Dr', 'Valleyview', 'USA'),
(27, '325 Olive Ct', 'Harborview', 'USA'),
(28, '436 Maplewood Way', 'Hillcrest', 'USA'),
(29, '547 Pinehurst Pl', 'Crestwood', 'USA'),
(30, '658 Cedarwood Cir', 'Shoreline', 'USA');