# Airbnb Clone Database Sample Data

This directory contains SQL scripts to populate your Airbnb clone database with realistic sample data for testing and development.

## Files

- `seed.sql`: SQL script with INSERT statements for all tables (User, Property, Booking, Payment, Review, Message).
- `README.md`: This documentation file.

## Usage

1. Ensure your schema (from `database-script-0x01/schema.sql`) is already created.
2. Run `seed.sql` in your SQL environment to insert sample data into the database.

## Notes

- Sample data covers multiple users (guests, hosts), properties, bookings, payments, reviews, and messages.
- All foreign key constraints and relationships are respected.