-- Drop if exists and create the database
DROP DATABASE IF EXISTS airbnb_mart;        -- wipe any previous run
CREATE DATABASE airbnb_mart
  CHARACTER SET utf8mb4     -- 4‑byte UTF‑8 → full Unicode/emoji support
  COLLATE utf8mb4_0900_ai_ci;       -- accent‑insensitive, case‑insensitive collation
USE airbnb_mart;         -- make it the default schema


-- Stores currencies like USD, EUR
CREATE TABLE currency (
    currency_code CHAR(3)  PRIMARY KEY,         -- ISO 4217 currency codes, e.g. USD, EUR
    name          VARCHAR(50) NOT NULL,     -- US Dollar
    symbol        VARCHAR(10),      -- $
    minor_unit    TINYINT UNSIGNED DEFAULT 2        -- 2 = cents
);


-- Daily exchange rates between currencies
CREATE TABLE fx_rate (
    rate_date      DATE NOT NULL,       -- valuation date
    base_currency  CHAR(3) NOT NULL,        -- EUR
    quote_currency CHAR(3) NOT NULL,        -- USD, GBP, JPY …
    rate_mid       DECIMAL(18,8) NOT NULL,      -- 1 base → ? quote
    fetched_ts     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (rate_date, base_currency, quote_currency),
        CONSTRAINT fk_fx_base
            FOREIGN KEY (base_currency) REFERENCES currency(currency_code)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_fx_quote
            FOREIGN KEY (quote_currency) REFERENCES currency(currency_code)
                ON DELETE CASCADE ON UPDATE CASCADE
);


-- Public profile information
CREATE TABLE `user` (
    user_id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(200)  NOT NULL UNIQUE,
    phone           VARCHAR(32),
    profile_pic     VARCHAR(255),
    date_of_birth   DATE,
    preferred_currency_code CHAR(3) NULL,       -- NULL ⇒ fallback to locale
    create_ts   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
       CONSTRAINT fk_user_currency
            FOREIGN KEY (preferred_currency_code) REFERENCES currency(currency_code)
                ON DELETE SET NULL ON UPDATE CASCADE
);


-- Credential storage (separated from profile for security)
CREATE TABLE user_auth (
  user_id          INT PRIMARY KEY,
  password_hash    VARCHAR(255) NOT NULL,       -- salted + stretched
  hash_algo        VARCHAR(20)  NOT NULL DEFAULT 'bcrypt',      -- hashing algorithm used (e.g. bcrypt, argon2id, scrypt)
  last_login       TIMESTAMP    NULL,
  is_active        TINYINT(1)   NOT NULL DEFAULT 1,
  created_ts       TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_ts       TIMESTAMP    NULL
                  ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_auth_user
      FOREIGN KEY (user_id) REFERENCES `user`(user_id)
            ON DELETE RESTRICT      -- keep the row until the user is wiped
            ON UPDATE CASCADE
);


-- Users who rent out properties
CREATE TABLE host (
    host_id     INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT NOT NULL,
    host_since  DATE NOT NULL,
    CONSTRAINT fk_host_user
        FOREIGN KEY (user_id) REFERENCES `user`(user_id)
            ON DELETE RESTRICT ON UPDATE CASCADE
);


