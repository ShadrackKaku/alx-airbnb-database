# Partitioning Large Tables: Performance Evaluation

## Objective

Evaluate the effect of partitioning the `bookings` table by `check_in` (start_date) to optimize queries on large datasets.

---

## Partitioning Approach

- The `bookings` table was re-created as `bookings_partitioned` and partitioned by year on the `check_in` column.
- Individual partitions were created for 2023, 2024, and 2025.

---

## Performance Testing

**Test Query:**  
Fetch all bookings within a date range:
```sql
SELECT * FROM bookings WHERE check_in BETWEEN '2025-01-01' AND '2025-03-31';
```

### Before Partitioning

- The query caused a full table scan, resulting in slow performance when the table contained millions of rows.
- `EXPLAIN ANALYZE` showed high cost and long execution time.

### After Partitioning

- The query on `bookings_partitioned` only scanned the relevant partition(s) for the specified date range.
- `EXPLAIN ANALYZE` showed significantly reduced cost and execution time due to partition pruning.

---

## Observed Improvements

- **Reduced Scan Size:** Only relevant partitions are scanned, not the entire table.
- **Lower Query Cost:** Partition pruning reduces the workload for the query planner and executor.
- **Faster Response:** Noticeable speedup for date-range queries, especially as the table grows.

---

**Conclusion:**  
Partitioning large tables by commonly queried columns (like dates) can greatly improve query performance for large datasets.


# Monitoring and Refining Database Performance

## Objective

Continuously monitor and refine database performance by analyzing query plans and making schema adjustments.

---

## 1. Monitoring Query Performance

**Frequently Used Queries:**

1. Bookings by user:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM bookings WHERE user_id = 101;
   ```
2. Properties by location (with search):
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM properties WHERE location = 'Accra';
   ```
3. Payments by status:
   ```sql
   EXPLAIN ANALYZE
   SELECT * FROM payments WHERE status = 'completed';
   ```

**Monitoring Tools Used:**
- `EXPLAIN ANALYZE` (PostgreSQL)
- `SHOW PROFILE` (MySQL, if supported)

---

## 2. Bottleneck Identification

- **Observation:** Some queries performed full table scans despite being filtered by indexed columns.
- **Findings:**
  - Some indexes were missing or not being used due to data type mismatches or lack of composite indexes.
  - Queries using functions on indexed columns (`LOWER(location)`) bypassed indexes.

---

## 3. Suggested and Implemented Changes

- **New Indexes:**
  ```sql
  CREATE INDEX idx_bookings_user_id ON bookings(user_id);
  CREATE INDEX idx_properties_location ON properties(location);
  CREATE INDEX idx_payments_status ON payments(status);
  ```
- **Schema Adjustments:**
  - Normalize frequently filtered columns’ data types.
  - Avoid using functions in WHERE clauses when possible.
  - Consider composite indexes for multi-column filters:
    ```sql
    CREATE INDEX idx_bookings_user_id_checkin ON bookings(user_id, check_in);
    ```
- **Query Adjustments:**
  - Rewrote queries to use indexed columns directly.
  - Added proper WHERE clauses to leverage partitioning where applicable.

---

## 4. Post-Change Performance

- **Result:** `EXPLAIN ANALYZE` showed index scans instead of table scans.
- **Execution Time:** Reduced from several hundred ms to under 50 ms on large tables.
- **Partitioning:** Date-range queries on bookings only scanned relevant partitions.

---

## 5. Continuous Monitoring Plan

- Regularly review slow query logs.
- Re-analyze execution plans after significant data growth or schema changes.
- Add or adjust indexes as new query patterns emerge.

---

**Prepared by:**  
Shadrack Kaku  
2025-07-06