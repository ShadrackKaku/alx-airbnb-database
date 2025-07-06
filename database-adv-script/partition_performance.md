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

**Prepared by:**  
Shadrack Kaku  
2025-07-06