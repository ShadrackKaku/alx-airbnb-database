-- Partitioning the bookings table by start_date (assume PostgreSQL syntax)

-- 1. Create a new partitioned table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    -- other columns as needed
    -- ...
    CONSTRAINT bookings_partitioned_unique UNIQUE(id, check_in)
) PARTITION BY RANGE (check_in);

-- 2. Create partitions for each year (example: 2023, 2024, 2025)
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 3. Example query to test performance before partitioning (on the original bookings table)
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE check_in BETWEEN '2025-01-01' AND '2025-03-31';

-- 4. Example query to test performance after partitioning (on the partitioned table)
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned WHERE check_in BETWEEN '2025-01-01' AND '2025-03-31';

-- Note: Data migration from bookings to bookings_partitioned is required for a real migration.