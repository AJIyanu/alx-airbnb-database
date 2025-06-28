-- Seed data for 'states' table
INSERT INTO states (state_id, state_name) VALUES
(GEN_RAND_UUID(), 'Lagos'),
(GEN_RAND_UUID(), 'Rivers'),
(GEN_RAND_UUID(), 'Oyo'),
(GEN_RAND_UUID(), 'Abuja'),
(GEN_RAND_UUID(), 'Kano'),
(GEN_RAND_UUID(), 'Enugu'),
(GEN_RAND_UUID(), 'Delta'),
(GEN_RAND_UUID(), 'Kaduna'),
(GEN_RAND_UUID(), 'Cross River'),
(GEN_RAND_UUID(), 'Ogun');

-- Seed data for 'cities' table (linking to states)
-- Example: SELECT state_id FROM states WHERE state_name = 'Lagos';
INSERT INTO cities (city_id, city_name, state_id) VALUES
(GEN_RAND_UUID(), 'Ikeja', (SELECT state_id FROM states WHERE state_name = 'Lagos')),
(GEN_RAND_UUID(), 'Port Harcourt', (SELECT state_id FROM states WHERE state_name = 'Rivers')),
(GEN_RAND_UUID(), 'Ibadan', (SELECT state_id FROM states WHERE state_name = 'Oyo')),
(GEN_RAND_UUID(), 'Wuse', (SELECT state_id FROM states WHERE state_name = 'Abuja')),
(GEN_RAND_UUID(), 'Kano City', (SELECT state_id FROM states WHERE state_name = 'Kano')),
(GEN_RAND_UUID(), 'Enugu Urban', (SELECT state_id FROM states WHERE state_name = 'Enugu')),
(GEN_RAND_UUID(), 'Warri', (SELECT state_id FROM states WHERE state_name = 'Delta')),
(GEN_RAND_UUID(), 'Zaria', (SELECT state_id FROM states WHERE state_name = 'Kaduna')),
(GEN_RAND_UUID(), 'Calabar', (SELECT state_id FROM states WHERE state_name = 'Cross River')),
(GEN_RAND_UUID(), 'Abeokuta', (SELECT state_id FROM states WHERE state_name = 'Ogun'));

-- Seed data for 'users' table
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
(GEN_RAND_UUID(), 'Adeola', 'Johnson', 'adeola.johnson@example.com', 'hashed_password_1', '+2348012345678', 'guest', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Chinedu', 'Okafor', 'chinedu.okafor@example.com', 'hashed_password_2', '+2347098765432', 'host', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Fatima', 'Abdullahi', 'fatima.abdullahi@example.com', 'hashed_password_3', '+2349034567890', 'guest', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Gbenga', 'Adewale', 'gbenga.adewale@example.com', 'hashed_password_4', '+2348123456789', 'host', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Ngozi', 'Eze', 'ngozi.eze@example.com', 'hashed_password_5', '+2347011223344', 'guest', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Tunde', 'Bakare', 'tunde.bakare@example.com', 'hashed_password_6', '+2348055667788', 'host', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Aisha', 'Mohammed', 'aisha.mohammed@example.com', 'hashed_password_7', '+2349099887766', 'guest', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Emeka', 'Nwosu', 'emeka.nwosu@example.com', 'hashed_password_8', '+2348177665544', 'host', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Blessing', 'Dada', 'blessing.dada@example.com', 'hashed_password_9', '+2347033221100', 'guest', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), 'Kunle', 'Olaleye', 'kunle.olaleye@example.com', 'hashed_password_10', '+2348066554433', 'admin', CURRENT_TIMESTAMP);

