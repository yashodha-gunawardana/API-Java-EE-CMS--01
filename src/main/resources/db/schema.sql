CREATE DATABASE cms;

USE cms;

CREATE TABLE user (
     id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(100),
     email VARCHAR(100),
     password VARCHAR(100),
     role VARCHAR(50)
);

CREATE TABLE complaint (
      complaint_id INT PRIMARY KEY AUTO_INCREMENT,
      employee_id INT NOT NULL,
      title VARCHAR(255),
      description TEXT,
      status VARCHAR(50) DEFAULT 'pending',
      remarks TEXT,
      date DATE,
      FOREIGN KEY (employee_id) REFERENCES user(id)
);

