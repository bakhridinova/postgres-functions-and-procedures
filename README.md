# PostgreSQL Functions and Procedures Task

## Overview

This task involves creating and using PostgreSQL functions and procedures to manipulate and retrieve data from the NORTHWIND database. Additionally, you will implement triggers for automated data logging and use cursors to efficiently process datasets.

**Estimated Time:** 2 hours  
**Maximum Points:** 24

## Task Description

You will work with the NORTHWIND database using the corresponding script from previous lessons.

### Exercise 1: Create a PostgreSQL Function

**Objective:** Create a function called `calculate_order_total(order_id INT)` that calculates and returns the total for a given order ID.

**Test:** Use any order ID from 1 to 20 to test the function.

### Exercise 2: Implement a Stored Procedure

**Objective:** Create a procedure called `update_stock(product_id INT, quantity INT)` that updates `UnitsInStock` in the `Products` table for a given product ID.

**Test:** Update the stock quantity for product ID 11.

### Exercise 3: Design and Implement a Trigger

**Objective:** Develop a trigger called `log_price_update` that inserts a record into a new table, `price_update_log`, whenever the `UnitPrice` of a product is updated.

**Test:** Update the `UnitPrice` for product ID 11 and verify the log.

### Exercise 4: Utilize Cursors in PL/pgSQL

**Objective:** Write a PL/pgSQL block using a cursor to iterate through orders in the `Orders` table and calculate the totals using the function from Exercise 1.

**Test:** Execute the block and verify the totals.

## Additional Requirements

- Label each file clearly (e.g., `01_Functions.sql`, `02_Stored_Procedures.sql`).
- Include comments in your SQL scripts to describe your actions.

## Evaluation Criteria

| Criteria          | 0 points | 1 point | 2 points | 3 points | 4 points |
|-------------------|----------|---------|----------|----------|----------|
| Task Completeness | No attempt or incomplete response to task requirements | Task is partially completed without meeting all specified requirements | Task is completed with syntax errors but meets all specified requirements | Task is completed with logical errors but meets all specified requirements | Task is completed with no errors and meets all specified requirements |
| Syntax Errors     | Code does not work | Major syntax errors prevent code from being executed | Code has minimal syntax errors | Code is free of syntax errors |
| Logical Errors    | Code returns unexpected results | Major logical errors significantly affect the program's logic | Code contains a few logical errors | Code has minimal logical errors | Code is free of logical errors |
| Minor Issues      | Task is completed with a significant number of minor issues (typos, formatting, readability, excessive complexity, etc.) | Task is completed with a noticeable number of minor issues | Task is completed with some minor issues | Task is completed with minimal minor issues | Task is completed with no minor issues |
| Description       | Inadequate or missing description | Adequate description | Very good description | Excellent description | Outstanding description |
| Creativity        | Little to no creativity | Some creativity in using different language constructs | Very good creativity in using different language constructs | Excellent creativity in using different language constructs | Outstanding creativity; uses innovative, original constructs |

## Result

Upload the file into your repository and submit the link in the form below.
