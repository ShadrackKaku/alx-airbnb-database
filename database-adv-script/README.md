# Advanced SQL Joins – Airbnb Database

This directory contains advanced SQL queries demonstrating the use of INNER JOIN, LEFT JOIN, and FULL OUTER JOIN on a simulated Airbnb database.

**Queries included:**
1. INNER JOIN: Bookings and their users.
2. LEFT JOIN: Properties and their reviews (including properties without reviews).
3. FULL OUTER JOIN: All users and all bookings, covering cases where users may not have bookings and bookings may not be linked to users.

See `joins_queries.sql` for all queries.


# Advanced SQL Practice – Subqueries

This directory contains advanced SQL queries for practicing the use of both correlated and non-correlated subqueries on a simulated Airbnb database.

**Included queries:**
1. Find all properties with an average rating greater than 4.0 (non-correlated subquery).
2. Find users who have made more than 3 bookings (correlated subquery).

See `subqueries.sql` for the actual SQL code.

# Advanced SQL Practice – Aggregations and Window Functions

This directory contains SQL queries that use aggregation and window functions for data analysis on a simulated Airbnb database.

**Included queries:**
1. Find the total number of bookings made by each user (with COUNT and GROUP BY).
2. Rank properties based on the total number of bookings (with RANK window function).

See `aggregations_and_window_functions.sql` for the SQL code.