-- Indexes for User, Booking, and Property tables to optimize query performance

-- User Table
CREATE INDEX idx_users_email ON users(email);

-- Booking Table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_check_in ON bookings(check_in);

-- Property Table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_title ON properties(title);