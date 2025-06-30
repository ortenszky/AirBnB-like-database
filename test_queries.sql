USE airbnb_mart;

-- Currency table -> Returns all information about the currency that uses the symbol '€', which is the Euro.
SELECT * FROM currency WHERE symbol = '€';


-- fx_rate table -> Shows the exchange rate from Euro to Swiss Franc (CHF) on June 23, 2025.
SELECT rate_mid AS 'Euro to CHF exchange rate on the 23rd of june, 2025'
FROM fx_rate
WHERE rate_date = '2025-06-23'
  AND base_currency = 'EUR'
  AND quote_currency = 'CHF';

-- user table -> Lists all users whose preferred currency is set to Swiss Franc (CHF).
SELECT first_name, last_name, preferred_currency_code
FROM user
WHERE preferred_currency_code = 'CHF';


-- user_auth table -> Counts the total number of active user accounts in the user_auth table.
SELECT COUNT(*) AS active_users
FROM user_auth
WHERE is_active = 1;


-- host table -> Shows the first 5 hosts and their listing titles, ordered by how long they've been hosting (earliest first).
SELECT
  h.host_id,
  u.first_name,
  u.last_name,
  h.host_since,
  l.title AS listing_title
FROM host h
JOIN user u ON h.user_id = u.user_id
JOIN listing l ON h.host_id = l.host_id
ORDER BY h.host_since ASC
LIMIT 5;


-- company table -> Retrieves companies whose tax ID starts with 'DE', indicating they are registered in Germany.
SELECT name, tax_id
FROM company
WHERE tax_id LIKE 'DE%';


-- user_company -> Lists all users who have the role of 'manager' in their associated companies.
SELECT u.first_name, u.last_name, c.name AS company, uc.role
FROM user_company uc
JOIN user u ON uc.user_id = u.user_id
JOIN company c ON uc.company_id = c.company_id
WHERE uc.role = 'manager';


-- country table -> Shows how many listings exist in each country based on address linkage.
SELECT co.name AS country, COUNT(li.listing_id) AS total_listings
FROM country co
JOIN city ci ON co.country_code = ci.country_code
JOIN address a ON ci.city_id = a.city_id
JOIN listing li ON a.address_id = li.address_id
GROUP BY co.name
ORDER BY total_listings DESC
LIMIT 5;


-- city table -> Returns the name and postal code of the cities in the USA.
SELECT name, zip
FROM city
WHERE country_code = 'USA';


-- address table -> Shows the addresses in the city of Berlin.
SELECT a.street, a.street_nr, ci.name AS city
FROM address a
JOIN city ci ON a.city_id = ci.city_id
WHERE ci.name = 'Berlin';


-- listing table -> Shows listings where at least 4 guests can stay.
SELECT l.title, h.host_id, u.first_name
FROM listing l
JOIN host h ON l.host_id = h.host_id
JOIN user u ON h.user_id = u.user_id
WHERE l.max_users >= 4;


-- amenity table -> Shows listings where at least 4 guests can stay.
SELECT COUNT(*) AS total_amenities
FROM amenity;


-- listing_amenity table -> Shows which amenities are most common across all listings.
SELECT a.name AS amenity, COUNT(*) AS listing_count
FROM listing_amenity la
JOIN amenity a ON la.amenity_id = a.amenity_id
GROUP BY a.name
ORDER BY listing_count DESC
LIMIT 5;


-- listing_rules table -> Finds all listings with a rule mentioning pets.
SELECT l.title, lr.rule_description
FROM listing_rules lr
JOIN listing l ON lr.listing_id = l.listing_id
WHERE lr.rule_description LIKE '%pet%';


-- picture table -> Retrieves the main picture and caption for 5 listings.
SELECT l.title, p.pic, p.caption
FROM picture p
JOIN listing l ON p.listing_id = l.listing_id
WHERE p.main_pic = TRUE
LIMIT 5;


-- price_rate table -> Retrieves surcharges where the multiplier increases the base price.
SELECT name, method, multiplier
FROM price_rate
WHERE method = 'MULTIPLY' AND multiplier > 1.0;


-- calendar_day table -> Finds Fridays that are also holidays.
SELECT calendar_date, day_of_week, is_holiday
FROM calendar_day
WHERE day_of_week = 'Friday' AND is_holiday = TRUE;


-- listing_price_rule table -> Shows listings with high daily prices (over €200), sorted from most to least expensive.
SELECT l.title, lpr.calendar_date, lpr.calculated_price
FROM listing_price_rule lpr
JOIN listing l ON lpr.listing_id = l.listing_id
WHERE lpr.calculated_price > 200
ORDER BY lpr.calculated_price DESC;


-- availability table -> Lists unavailable dates for the ‘Capitol Hill Apartment’, ordered chronologically.
SELECT l.title, a.calendar_date
FROM availability a
JOIN listing l ON a.listing_id = l.listing_id
WHERE a.is_available = FALSE AND l.title = 'Capitol Hill Apartment'
ORDER BY a.calendar_date;


