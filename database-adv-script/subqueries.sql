-- 1. Find all properties where the average rating is greater than 4.0 (using a subquery)
SELECT
    p.id AS property_id,
    p.title,
    p.location
FROM
    properties p
WHERE
    (
        SELECT AVG(r.rating)
        FROM reviews r
        WHERE r.property_id = p.id
    ) > 4.0;

-- 2. Find users who have made more than 3 bookings (using a correlated subquery)
SELECT
    u.id AS user_id,
    u.full_name,
    u.email
FROM
    users u
WHERE
    (
        SELECT COUNT(*)
        FROM bookings b
        WHERE b.user_id = u.id
    ) > 3;