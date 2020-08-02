DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;

USE employees_db;

CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE role (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  department_id INT, 
  PRIMARY KEY (id)
);

CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR (50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  role_id INT NOT NULL, 
  manager_id INT, 
  PRIMARY KEY (id)
);

INSERT INTO department (name)
VALUES ("Permitting"), ("Engineering"), ("Environmental Science"), ("Legal"), ("Finance"), ("Human Resources");

INSERT INTO role (title, salary, department_id)
VALUES ("Permit Coordinator", "42000", "1"), ("Civil Engineer", "72000", "2"), ("Policy Expert", "40000", "3"), ("Lawyer", "60000", "4"), ("Actuary", "60000", "5"), ("Employee Advocate", "40000", "6");

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Steve", "Carell", "1", "1"), ("Oprah", "Winfrey", "2", "1"), ("Robin", "Williams", "3", "1"), ("Denzel", "Washington", "4", "1"), ("Fletcher", "Reede", "5", "1"), ("Brittany", "Spears", "6", "1");
-- Query for view all --
SELECT e.id, e.first_name, e.last_name, d.name AS department, r.title, r.salary, CONCAT_WS(" ", m.first_name, m.last_name) AS manager FROM employee e LEFT JOIN employee m ON m.id = e.manager_id INNER JOIN role r ON e.role_id = r.id INNER JOIN department d ON r.department_id = d.id ORDER BY e.id ASC;

-- Query for view all roles --
SELECT  r.id, r.title, r.salary, d.name as Department_Name FROM role AS r INNER JOIN department AS d ON r.department_id = d.id;


-- Query for getting employees --
SELECT id, CONCAT_WS(' ', first_name, last_name) AS Employee_Name FROM employee

-- Query for updating --
UPDATE employee SET role_id = 3 WHERE id = 8;
UPDATE employee SET ? WHERE ?;

-- Query for Delete --
DELETE FROM department WHERE id = 13;