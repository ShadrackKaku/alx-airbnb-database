-- Indexes for User, Booking, and Property tables to optimize query performance

-- 1. Performance measurement BEFORE creating indexes
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 42;

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE property_id = 101;

EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'test@example.com';

EXPLAIN ANALYZE
SELECT * FROM properties WHERE location = 'Accra';

-- 2. CREATE INDEX statements

-- User Table
CREATE INDEX idx_users_email ON users(email);

-- Booking Table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_check_in ON bookings(check_in);

-- Property Table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_title ON properties(title);

-- 3. Performance measurement AFTER creating indexes
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 42;

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE property_id = 101;

EXPLAIN ANALYZE
SELECT * FROM users WHERE email = 'test@example.com';

EXPLAIN ANALYZE
SELECT * FROM properties WHERE location = 'Accra';