-- booking table -> Lists 5 confirmed bookings with guest name, listing title and total price.
SELECT b.booking_id, u.first_name, l.title, b.total_price
FROM booking b
JOIN user u ON b.user_id = u.user_id
JOIN listing l ON b.listing_id = l.listing_id
WHERE b.booking_status = 'confirmed'
LIMIT 5;


-- cancellation table -> Shows cancellations with large refunds, including who booked and why they cancelled.
SELECT c.booking_id, b.user_id, c.reason, c.refund_amount
FROM cancellation c
JOIN booking b ON c.booking_id = b.booking_id
WHERE c.refund_amount > 100
LIMIT 5;


-- review table -> Lists recent negative reviews (rating below 4), showing reviewer name and comment.
SELECT u.first_name AS reviewer, r.rating, r.comment
FROM review r
JOIN user u ON r.reviewer_id = u.user_id
WHERE r.rating < 4
ORDER BY r.created_at DESC;


-- payment table -> Groups successful payments by method (e.g., Stripe, PayPal).
SELECT payment_method, COUNT(*) AS total, SUM(amount) AS total_amount
FROM payment
WHERE payment_status = 'completed'
GROUP BY payment_method
ORDER BY total_amount DESC;


-- promo_code table -> Lists currently valid and active promo codes.
SELECT code, discount_type, value
FROM promo_code
WHERE is_active = 1 AND valid_to >= CURRENT_DATE
LIMIT 5;


-- promo_redemption table -> Aggregates how often each promo code was used.
SELECT pr.promo_code, COUNT(*) AS redemptions, SUM(pr.discount_applied) AS total_discount
FROM promo_redemption pr
GROUP BY pr.promo_code
ORDER BY total_discount DESC
LIMIT 5;


-- conversation table -> Finds conversations not linked to a booking (pre-booking discussions).
SELECT c.conversation_id, b.booking_id, c.created_at
FROM conversation c
LEFT JOIN booking b ON c.booking_id = b.booking_id
WHERE b.booking_id IS NULL;


-- conversation_participant table -> Lists all participants in conversation #10.
SELECT cp.conversation_id, u.first_name
FROM conversation_participant cp
JOIN user u ON cp.user_id = u.user_id
WHERE cp.conversation_id = 10;


-- message table -> Retrieves all messages in a specific conversation, ordered by time.
SELECT m.body, u.first_name, m.sent_at
FROM message m
JOIN user u ON m.sender_id = u.user_id
WHERE m.conversation_id = 5
ORDER BY m.sent_at;


-- support_ticket table -> Shows all open support tickets and who submitted them.
SELECT st.ticket_id, u.first_name, st.subject, st.status
FROM support_ticket st
LEFT JOIN user u ON st.user_id = u.user_id
WHERE st.status = 'open';


-- user_referral table -> Lists who referred whom, with their names and sign-up timestamps.
SELECT u1.first_name AS referrer, u2.first_name AS referred, ur.referred_ts
FROM user_referral ur
JOIN user u1 ON ur.referrer_id = u1.user_id
JOIN user u2 ON ur.referred_id = u2.user_id
ORDER BY ur.referred_ts DESC
LIMIT 5;


-- language table -> Finds languages whose names contain “an” (e.g., Spanish, Mandarin, German).
SELECT *
FROM language
WHERE name LIKE '%an%';


-- user_language table -> Displays 5 users and the languages they speak.
SELECT u.first_name, l.name AS language
FROM user_language ul
JOIN user u ON ul.user_id = u.user_id
JOIN language l ON ul.language_code = l.language_code
LIMIT 5;


-- host_listing_language table -> Shows which languages each listing supports, as declared by the host.
SELECT h.host_id, l.title, lang.name AS language
FROM host_listing_language hll
JOIN host h ON hll.host_id = h.host_id
JOIN listing l ON hll.listing_id = l.listing_id
JOIN language lang ON hll.language_code = lang.language_code
LIMIT 5;


-- search_history table -> Finds searches for larger groups (3+) that included the word ‘pool’.
SELECT query_text, origin_city, check_in, check_out
FROM search_history
WHERE guests >= 3 AND query_text LIKE '%pool';


-- wishlist table -> Shows 5 wishlists and how many listings are saved in each.
SELECT w.name, COUNT(wi.listing_id) AS total_items
FROM wishlist w
JOIN wishlist_item wi ON w.wishlist_id = wi.wishlist_id
GROUP BY w.name
ORDER BY total_items DESC
LIMIT 5;


-- wishlist_item table -> Displays who saved what, to which wishlist.
SELECT u.first_name, l.title, w.name AS wishlist_name
FROM wishlist_item wi
JOIN wishlist w ON wi.wishlist_id = w.wishlist_id
JOIN listing l ON wi.listing_id = l.listing_id
JOIN user u ON w.user_id = u.user_id
ORDER BY wi.added_ts DESC
LIMIT 5;


-- Triple relationship -> Shows completed payments linked to bookings and users — useful for transaction history, receipts, or financial dashboards.
SELECT
  u.first_name, u.last_name,
  b.booking_id, b.total_price,
  p.payment_method, p.amount
FROM user u
JOIN booking b ON u.user_id = b.user_id
JOIN payment p ON b.booking_id = p.booking_id
WHERE p.payment_status = 'completed';