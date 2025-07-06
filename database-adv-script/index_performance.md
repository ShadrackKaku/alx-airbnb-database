# Implement Indexes for Optimization

## Objective

Identify and create indexes to improve query performance for high-usage columns in the User, Booking, and Property tables. Measure and document the query performance before and after adding indexes.

---

## 1. Identify High-Usage Columns

- **User Table:** `id`, `email`
- **Booking Table:** `id`, `user_id`, `property_id`, `check_in`, `check_out`
- **Property Table:** `id`, `location`, `title`

Columns commonly used in `WHERE`, `JOIN`, and `ORDER BY` clauses:
- `users.email` (for login/auth queries)
- `bookings.user_id`, `bookings.property_id` (for JOINs)
- `bookings.check_in`, `bookings.check_out` (for date-range queries)
- `properties.location`, `properties.title` (for searches and ordering)

---

## 2. Create Indexes

See `database_index.sql` for the actual SQL commands.

**Example (PostgreSQL/MySQL compatible):**
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_check_in ON bookings(check_in);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_title ON properties(title);
```

---

## 3. Measure Query Performance

**Example Query (before indexes):**
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 42;
```
- **Result (before index):**  
  - Cost: High, Full Table Scan

**Example Query (after adding index):**
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 42;
```
- **Result (after index):**  
  - Cost: Lower, Index Scan

**Improvement:**  
- Query execution time reduced from _X ms_ to _Y ms_ after index creation.
- The optimizer now uses the index (`idx_bookings_user_id`) instead of a full table scan.

---

## 4. Summary of Improvements

- Indexes on frequently filtered/joined columns can dramatically reduce query response time.
- Always measure with `EXPLAIN` or `ANALYZE` to confirm that the optimizer uses the new indexes.

---

**Prepared by:**  
Shadrack Kaku  
2025-07-06

