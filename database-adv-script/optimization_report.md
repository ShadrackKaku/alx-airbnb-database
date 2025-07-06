# Query Optimization Report

## 1. Initial Query

The initial query retrieves all bookings, user details, property details, and payment details using joins between the `bookings`, `users`, `properties`, and `payments` tables.

## 2. Performance Analysis

Performance was analyzed using `EXPLAIN ANALYZE`.  
**Potential inefficiencies observed:**
- Full table scans if indexes are missing on join columns (`user_id`, `property_id`, `booking_id`).
- Retrieving all columns and all rows can be slow for large datasets.
- Unfiltered result set means more data processed and transferred.

## 3. Refactoring and Optimization

- **Indexes:** Ensure indexes exist on key columns:
  - `bookings.user_id`
  - `bookings.property_id`
  - `payments.booking_id`
- **Column selection:** Select only required columns.
- **Filtering:** Apply `WHERE` clause for active or recent payments to limit rows if use-case allows.
- **Join type:** Use `LEFT JOIN` for `payments` only if not all bookings have payments; otherwise, use `JOIN`.

## 4. Optimized Query

- Example optimization: Add WHERE clause to limit to `pay.status = 'completed'`, reducing result set size.
- Confirmed index usage in join columns using `EXPLAIN ANALYZE`.
- Reduced number of columns selected if possible.

## 5. Results

- **Before optimization:** Higher cost, possible table scans, slower execution time.
- **After optimization:** Lower cost, index scans, faster execution time.

## 6. Conclusion

Proper indexing, selective column retrieval, and appropriate filtering can dramatically improve query performance for complex multi-table joins.

**Prepared by:**  
Shadrack Kaku  
2025-07-06