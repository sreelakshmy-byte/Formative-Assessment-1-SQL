# Formative-Assessment-1-SQL
Global Store Database-This repository contains SQL scripts to create and manage a simple global store database, including tables for inventory management and order tracking.

Table of Contents

Database Structure


Tables

Products Table

Orders Table

Queries

Inventory Management

Order Management

Analytics

Views

Usage

Database Structure

The database is named global_store_db and contains two primary tables:

inventory (originally created as products)

orders

Tables

Products Table

The inventory table (initially named products) contains details about the products available in the store. The table includes the following fields:

product_id: An auto-incremented integer serving as the primary key.

name: The name of the product (VARCHAR).

price: The price of the product (DECIMAL).

quantity: The quantity available in the inventory (INT).


category: The category to which the product belongs (VARCHAR).

Orders Table

The orders table tracks customer orders and contains the following fields:

order_id: An auto-incremented integer serving as the primary key.

product_id: A foreign key referencing the product_id in the inventory table.

quantity_ordered: The quantity of the product ordered (INT).

order_date: The date when the order was placed (DATE).
