-- Initial complex query: Retrieve all bookings with user, property, and payment details
SELECT
    b.id AS booking_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.full_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id;

-- Analyze the query's performance before optimization
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.full_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id;

-- Refactored/optimized query example:
-- Using AND to filter for completed payments within a specific date range
SELECT
    b.id AS booking_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.full_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id
WHERE
    pay.status = 'completed'
    AND pay.payment_date >= '2025-01-01';

-- Analyze the query's performance after optimization
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    b.check_in,
    b.check_out,
    u.id AS user_id,
    u.full_name,
    u.email,
    p.id AS property_id,
    p.title AS property_title,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM
    bookings b
JOIN
    users u ON b.user_id = u.id
JOIN
    properties p ON b.property_id = p.id
LEFT JOIN
    payments pay ON b.id = pay.booking_id
WHERE
    pay.status = 'completed'
    AND pay.payment_date >= '2025-01-01';

    