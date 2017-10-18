/*
* COSC 341  Assignment 3
* This script makes the tables for the Company and populates them.
*/

--Create the employee tablef
create table employee (
    fname varchar(25),
    lname varchar(25),
    ssn number(9) primary key,
    sex char(1),
    salary number(30),
    super_ssn number(9),
    dno number(1)
);

--Create the department table
create table department (
    dname varchar(25),
    dnumber number(1) primary key,
    mgr_ssn number(9),
    mgr_start_date date
)

--Create the dept_locations table
create table dept_locations (
    dnumber number(1) primary key,
    dlocation varchar(25) primary key
)

--Create the works_on table
create table works_on (
    essn number(9) primary key,
    pno number(1) primary key,
    hours number
)

--Create the project table
create table project (
    pname varchar(25),
    pnumber number(2) primary key,
    plocation varchar(25),
    dnum number(1)
)