--  Business accounts: one or many employees can book on behalf of a company
CREATE TABLE company (
    company_id     INT AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(150) NOT NULL,
    tax_id         VARCHAR(40)  NULL,       -- VAT / EIN
    billing_email  VARCHAR(200) NULL,
    currency_code  CHAR(3) NOT NULL,        -- default invoicing currency
    created_ts     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_company_currency
            FOREIGN KEY (currency_code) REFERENCES currency(currency_code)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Bridge table: many‑to‑many user ↔ company with roles
CREATE TABLE user_company (
    user_id     INT NOT NULL,
    company_id  INT NOT NULL,
    role        ENUM('employee','manager','finance','admin')
                       NOT NULL DEFAULT 'employee',
    joined_ts   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id, company_id),
        CONSTRAINT fk_uc_user
            FOREIGN KEY (user_id) REFERENCES `user`(user_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_uc_company
            FOREIGN KEY (company_id) REFERENCES company(company_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);


-- GEO HIERARCHY (country → city → address) ->  Allows proper normalisation, geo‑filtering and reuse of reference data.
CREATE TABLE country (
    country_code    CHAR(3) PRIMARY KEY,        -- ISO‑3166‑1 alpha‑3, e.g. USA, DEU, JPN
    name            VARCHAR(100) NOT NULL,
    currency_code CHAR(3)      NOT NULL,
    CONSTRAINT fk_country_currency
        FOREIGN KEY (currency_code)
        REFERENCES currency(currency_code)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE city (
    city_id         INT AUTO_INCREMENT PRIMARY KEY ,
    name            VARCHAR(100) NOT NULL,
    zip             VARCHAR(20),
    country_code    CHAR(3) NOT NULL,
    CONSTRAINT fk_city_country
        FOREIGN KEY (country_code) REFERENCES country(country_code)
            ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE address (
    address_id  INT AUTO_INCREMENT PRIMARY KEY,
    street      VARCHAR(200) NOT NULL,
    street_nr   CHAR(3) NOT NULL,
    city_id     INT NOT NULL,
    lat         DECIMAL(9,6),
    lng         DECIMAL(9,6),
    CONSTRAINT fk_address_city
        FOREIGN KEY (city_id) REFERENCES city(city_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Stores immutable attributes of a property listed for rent (one row per advertised unit).
-- Anything that changes frequently (availability, pricing, reviews) are stored in separate tables.
CREATE TABLE listing (
    listing_id      INT AUTO_INCREMENT PRIMARY KEY,
    host_id         INT NOT NULL,       -- owner/manager (FK → host)
    address_id      INT NOT NULL,       -- physical location (FK → address)
    title           VARCHAR(150) NOT NULL,      -- marketing headline shown in search
    description     TEXT,       -- long‑form description
    property_type   VARCHAR(50),        -- apartment / room / house / chalet ...
    room_type       VARCHAR(50),        -- entire place / private room / shared ...
    max_users       TINYINT UNSIGNED NOT NULL,
    bedrooms        INT,
    beds            INT,
    bathrooms       INT,
    created_ts      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          ENUM('ACTIVE','SUSPENDED','ARCHIVED') NOT NULL DEFAULT 'ACTIVE',
    CONSTRAINT fk_listing_host
        FOREIGN KEY (host_id)    REFERENCES host(host_id)
            ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_listing_address
        FOREIGN KEY (address_id) REFERENCES address(address_id)
            ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Amenity catalogue
CREATE TABLE amenity (
    amenity_id      INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL UNIQUE        -- “Wifi”, “Pool”, ..
);


CREATE TABLE listing_amenity (
    listing_id      INT NOT NULL,
    amenity_id      INT NOT NULL,
    PRIMARY KEY (listing_id, amenity_id),
    CONSTRAINT fk_la_listing
        FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
            ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_la_amenity
        FOREIGN KEY (amenity_id) REFERENCES amenity(amenity_id)
            ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Many‑to‑many: which amenities a listing offers
CREATE TABLE listing_rules (
    rule_id             INT AUTO_INCREMENT PRIMARY KEY,
    listing_id          INT NOT NULL,
    rule_description    TEXT,
    CONSTRAINT fk_lr_listing
        FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
            ON DELETE CASCADE ON UPDATE CASCADE
);


-- Photos of the listing
CREATE TABLE picture (
    pic_id              INT AUTO_INCREMENT PRIMARY KEY,
    listing_id          INT NOT NULL,
    pic                 VARCHAR(255),       -- path / CDN URL
    caption             TEXT,
    main_pic            BOOLEAN,        -- TRUE if cover/thumbnail
        CONSTRAINT fk_picture_listing
            FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
            ON DELETE CASCADE ON UPDATE CASCADE
);


-- Base rate modifiers (weekday, weekend, holiday, promo…)
CREATE TABLE price_rate (
    rate_id               INT PRIMARY KEY AUTO_INCREMENT,
    name                  VARCHAR(50) NOT NULL UNIQUE,        -- 'Weekday', 'Weekend', 'Holiday'
    description           TEXT,
    method                ENUM('MULTIPLY','ADD','OVERRIDE') NOT NULL DEFAULT 'MULTIPLY',       -- how the rate is applied to the base price
    multiplier            DECIMAL(10,4) NOT NULL DEFAULT 1.0000,
        CONSTRAINT chk_pr_positive
            CHECK (multiplier > 0),
    effective_from        DATE NOT NULL DEFAULT '1900-01-01',       -- allow future changes without deleting old rows
    effective_to          DATE NULL,        -- NULL = open‑ended
    created_ts            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_ts            TIMESTAMP NULL
                        ON UPDATE CURRENT_TIMESTAMP

);


-- Calendar reference (one row per calendar day)
CREATE TABLE calendar_day
(
    calendar_date       DATE PRIMARY KEY,
    day_of_week         VARCHAR(10),        -- Monday, Tuesday …
    is_weekend          BOOLEAN,
    is_holiday          BOOLEAN,
    rate_id             INT NOT NULL,       -- default rate for that day
        CONSTRAINT fk_cd_pr
            FOREIGN KEY (rate_id) REFERENCES price_rate (rate_id)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Final computed price for a listing on a day
CREATE TABLE listing_price_rule (
    listing_id          INT NOT NULL,
    calendar_date       DATE NOT NULL,
    rate_id             INT NOT NULL,
    calculated_price    DECIMAL(10,2) NOT NULL,      -- after applying multiplier/add
    created_ts          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (listing_id, calendar_date, rate_id),
        CONSTRAINT fk_lpr_listing
            FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_lpr_calendar
            FOREIGN KEY (calendar_date) REFERENCES calendar_day(calendar_date)
                ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT fk_lpr_rate
            FOREIGN KEY (rate_id) REFERENCES price_rate(rate_id)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Availability flag
CREATE TABLE availability (
  listing_id            INT NOT NULL,
  calendar_date         DATE NOT NULL,
  is_available          BOOLEAN NOT NULL,       -- FALSE once booked / blocked
  PRIMARY KEY (listing_id, calendar_date),
        CONSTRAINT fk_availability_listing
            FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_availability_cd
            FOREIGN KEY (calendar_date) REFERENCES calendar_day(calendar_date)
            ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Guest reservation
CREATE TABLE booking (
    booking_id          INT AUTO_INCREMENT PRIMARY KEY,
    user_id             INT NOT NULL,
    company_id          INT NULL,        -- optional business account
    listing_id          INT NOT NULL,
    check_in            DATE NOT NULL,
    check_out           DATE NOT NULL,
    num_guests          INT DEFAULT 1,
    base_price           DECIMAL(10,2) NOT NULL,        -- before discounts/price_rates
    booking_status      ENUM('pending', 'confirmed', 'cancelled', 'completed') NOT NULL DEFAULT 'pending',
    total_price         DECIMAL(10,2),      -- final amount to be charge
    currency_code       CHAR(3) NOT NULL,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_booking_user
            FOREIGN KEY (user_id) REFERENCES `user`(user_id)
                     ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT fk_booking_company
            FOREIGN KEY (company_id) REFERENCES company(company_id)
                ON DELETE SET NULL ON UPDATE CASCADE,        -- keep booking if company is removed
        CONSTRAINT fk_booking_listing
            FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
                     ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_booking_currency
            FOREIGN KEY (currency_code) REFERENCES currency(currency_code)
                ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT chk_booking_dates
            CHECK (check_out > check_in)
);


-- Cancellation & refunds
CREATE TABLE cancellation (
    cancellation_id     INT AUTO_INCREMENT PRIMARY KEY,
    booking_id          INT NOT NULL,
    cancellation_date   DATETIME,
    reason              TEXT,       -- Reason the guest cancelled the booking
    refund_amount       DECIMAL(10,2),
        CONSTRAINT fk_cancellation_booking
            FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
            ON DELETE CASCADE ON UPDATE CASCADE
);

-- -- Reviews for both hosts and guests
CREATE TABLE review (
    review_id           INT AUTO_INCREMENT PRIMARY KEY,
    booking_id          INT NOT NULL,
    user_id             INT NOT NULL,       -- guest of the booking
    reviewer_id         INT NOT NULL,      -- user who leaves the review
    reviewee_id         INT NOT NULL,      -- user who is being reviewed (host or guest)
    rating              INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment             TEXT,
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_review_booking
             FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
                ON DELETE CASCADE ON UPDATE CASCADE,

        CONSTRAINT fk_review_reviewer
            FOREIGN KEY (reviewer_id) REFERENCES `user`(user_id)
                ON DELETE RESTRICT ON UPDATE CASCADE,

        CONSTRAINT fk_review_reviewee
            FOREIGN KEY (reviewee_id) REFERENCES `user`(user_id)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Payments (one or more per booking)
CREATE TABLE payment (
    payment_id          INT AUTO_INCREMENT PRIMARY KEY,
    booking_id          INT NOT NULL,
    amount              DECIMAL(10,2),
    currency_code       CHAR(3) NOT NULL,       -- in what currency is the payment to be made
    payment_method      ENUM('credit_card', 'paypal', 'stripe', 'bank_transfer') NOT NULL,
    payment_status      ENUM('pending', 'completed', 'failed', 'refunded') NOT NULL DEFAULT 'pending',
    transaction_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_payment_booking
            FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_payment_currency
            FOREIGN KEY (currency_code) REFERENCES currency(currency_code)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Discount codes for bookings
CREATE TABLE promo_code (
  code             VARCHAR(50)  PRIMARY KEY,
  description      TEXT,
  discount_type    ENUM('PERCENT','FIXED') NOT NULL,
  value            DECIMAL(10,2) NOT NULL,      -- % or fixed amount
  currency_code    CHAR(3) NULL,        -- NULL when discount_type='PERCENT'
  usage_limit      INT UNSIGNED  DEFAULT 1,     -- 0 = can be used unlimited times
  per_user_limit   INT UNSIGNED  DEFAULT 1,
  valid_from       DATE NOT NULL,
  valid_to         DATE NOT NULL,
  is_active        TINYINT(1) NOT NULL DEFAULT 1,
  created_ts       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_by       INT NULL,        -- admin who created it
        CONSTRAINT fk_pc_currency
            FOREIGN KEY (currency_code) REFERENCES currency(currency_code)
                ON DELETE RESTRICT ON UPDATE CASCADE,
        CONSTRAINT fk_pc_creator
            FOREIGN KEY (created_by) REFERENCES `user`(user_id)
                ON DELETE SET NULL ON UPDATE CASCADE,
        CONSTRAINT chk_pc_percent
            CHECK ( (discount_type='PERCENT' AND value BETWEEN 0 AND 100)
                OR (discount_type='FIXED' AND value  > 0) )
);


-- Promo redemption log
CREATE TABLE promo_redemption (
  promo_code  VARCHAR(50) NOT NULL,
  booking_id  INT NOT NULL,
  user_id     INT NOT NULL,
  redeemed_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  discount_applied DECIMAL(10,2) NOT NULL,

        PRIMARY KEY (promo_code, booking_id),
        CONSTRAINT fk_pr_promo
            FOREIGN KEY (promo_code) REFERENCES promo_code(code)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_pr_booking
            FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_pr_user
            FOREIGN KEY (user_id)    REFERENCES `user`(user_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);


-- Conversation (chat thread)
CREATE TABLE conversation (
    conversation_id     INT AUTO_INCREMENT PRIMARY KEY,
    booking_id          INT NULL,       -- nullable: supports pre-booking chats
    created_at          TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_conv_booking
            FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
                ON DELETE SET NULL ON UPDATE CASCADE
);


-- Participants in a conversation
CREATE TABLE conversation_participant (
    conversation_id     INT NOT NULL,
    user_id             INT NOT NULL,
    PRIMARY KEY (conversation_id, user_id),
        CONSTRAINT fk_cp_conv
            FOREIGN KEY (conversation_id) REFERENCES conversation(conversation_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_cp_user
            FOREIGN KEY (user_id) REFERENCES `user`(user_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);


-- Chat messages
CREATE TABLE message (
    message_id          INT AUTO_INCREMENT PRIMARY KEY,
    conversation_id     INT NOT NULL,
    parent_message_id   INT NULL,       -- for threading
    sender_id           INT NOT NULL,
    body                TEXT NOT NULL,
    sent_at             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_automated        BOOLEAN DEFAULT FALSE,  -- TRUE for automatic “booking confirmed” notes
        CONSTRAINT fk_msg_conv
            FOREIGN KEY (conversation_id) REFERENCES conversation(conversation_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
         CONSTRAINT fk_msg_parent
        FOREIGN KEY (parent_message_id) REFERENCES message(message_id)
                ON DELETE SET NULL           -- keep replies if parent is deleted
        ON UPDATE CASCADE,
        CONSTRAINT fk_msg_sender
            FOREIGN KEY (sender_id) REFERENCES `user`(user_id)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Customer support tickets
CREATE TABLE support_ticket (
    ticket_id            INT AUTO_INCREMENT PRIMARY KEY,
    user_id              INT NULL,
    subject              VARCHAR(100),
    description          TEXT,
    status               ENUM('open', 'resolved', 'closed') NOT NULL DEFAULT 'open',
    created_ts           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_ticket_user
            FOREIGN KEY (user_id) REFERENCES `user`(user_id)
                ON DELETE SET NULL ON UPDATE CASCADE
);


-- Referral programme
CREATE TABLE user_referral (
    referrer_id         INT NULL,       -- could be NULL for organic sign-ups
    referred_id         INT PRIMARY KEY,        -- each user is referred at most once
    referred_ts         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_ur_referrer
            FOREIGN KEY (referrer_id) REFERENCES `user`(user_id)
                ON DELETE SET NULL ON UPDATE CASCADE,
        CONSTRAINT fk_ur_referred
            FOREIGN KEY (referred_id) REFERENCES `user`(user_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);

-- Table to store each language
CREATE TABLE language (
    language_code   CHAR(2) PRIMARY KEY,        -- ISO‑639‑1
    name            VARCHAR(50) NOT NULL
);


-- Languages a user speaks
CREATE TABLE user_language (
    user_id        INT NOT NULL,
    language_code  CHAR(2) NOT NULL,
    added_ts       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id, language_code),
        CONSTRAINT fk_ul_user
            FOREIGN KEY (user_id) REFERENCES `user`(user_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_ul_language
            FOREIGN KEY (language_code) REFERENCES language(language_code)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Languages a host supports per listing
CREATE TABLE host_listing_language (
    host_id         INT NOT NULL,
    listing_id      INT NOT NULL,
    language_code   CHAR(2) NOT NULL,
    added_ts        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (host_id, listing_id, language_code),
        CONSTRAINT fk_hll_host
            FOREIGN KEY (host_id) REFERENCES host(host_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_hll_listing
            FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_hll_language
            FOREIGN KEY (language_code) REFERENCES language(language_code)
                ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Searches executed by users or anonymous sessions
CREATE TABLE search_history (
    search_id       BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id         INT NULL,       -- NULL = not logged-in
    session_id      CHAR(36) NOT NULL,      -- random v4-UUID session identifier
    origin_city     VARCHAR(100) NULL,
    check_in        DATE NULL,
    check_out       DATE NULL,
    guests          TINYINT UNSIGNED,
    query_text      VARCHAR(255) NULL,      -- free-text (“ski cabin”)
    lat             DECIMAL(9,6) NULL,      -- latitude for map planning
    lng             DECIMAL(9,6) NULL,      -- longitude for map planning
    created_ts      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_sh_user
            FOREIGN KEY (user_id) REFERENCES `user`(user_id)
                ON DELETE SET NULL ON UPDATE CASCADE
);


-- Wish‑lists (collections of favourite listings)
CREATE TABLE wishlist (
    wishlist_id   INT AUTO_INCREMENT PRIMARY KEY,
    user_id       INT NOT NULL,
    name          VARCHAR(100) NOT NULL,
    is_default    BOOLEAN NOT NULL DEFAULT FALSE,      -- marks one wish-list as the user's "main" list
    created_ts    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_wl_user
            FOREIGN KEY (user_id) REFERENCES `user`(user_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);


-- Listings saved to a wish‑list
CREATE TABLE wishlist_item (
    wishlist_id   INT NOT NULL,
    listing_id    INT NOT NULL,
    added_ts      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (wishlist_id, listing_id),
        CONSTRAINT fk_wli_wishlist
            FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id)
                ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT fk_wli_listing
            FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
                ON DELETE CASCADE ON UPDATE CASCADE
);



