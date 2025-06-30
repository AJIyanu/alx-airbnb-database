-- USERS
CREATE INDEX idx_users_email ON users(email);

-- BOOKINGS
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
CREATE INDEX idx_bookings_dates ON bookings(start_date, end_date);

-- PROPERTIES
CREATE INDEX idx_properties_city_id ON properties(city_id);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_price ON properties(price_per_night);
CREATE INDEX idx_properties_created_at ON properties(created_at);


EXPLAIN ANALYZE
SELECT * 
FROM bookings 
WHERE status = 'confirmed' 
AND start_date >= '2025-07-01';