-- Seed data for 'properties' table
INSERT INTO properties (property_id, host_id, name, description, city_id, price_per_night, created_at, updated_at) VALUES
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'chinedu.okafor@example.com'), 'Lagos Island Retreat', 'A serene and luxurious apartment with a breathtaking view of the Atlantic, perfect for a getaway.', (SELECT city_id FROM cities WHERE city_name = 'Ikeja'), 75000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'gbenga.adewale@example.com'), 'Portharcourt Garden Villa', 'Spacious villa with a beautiful garden, ideal for families or groups visiting the Garden City.', (SELECT city_id FROM cities WHERE city_name = 'Port Harcourt'), 60000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'tunde.bakare@example.com'), 'Ibadan Hilltop Haven', 'A cozy bungalow nestled on a hill, offering tranquility and stunning views of Ibadan.', (SELECT city_id FROM cities WHERE city_name = 'Ibadan'), 45000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'emeka.nwosu@example.com'), 'Abuja Central Apartment', 'Modern apartment in the heart of Abuja, close to major attractions and business districts.', (SELECT city_id FROM cities WHERE city_name = 'Wuse'), 90000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'chinedu.okafor@example.com'), 'Kano Old City Guesthouse', 'Experience the rich culture of Kano in this traditional guesthouse with modern amenities.', (SELECT city_id FROM cities WHERE city_name = 'Kano City'), 35000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'gbenga.adewale@example.com'), 'Enugu Coal City Pad', 'Comfortable and affordable flat in Enugu, perfect for short or long stays.', (SELECT city_id FROM cities WHERE city_name = 'Enugu Urban'), 30000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'tunde.bakare@example.com'), 'Warri Waterfront Home', 'Riverside property offering a peaceful escape with easy access to Warri\'s vibrant life.', (SELECT city_id FROM cities WHERE city_name = 'Warri'), 55000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'emeka.nwosu@example.com'), 'Zaria University Lodge', 'Conveniently located lodge near Ahmadu Bello University, ideal for academic visitors.', (SELECT city_id FROM cities WHERE city_name = 'Zaria'), 25000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'chinedu.okafor@example.com'), 'Calabar Marina View', 'Stunning apartment overlooking the Calabar Marina, great for leisure and relaxation.', (SELECT city_id FROM cities WHERE city_name = 'Calabar'), 70000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'gbenga.adewale@example.com'), 'Abeokuta Rock Retreat', 'A charming house with a view of Olumo Rock, offering a unique cultural experience.', (SELECT city_id FROM cities WHERE city_name = 'Abeokuta'), 40000.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Seed data for 'bookings' table
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Lagos Island Retreat'), (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com'), '2025-07-10', '2025-07-15', 375000.00, 'confirmed', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Portharcourt Garden Villa'), (SELECT user_id FROM users WHERE email = 'fatima.abdullahi@example.com'), '2025-08-01', '2025-08-07', 360000.00, 'pending', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Ibadan Hilltop Haven'), (SELECT user_id FROM users WHERE email = 'ngozi.eze@example.com'), '2025-09-05', '2025-09-10', 225000.00, 'confirmed', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Abuja Central Apartment'), (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com'), '2025-07-20', '2025-07-22', 180000.00, 'confirmed', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Kano Old City Guesthouse'), (SELECT user_id FROM users WHERE email = 'blessing.dada@example.com'), '2025-08-15', '2025-08-20', 175000.00, 'pending', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Enugu Coal City Pad'), (SELECT user_id FROM users WHERE email = 'fatima.abdullahi@example.com'), '2025-09-01', '2025-09-03', 60000.00, 'confirmed', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Warri Waterfront Home'), (SELECT user_id FROM users WHERE email = 'ngozi.eze@example.com'), '2025-10-10', '2025-10-14', 220000.00, 'pending', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Zaria University Lodge'), (SELECT user_id FROM users WHERE email = 'aisha.mohammed@example.com'), '2025-11-01', '2025-11-05', 125000.00, 'confirmed', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Calabar Marina View'), (SELECT user_id FROM users WHERE email = 'blessing.dada@example.com'), '2025-12-01', '2025-12-04', 210000.00, 'confirmed', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Abeokuta Rock Retreat'), (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com'), '2026-01-01', '2026-01-05', 200000.00, 'pending', CURRENT_TIMESTAMP);

-- Seed data for 'payments' table
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com') AND start_date = '2025-07-10'), 375000.00, CURRENT_TIMESTAMP, 'credit_card'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'fatima.abdullahi@example.com') AND start_date = '2025-08-01'), 360000.00, CURRENT_TIMESTAMP, 'paypal'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'ngozi.eze@example.com') AND start_date = '2025-09-05'), 225000.00, CURRENT_TIMESTAMP, 'stripe'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com') AND start_date = '2025-07-20'), 180000.00, CURRENT_TIMESTAMP, 'credit_card'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'blessing.dada@example.com') AND start_date = '2025-08-15'), 175000.00, CURRENT_TIMESTAMP, 'paypal'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'fatima.abdullahi@example.com') AND start_date = '2025-09-01'), 60000.00, CURRENT_TIMESTAMP, 'stripe'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'ngozi.eze@example.com') AND start_date = '2025-10-10'), 220000.00, CURRENT_TIMESTAMP, 'credit_card'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'aisha.mohammed@example.com') AND start_date = '2025-11-01'), 125000.00, CURRENT_TIMESTAMP, 'paypal'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'blessing.dada@example.com') AND start_date = '2025-12-01'), 210000.00, CURRENT_TIMESTAMP, 'stripe'),
(GEN_RAND_UUID(), (SELECT booking_id FROM bookings WHERE user_id = (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com') AND start_date = '2026-01-01'), 200000.00, CURRENT_TIMESTAMP, 'credit_card');

-- Seed data for 'reviews' table
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Lagos Island Retreat'), (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com'), 5, 'Absolutely stunning! The view was incredible and the apartment was spotless.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Portharcourt Garden Villa'), (SELECT user_id FROM users WHERE email = 'fatima.abdullahi@example.com'), 4, 'Lovely garden and spacious rooms. A great place for a family vacation.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Ibadan Hilltop Haven'), (SELECT user_id FROM users WHERE email = 'ngozi.eze@example.com'), 5, 'Very peaceful and serene. Enjoyed the hilltop views and fresh air.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Abuja Central Apartment'), (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com'), 4, 'Conveniently located and very modern. Perfect for business trips.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Kano Old City Guesthouse'), (SELECT user_id FROM users WHERE email = 'blessing.dada@example.com'), 3, 'An authentic experience, though some amenities could be updated.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Enugu Coal City Pad'), (SELECT user_id FROM users WHERE email = 'fatima.abdullahi@example.com'), 4, 'Good value for money. Clean and comfortable for a short stay.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Warri Waterfront Home'), (SELECT user_id FROM users WHERE email = 'ngozi.eze@example.com'), 5, 'The riverside location was fantastic. Very relaxing and beautiful.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Zaria University Lodge'), (SELECT user_id FROM users WHERE email = 'aisha.mohammed@example.com'), 3, 'Decent place for a quick visit to the university. Basic but functional.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Calabar Marina View'), (SELECT user_id FROM users WHERE email = 'blessing.dada@example.com'), 5, 'Loved waking up to the marina view! The apartment was well-equipped.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT property_id FROM properties WHERE name = 'Abeokuta Rock Retreat'), (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com'), 4, 'Unique location with a great view of Olumo Rock. A memorable stay.', CURRENT_TIMESTAMP);

-- Seed data for 'messages' table
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com'), (SELECT user_id FROM users WHERE email = 'chinedu.okafor@example.com'), 'Hello, is the Lagos Island Retreat available for my dates?', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'chinedu.okafor@example.com'), (SELECT user_id FROM users WHERE email = 'adeola.johnson@example.com'), 'Yes, it is! What dates are you looking at?', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'fatima.abdullahi@example.com'), (SELECT user_id FROM users WHERE email = 'gbenga.adewale@example.com'), 'Hi, I am interested in the Portharcourt Garden Villa. Can I get more details?', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'gbenga.adewale@example.com'), (SELECT user_id FROM users WHERE email = 'fatima.abdullahi@example.com'), 'Certainly! I have sent you a detailed brochure.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'ngozi.eze@example.com'), (SELECT user_id FROM users WHERE email = 'tunde.bakare@example.com'), 'Is the Ibadan Hilltop Haven pet-friendly?', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'tunde.bakare@example.com'), (SELECT user_id FROM users WHERE email = 'ngozi.eze@example.com'), 'Unfortunately, it is not pet-friendly at the moment.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'aisha.mohammed@example.com'), (SELECT user_id FROM users WHERE email = 'emeka.nwosu@example.com'), 'What is the closest landmark to the Abuja Central Apartment?', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'emeka.nwosu@example.com'), (SELECT user_id FROM users WHERE email = 'aisha.mohammed@example.com'), 'It is very close to the Central Business District.', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'blessing.dada@example.com'), (SELECT user_id FROM users WHERE email = 'chinedu.okafor@example.com'), 'Can I get a discount for a longer stay at the Calabar Marina View?', CURRENT_TIMESTAMP),
(GEN_RAND_UUID(), (SELECT user_id FROM users WHERE email = 'chinedu.okafor@example.com'), (SELECT user_id FROM users WHERE email = 'blessing.dada@example.com'), 'Let me check and get back to you on that.', CURRENT_TIMESTAMP);
