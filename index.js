const mysql = require('mysql');
const inquirer = require('inquirer');
const { printTable } = require('console-table-printer');
let roles;
let departments;
let managers;
let employees;

var connection = mysql.createConnection({
    host: "localhost",
  
    // Your port; if not 3306
    port: 3306,
  
    // Your username
    user: "root",
  
    // Your password
    password: "",
    database: "employee_db"
  });