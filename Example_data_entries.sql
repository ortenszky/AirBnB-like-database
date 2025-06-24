USE airbnb_mart;         -- make it the default schema


INSERT INTO currency (currency_code, name, symbol, minor_unit) VALUES
  -- America
  ('USD', 'US Dollar', '$', 2),
  ('CAD', 'Canadian Dollar', '$', 2),
  ('MXN', 'Mexican Peso', '$', 2),
  ('BRL', 'Brazilian Real', 'R$', 2),
  ('ARS', 'Argentine Peso', '$', 2),
  ('CLP', 'Chilean Peso', '$', 0),
  ('COP', 'Colombian Peso', '$', 2),
  ('PEN', 'Peruvian Sol', 'S/', 2),
  ('UYU', 'Uruguayan Peso', '$', 2),

  -- Europe
  ('EUR', 'Euro', '€', 2),
  ('GBP', 'British Pound', '£', 2),
  ('CHF', 'Swiss Franc', 'CHF', 2),
  ('SEK', 'Swedish Krona', 'kr', 2),
  ('NOK', 'Norwegian Krone', 'kr', 2),
  ('DKK', 'Danish Krone', 'kr', 2),
  ('CZK', 'Czech Koruna', 'Kč', 2),
  ('PLN', 'Polish Złoty', 'zł', 2),
  ('HUF', 'Hungarian Forint', 'Ft', 2),
  ('RON', 'Romanian Leu', 'lei', 2),
  ('RUB', 'Russian Ruble', '₽', 2),
  ('TRY', 'Turkish Lira', '₺', 2),
  ('ISK', 'Icelandic Króna', 'kr', 0),
  ('BGN', 'Bulgarian Lev', 'лв', 2),

  -- Middle East & North Africa
  ('AED', 'UAE Dirham', 'د.إ', 2),
  ('SAR', 'Saudi Riyal', '﷼', 2),
  ('QAR', 'Qatari Riyal', '﷼', 2),
  ('KWD', 'Kuwaiti Dinar', 'د.ك', 3),
  ('OMR', 'Omani Rial', '﷼', 3),
  ('BHD', 'Bahraini Dinar', 'ب.د', 3),
  ('ILS', 'Israeli New Shekel', '₪', 2),
  ('EGP', 'Egyptian Pound', '£', 2),
  ('MAD', 'Moroccan Dirham', 'د.م.', 2),
  ('DZD', 'Algerian Dinar', 'دج', 2),
  ('TND', 'Tunisian Dinar', 'د.ت', 3),

  -- Africa (Sub‑Saharan)
  ('ZAR', 'South African Rand', 'R', 2),
  ('NGN', 'Nigerian Naira', '₦', 2),
  ('GHS', 'Ghanaian Cedi', '₵', 2),
  ('KES', 'Kenyan Shilling', 'KSh', 2),
  ('TZS', 'Tanzanian Shilling', 'TSh', 2),
  ('UGX', 'Ugandan Shilling', 'USh', 0),
  ('XOF', 'West African CFA Franc', 'Fr', 0),
  ('XAF', 'Central African CFA Franc', 'Fr', 0),

  -- Asia‑Pacific
  ('JPY', 'Japanese Yen', '¥', 0),
  ('CNY', 'Chinese Yuan', '¥', 2),
  ('HKD', 'Hong Kong Dollar', '$', 2),
  ('TWD', 'New Taiwan Dollar', '$', 2),
  ('KRW', 'South Korean Won', '₩', 0),
  ('SGD', 'Singapore Dollar', '$', 2),
  ('MYR', 'Malaysian Ringgit', 'RM', 2),
  ('THB', 'Thai Baht', '฿', 2),
  ('IDR', 'Indonesian Rupiah', 'Rp', 2),
  ('PHP', 'Philippine Peso', '₱', 2),
  ('VND', 'Vietnamese Đồng', '₫', 0),
  ('INR', 'Indian Rupee', '₹', 2),
  ('PKR', 'Pakistani Rupee', '₨', 2),
  ('BDT', 'Bangladeshi Taka', '৳', 2),
  ('LKR', 'Sri Lankan Rupee', 'රු', 2),
  ('AUD', 'Australian Dollar', '$', 2),
  ('NZD', 'New Zealand Dollar', '$', 2);


-- Daily FX rates for valuation date 23 Jun 2025, base currency is always EUR
-- Source: European Central Bank reference rates published 24 Jun 2025
INSERT INTO fx_rate (rate_date, base_currency, quote_currency, rate_mid)
VALUES
  -- Americas ---------------------------------------------------------------
  ('2025-06-23','EUR','USD',  1.14720000),
  ('2025-06-23','EUR','BRL',  6.35810000),
  ('2025-06-23','EUR','CAD',  1.58180000),
  ('2025-06-23','EUR','MXN', 22.08620000),

  -- EMEA -------------------------------------------------------------------
  ('2025-06-23','EUR','GBP',  0.85670000),
  ('2025-06-23','EUR','CHF',  0.93870000),
  ('2025-06-23','EUR','NOK', 11.66350000),
  ('2025-06-23','EUR','SEK', 11.16350000),
  ('2025-06-23','EUR','DKK',  7.45950000),
  ('2025-06-23','EUR','BGN',  1.95580000),
  ('2025-06-23','EUR','CZK', 24.86200000),
  ('2025-06-23','EUR','HUF',404.23000000),
  ('2025-06-23','EUR','PLN',  4.27550000),
  ('2025-06-23','EUR','RON',  5.04510000),
  ('2025-06-23','EUR','ISK',143.00000000),
  ('2025-06-23','EUR','TRY', 45.57800000),
  ('2025-06-23','EUR','ZAR', 20.77290000),

  -- Asia / Pacific ---------------------------------------------------------
  ('2025-06-23','EUR','JPY',169.27000000),
  ('2025-06-23','EUR','CNY',  8.24420000),
  ('2025-06-23','EUR','HKD',  9.00550000),
  ('2025-06-23','EUR','IDR',18931.44000000),
  ('2025-06-23','EUR','ILS',  3.98610000),
  ('2025-06-23','EUR','INR', 99.53500000),
  ('2025-06-23','EUR','KRW',1592.49000000),
  ('2025-06-23','EUR','MYR',  4.92720000),
  ('2025-06-23','EUR','PHP', 66.09500000),
  ('2025-06-23','EUR','SGD',  1.48290000),
  ('2025-06-23','EUR','THB', 37.81200000),
  ('2025-06-23','EUR','AUD',  1.79630000),
  ('2025-06-23','EUR','NZD',  1.94540000);



-- 20 illustrative user profiles
INSERT INTO `user`
    (first_name, last_name, email, phone, profile_pic,
     date_of_birth, preferred_currency_code)
VALUES
  -- 1
  ('Alice',  'Smith',     'alice.smith@example.com',  '+1-202-555-0101',
   'https://cdn.example.com/pp/alice.jpg',  '1990-03-15', 'USD'),

  -- 2
  ('Bob',    'Johnson',   'bob.johnson@example.com',  '+1-202-555-0102',
   NULL,                         '1985-07-22', 'EUR'),

  -- 3
  ('Carol',  'Davis',     'carol.davis@example.com',  '+44 7700 900103',
   'https://cdn.example.com/pp/carol.jpg',  '1992-11-09', 'GBP'),

  -- 4
  ('David',  'Miller',    'd.miller@example.com',     '+1-202-555-0104',
   NULL,                         '1978-05-30', 'CHF'),

  -- 5
  ('Emma',   'Wilson',    'emma.wilson@example.com',  '+61 4 1234 5675',
   'https://cdn.example.com/pp/emma.jpg',   '1995-01-18', 'AUD'),

  -- 6
  ('Frank',  'Moore',     'frank.moore@example.com',  '+1-202-555-0106',
   NULL,                         '1982-12-03', 'CAD'),

  -- 7
  ('Grace',  'Taylor',    'grace.taylor@example.com', '+1-202-555-0107',
   'https://cdn.example.com/pp/grace.jpg',  '2000-09-27', NULL),

  -- 8
  ('Henry',  'Anderson',  'henry.a@example.com',      '+1-202-555-0108',
   NULL,                         '1993-04-11', 'JPY'),

  -- 9
  ('Irene',  'Thomas',    'irene.thomas@example.com', '+34 612 345 678',
   'https://cdn.example.com/pp/irene.jpg',  '1988-08-19', 'EUR'),

  -- 10
  ('Jack',   'Jackson',   'jack.jackson@example.com', '+49 151 12345679',
   NULL,                         '2001-02-07', 'CHF'),

  -- 11
  ('Karen',  'White',     'karen.white@example.com',  '+1-202-555-0111',
   'https://cdn.example.com/pp/karen.jpg',  '1975-06-14', 'USD'),

  -- 12
  ('Liam',   'Harris',    'liam.harris@example.com',  '+353 85 123 4567',
   NULL,                         '1998-10-01', 'GBP'),

  -- 13
  ('Mia',    'Martin',    'mia.martin@example.com',   '+1-202-555-0113',
   'https://cdn.example.com/pp/mia.jpg',    '1996-12-25', NULL),

  -- 14
  ('Noah',   'Thompson',  'noah.t@example.com',       '+1-202-555-0114',
   NULL,                         '1981-03-05', 'NZD'),

  -- 15
  ('Olivia', 'Garcia',    'olivia.garcia@example.com','+52 55 1234 5678',
   'https://cdn.example.com/pp/olivia.jpg', '1994-07-31', 'MXN'),

  -- 16
  ('Paul',   'Martinez',  'paul.martinez@example.com','+1-202-555-0116',
   NULL,                         '1979-01-09', 'USD'),

  -- 17
  ('Quinn',  'Robinson',  'quinn.robinson@example.com','+1-202-555-0117',
   'https://cdn.example.com/pp/quinn.jpg',  '2002-05-16', 'EUR'),

  -- 18
  ('Ruby',   'Clark',     'ruby.clark@example.com',   '+27 72 123 4567',
   NULL,                         '1987-09-12', 'ZAR'),

  -- 19
  ('Samuel', 'Rodriguez', 'sam.rodriguez@example.com','+1-202-555-0119',
   'https://cdn.example.com/pp/samuel.jpg', '1991-11-29', 'ARS'),

  -- 20
  ('Tina',   'Lewis',     'tina.lewis@example.com',   '+1-202-555-0120',
   NULL,                         '1997-04-23', NULL),

  -- 21
  ('Uma',      'Bennett',   'uma.bennett@example.com',  '+1-202-555-0121',
   NULL,                         '1986-10-11', 'USD'),

  -- 22
  ('Victor',   'Hughes',    'victor.hughes@example.com','+44 7700 900122',
   'https://cdn.example.com/pp/victor.jpg', '1993-02-17', 'GBP'),

  -- 23
  ('Wendy',    'Perez',     'wendy.perez@example.com',  '+52 55 6543 2100',
   NULL,                         '1991-08-04', 'MXN'),

  -- 24
  ('Xavier',   'Flores',    'xavier.flores@example.com','+34 611 222 333',
   'https://cdn.example.com/pp/xavier.jpg', '1997-12-29', 'EUR'),

  -- 25
  ('Yara',     'Nguyen',    'yara.nguyen@example.com',  '+61 4 5555 0125',
   NULL,                         '1995-05-13', 'AUD'),

  -- 26
  ('Zane',     'Kim',       'zane.kim@example.com',     '+82 10-9876-0126',
   'https://cdn.example.com/pp/zane.jpg',   '1989-01-30', 'KRW'),

  -- 27
  ('Abel',     'Lopez',     'abel.lopez@example.com',   '+34 622 123 456',
   NULL,                         '1994-07-21', NULL),

  -- 28
  ('Bianca',   'Gonzalez',  'bianca.gonzalez@example.com','+1-202-555-0128',
   NULL,                         '1983-03-09', 'USD'),

  -- 29
  ('Carter',   'Ward',      'carter.ward@example.com',  '+1-202-555-0129',
   'https://cdn.example.com/pp/carter.jpg',  '2001-11-27', 'CAD'),

  -- 30
  ('Diana',    'Foster',    'diana.foster@example.com', '+1-202-555-0130',
   NULL,                         '1999-09-15', NULL),

  -- 31
  ('Ethan',    'Bailey',    'ethan.bailey@example.com', '+49 151 23456731',
   'https://cdn.example.com/pp/ethan.jpg',  '1987-04-02', 'CHF'),

  -- 32
  ('Farah',    'Ali',       'farah.ali@example.com',    '+971 50 123 4567',
   NULL,                         '1990-06-18', 'AED'),

  -- 33
  ('Gavin',    'Scott',     'gavin.scott@example.com',  '+353 85 987 3333',
   'https://cdn.example.com/pp/gavin.jpg',  '1982-02-23', 'EUR'),

  -- 34
  ('Hannah',   'Murphy',    'hannah.murphy@example.com','+44 7700 900134',
   NULL,                         '1996-12-08', 'GBP'),

  -- 35
  ('Ismael',   'Silva',     'ismael.silva@example.com', '+55 21 91234 0135',
   'https://cdn.example.com/pp/ismael.jpg', '1984-05-26', 'BRL'),

  -- 36
  ('Jade',     'Khan',      'jade.khan@example.com',    '+92 300 111 0136',
   NULL,                         '1993-10-12', NULL),

  -- 37
  ('Ken',      'Wu',        'ken.wu@example.com',       '+886 912 345 137',
   'https://cdn.example.com/pp/ken.jpg',    '1998-01-17', 'TWD'),

  -- 38
  ('Lola',     'Dupont',    'lola.dupont@example.com',  '+33 6 12 34 56 38',
   NULL,                         '1992-07-07', 'EUR'),

  -- 39
  ('Marco',    'Rossi',     'marco.rossi@example.com',  '+39 347 1234 139',
   'https://cdn.example.com/pp/marco.jpg',  '1981-11-03', 'EUR'),

  -- 40
  ('Nina',     'Meier',     'nina.meier@example.com',   '+41 79 321 0140',
   NULL,                         '1994-04-30', 'CHF'),

  -- 41
  ('Omar',     'Aziz',      'omar.aziz@example.com',    '+20 100 222 0141',
   'https://cdn.example.com/pp/omar.jpg',   '1988-08-22', 'EGP'),

  -- 42
  ('Pia',      'Johansson', 'pia.johansson@example.com','+46 70 123 0142',
   NULL,                         '2000-02-02', 'SEK'),

  -- 43
  ('Qi',       'Zhang',     'qi.zhang@example.com',     '+86 138 0000 0143',
   'https://cdn.example.com/pp/qi.jpg',     '1997-09-19', 'CNY'),

  -- 44
  ('Rafael',   'Costa',     'rafael.costa@example.com', '+351 912 345 144',
   NULL,                         '1985-06-11', 'EUR'),

  -- 45
  ('Sara',     'O\'Connor', 'sara.oconnor@example.com', '+1-202-555-0145',
   'https://cdn.example.com/pp/sara.jpg',   '1991-12-14', 'USD'),

  -- 46
  ('Tom',      'Lee',       'tom.lee@example.com',      '+82 10-2222-0146',
   NULL,                         '1989-03-05', 'KRW'),

  -- 47
  ('Ursula',   'Keller',    'ursula.keller@example.com','+41 78 555 0147',
   'https://cdn.example.com/pp/ursula.jpg', '1979-05-18', NULL),

  -- 48
  ('Victor',   'Ivanov',    'victor.ivanov@example.com','+7 916 555 0148',
   NULL,                         '1986-01-28', 'RUB'),

  -- 49
  ('Warda',    'Mohamed',   'warda.m@example.com',      '+254 712 345 149',
   'https://cdn.example.com/pp/warda.jpg',  '1993-11-07', 'KES'),

  -- 50
  ('Ximena',   'Torres',    'ximena.torres@example.com','+57 320 555 0150',
   NULL,                         '1990-05-24', 'COP'),

  -- 51
  ('Yusuf',    'Demir',     'yusuf.demir@example.com',  '+90 535 555 0151',
   'https://cdn.example.com/pp/yusuf.jpg',  '1994-02-13', 'TRY'),

  -- 52
  ('Zoey',     'Lam',       'zoey.lam@example.com',     '+852 9123 0152',
   NULL,                         '1998-08-30', 'HKD'),

  -- 53
  ('Andre',    'Peterson',  'andre.peterson@example.com','+1-202-555-0153',
   'https://cdn.example.com/pp/andre.jpg',  '1982-06-09', 'USD'),

  -- 54
  ('Bella',    'Vega',      'bella.vega@example.com',   '+34 613 555 0154',
   NULL,                         '1996-03-16', 'EUR'),

  -- 55
  ('Chloe',    'Reed',      'chloe.reed@example.com',   '+1-202-555-0155',
   'https://cdn.example.com/pp/chloe.jpg',  '1988-10-27', 'USD'),

  -- 56
  ('Diego',    'Mendez',    'diego.mendez@example.com', '+52 55 8765 0156',
   NULL,                         '1992-12-05', 'MXN'),

  -- 57
  ('Elina',    'Korhonen',  'elina.korhonen@example.com','+358 40 123 0157',
   'https://cdn.example.com/pp/elina.jpg',  '1995-07-11', 'EUR'),

  -- 58
  ('Felix',    'Schmidt',   'felix.schmidt@example.com','+49 152 555 0158',
   NULL,                         '1981-01-04', 'EUR'),

  -- 59
  ('Giulia',   'Bianchi',   'giulia.bianchi@example.com','+39 348 555 0159',
   'https://cdn.example.com/pp/giulia.jpg', '1997-05-09', 'EUR'),

  -- 60
  ('Hugo',     'Nielsen',   'hugo.nielsen@example.com', '+45 31 12 01 60',
   NULL,                         '1983-09-22', 'DKK');


-- Seed data: user_auth (bcrypt hashes, active = 1 by default)
INSERT INTO user_auth (user_id, password_hash) VALUES
  ( 1, '$2b$12$eTByJ1C5RVHMXHtcwPa5E.GuCd9vNnniOybS/pY5Pja/qvpDMAYA2'),
  ( 2, '$2b$12$XQ4XSG3L0eD6/rs24kq5c.eYf9fbQ3VIAtF5NCz7k3A5kZZgwyU9G'),
  ( 3, '$2b$12$XZD0rGUNShUM3R.x6GHFMOl6VwB3p6k9R/+qvOB0fOkH1ZZ1xdjIi'),
  ( 4, '$2b$12$PL1vGjYH6G6wNWJzi10BG.vdoo6gWQBaIjXImQxGc1dQc5s.AGXnW'),
  ( 5, '$2b$12$TdY9QW/KpZ6YG1ChB7sSYOBVbWcv16O3MHuvb6jVWeItPxX2VINeW'),
  ( 6, '$2b$12$fM/dwZ0pQfM9vDOMkMt2veI9l8kdFMvx6bMpiKFFitvolG/G5hgbK'),
  ( 7, '$2b$12$dldyTz7kKIhxX3sI5YucsOV9ox96D65gis6pZeRAEIJ5zsxFrqFNi'),
  ( 8, '$2b$12$wsPC5zsxFrqFNi0Qe6HW.eujeRGna43EIBgzHuLlHotE5T7V6cz2.'),
  ( 9, '$2b$12$QHgFUsVTN4s5j28ykVfoCud0z7LxyzKDn5XxhxL7sRKqzZo4PM5d2'),
  (10, '$2b$12$3HoPazTApZxEXLJJLLq5yOekF2qTf/3GQ/ISNk31DJ7tY8DbDeihS'),
  (11, '$2b$12$VNDVYqoQZnIcXtNCmieYwuk0CQpZK0s8AjtKoa6HgMHqmpYyqn1EK'),
  (12, '$2b$12$wFpC18JNpDutLCRa14Q6gOH0YzUKGwEuKXXSb9VjA36TObgGJE0Je'),
  (13, '$2b$12$eRkNvztNFVQVw1Gc7YCO5eFZ3VAbw/T/jGj33jjlHzvEihQ/HVbiv'),
  (14, '$2b$12$NxX01yvCb4s46HoPazTApew9u5lHppZArYzS4x2QV/pk3jfbQ3VIQ'),
  (15, '$2b$12$Yw35vj7Xj1mXbgweAV/QYe0jzFZISwH0z7D65gis6pZpQw3KGItPO'),
  (16, '$2b$12$3DpF5NCz7k3A5kZgwyU9geG5hgbKNdY9QW/KpZ6YVCBbq5ylXeGla'),
  (17, '$2b$12$k5VlzDqgW8sELpAo0P5PLuEUzUKGwEU9l8kdFMvx6bMpiKFFitvae'),
  (18, '$2b$12$gdKFFitvolFZ3VAbw/T/jGoc5Tz7kKIhxX3sI5YucsOV9ox96D65g'),
  (19, '$2b$12$YCimeYwuk0CQpZK0s8AjqNxX01yvCb4s46HoPazTApZxEXLJJLLq5'),
  (20, '$2b$12$H0YzUKGwEU9l8kdFMvx6bMpiKFFitvXdJhBKt3Q6gOH0YzUKGwEuK'),
  (21, '$2b$12$ocH.FSrGdEEJfstqAI5lo9DojrSBTlSPFVw/0q9mTOD2YTEU8y5H/'),
  (22, '$2b$12$rQuO7TxUz5S5vLtP6/cJ5DMylbR2VJ8KXEGEaMpaZSSEGTL5m1C4k'),
  (23, '$2b$12$vGt8IRGHc9PqWksx/9Vk1xEEcsC8zsxRY1Hrw9jUKeDuFDGb4FS4m'),
  (24, '$2b$12$xA9Jjp7fZgEAw/6iRCV/5NwjU7S.c5QWjzgCWkseymgtccMf26rxB'),
  (25, '$2b$12$LbhlSM6rXSUBy.CKzPqGATTwW8TsIvWaXv1PG3oV/lzZvC4zw4yd6'),
  (26, '$2b$12$5IWic4U58O.yixo8WAt0dXmlvO4YHn9TjfhI52LsWz5Lu1Zm6W11B'),
  (27, '$2b$12$rZo7bIsGJOEqwfjfGJuoPquO7JML198kPdyU2PeQ1DdMd7mBA5Kcy'),
  (28, '$2b$12$IPCloLEugO4rH66bdhbSdiItsK1fLY6MX.KxtF7eQdffLyLMcGPAB'),
  (29, '$2b$12$chTZ.AhXBMgdIXtgfUPnkM0Vn7LIiZ1hmwWLe5ibSZqscm4dAxJ0K'),
  (30, '$2b$12$fdfEyZVP7Y4mBRubQKGSTEkhhnYMeqlnnxHpEqRHFpcOpn7MNqaPK'),
  (31, '$2b$12$BsDp7m5yHfdVqdnZfKwyv/AYJWSI6anIzrov4m5VgS8171WW4Q0D9'),
  (32, '$2b$12$rF8.GMti7DtCtl.JlUkjvZMt6eOgCM4G7b2/lbmSmWJv4Q0upJF4k'),
  (33, '$2b$12$g7o.VmqFzdvQNa5HqTfUHJcfqU9NGeOea8cLMrHeB7qD6tsEr2ajo'),
  (34, '$2b$12$XS8gE5ZW4EN4F12.3CWsy5DvZG7bjs90UjQcC7QXsYWFqc2yTZaN8'),
  (35, '$2b$12$wM6dZ8nVvniwuf7YcuCiGdH5bSAOgj8yHt4Kljd/L5wHebY0csPQi'),
  (36, '$2b$12$p3daSMF6QprcjJKtVdCvC.yCO9zHP8EAEpbj0HYrEgH7kVbcyHeK6'),
  (37, '$2b$12$9EzOQsMq4U.5.PRp1JoTgeflmzTt0Vq2StxT8aX6InAFGa04ODj0q'),
  (38, '$2b$12$wecPi1WhUDuaiJPm2y0lWuQ4izXrjjFWyEeFIAs9HBVo2oOaXq0nu'),
  (39, '$2b$12$aZ5yOyfnrHu3n2FrpOj.jOWVRlod9F/BtJ0Dxd4m10SNI2Bni9ITC'),
  (40, '$2b$12$bD6I7qKWX3HCPJcY3VB2Ve5.fT6t/4UEZ/maqcRa/4RnKmj2JgOXS'),
  (41, '$2b$12$KKHamCkEtllnPVDVgP6ZV38FedgeHKfvT80jhjI2Mv4uAPmqg/IlK'),
  (42, '$2b$12$icBubcr5/kig3fX7fbuOqIydRIsajKAJ7VRTTTaMwNbHcbv4dTopk'),
  (43, '$2b$12$5U2t8fVjnkcSslYoGWDTPUhj8n0XMECemsc26wZnd07Wt076fJ8CT'),
  (44, '$2b$12$.JnaSS/d5yv0t9Oh/wfav8jwP2DCCNiY2rFWHOQSGR52GclEwodoe'),
  (45, '$2b$12$wK3iV15JoERQgSsrolo.Niwzj9WbQudlLGNp0NbNf1hFrqg2gKa5Q'),
  (46, '$2b$12$oGHpUI13QvfcqkerGLV.EOEU1ZVIHx89QcLyb.PTjGbNCmk1aYXKm'),
  (47, '$2b$12$3GSB4ZG5.J12vNLXEHsyWRGLPvsS6EXn0.QNSkrf3vg0eDFTqm2/p'),
  (48, '$2b$12$2dMMOD6wp.KrfuH.cJplPkA/VB2xq2HOHyzWFdUx8G.lBx6I1dvUS'),
  (49, '$2b$12$rox3sSWX6dGpGUAT154a1uftIVVhE3FELX4mECkST2UeBQFIePIpW'),
  (50, '$2b$12$4HyQPnz1o8aG6xwovF8iMrQRrFr0Dx2odKAw/nok6YLTWXUqtw5ZV'),
  (51, '$2b$12$XacAiRo20rulxqy6Hp1fJd0Mgf.t/h7Y.iSmzND5uX.fxmjWXpZ/k'),
  (52, '$2b$12$i.tJrSBGkUKA5RD9qqF19rc7M01xZH7MEnXsFl3VHwd4WFSw6mVoa'),
  (53, '$2b$12$kNvCTjTv2t5LqylXTQPaj/wkPDgnX2VrNyR5tcVh6Z1O6luDfUBqa'),
  (54, '$2b$12$P0p2c6M51wV1Joy.XeTZZ3yVna0y0JByJcsAfRscGO/zyuh0zuS1p'),
  (55, '$2b$12$txWrp5DyYBC1pa75SDdFsVVcK4FPDvROC72kOyz7OYgBoxQHUn6hD'),
  (56, '$2b$12$GAJj4pRcuE1QAKo4u0azq.u07iQf38Gv4SqP3J8wRcuZ2IqIUmd1e'),
  (57, '$2b$12$8xt4Z08JfVRPJuwd2Coy0eIinbmgnWZvPZAxFfEwODunws5h1sqLm'),
  (58, '$2b$12$B.7ipPxgOPQdOah1lPp3vOcLBja6drPCHqgDFaeVCkadl8T11KC5W'),
  (59, '$2b$12$5p3q47uJ6/Ol5nybCwO4kOvxfQ6fQgYXT6PS00Kg3t5tN6VtiXuvy'),
  (60, '$2b$12$K6TjEhv2JM3Wg7ZdR7CqJeMm2235s7GbRspMbm1stIF7BUThP4yq.');


-- Seed data: 20 hosts (user_id → host_since date)
INSERT INTO host (user_id, host_since) VALUES
  ( 1, '2016-05-12'),
  ( 2, '2014-11-03'),
  ( 3, '2018-07-19'),
  ( 4, '2012-09-25'),
  ( 5, '2020-01-10'),
  ( 6, '2015-03-17'),
  ( 7, '2021-06-08'),
  ( 8, '2017-02-14'),
  ( 9, '2019-09-30'),
  (10, '2013-12-05'),
  (11, '2016-08-22'),
  (12, '2018-04-27'),
  (13, '2022-10-15'),
  (14, '2014-02-19'),
  (15, '2020-11-09'),
  (16, '2015-07-01'),
  (17, '2023-05-04'),
  (18, '2017-11-28'),
  (19, '2019-03-12'),
  (20, '2023-02-14');



-- Seed data: 20 real-world company names (made up tax-IDs & emails)
INSERT INTO company (name, tax_id, billing_email, currency_code) VALUES
  ('Apple Inc.',                                 '94-0000001',        'billing@apple.com',                 'USD'),
  ('Microsoft Corporation',                      '91-0000002',        'ap@microsoft.com',                  'USD'),
  ('Amazon.com, Inc.',                           '91-0000003',        'invoices@amazon.com',               'USD'),
  ('Alphabet Inc.',                              '94-0000004',        'billing@abc.xyz',                   'USD'),
  ('Tesla, Inc.',                                '47-0000005',        'accounts@tesla.com',                'USD'),
  ('Nestlé S.A.',                                'CHE-000.000.006',   'billing@nestle.com',                'CHF'),
  ('Siemens AG',                                 'DE000000007',       'rechnung@siemens.com',              'EUR'),
  ('Toyota Motor Corporation',                   'JP0000000008',      'payments@toyota.co.jp',             'JPY'),
  ('Samsung Electronics Co., Ltd.',              'KR0000000009',      'finance@samsung.com',               'KRW'),
  ('BP p.l.c.',                                  'GB0000000010',      'accounts@bp.com',                   'GBP'),
  ('LVMH Moët Hennessy Louis Vuitton SE',        'FR0000000011',      'facturation@lvmh.com',              'EUR'),
  ('Alibaba Group Holding Limited',              'CN0000000012',      'billing@alibaba-inc.com',           'CNY'),
  ('Reliance Industries Limited',                'IN0000000013',      'accounts@ril.com',                  'INR'),
  ('BHP Group Limited',                          'AU0000000014',      'ap@bhp.com',                        'AUD'),
  ('Petróleo Brasileiro S.A. (Petrobras)',       'BR0000000015',      'fatura@petrobras.com.br',           'BRL'),
  ('Royal Bank of Canada',                       'CA0000000016',      'billing@rbc.com',                   'CAD'),
  ('Novo Nordisk A/S',                           'DK0000000017',      'invoice@novonordisk.com',           'DKK'),
  ('Emirates Group',                             'AE0000000018',      'finance@emirates.com',              'AED'),
  ('Tencent Holdings Ltd.',                      'CN0000000019',      'billing@tencent.com',               'CNY'),
  ('Naspers Limited',                            'ZA0000000020',      'accounts@naspers.com',              'ZAR');


-- Seed data: user_company (25 user ↔ company links, varied roles)
INSERT INTO user_company (user_id, company_id, role) VALUES
  -- Company 1  : Apple Inc.
  (21,  1, 'employee'),
  (22,  1, 'manager'),

  -- Company 2  : Microsoft
  (23,  2, 'employee'),
  (24,  2, 'finance'),

  -- Company 3  : Amazon
  (25,  3, 'employee'),
  (26,  3, 'admin'),

  -- Company 4  : Alphabet
  (27,  4, 'employee'),
  (28,  4, 'manager'),

  -- Company 5  : Tesla
  (29,  5, 'employee'),
  (30,  5, 'finance'),

  -- Company 6  : Nestlé
  (31,  6, 'employee'),
  (32,  6, 'admin'),

  -- Company 7  : Siemens
  (33,  7, 'employee'),
  (34,  7, 'manager'),

  -- Company 8  : Toyota
  (35,  8, 'employee'),
  (36,  8, 'finance'),

  -- Company 9  : Samsung
  (37,  9, 'employee'),
  (38,  9, 'manager'),

  -- Company 10 : BP
  (39, 10, 'employee'),
  (40, 10, 'finance'),

  -- Company 11 : LVMH
  (41, 11, 'employee'),

  -- Company 12 : Alibaba
  (42, 12, 'employee'),

  -- Company 13 : Reliance Industries
  (43, 13, 'employee'),

  -- Company 14 : BHP Group
  (44, 14, 'employee'),

  -- Company 15 : Petrobras
  (45, 15, 'employee');


-- Seed data: 40 major countries (ISO-3166-1 alpha-3 + currency)
INSERT INTO country (country_code, name, currency_code) VALUES
  ('USA', 'United States of America',  'USD'),
  ('CAN', 'Canada',                    'CAD'),
  ('MEX', 'Mexico',                    'MXN'),
  ('BRA', 'Brazil',                    'BRL'),
  ('ARG', 'Argentina',                 'ARS'),
  ('GBR', 'United Kingdom',            'GBP'),
  ('FRA', 'France',                    'EUR'),
  ('DEU', 'Germany',                   'EUR'),
  ('ITA', 'Italy',                     'EUR'),
  ('ESP', 'Spain',                     'EUR'),
  ('NLD', 'Netherlands',               'EUR'),
  ('CHE', 'Switzerland',               'CHF'),
  ('SWE', 'Sweden',                    'SEK'),
  ('NOR', 'Norway',                    'NOK'),
  ('DNK', 'Denmark',                   'DKK'),
  ('ISL', 'Iceland',                   'ISK'),
  ('POL', 'Poland',                    'PLN'),
  ('CZE', 'Czech Republic',            'CZK'),
  ('HUN', 'Hungary',                   'HUF'),
  ('ROU', 'Romania',                   'RON'),
  ('BGR', 'Bulgaria',                  'BGN'),
  ('TUR', 'Turkey',                    'TRY'),
  ('RUS', 'Russia',                    'RUB'),
  ('CHN', 'China',                     'CNY'),
  ('JPN', 'Japan',                     'JPY'),
  ('KOR', 'South Korea',               'KRW'),
  ('IND', 'India',                     'INR'),
  ('IDN', 'Indonesia',                 'IDR'),
  ('SGP', 'Singapore',                 'SGD'),
  ('MYS', 'Malaysia',                  'MYR'),
  ('PHL', 'Philippines',               'PHP'),
  ('THA', 'Thailand',                  'THB'),
  ('HKG', 'Hong Kong SAR',             'HKD'),
  ('AUS', 'Australia',                 'AUD'),
  ('NZL', 'New Zealand',               'NZD'),
  ('ZAF', 'South Africa',              'ZAR'),
  ('ARE', 'United Arab Emirates',      'AED'),
  ('EGY', 'Egypt',                     'EGP'),
  ('KEN', 'Kenya',                     'KES'),
  ('COL', 'Colombia',                  'COP');


-- Seed data: 40 capital cities (linked to country table)
INSERT INTO city (name, zip, country_code) VALUES
  ('Washington, D.C.',      '20500',     'USA'),
  ('Ottawa',                'K1A 0A9',   'CAN'),
  ('Mexico City',           '06000',     'MEX'),
  ('Brasília',              '70000-000', 'BRA'),
  ('Buenos Aires',          'C1002',     'ARG'),
  ('London',                'SW1A 1AA',  'GBR'),
  ('Paris',                 '75000',     'FRA'),
  ('Berlin',                '10117',     'DEU'),
  ('Rome',                  '00187',     'ITA'),
  ('Madrid',                '28013',     'ESP'),
  ('Amsterdam',             '1012',      'NLD'),
  ('Bern',                  '3005',      'CHE'),
  ('Stockholm',             '11121',     'SWE'),
  ('Oslo',                  '0010',      'NOR'),
  ('Copenhagen',            '1050',      'DNK'),
  ('Reykjavík',             '101',       'ISL'),
  ('Warsaw',                '00-001',    'POL'),
  ('Prague',                '11000',     'CZE'),
  ('Budapest',              '1051',      'HUN'),
  ('Bucharest',             '010011',    'ROU'),
  ('Sofia',                 '1000',      'BGR'),
  ('Ankara',                '06000',     'TUR'),
  ('Moscow',                '101000',    'RUS'),
  ('Beijing',               '100000',    'CHN'),
  ('Tokyo',                 '100-0001',  'JPN'),
  ('Seoul',                 '04524',     'KOR'),
  ('New Delhi',             '110001',    'IND'),
  ('Jakarta',               '10110',     'IDN'),
  ('Singapore',             '049317',    'SGP'),
  ('Kuala Lumpur',          '50050',     'MYS'),
  ('Manila',                '1000',      'PHL'),
  ('Bangkok',               '10200',     'THA'),
  ('Hong Kong',             '999077',        'HKG'),
  ('Canberra',              '2600',      'AUS'),
  ('Wellington',            '6011',      'NZL'),
  ('Pretoria',              '0002',      'ZAF'),
  ('Abu Dhabi',             '00000',     'ARE'),
  ('Cairo',                 '11511',     'EGY'),
  ('Nairobi',               '00100',     'KEN'),
  ('Bogotá',                '110111',    'COL');


-- Seed data: 40 sample addresses (1 per capital city, linked via city_id 1-40)
INSERT INTO address (street, street_nr, city_id, lat, lng) VALUES
  -- USA – Washington, D.C. (city_id 1)
  ('Pennsylvania Avenue NW', '160',  1,  38.897957,  -77.036560),

  -- Canada – Ottawa (2)
  ('Wellington Street',      '111',  2,  45.421532,  -75.697189),

  -- Mexico – Mexico City (3)
  ('Av. Paseo de la Reforma','222',  3,  19.432608,  -99.133209),

  -- Brazil – Brasília (4)
  ('Esplanada dos Ministérios','101',4, -15.793889,  -47.882778),

  -- Argentina – Buenos Aires (5)
  ('Avenida de Mayo',        '250',  5, -34.608418,  -58.373161),

  -- UK – London (6)
  ('Downing Street',         '10',   6,  51.503363,   -0.127625),

  -- France – Paris (7)
  ('Avenue des Champs-Élysées','110',7,  48.865633,    2.321236),

  -- Germany – Berlin (8)
  ('Unter den Linden',       '115',  8,  52.517036,   13.388860),

  -- Italy – Rome (9)
  ('Via del Corso',          '123',  9,  41.900932,   12.479920),

  -- Spain – Madrid (10)
  ('Calle de Alcalá',        '280', 10,  40.419508,   -3.693478),

  -- Netherlands – Amsterdam (11)
  ('Prinsengracht',          '263', 11,  52.374030,    4.883100),

  -- Switzerland – Bern (12)
  ('Bundesgasse',            '18',  12,  46.946568,    7.444606),

  -- Sweden – Stockholm (13)
  ('Drottninggatan',         '90',  13,  59.332580,   18.063240),

  -- Norway – Oslo (14)
  ('Karl Johans gate',       '21',  14,  59.913868,   10.741015),

  -- Denmark – Copenhagen (15)
  ('Amagertorv',             '3',   15,  55.676098,   12.569015),

  -- Iceland – Reykjavík (16)
  ('Austurstræti',           '6',   16,  64.147209,  -21.939509),

  -- Poland – Warsaw (17)
  ('Krakowskie Przedmieście','56',  17,  52.240236,   21.016999),

  -- Czechia – Prague (18)
  ('Staroměstské náměstí',   '2',   18,  50.087811,   14.420460),

  -- Hungary – Budapest (19)
  ('Andrássy út',            '60',  19,  47.502380,   19.058400),

  -- Romania – Bucharest (20)
  ('Calea Victoriei',        '155', 20,  44.440179,   26.096306),

  -- Bulgaria – Sofia (21)
  ('Vitosha Boulevard',      '66',  21,  42.694992,   23.321722),

  -- Turkey – Ankara (22)
  ('Atatürk Bulvarı',        '98',  22,  39.925533,   32.836952),

  -- Russia – Moscow (23)
  ('Tverskaya Street',       '7',   23,  55.755826,   37.617300),

  -- China – Beijing (24)
  ('Chang\'an Avenue',       '1',   24,  39.904202,  116.407394),

  -- Japan – Tokyo (25)
  ('Shinjuku-dori',          '33',  25,  35.689487,  139.691711),

  -- South Korea – Seoul (26)
  ('Sejong-daero',           '110', 26,  37.566536,  126.977966),

  -- India – New Delhi (27)
  ('Rajpath',                '12',  27,  28.614179,   77.225579),

  -- Indonesia – Jakarta (28)
  ('Jl. Medan Merdeka',      '8',   28,  -6.175110,  106.865036),

  -- Singapore (29)
  ('Orchard Road',           '350', 29,   1.303994,  103.831189),

  -- Malaysia – Kuala Lumpur (30)
  ('Jalan Raja',             '2',   30,   3.155056,  101.693207),

  -- Philippines – Manila (31)
  ('Roxas Boulevard',        '158', 31,  14.558846,  120.983406),

  -- Thailand – Bangkok (32)
  ('Ratchadamnoen Avenue',   '1',   32,  13.756331,  100.501762),

  -- Hong Kong SAR (33)
  ('Queensway',              '10',  33,  22.296944,  114.175278),

  -- Australia – Canberra (34)
  ('Kingston Parade',        '70',  34, -35.282001,  149.128998),

  -- New Zealand – Wellington (35)
  ('Lambton Quay',           '80',  35, -41.283001,  174.776596),

  -- South Africa – Pretoria (36)
  ('Visagie Street',         '175', 36, -25.746019,   28.188055),

  -- UAE – Abu Dhabi (37)
  ('Corniche Road',          '5',   37,  24.466667,   54.366669),

  -- Egypt – Cairo (38)
  ('Tahrir Square',          '1',   38,  30.044420,   31.235712),

  -- Kenya – Nairobi (39)
  ('Kenyatta Avenue',        '50',  39,  -1.286389,   36.817223),

  -- Colombia – Bogotá (40)
  ('Carrera 7',              '18',  40,   4.598056,  -74.075833);



-- Seed data: 30 listings (hosts 1-20, addresses 1-30)
INSERT INTO listing
  (host_id, address_id, title, description,
   property_type, room_type, max_users, bedrooms, beds, bathrooms)
VALUES
  -- 1  Washington, D.C.
  ( 1,  1, 'Capitol Hill Apartment',
    'Stylish 1-bed flat steps from the National Mall, walk to museums & metro.',
    'Apartment',  'Entire place', 2, 1, 1, 1),

  -- 2  Ottawa
  ( 2,  2, 'Parliament View Townhome',
    'Cozy 2-storey townhome with balcony overlooking the Ottawa River.',
    'Townhouse',  'Entire place', 4, 2, 2, 2),

  -- 3  Mexico City
  ( 3,  3, 'Reforma Studio Loft',
    'Industrial-chic loft on Paseo de la Reforma.',
    'Loft',       'Entire place', 2, 0, 1, 1),

  -- 4  Brasília
  ( 4,  4, 'Modern Flat near Esplanada',
    'Bright apartment with panoramic city views, 5 min to ministries.',
    'Apartment',  'Entire place', 3, 1, 2, 1),

  -- 5  Buenos Aires
  ( 5,  5, 'San Telmo Heritage Home',
    'Vintage 1900s house with patio & old-school vibes, walk to Plaza de Mayo.',
    'House',      'Entire place', 6, 3, 4, 2),

  -- 6  London
  ( 6,  6, 'Iconic Downing Street Room',
    'Private room in historic townhouse, heart of Westminster.',
    'Townhouse',  'Private room', 2, 1, 1, 1),

  -- 7  Paris
  ( 7,  7, 'Champs-Élysées Chic Studio',
    'Elegant studio with Juliet balcony, cafés at your doorstep.',
    'Studio',     'Entire place', 2, 0, 1, 1),

  -- 8  Berlin
  ( 8,  8, 'Unter den Linden Flat',
    'Minimalist 2-bed apartment, bike included, near Brandenburg Gate.',
    'Apartment',  'Entire place', 4, 2, 2, 1),

  -- 9  Rome
  ( 9,  9, 'Via del Corso Penthouse',
    'Sunny penthouse with terrace overlooking historic rooftops.',
    'Apartment',  'Entire place', 4, 2, 2, 2),

  -- 10 Madrid
  (10, 10, 'Alcalá Artistic Loft',
    'Open-plan loft in art-deco building, 3 min walk to Puerta del Sol.',
    'Loft',       'Entire place', 3, 1, 1, 1),

  -- 11 Amsterdam
  (11, 11, 'Canal-Side Houseboat',
    'Unique floating home on Prinsengracht canal, bikes & occasional ducks included.',
    'Houseboat',  'Entire place', 2, 1, 1, 1),

  -- 12 Bern
  (12, 12, 'Bundesgasse Alpine Flat',
    'Comfortable 1-bed flat with river Aare views & Swiss charm.',
    'Apartment',  'Entire place', 2, 1, 1, 1),

  -- 13 Stockholm
  (13, 13, 'Gamla Stan Rooftop Studio',
    'Top-floor studio in Old Town, exposed beams & cobblestone streets.',
    'Studio',     'Entire place', 2, 0, 1, 1),

  -- 14 Oslo
  (14, 14, 'Karl Johans Cozy Room',
    'Private room with fjord-inspired décor, 5 min to Opera House.',
    'Apartment',  'Private room', 2, 1, 1, 1),

  -- 15 Copenhagen
  (15, 15, 'Nyhavn Colorful Apartment',
    'Bright 2-bed flat by the canal, live like a Dane.',
    'Apartment',  'Entire place', 4, 2, 3, 1),

  -- 16 Reykjavík
  (16, 16, 'Austurstræti Nordic Cabin',
    'Urban cabin-style studio, thermal pool pass included.',
    'Studio',     'Entire place', 2, 0, 1, 1),

  -- 17 Warsaw
  (17, 17, 'Old-Town Boutique Suite',
    'Designer 1-bed suite overlooking Royal Route, breakfast basket daily.',
    'Apartment',  'Entire place', 2, 1, 1, 1),

  -- 18 Prague
  (18, 18, 'Staroměstské Square Loft',
    'Gothic-beam loft steps from Astronomical Clock, free walking tour.',
    'Loft',       'Entire place', 3, 1, 2, 1),

  -- 19 Budapest
  (19, 19, 'Andrássy Grand Apartment',
    'High-ceiling 3-bed flat near Opera House, thermal-bath vouchers.',
    'Apartment',  'Entire place', 6, 3, 4, 2),

  -- 20 Bucharest
  (20, 20, 'Victoriei Stylish Studio',
    'Contemporary studio in Belle-Époque building, hip cafés downstairs.',
    'Studio',     'Entire place', 2, 0, 1, 1),

  -- 21 Sofia
  ( 1, 21, 'Vitosha Blvd City Pad',
    'Compact 1-bed apartment on main pedestrian street, mountain views.',
    'Apartment',  'Entire place', 2, 1, 1, 1),

  -- 22 Ankara
  ( 2, 22, 'Atatürk Boulevard Flat',
    'Spacious flat with private balcony, near Kızılay Square.',
    'Apartment',  'Entire place', 4, 2, 2, 1),

  -- 23 Moscow
  ( 3, 23, 'Tverskaya Luxe Suite',
    'Luxury suite in Stalin-era high-rise, panoramic city skyline.',
    'Apartment',  'Entire place', 2, 1, 1, 1),

  -- 24 Beijing
  ( 4, 24, 'Chang\'an Avenue Courtyard',
    'Traditional hutong courtyard room, tea ceremony included.',
    'House',      'Private room', 2, 1, 1, 1),

  -- 25 Tokyo
  ( 5, 25, 'Shinjuku Capsule Loft',
    'Tiny but tech-savvy loft with skyline view, steps to JR station.',
    'Loft',       'Entire place', 2, 0, 1, 1),

  -- 26 Seoul
  ( 6, 26, 'Sejong-daero Hanok Room',
    'Private room in renovated hanok, kimchi-making class hosted.',
    'House',      'Private room', 2, 1, 1, 1),

  -- 27 New Delhi
  ( 7, 27, 'Rajpath Heritage Bungalow',
    'Colonial bungalow with verandah & garden, near India Gate.',
    'Bungalow',   'Entire place', 5, 3, 4, 2),

  -- 28 Jakarta
  ( 8, 28, 'Merdeka Central Condo',
    'Modern condo with rooftop pool & skyline views, CBD location.',
    'Condo',      'Entire place', 3, 1, 2, 1),

  -- 29 Singapore
  ( 9, 29, 'Orchard Designer Suite',
    'High-rise serviced suite with infinity pool access.',
    'Apartment',  'Entire place', 2, 1, 1, 1),

  -- 30 Kuala Lumpur
  (10, 30, 'KLCC Sky Residence',
    'Luxury 2-bed apartment with Petronas Twin Towers vista.',
    'Apartment',  'Entire place', 4, 2, 2, 2);


-- Seed data: 20 common property amenities
INSERT INTO amenity (name) VALUES
  ('Wifi'),
  ('Air conditioning'),
  ('Heating'),
  ('Kitchen'),
  ('Washer'),
  ('Dryer'),
  ('Free parking on premises'),
  ('Pool'),
  ('Hot tub'),
  ('Gym'),
  ('TV'),
  ('Breakfast included'),
  ('Pets allowed'),
  ('Smoking allowed'),
  ('Wheelchair accessible'),
  ('Baby crib'),
  ('High chair'),
  ('BBQ grill'),
  ('Fire pit'),
  ('EV charger');


-- Seed data: listing_amenity  (30 listings × varied amenities)
INSERT INTO listing_amenity (listing_id, amenity_id) VALUES
  -- Listing 1  • Capitol Hill Apartment
  (1,1),(1,3),(1,4),(1,11),(1,5),(1,7),

  -- Listing 2  • Parliament View Townhome
  (2,1),(2,3),(2,4),(2,5),(2,6),(2,7),(2,11),

  -- Listing 3  • Reforma Studio Loft
  (3,1),(3,2),(3,4),(3,11),(3,13),

  -- Listing 4  • Modern Flat near Esplanada
  (4,1),(4,2),(4,4),(4,8),(4,5),

  -- Listing 5  • San Telmo Heritage Home
  (5,1),(5,4),(5,5),(5,6),(5,18),(5,19),

  -- Listing 6  • Iconic Downing St Room
  (6,1),(6,3),(6,12),(6,11),(6,4),

  -- Listing 7  • Champs-Élysées Chic Studio
  (7,1),(7,2),(7,3),(7,4),(7,11),(7,5),

  -- Listing 8  • Unter den Linden Flat
  (8,1),(8,3),(8,4),(8,5),(8,6),(8,20),(8,13),

  -- Listing 9  • Via del Corso Penthouse
  (9,1),(9,2),(9,4),(9,9),(9,11),

  -- Listing 10 • Alcalá Artistic Loft
  (10,1),(10,2),(10,4),(10,3),(10,5),(10,11),

  -- Listing 11 • Canal-Side Houseboat
  (11,1),(11,4),(11,13),(11,18),(11,19),

  -- Listing 12 • Bundesgasse Alpine Flat
  (12,1),(12,3),(12,4),(12,5),(12,20),

  -- Listing 13 • Gamla Stan Rooftop Studio
  (13,1),(13,3),(13,4),(13,11),

  -- Listing 14 • Karl Johans Cozy Room
  (14,1),(14,3),(14,4),(14,5),(14,7),

  -- Listing 15 • Nyhavn Colorful Apartment
  (15,1),(15,3),(15,4),(15,5),(15,6),(15,11),(15,18),

  -- Listing 16 • Reykjavík Nordic Cabin
  (16,1),(16,3),(16,4),(16,9),(16,19),

  -- Listing 17 • Old-Town Boutique Suite
  (17,1),(17,3),(17,4),(17,5),(17,13),(17,11),

  -- Listing 18 • Staroměstské Square Loft
  (18,1),(18,3),(18,4),(18,5),(18,12),

  -- Listing 19 • Andrássy Grand Apartment
  (19,1),(19,3),(19,4),(19,5),(19,2),(19,11),

  -- Listing 20 • Victoriei Stylish Studio
  (20,1),(20,2),(20,4),(20,11),

  -- Listing 21 • Vitosha Blvd City Pad
  (21,1),(21,3),(21,4),(21,5),(21,13),

  -- Listing 22 • Atatürk Boulevard Flat
  (22,1),(22,2),(22,4),(22,5),(22,6),

  -- Listing 23 • Tverskaya Luxe Suite
  (23,1),(23,3),(23,4),(23,9),(23,10),(23,11),

  -- Listing 24 • Chang’an Avenue Courtyard
  (24,1),(24,4),(24,12),(24,2),(24,13),

  -- Listing 25 • Shinjuku Capsule Loft
  (25,1),(25,2),(25,4),(25,5),(25,6),(25,11),

  -- Listing 26 • Sejong-daero Hanok Room
  (26,1),(26,3),(26,4),(26,12),(26,16),(26,17),

  -- Listing 27 • Rajpath Heritage Bungalow
  (27,1),(27,2),(27,4),(27,5),(27,6),(27,13),(27,19),

  -- Listing 28 • Merdeka Central Condo
  (28,1),(28,2),(28,4),(28,8),(28,10),(28,11),

  -- Listing 29 • Orchard Designer Suite
  (29,1),(29,2),(29,4),(29,10),(29,8),(29,5),

  -- Listing 30 • KLCC Sky Residence
  (30,1),(30,2),(30,4),(30,8),(30,10),(30,20),(30,5);


-- Seed data: house-rules for all 30 listings
-- rule_id auto-increments; only (listing_id, rule_description) required
INSERT INTO listing_rules (listing_id, rule_description) VALUES
  -- Listing 1  • Capitol Hill Apartment
  (1,'No smoking inside'),
  (1,'Quiet hours 22:00-07:00'),

  -- Listing 2  • Parliament View Townhome
  (2,'No parties/events'),
  (2,'No pets'),

  -- Listing 3  • Reforma Studio Loft
  (3,'No smoking'),
  (3,'No loud music after 23:00'),

  -- Listing 4  • Modern Flat near Esplanada
  (4,'No pets'),
  (4,'Check-out before 11:00'),

  -- Listing 5  • San Telmo Heritage Home
  (5,'No parties/events'),
  (5,'Quiet hours 23:00-08:00'),

  -- Listing 6  • Iconic Downing Street Room
  (6,'No smoking'),
  (6,'Pets on request'),

  -- Listing 7  • Champs-Élysées Chic Studio
  (7,'No shoes inside'),
  (7,'Quiet hours 22:00-08:00'),

  -- Listing 8  • Unter den Linden Flat
  (8,'No parties/events'),
  (8,'Check-in after 15:00'),

  -- Listing 9  • Via del Corso Penthouse
  (9,'No smoking'),
  (9,'Roof terrace closes at 22:00'),

  -- Listing 10 • Alcalá Artistic Loft
  (10,'No pets'),
  (10,'No loud music after 22:00'),

  -- Listing 11 • Canal-Side Houseboat
  (11,'No parties/events'),
  (11,'No smoking on deck'),

  -- Listing 12 • Bundesgasse Alpine Flat
  (12,'No shoes inside'),
  (12,'Quiet hours 21:00-07:00'),

  -- Listing 13 • Gamla Stan Rooftop Studio
  (13,'No smoking'),
  (13,'No pets'),

  -- Listing 14 • Karl Johans Cozy Room
  (14,'No parties/events'),
  (14,'Check-out before 10:00'),

  -- Listing 15 • Nyhavn Colorful Apartment
  (15,'No loud music after 22:00'),
  (15,'Pets allowed with fee'),

  -- Listing 16 • Reykjavík Nordic Cabin
  (16,'No smoking'),
  (16,'Quiet hours 23:00-07:00'),

  -- Listing 17 • Old-Town Boutique Suite
  (17,'No parties/events'),
  (17,'No pets'),

  -- Listing 18 • Staroměstské Square Loft
  (18,'No smoking'),
  (18,'Check-in after 14:00'),

  -- Listing 19 • Andrássy Grand Apartment
  (19,'Quiet hours 22:00-08:00'),
  (19,'No parties/events'),

  -- Listing 20 • Victoriei Stylish Studio
  (20,'No smoking'),
  (20,'No pets'),

  -- Listing 21 • Vitosha Blvd City Pad
  (21,'Quiet hours 22:00-07:00'),
  (21,'No parties/events'),

  -- Listing 22 • Atatürk Boulevard Flat
  (22,'No smoking'),
  (22,'Check-out before 11:00'),

  -- Listing 23 • Tverskaya Luxe Suite
  (23,'No pets'),
  (23,'Quiet hours 23:00-08:00'),

  -- Listing 24 • Chang’an Ave Courtyard
  (24,'Shoes off indoors'),
  (24,'No smoking'),

  -- Listing 25 • Shinjuku Capsule Loft
  (25,'No parties/events'),
  (25,'Quiet hours 22:00-08:00'),

  -- Listing 26 • Sejong-daero Hanok Room
  (26,'No smoking'),
  (26,'Pets not allowed'),

  -- Listing 27 • Rajpath Heritage Bungalow
  (27,'No parties/events'),
  (27,'Quiet hours 22:00-07:00'),

  -- Listing 28 • Merdeka Central Condo
  (28,'No smoking'),
  (28,'Check-out before 11:00'),

  -- Listing 29 • Orchard Designer Suite
  (29,'No loud music after 21:00'),
  (29,'No smoking'),

  -- Listing 30 • KLCC Sky Residence
  (30,'No parties/events'),
  (30,'Quiet hours 23:00-08:00');


-- Seed data: photos for 30 listings with descriptive captions
INSERT INTO picture (listing_id, pic, caption, main_pic) VALUES
  -- Listing 1
  (1,  'http://example.com/photos/listing1_main.jpg',  'Living room', TRUE),
  (1,  'http://example.com/photos/listing1_extra.jpg', 'Kitchen',     FALSE),

  -- Listing 2
  (2,  'http://example.com/photos/listing2_main.jpg',  'Exterior front', TRUE),
  (2,  'http://example.com/photos/listing2_extra.jpg', 'Bedroom',        FALSE),

  -- Listing 3
  (3,  'http://example.com/photos/listing3_main.jpg',  'Open-plan lounge', TRUE),
  (3,  'http://example.com/photos/listing3_extra.jpg', 'Bathroom',        FALSE),

  -- Listing 4
  (4,  'http://example.com/photos/listing4_main.jpg',  'City-view balcony', TRUE),
  (4,  'http://example.com/photos/listing4_extra.jpg', 'Dining area',      FALSE),

  -- Listing 5
  (5,  'http://example.com/photos/listing5_main.jpg',  'Patio courtyard', TRUE),
  (5,  'http://example.com/photos/listing5_extra.jpg', 'Master bedroom',  FALSE),

  -- Listing 6
  (6,  'http://example.com/photos/listing6_main.jpg',  'Historic façade', TRUE),
  (6,  'http://example.com/photos/listing6_extra.jpg', 'Private room',    FALSE),

  -- Listing 7
  (7,  'http://example.com/photos/listing7_main.jpg',  'Studio overview', TRUE),
  (7,  'http://example.com/photos/listing7_extra.jpg', 'Compact kitchen', FALSE),

  -- Listing 8
  (8,  'http://example.com/photos/listing8_main.jpg',  'Minimalist lounge', TRUE),
  (8,  'http://example.com/photos/listing8_extra.jpg', 'Workspace nook',   FALSE),

  -- Listing 9
  (9,  'http://example.com/photos/listing9_main.jpg',  'Rooftop terrace', TRUE),
  (9,  'http://example.com/photos/listing9_extra.jpg', 'En-suite bath',   FALSE),

  -- Listing 10
  (10, 'http://example.com/photos/listing10_main.jpg', 'Art-deco living area', TRUE),
  (10, 'http://example.com/photos/listing10_extra.jpg','Breakfast bar',         FALSE),

  -- Listing 11
  (11, 'http://example.com/photos/listing11_main.jpg', 'Houseboat deck', TRUE),
  (11, 'http://example.com/photos/listing11_extra.jpg','Canal-side view', FALSE),

  -- Listing 12
  (12, 'http://example.com/photos/listing12_main.jpg', 'Alpine living room', TRUE),
  (12, 'http://example.com/photos/listing12_extra.jpg','River view balcony', FALSE),

  -- Listing 13
  (13, 'http://example.com/photos/listing13_main.jpg', 'Exposed-beam studio', TRUE),
  (13, 'http://example.com/photos/listing13_extra.jpg','Kitchenette',         FALSE),

  -- Listing 14
  (14, 'http://example.com/photos/listing14_main.jpg', 'Cozy guest room', TRUE),
  (14, 'http://example.com/photos/listing14_extra.jpg','Shared kitchen',  FALSE),

  -- Listing 15
  (15, 'http://example.com/photos/listing15_main.jpg', 'Canal-view lounge', TRUE),
  (15, 'http://example.com/photos/listing15_extra.jpg','Colourful bedroom', FALSE),

  -- Listing 16
  (16, 'http://example.com/photos/listing16_main.jpg', 'Cabin interior', TRUE),
  (16, 'http://example.com/photos/listing16_extra.jpg','Fire-place corner', FALSE),

  -- Listing 17
  (17, 'http://example.com/photos/listing17_main.jpg', 'Designer living space', TRUE),
  (17, 'http://example.com/photos/listing17_extra.jpg','Coffee station',      FALSE),

  -- Listing 18
  (18, 'http://example.com/photos/listing18_main.jpg', 'Loft overview', TRUE),
  (18, 'http://example.com/photos/listing18_extra.jpg','Historic beams', FALSE),

  -- Listing 19
  (19, 'http://example.com/photos/listing19_main.jpg', 'Grand salon', TRUE),
  (19, 'http://example.com/photos/listing19_extra.jpg','Formal dining', FALSE),

  -- Listing 20
  (20, 'http://example.com/photos/listing20_main.jpg', 'Modern studio', TRUE),
  (20, 'http://example.com/photos/listing20_extra.jpg','Bathroom',     FALSE),

  -- Listing 21
  (21, 'http://example.com/photos/listing21_main.jpg', 'City-pad lounge', TRUE),
  (21, 'http://example.com/photos/listing21_extra.jpg','Mountain view',  FALSE),

  -- Listing 22
  (22, 'http://example.com/photos/listing22_main.jpg', 'Spacious living area', TRUE),
  (22, 'http://example.com/photos/listing22_extra.jpg','Balcony sunset',      FALSE),

  -- Listing 23
  (23, 'http://example.com/photos/listing23_main.jpg', 'Luxury suite', TRUE),
  (23, 'http://example.com/photos/listing23_extra.jpg','Marble bathroom', FALSE),

  -- Listing 24
  (24, 'http://example.com/photos/listing24_main.jpg', 'Courtyard entrance', TRUE),
  (24, 'http://example.com/photos/listing24_extra.jpg','Tea corner',       FALSE),

  -- Listing 25
  (25, 'http://example.com/photos/listing25_main.jpg', 'Skyline view loft', TRUE),
  (25, 'http://example.com/photos/listing25_extra.jpg','Smart kitchenette', FALSE),

  -- Listing 26
  (26, 'http://example.com/photos/listing26_main.jpg', 'Traditional hanok room', TRUE),
  (26, 'http://example.com/photos/listing26_extra.jpg','Garden path',          FALSE),

  -- Listing 27
  (27, 'http://example.com/photos/listing27_main.jpg', 'Verandah exterior', TRUE),
  (27, 'http://example.com/photos/listing27_extra.jpg','Vintage bedroom', FALSE),

  -- Listing 28
  (28, 'http://example.com/photos/listing28_main.jpg', 'Condo living room', TRUE),
  (28, 'http://example.com/photos/listing28_extra.jpg','Rooftop pool',     FALSE),

  -- Listing 29
  (29, 'http://example.com/photos/listing29_main.jpg', 'Designer suite', TRUE),
  (29, 'http://example.com/photos/listing29_extra.jpg','Infinity pool',   FALSE),

  -- Listing 30
  (30, 'http://example.com/photos/listing30_main.jpg', 'Sky residence lounge', TRUE),
  (30, 'http://example.com/photos/listing30_extra.jpg','Twin-towers view',    FALSE);


-- Seed data: 20 price_rate rows (multipliers > 0 per chk_pr_positive)
INSERT INTO price_rate
  (name, description, method, multiplier, effective_from, effective_to)
VALUES
  -- Standard & temporal rates
  ('Weekday',           'Monday–Thursday standard rate',                 'MULTIPLY', 1.0000, '1900-01-01',  NULL),
  ('Weekend',           'Friday & Saturday premium',                     'MULTIPLY', 1.1500, '1900-01-01',  NULL),
  ('Holiday',           'National public holidays uplift',               'MULTIPLY', 1.2500, '1900-01-01',  NULL),
  ('Peak_Summer',       'High-season July–Aug premium',                  'MULTIPLY', 1.3000, '2025-06-01', '2025-08-31'),
  ('Off_Season',        'Low-season Jan–Mar discount',                   'MULTIPLY', 0.8000, '1900-01-01',  NULL),

  -- Booking-timing incentives
  ('Early_Bird',        'Booked ≥60 days in advance',                    'MULTIPLY', 0.9000, '1900-01-01',  NULL),
  ('Last_Minute',       'Booked ≤3 days before arrival',                 'MULTIPLY', 0.8500, '1900-01-01',  NULL),

  -- Length-of-stay
  ('Long_Stay',         'Stays of 7 nights or more',                     'MULTIPLY', 0.9500, '1900-01-01',  NULL),
  ('Short_Stay',        '1-night surcharge',                             'ADD',      20.0000, '1900-01-01',  NULL),

  -- Fees & taxes (additive)
  ('Cleaning_Fee',      'Flat cleaning fee per booking',                 'ADD',      50.0000, '1900-01-01',  NULL),
  ('City_Tax',          'Local accommodation tax',                       'ADD',      10.0000, '1900-01-01',  NULL),
  ('Service_Fee',       'Platform service fee',                          'ADD',      15.0000, '1900-01-01',  NULL),
  ('EV_Charging_Fee',   'Optional EV charger use per night',             'ADD',       5.0000, '1900-01-01',  NULL),

  -- Promotional events
  ('Black_Friday',      'Black Friday flash sale',                       'MULTIPLY', 0.7500, '2025-11-28', '2025-11-30'),
  ('Cyber_Monday',      'Cyber Monday discount',                         'MULTIPLY', 0.7800, '2025-12-01', '2025-12-02'),

  -- Seasonal / holiday specials
  ('Christmas',         'Christmas uplift',                              'MULTIPLY', 1.4000, '2025-12-24', '2025-12-26'),
  ('New_Year',          'New Year’s Eve/Day premium',                    'MULTIPLY', 1.5000, '2025-12-30', '2026-01-02'),
  ('Easter',            'Easter weekend premium',                        'MULTIPLY', 1.2000, '2026-04-03', '2026-04-06'),
  ('Spring_Festival',   'Lunar New Year / Spring Festival week',         'MULTIPLY', 1.3500, '2026-02-07', '2026-02-14'),

  -- Misc. demand spikes
  ('Event_Rate',        'City-wide events & conventions',                'MULTIPLY', 1.3000, '1900-01-01',  NULL),
  ('Shoulder_Season',   'Moderate demand (spring & autumn)',             'MULTIPLY', 1.0500, '1900-01-01',  NULL);


-- Seed data: 2 months of calendar days
INSERT INTO calendar_day
  (calendar_date, day_of_week, is_weekend, is_holiday, rate_id)
VALUES
-- June
  ('2025-06-01','Sunday',    TRUE,  FALSE, 2),
  ('2025-06-02','Monday',    FALSE, FALSE, 4),
  ('2025-06-03','Tuesday',   FALSE, FALSE, 4),
  ('2025-06-04','Wednesday', FALSE, FALSE, 4),
  ('2025-06-05','Thursday',  FALSE, FALSE, 4),
  ('2025-06-06','Friday',    FALSE, FALSE, 4),
  ('2025-06-07','Saturday',  TRUE,  FALSE, 2),
  ('2025-06-08','Sunday',    TRUE,  FALSE, 2),
  ('2025-06-09','Monday',    FALSE, FALSE, 4),
  ('2025-06-10','Tuesday',   FALSE, FALSE, 4),
  ('2025-06-11','Wednesday', FALSE, FALSE, 4),
  ('2025-06-12','Thursday',  FALSE, FALSE, 4),
  ('2025-06-13','Friday',    FALSE, FALSE, 4),
  ('2025-06-14','Saturday',  TRUE,  FALSE, 2),
  ('2025-06-15','Sunday',    TRUE,  FALSE, 2),
  ('2025-06-16','Monday',    FALSE, FALSE, 4),
  ('2025-06-17','Tuesday',   FALSE, FALSE, 4),
  ('2025-06-18','Wednesday', FALSE, FALSE, 4),
  ('2025-06-19','Thursday',  FALSE, TRUE,  3),
  ('2025-06-20','Friday',    FALSE, FALSE, 4),
  ('2025-06-21','Saturday',  TRUE,  FALSE, 2),
  ('2025-06-22','Sunday',    TRUE,  FALSE, 2),
  ('2025-06-23','Monday',    FALSE, FALSE, 4),
  ('2025-06-24','Tuesday',   FALSE, FALSE, 4),
  ('2025-06-25','Wednesday', FALSE, FALSE, 4),
  ('2025-06-26','Thursday',  FALSE, FALSE, 4),
  ('2025-06-27','Friday',    FALSE, FALSE, 4),
  ('2025-06-28','Saturday',  TRUE,  FALSE, 2),
  ('2025-06-29','Sunday',    TRUE,  FALSE, 2),
  ('2025-06-30','Monday',    FALSE, FALSE, 4),

-- July
  ('2025-07-01','Tuesday',   FALSE, FALSE, 4),
  ('2025-07-02','Wednesday', FALSE, FALSE, 4),
  ('2025-07-03','Thursday',  FALSE, FALSE, 4),
  ('2025-07-04','Friday',    FALSE, TRUE,  3),
  ('2025-07-05','Saturday',  TRUE,  FALSE, 2),
  ('2025-07-06','Sunday',    TRUE,  FALSE, 2),
  ('2025-07-07','Monday',    FALSE, FALSE, 4),
  ('2025-07-08','Tuesday',   FALSE, FALSE, 4),
  ('2025-07-09','Wednesday', FALSE, FALSE, 4),
  ('2025-07-10','Thursday',  FALSE, FALSE, 4),
  ('2025-07-11','Friday',    FALSE, FALSE, 4),
  ('2025-07-12','Saturday',  TRUE,  FALSE, 2),
  ('2025-07-13','Sunday',    TRUE,  FALSE, 2),
  ('2025-07-14','Monday',    FALSE, FALSE, 4),
  ('2025-07-15','Tuesday',   FALSE, FALSE, 4),
  ('2025-07-16','Wednesday', FALSE, FALSE, 4),
  ('2025-07-17','Thursday',  FALSE, FALSE, 4),
  ('2025-07-18','Friday',    FALSE, FALSE, 4),
  ('2025-07-19','Saturday',  TRUE,  FALSE, 2),
  ('2025-07-20','Sunday',    TRUE,  FALSE, 2),
  ('2025-07-21','Monday',    FALSE, FALSE, 4),
  ('2025-07-22','Tuesday',   FALSE, FALSE, 4),
  ('2025-07-23','Wednesday', FALSE, FALSE, 4),
  ('2025-07-24','Thursday',  FALSE, FALSE, 4),
  ('2025-07-25','Friday',    FALSE, FALSE, 4),
  ('2025-07-26','Saturday',  TRUE,  FALSE, 2),
  ('2025-07-27','Sunday',    TRUE,  FALSE, 2),
  ('2025-07-28','Monday',    FALSE, FALSE, 4),
  ('2025-07-29','Tuesday',   FALSE, FALSE, 4),
  ('2025-07-30','Wednesday', FALSE, FALSE, 4),
  ('2025-07-31','Thursday',  FALSE, FALSE, 4);


-- Seed data: 20 listing-price rules (June-July 2025)
INSERT INTO listing_price_rule
  (listing_id, calendar_date, rate_id, calculated_price) VALUES
  -- Listing 1 • Capitol Hill Apartment
  (1,'2025-06-21',2,150.00),   -- Sat  Weekend
  (1,'2025-07-04',3,175.00),   -- Fri  Independence Day (Holiday)

  -- Listing 2 • Parliament View Townhome
  (2,'2025-06-25',4,140.00),   -- Wed  Peak Summer
  (2,'2025-06-29',2,155.00),   -- Sun  Weekend

  -- Listing 3 • Reforma Studio Loft
  (3,'2025-07-05',2,120.00),   -- Sat  Weekend
  (3,'2025-07-06',2,118.00),   -- Sun  Weekend
  (3,'2025-07-07',4,110.00),   -- Mon  Peak Summer

  -- Listing 4 • Modern Flat near Esplanada
  (4,'2025-06-19',3,180.00),   -- Thu  Juneteenth (Holiday)
  (4,'2025-07-11',4,160.00),   -- Fri  Peak Summer

  -- Listing 5 • San Telmo Heritage Home
  (5,'2025-06-22',2,200.00),   -- Sun  Weekend
  (5,'2025-07-14',4,210.00),   -- Mon  Peak Summer
  (5,'2025-07-19',2,220.00),   -- Sat  Weekend

  -- Listing 6 • Iconic Downing Street Room
  (6,'2025-06-30',4, 90.00),   -- Mon  Peak Summer
  (6,'2025-07-12',2, 95.00),   -- Sat  Weekend

  -- Listing 7 • Champs-Élysées Chic Studio
  (7,'2025-06-26',4,130.00),   -- Thu  Peak Summer
  (7,'2025-07-15',4,132.00),   -- Tue  Peak Summer

  -- Listing 8 • Unter den Linden Flat
  (8,'2025-07-03',4,115.00),   -- Thu  Peak Summer
  (8,'2025-07-18',4,116.00),   -- Fri  Peak Summer

  -- Listing 9 • Via del Corso Penthouse
  (9,'2025-06-28',2,140.00),   -- Sat  Weekend
  (9,'2025-07-20',2,145.00);   -- Sun  Weekend


-- Seed data: 20 booked/blocked nights (is_available = FALSE)
INSERT INTO availability (listing_id, calendar_date, is_available) VALUES
  -- Listing 1 • Capitol Hill Apartment
  (1,'2025-06-21',FALSE),
  (1,'2025-06-22',FALSE),

  -- Listing 2 • Parliament View Townhome
  (2,'2025-07-04',FALSE),  -- Independence Day
  (2,'2025-07-05',FALSE),

  -- Listing 3 • Reforma Studio Loft
  (3,'2025-06-30',FALSE),
  (3,'2025-07-02',FALSE),

  -- Listing 4 • Modern Flat near Esplanada
  (4,'2025-07-12',FALSE),
  (4,'2025-07-13',FALSE),

  -- Listing 5 • San Telmo Heritage Home
  (5,'2025-06-27',FALSE),
  (5,'2025-07-14',FALSE),

  -- Listing 6 • Iconic Downing Street Room
  (6,'2025-07-12',FALSE),
  (6,'2025-07-13',FALSE),

  -- Listing 7 • Champs-Élysées Chic Studio
  (7,'2025-06-26',FALSE),
  (7,'2025-07-15',FALSE),

  -- Listing 8 • Unter den Linden Flat
  (8,'2025-07-03',FALSE),
  (8,'2025-07-18',FALSE),

  -- Listing 9 • Via del Corso Penthouse
  (9,'2025-06-28',FALSE),
  (9,'2025-07-20',FALSE),

  -- Listing 10 • Alcalá Artistic Loft
  (10,'2025-06-29',FALSE),
  (10,'2025-07-11',FALSE);


-- Seed data: 20 bookings (June–July 2025)
-- listing_id 1-10, user_id 21-40, some tied to companies 1-3
INSERT INTO booking
  (user_id, company_id, listing_id,
   check_in, check_out, num_guests,
   base_price, booking_status, total_price, currency_code)
VALUES
  -- Listing 1 • Capitol Hill Apartment (USD)
  (21, NULL, 1, '2025-06-21','2025-06-22', 2, 130.00, 'completed', 150.00, 'USD'),
  (22, NULL, 1, '2025-06-22','2025-06-23', 1, 130.00, 'completed', 150.00, 'USD'),

  -- Listing 2 • Parliament View Townhome (CAD) – Apple Inc. business trip
  (23, 2,    2, '2025-07-04','2025-07-05', 3, 140.00, 'confirmed', 165.00, 'CAD'),
  (24, 2,    2, '2025-07-05','2025-07-06', 2, 140.00, 'confirmed', 165.00, 'CAD'),

  -- Listing 3 • Reforma Studio Loft (MXN)
  (25, NULL, 3, '2025-06-30','2025-07-01', 1,  90.00, 'completed', 105.00, 'MXN'),
  (26, NULL, 3, '2025-07-02','2025-07-03', 1,  90.00, 'confirmed', 105.00, 'MXN'),

  -- Listing 4 • Modern Flat near Esplanada (BRL) – Microsoft off-site
  (27, 4,    4, '2025-07-12','2025-07-13', 2, 160.00, 'confirmed', 185.00, 'BRL'),
  (28, 4,    4, '2025-07-13','2025-07-14', 2, 160.00, 'confirmed', 185.00, 'BRL'),

  -- Listing 5 • San Telmo Heritage Home (ARS)
  (29, NULL, 5, '2025-06-27','2025-06-28', 4, 190.00, 'completed', 215.00, 'ARS'),
  (30, NULL, 5, '2025-07-14','2025-07-15', 3, 200.00, 'confirmed', 225.00, 'ARS'),

  -- Listing 6 • Iconic Downing St Room (GBP) – Amazon UK stay
  (31, 6,    6, '2025-07-12','2025-07-13', 1,  85.00, 'confirmed',  95.00, 'GBP'),
  (32, 6,    6, '2025-07-13','2025-07-14', 1,  85.00, 'confirmed',  95.00, 'GBP'),

  -- Listing 7 • Champs-Élysées Chic Studio (EUR)
  (33, NULL, 7, '2025-06-26','2025-06-27', 2, 120.00, 'completed', 135.00, 'EUR'),
  (34, NULL, 7, '2025-07-15','2025-07-16', 2, 125.00, 'confirmed', 140.00, 'EUR'),

  -- Listing 8 • Unter den Linden Flat (EUR)
  (35, NULL, 8, '2025-07-03','2025-07-04', 2, 110.00, 'completed', 125.00, 'EUR'),
  (36, NULL, 8, '2025-07-18','2025-07-19', 2, 115.00, 'confirmed', 130.00, 'EUR'),

  -- Listing 9 • Via del Corso Penthouse (EUR)
  (37, NULL, 9, '2025-06-28','2025-06-29', 3, 140.00, 'completed', 160.00, 'EUR'),
  (38, NULL, 9, '2025-07-20','2025-07-21', 2, 145.00, 'confirmed', 165.00, 'EUR'),

  -- Listing 10 • Alcalá Artistic Loft (EUR)
  (39, NULL,10, '2025-06-29','2025-06-30', 2, 110.00, 'completed', 125.00, 'EUR'),
  (40, NULL,10, '2025-07-11','2025-07-12', 2, 115.00, 'confirmed', 130.00, 'EUR'),

  -- Listing 11 • Canal-Side Houseboat (EUR)
  (41, NULL, 11, '2025-07-22','2025-07-23', 2, 130.00, 'confirmed', 145.00, 'EUR'),
  (42, NULL, 11, '2025-07-27','2025-07-28', 2, 130.00, 'pending',   145.00, 'EUR'),

  -- Listing 12 • Bundesgasse Alpine Flat (CHF)
  (43, NULL, 12, '2025-07-18','2025-07-19', 2, 120.00, 'confirmed', 135.00, 'CHF'),
  (44, NULL, 12, '2025-07-19','2025-07-20', 2, 120.00, 'pending',   135.00, 'CHF'),

  -- Listing 13 • Gamla Stan Rooftop Studio (SEK)
  (45, NULL, 13, '2025-07-03','2025-07-04', 1, 100.00, 'confirmed', 115.00, 'SEK'),
  (46, NULL, 13, '2025-07-04','2025-07-05', 1, 100.00, 'pending',   115.00, 'SEK'),

  -- Listing 14 • Karl Johans Cozy Room (NOK)
  (47, NULL, 14, '2025-07-24','2025-07-25', 1,  90.00, 'confirmed', 105.00, 'NOK'),
  (48, NULL, 14, '2025-07-25','2025-07-26', 1,  90.00, 'pending',   105.00, 'NOK'),

  -- Listing 15 • Nyhavn Colorful Apartment (DKK)
  (49, NULL, 15, '2025-06-30','2025-07-01', 2, 150.00, 'confirmed', 170.00, 'DKK'),
  (50, NULL, 15, '2025-07-04','2025-07-05', 2, 150.00, 'pending',   170.00, 'DKK'),

  -- Listing 16 • Reykjavík Nordic Cabin (ISK)
  (51, NULL, 16, '2025-07-11','2025-07-12', 2, 110.00, 'confirmed', 125.00, 'ISK'),
  (52, NULL, 16, '2025-07-12','2025-07-13', 2, 110.00, 'pending',   125.00, 'ISK'),

  -- Listing 17 • Old-Town Boutique Suite (PLN)
  (53, NULL, 17, '2025-07-07','2025-07-08', 2,  80.00, 'confirmed',  95.00, 'PLN'),
  (54, NULL, 17, '2025-07-08','2025-07-09', 2,  80.00, 'pending',    95.00, 'PLN'),

  -- Listing 18 • Staroměstské Square Loft (CZK)
  (55, NULL, 18, '2025-06-25','2025-06-26', 2,  90.00, 'confirmed', 105.00, 'CZK'),
  (56, NULL, 18, '2025-06-26','2025-06-27', 2,  90.00, 'pending',   105.00, 'CZK'),

  -- Listing 19 • Andrássy Grand Apartment (HUF)
  (57, NULL, 19, '2025-07-17','2025-07-18', 3, 140.00, 'confirmed', 165.00, 'HUF'),
  (58, NULL, 19, '2025-07-18','2025-07-19', 3, 140.00, 'pending',   165.00, 'HUF'),

  -- Listing 20 • Victoriei Stylish Studio (RON)
  (59, NULL, 20, '2025-06-20','2025-06-21', 2,  85.00, 'confirmed', 100.00, 'RON'),
  (60, NULL, 20, '2025-06-21','2025-06-22', 2,  85.00, 'pending',   100.00, 'RON');


-- Seed data: 20 cancellations for booking_id 21-40
INSERT INTO cancellation
  (booking_id, cancellation_date, reason, refund_amount) VALUES
  (21,'2025-05-20 10:05:00','Guest schedule change',           145.00),
  (22,'2025-06-01 14:20:00','Found cheaper accommodation',     145.00),
  (23,'2025-06-15 09:30:00','Corporate trip cancelled',        165.00),
  (24,'2025-06-18 16:45:00','Changed to different dates',      165.00),
  (25,'2025-05-28 11:10:00','Flight was rescheduled',          105.00),
  (26,'2025-06-03 18:25:00','Health reasons',                  105.00),
  (27,'2025-06-22 07:55:00','Company policy change',           185.00),
  (28,'2025-06-24 19:40:00','Conference moved online',         185.00),
  (29,'2025-05-30 21:15:00','Family emergency',                215.00),
  (30,'2025-06-25 12:05:00','Guest opted for longer stay elsewhere',225.00),
  (31,'2025-06-28 08:50:00','Visa issues',                      95.00),
  (32,'2025-07-02 15:30:00','Budget constraints',               95.00),
  (33,'2025-06-10 13:10:00','Weather concerns',                135.00),
  (34,'2025-07-05 10:45:00','Changed destination city',        140.00),
  (35,'2025-06-12 17:20:00','Work schedule conflict',          125.00),
  (36,'2025-07-06 09:00:00','Travel companion cancelled',      130.00),
  (37,'2025-05-26 11:40:00','Medical emergency',               160.00),
  (38,'2025-06-29 14:55:00','Found a larger place',            165.00),
  (39,'2025-05-27 18:35:00','Transportation strike',           125.00),
  (40,'2025-06-30 07:25:00','Changed to different accommodation',130.00);


-- Seed data: 20 reviews (10 guest→host, 10 host→guest)
INSERT INTO review
  (booking_id, user_id, reviewer_id, reviewee_id, rating, comment) VALUES
  -- Guest reviews of hosts (bookings 1-10)
  ( 1, 21, 21,  1, 5, 'Great place, super friendly host!'),
  ( 2, 22, 22,  1, 4, 'Nice stay, a bit noisy at night.'),
  ( 3, 23, 23,  2, 5, 'Amazing townhouse and perfect location.'),
  ( 4, 24, 24,  2, 5, 'Host was very accommodating.'),
  ( 5, 25, 25,  3, 4, 'Loft was stylish, Wi-Fi could be faster.'),
  ( 6, 26, 26,  3, 5, 'Loved the industrial vibe, would return.'),
  ( 7, 27, 27,  4, 4, 'Great view, minor check-in delay.'),
  ( 8, 28, 28,  4, 5, 'Spotless flat and helpful host.'),
  ( 9, 29, 29,  5, 5, 'Beautiful heritage home, fantastic patio.'),
  (10, 30, 30,  5, 3, 'Good value but street was loud.'),

  -- Host reviews of guests (bookings 11-20)
  (11, 31,  6, 31, 5, 'Excellent guest, left room spotless.'),
  (12, 32,  6, 32, 4, 'Good guest, minor checkout delay.'),
  (13, 33,  7, 33, 5, 'Very polite, welcome back anytime!'),
  (14, 34,  7, 34, 5, 'Friendly and communicative guest.'),
  (15, 35,  8, 35, 4, 'Tidy guest, slight noise after hours.'),
  (16, 36,  8, 36, 4, 'Easy to host, followed house rules.'),
  (17, 37,  9, 37, 5, 'Great guest, no issues at all.'),
  (18, 38,  9, 38, 3, 'Left dishes unwashed but otherwise fine.'),
  (19, 39, 10, 39, 5, 'Perfect guest, highly recommended.'),
  (20, 40, 10, 40, 4, 'Good stay, could improve communication.');


-- Seed data: 20 payments for booking_id 1–20
INSERT INTO payment
  (booking_id, amount, currency_code,
   payment_method, payment_status)
VALUES
  -- Capitol Hill Apartment  (USD)
  ( 1, 150.00, 'USD', 'credit_card',  'completed'),
  ( 2, 150.00, 'USD', 'paypal',       'completed'),

  -- Parliament View Townhome (CAD)
  ( 3, 165.00, 'CAD', 'stripe',       'completed'),
  ( 4, 165.00, 'CAD', 'credit_card',  'completed'),

  -- Reforma Studio Loft (MXN)
  ( 5, 105.00, 'MXN', 'paypal',       'completed'),
  ( 6, 105.00, 'MXN', 'stripe',       'failed'),      -- card declined

  -- Modern Flat near Esplanada (BRL)
  ( 7, 185.00, 'BRL', 'credit_card',  'completed'),
  ( 8, 185.00, 'BRL', 'paypal',       'completed'),

  -- San Telmo Heritage Home (ARS)
  ( 9, 215.00, 'ARS', 'stripe',       'completed'),
  (10, 225.00, 'ARS', 'credit_card',  'completed'),

  -- Iconic Downing Street Room (GBP)
  (11,  95.00, 'GBP', 'paypal',       'completed'),
  (12,  95.00, 'GBP', 'bank_transfer','pending'),     -- awaiting confirmation

  -- Champs-Élysées Chic Studio (EUR)
  (13, 135.00, 'EUR', 'stripe',       'completed'),
  (14, 140.00, 'EUR', 'credit_card',  'completed'),

  -- Unter den Linden Flat (EUR)
  (15, 125.00, 'EUR', 'paypal',       'failed'),      -- payment error
  (16, 130.00, 'EUR', 'stripe',       'pending'),

  -- Via del Corso Penthouse (EUR)
  (17, 160.00, 'EUR', 'credit_card',  'completed'),
  (18, 165.00, 'EUR', 'paypal',       'completed'),

  -- Alcalá Artistic Loft (EUR)
  (19, 125.00, 'EUR', 'stripe',       'completed'),
  (20, 130.00, 'EUR', 'bank_transfer','completed');


-- Seed data: 20 promotional codes
INSERT INTO promo_code
  (code, description, discount_type, value, currency_code,
   usage_limit, per_user_limit,
   valid_from, valid_to, is_active, created_by)
VALUES
  -- General-purpose %
  ('SUMMER10',     '10 % off summer stays',                'PERCENT', 10.00, NULL, 0, 1, '2025-06-01','2025-08-31', 1, 1),
  ('WELCOME5',     'First-time guest welcome',            'PERCENT',  5.00, NULL, 0, 1, '2025-01-01','2025-12-31', 1, 1),
  ('LONGSTAY15',   '15 % off stays ≥7 nights',            'PERCENT', 15.00, NULL, 0, 0, '2025-01-01','2026-12-31', 1, 1),
  ('FLASH20',      'Flash sale 20 % off',                 'PERCENT', 20.00, NULL, 100,1,'2025-07-10','2025-07-12', 1, 1),
  ('REVIEWER7',    '7 % off for leaving a review',        'PERCENT',  7.00, NULL, 0, 1, '2025-06-01','2026-06-01', 1, 1),

  -- Fixed amount, USD
  ('JULY4USD25',   '$25 off Independence Day',            'FIXED',   25.00, 'USD', 50,1,'2025-07-01','2025-07-05', 1, 1),
  ('BLACKFRIDAY',  '$50 Black Friday discount',           'FIXED',   50.00, 'USD', 0, 1,'2025-11-28','2025-11-30', 1, 1),
  ('CYBER10',      '$10 Cyber Monday deal',               'FIXED',   10.00, 'USD', 0, 1,'2025-12-01','2025-12-02', 1, 1),

  -- Fixed amount, EUR
  ('EUROSPRING20', '€20 spring discount (EU listings)',   'FIXED',   20.00, 'EUR', 0, 1,'2026-03-01','2026-05-31', 1, 1),
  ('XMAS15EUR',    '€15 off Christmas bookings',          'FIXED',   15.00, 'EUR', 0, 1,'2025-12-20','2025-12-26', 1, 1),

  -- Fixed amount, GBP
  ('LONDON5',      '£5 off London stays',                 'FIXED',    5.00, 'GBP', 0, 3,'2025-06-01','2026-05-31', 1, 1),
  ('UKWEEKEND10',  '£10 off UK weekend trips',            'FIXED',   10.00, 'GBP', 0, 1,'2025-06-01','2026-06-01', 1, 1),

  -- Fixed amount, CHF
  ('ALPSCHF30',    'CHF 30 off Swiss chalets',            'FIXED',   30.00, 'CHF', 0, 1,'2025-12-01','2026-03-31', 1, 1),

  -- Fixed amount, CAD
  ('CANADA25',     'CAD 25 off any Canadian listing',     'FIXED',   25.00, 'CAD', 0, 1,'2025-07-01','2026-07-01', 1, 1),

  -- Fixed amount, AUD
  ('AUSSIE15',     'AUD 15 off Aussie holidays',          'FIXED',   15.00, 'AUD', 0, 2,'2025-09-01','2026-02-28', 1, 1),

  -- Percentage promos for events
  ('NYE30',        '30 % off New Year’s Eve',             'PERCENT', 30.00, NULL, 0, 1,'2025-12-30','2026-01-02', 1, 1),
  ('EASTER12',     '12 % off Easter weekend',             'PERCENT', 12.00, NULL, 0, 1,'2026-04-02','2026-04-07', 1, 1),
  ('SPRINGFEST8',  '8 % off Spring Festival week',        'PERCENT',  8.00, NULL, 0, 1,'2026-02-07','2026-02-14', 1, 1),

  -- Fixed amount, JPY
  ('TOKYOJPY1500', '¥1 500 off Tokyo stays',              'FIXED', 1500.00, 'JPY', 0, 1,'2025-06-15','2026-06-15', 1, 1),

  -- Inactive code example
  ('OLDYEAR5',     '5 % legacy promo (inactive)',         'PERCENT',  5.00, NULL, 0, 1,'2024-01-01','2024-12-31', 0, 1);


-- Seed data: 20 promo-code redemptions (bookings 1-20)
INSERT INTO promo_redemption
  (promo_code, booking_id, user_id, discount_applied) VALUES
  -- 1
  ('SUMMER10',      1, 21, 15.00),
  -- 2
  ('WELCOME5',      2, 22,  7.50),
  -- 3
  ('LONGSTAY15',    3, 23, 24.75),
  -- 4
  ('FLASH20',       4, 24, 33.00),
  -- 5
  ('REVIEWER7',     5, 25,  7.35),
  -- 6
  ('JULY4USD25',    6, 26, 25.00),
  -- 7
  ('BLACKFRIDAY',   7, 27, 50.00),
  -- 8
  ('CYBER10',       8, 28, 10.00),
  -- 9
  ('EUROSPRING20',  9, 29, 20.00),
  -- 10
  ('XMAS15EUR',    10, 30, 15.00),
  -- 11
  ('LONDON5',      11, 31,  5.00),
  -- 12
  ('UKWEEKEND10',  12, 32, 10.00),
  -- 13
  ('ALPSCHF30',    13, 33, 30.00),
  -- 14
  ('CANADA25',     14, 34, 25.00),
  -- 15
  ('AUSSIE15',     15, 35, 15.00),
  -- 16
  ('NYE30',        16, 36, 39.00),
  -- 17
  ('EASTER12',     17, 37, 19.20),
  -- 18
  ('SPRINGFEST8',  18, 38, 13.20),
  -- 19
  ('TOKYOJPY1500', 19, 39, 10.00),
  -- 20
  ('OLDYEAR5',     20, 40,  6.50);


-- Seed data: 20 conversation threads
    -- Threads 1-15 are linked to specific bookings (booking_id 1-15)
    -- Threads 16-20 are “pre-booking” chats (booking_id = NULL)-
INSERT INTO conversation (booking_id) VALUES
  ( 1),
  ( 2),
  ( 3),
  ( 4),
  ( 5),
  ( 6),
  ( 7),
  ( 8),
  ( 9),
  (10),
  (11),
  (12),
  (13),
  (14),
  (15),
  (NULL),   -- enquiry before any booking
  (NULL),
  (NULL),
  (NULL),
  (NULL);



-- Seed data: 20 conversation participants
    -- Conversations 1-10 each have exactly two participants:
        -- the host (user_id 1-5)
        -- the guest (user_id 21-30)
INSERT INTO conversation_participant (conversation_id, user_id) VALUES
  ( 1,  1),  -- host of listing 1
  ( 1, 21),  -- guest (booking 1)

  ( 2,  1),  -- same host, different guest
  ( 2, 22),

  ( 3,  2),  -- host of listing 2
  ( 3, 23),

  ( 4,  2),
  ( 4, 24),

  ( 5,  3),  -- host of listing 3
  ( 5, 25),

  ( 6,  3),
  ( 6, 26),

  ( 7,  4),  -- host of listing 4
  ( 7, 27),

  ( 8,  4),
  ( 8, 28),

  ( 9,  5),  -- host of listing 5
  ( 9, 29),

  (10,  5),
  (10, 30);



-- Seed data: 20 chat messages (one per conversation)
-- + 20 replies
INSERT INTO message
  (conversation_id, parent_message_id, sender_id, body, is_automated) VALUES
  -- Conversations linked to bookings
  ( 1, NULL, 21, 'Hi! Looking forward to checking in on Saturday. Let me know arrival details.', FALSE),
  ( 2, NULL, 22, 'Hello! Can we confirm parking availability during my stay?',                   FALSE),
  ( 3, NULL, 23, 'Hi there — what is the Wi-Fi speed in the townhome?',                           FALSE),
  ( 4, NULL, 24, 'Good morning! Could we get a late checkout on Sunday?',                         FALSE),
  ( 5, NULL, 25, 'Hola! Is the patio shared with other guests?',                                  FALSE),
  ( 6, NULL, 26, 'Hi! Do you provide airport pickup service?',                                    FALSE),
  ( 7, NULL, 27, 'Hello! Any recommendations for restaurants nearby?',                            FALSE),
  ( 8, NULL, 28, 'Hi! Is there an elevator in the building?',                                     FALSE),
  ( 9, NULL, 29, 'Ciao! Does the penthouse have blackout curtains?',                              FALSE),
  (10, NULL, 30, '¡Hola! Could you confirm the loft has air-conditioning?',                       FALSE),

  -- Conversations 11–15 (linked to bookings 11-15)
  (11, NULL, 31, 'Hi! Just confirming my arrival at 18:00 tomorrow.',                             FALSE),
  (12, NULL, 32, 'Hello! Is early check-in possible around 13:00?',                               FALSE),
  (13, NULL, 33, 'Hej! Where can we store luggage after checkout?',                               FALSE),
  (14, NULL, 34, 'Hi! Are linens and towels included?',                                           FALSE),
  (15, NULL, 35, 'G’day! Does the apartment have a washer/dryer?',                                FALSE),

  -- Pre-booking enquiry threads (conversation_id 16-20, booking_id NULL)
  (16, NULL, 41, 'Hi! Is the houseboat available for the first weekend of August?',               FALSE),
  (17, NULL, 42, 'Hello! Could you clarify the pet policy before I book?',                        FALSE),
  (18, NULL, 43, 'Hi there — is there secure bike storage on site?',                              FALSE),
  (19, NULL, 44, 'Good evening! What is your cancellation policy?',                               FALSE),
  (20, NULL, 45, 'Hey! Do you offer any weekly discount for a two-week stay?',                    FALSE),

  -- Replies from hosts to guests
  ( 1,  1,  1, 'Hi! Check-in is any time after 3 pm. Looking forward to hosting you!', FALSE),
  ( 2,  2,  1, 'Yes—one on-street permit is included free of charge.',               FALSE),
  ( 3,  3,  2, 'The Wi-Fi averages 200 Mbps down / 50 Mbps up.',                     FALSE),
  ( 4,  4,  2, 'Sure, late checkout until noon is no problem.',                      FALSE),
  ( 5,  5,  3, 'The patio is private—only for your group.',                          FALSE),
  ( 6,  6,  3, 'We can arrange a driver for $30—let me know flight details.',        FALSE),
  ( 7,  7,  4, 'I recommend the rooftop restaurant “Skyline”.',                      FALSE),
  ( 8,  8,  4, 'Yes, the flat is on the 4ᵗʰ floor with a lift.',                     FALSE),
  ( 9,  9,  5, 'All bedrooms have blackout curtains for a restful sleep.',           FALSE),
  (10, 10,  5, 'Correct—full A/C throughout the loft.',                              FALSE),

  -- Replies from hosts to later bookings
  (11, 11,  6, 'Great—see you at 18:00. Safe travels!',                              FALSE),
  (12, 12,  6, 'Early check-in at 13:00 is available—confirmed.',                    FALSE),
  (13, 13,  7, 'Yes, you can store luggage until 5 pm.',                             FALSE),
  (14, 14,  7, 'Linens and towels are provided for all guests.',                     FALSE),
  (15, 15,  8, 'Yes—washer/dryer combo is in the hallway closet.',                   FALSE),

  -- Replies to pre-booking enquiries (conv 16-20)
  (16, 16, 11, 'The houseboat is free that weekend—feel free to book!',              FALSE),
  (17, 17, 11, 'Pets under 10 kg are welcome with a €20 fee.',                        FALSE),
  (18, 18, 12, 'Yes, we have a secure bike shed behind the building.',               FALSE),
  (19, 19, 13, 'Flexible 48-hour free-cancellation policy applies.',                 FALSE),
  (20, 20, 14, 'We offer a 10 % weekly discount for 7+-night stays.',                FALSE);


-- Seed data: 20 customer-support tickets
INSERT INTO support_ticket
  (user_id, subject, description, status) VALUES
  -- 1  user 21
  (21, 'Booking date change',
   'Please adjust my check-in from 21 Jun to 22 Jun on booking #1.',       'open'),

  -- 2  user 22
  (22, 'Refund enquiry',
   'I cancelled within the free window; when will I see my refund?',       'resolved'),

  -- 3  user 23
  (23, 'Payment failed',
   'Stripe payment declined for booking #3 — need assistance.',            'closed'),

  -- 4  user 24
  (24, 'Early check-in request',
   'Can I access the townhome at 11 am instead of 3 pm?',                  'open'),

  -- 5  user 25
  (25, 'Host unresponsive',
   'I messaged the host two days ago and still no reply.',                 'open'),

  -- 6  user 26
  (26, 'Apply promo code retrospectively',
   'Forgot to enter SUMMER10 during checkout — possible to apply now?',    'resolved'),

  -- 7  user 27
  (27, 'Invoice needed',
   'Need a VAT invoice for my business stay, booking #7.',                 'closed'),

  -- 8  user 28
  (28, 'Change number of guests',
   'We now have 3 guests instead of 2 for booking #8.',                    'open'),

  -- 9  user 29
  (29, 'Property cleanliness issue',
   'The penthouse was not cleaned properly on arrival; photos attached.',  'open'),

  -- 10 user 30
  (30, 'Duplicate charge',
   'Card was charged twice for booking #10 — please investigate.',         'resolved'),

  -- 11 user 31
  (31, 'Extend stay',
   'Want to add one more night to the houseboat reservation.',             'open'),

  -- 12 user 32
  (32, 'Late checkout fee dispute',
   'Charged a fee although checkout approved by host.',                    'closed'),

  -- 13 user 33
  (33, 'Change payment method',
   'Need to switch from PayPal to credit card for booking #13.',           'open'),

  -- 14 user 34
  (34, 'Accessibility information',
   'Is the room wheelchair-accessible? Could not find details.',           'open'),

  -- 15 user 35
  (35, 'Noise complaint',
   'Neighbour construction noise 07:00–18:00, please assist.',            'resolved'),

  -- 16 user 36
  (36, 'Unable to upload ID',
   'Verification upload keeps failing on mobile app.',                     'open'),

  -- 17 user 37
  (37, 'Currency conversion issue',
   'Total charged in USD instead of EUR — need clarification.',            'closed'),

  -- 18 user 38
  (38, 'Request invoice amendment',
   'Company name misspelled on invoice; please re-issue.',                 'resolved'),

  -- 19 user 39
  (39, 'Pet policy clarification',
   'Booking #19: Are cats allowed? Listing mentions “pets on request”.',   'open'),

  -- 20 anonymous ticket
  (NULL,
   'General enquiry',
   'I am considering hosting — what fees apply to hosts?',                 'open');



-- Seed data: 20 referral relationships
-- Early users 1-5 each refer four later users (IDs 41-60)
INSERT INTO user_referral (referrer_id, referred_id) VALUES
  -- Referrer 1
  (1, 41),
  (1, 42),
  (1, 43),
  (1, 44),

  -- Referrer 2
  (2, 45),
  (2, 46),
  (2, 47),
  (2, 48),

  -- Referrer 3
  (3, 49),
  (3, 50),
  (3, 51),
  (3, 52),

  -- Referrer 4
  (4, 53),
  (4, 54),
  (4, 55),
  (4, 56),

  -- Referrer 5
  (5, 57),
  (5, 58),
  (5, 59),
  (5, 60);


-- Seed data: major languages
INSERT INTO language (language_code, name) VALUES
  ('nl', 'Dutch'),
  ('pl', 'Polish'),
  ('id', 'Indonesian'),
  ('fa', 'Persian (Farsi)'),
  ('th', 'Thai'),
  ('sw', 'Swahili'),
  ('gu', 'Gujarati'),
  ('he', 'Hebrew'),
  ('ro', 'Romanian'),
  ('cs', 'Czech'),
  ('sv', 'Swedish'),
  ('el', 'Greek'),
  ('fi', 'Finnish'),
  ('no', 'Norwegian'),
  ('da', 'Danish'),
  ('hu', 'Hungarian'),
  ('uk', 'Ukrainian'),
  ('sr', 'Serbian'),
  ('bg', 'Bulgarian'),
  ('sk', 'Slovak'),
  ('ms', 'Malay'),
  ('my', 'Burmese'),
  ('km', 'Khmer'),
  ('lo', 'Lao'),
  ('si', 'Sinhala'),
  ('am', 'Amharic'),
  ('af', 'Afrikaans'),
  ('zu', 'Zulu'),
  ('yo', 'Yoruba'),
  ('ne', 'Nepali'),
  ('ur', 'Urdu'),
  ('de', 'German'),
  ('ko', 'Korean'),
  ('es', 'Spanish'),
  ('ar', 'Arabic'),
  ('pt', 'Portuguese'),
  ('zh', 'Chinese'),
  ('ru', 'Russian'),
  ('fr', 'France'),
  ('it', 'Italian'),
  ('en', 'English'),
  ('tr', 'Turkish');


-- Seed data: primary language for all 60 users
INSERT INTO user_language (user_id, language_code) VALUES
  -- Users 1–20 (early demo users & hosts)
   ( 1,'en'),  -- Alice Smith   • USA
   ( 2,'en'),  -- Bob Johnson   • USA
   ( 3,'en'),  -- Carol Davis   • UK
   ( 4,'en'),  -- David Miller  • USA
   ( 5,'en'),  -- Emma Wilson   • Australia
   ( 6,'en'),  -- Frank Moore   • USA
   ( 7,'en'),  -- Grace Taylor  • USA
   ( 8,'en'),  -- Henry Anderson• USA
   ( 9,'es'),  -- Irene Thomas  • Spain
   (10,'de'),  -- Jack Jackson  • Germany
   (11,'en'),  -- Karen White   • USA
   (12,'en'),  -- Liam Harris   • Ireland
   (13,'en'),  -- Mia Martin    • USA
   (14,'en'),  -- Noah Thompson • USA
   (15,'es'),  -- Olivia Garcia • Mexico
   (16,'en'),  -- Paul Martinez • USA
   (17,'en'),  -- Quinn Robinson• USA
   (18,'en'),  -- Ruby Clark    • South Africa (English)
   (19,'en'),  -- Samuel Rodriguez• USA
   (20,'en'),  -- Tina Lewis    • USA

  -- Users 21–40 (new sign-ups)
   (21,'en'),  -- Uma Bennett   • USA
   (22,'en'),  -- Victor Hughes • UK
   (23,'es'),  -- Wendy Perez   • Mexico
   (24,'es'),  -- Xavier Flores • Spain
   (25,'en'),  -- Yara Nguyen   • Australia
   (26,'ko'),  -- Zane Kim      • South Korea
   (27,'es'),  -- Abel Lopez    • Spain
   (28,'en'),  -- Bianca Gonzalez• USA
   (29,'en'),  -- Carter Ward   • USA
   (30,'en'),  -- Diana Foster  • USA
   (31,'de'),  -- Ethan Bailey  • Germany
   (32,'ar'),  -- Farah Ali     • UAE
   (33,'en'),  -- Gavin Scott   • Ireland
   (34,'en'),  -- Hannah Murphy • UK
   (35,'pt'),  -- Ismael Silva  • Brazil
   (36,'ur'),  -- Jade Khan     • Pakistan
   (37,'zh'),  -- Ken Wu        • Taiwan
   (38,'fr'),  -- Lola Dupont   • France
   (39,'it'),  -- Marco Rossi   • Italy
   (40,'de'),  -- Nina Meier    • Switzerland (German)

  -- Users 41–60 (later sign-ups via referrals)
   (41,'ar'),  -- Omar Aziz     • Egypt
   (42,'sv'),  -- Pia Johansson • Sweden
   (43,'zh'),  -- Qi Zhang      • China
   (44,'pt'),  -- Rafael Costa  • Portugal
   (45,'en'),  -- Sara O'Connor • USA
   (46,'ko'),  -- Tom Lee       • South Korea
   (47,'de'),  -- Ursula Keller • Switzerland
   (48,'ru'),  -- Victor Ivanov • Russia
   (49,'sw'),  -- Warda Mohamed • Kenya (Swahili)
   (50,'es'),  -- Ximena Torres • Colombia
   (51,'tr'),  -- Yusuf Demir   • Turkey
   (52,'zh'),  -- Zoey Lam      • Hong Kong
   (53,'en'),  -- Andre Peterson• USA
   (54,'es'),  -- Bella Vega    • Spain
   (55,'en'),  -- Chloe Reed    • USA
   (56,'es'),  -- Diego Mendez  • Mexico
   (57,'fi'),  -- Elina Korhonen• Finland
   (58,'de'),  -- Felix Schmidt • Germany
   (59,'it'),  -- Giulia Bianchi• Italy
   (60,'da');  -- Hugo Nielsen  • Denmark


-- Seed data: host-listing languages (30 rows, one for every listing)
INSERT INTO host_listing_language (host_id, listing_id, language_code) VALUES
  -- Listings 1-10 (unique hosts 1-10)
   ( 1,  1, 'en'),  -- Capitol Hill Apartment
   ( 2,  2, 'en'),  -- Parliament View Townhome
   ( 3,  3, 'en'),  -- Reforma Studio Loft
   ( 4,  4, 'en'),  -- Modern Flat near Esplanada
   ( 5,  5, 'en'),  -- San Telmo Heritage Home
   ( 6,  6, 'en'),  -- Iconic Downing Street Room
   ( 7,  7, 'en'),  -- Champs-Élysées Chic Studio
   ( 8,  8, 'en'),  -- Unter den Linden Flat
   ( 9,  9, 'es'),  -- Via del Corso Penthouse  (Spanish-speaking host)
   (10, 10, 'de'),  -- Alcalá Artistic Loft     (German-speaking host)

  -- Listings 11-20 (hosts 11-20)
   (11, 11, 'en'),  -- Canal-Side Houseboat
   (12, 12, 'en'),  -- Bundesgasse Alpine Flat
   (13, 13, 'en'),  -- Gamla Stan Rooftop Studio
   (14, 14, 'en'),  -- Karl Johans Cozy Room
   (15, 15, 'es'),  -- Nyhavn Colorful Apartment (Spanish host)
   (16, 16, 'en'),  -- Reykjavík Nordic Cabin
   (17, 17, 'en'),  -- Old-Town Boutique Suite
   (18, 18, 'en'),  -- Staroměstské Square Loft
   (19, 19, 'en'),  -- Andrássy Grand Apartment
   (20, 20, 'en'),  -- Victoriei Stylish Studio

  -- Listings 21-30 reuse hosts 1-10
   ( 1, 21, 'en'),
   ( 2, 22, 'en'),
   ( 3, 23, 'en'),
   ( 4, 24, 'en'),
   ( 5, 25, 'en'),
   ( 6, 26, 'en'),
   ( 7, 27, 'en'),
   ( 8, 28, 'en'),
   ( 9, 29, 'es'),
   (10, 30, 'de');


-- Seed data: 20 search-history rows
INSERT INTO search_history
  (user_id, session_id, origin_city,
   check_in, check_out, guests,
   query_text, lat, lng)
VALUES
  -- Logged-in users ---------------------------------------------------------
  (21,'550e8400-e29b-41d4-a716-446655440001','Washington, D.C.',
      '2025-07-04','2025-07-07',2,'4th of July stay', 38.907192,-77.036873),

  (22,'550e8400-e29b-41d4-a716-446655440002','Ottawa',
      '2025-07-10','2025-07-12',1,'townhome near Parliament', 45.421532,-75.697189),

  (23,'550e8400-e29b-41d4-a716-446655440003','Mexico City',
      '2025-06-28','2025-07-02',2,'loft reforma wifi fast', 19.432608,-99.133209),

  (24,'550e8400-e29b-41d4-a716-446655440004','Brasília',
      '2025-07-11','2025-07-15',3,'family apartment with pool', -15.793889,-47.882778),

  (25,'550e8400-e29b-41d4-a716-446655440005','Buenos Aires',
      '2025-06-25','2025-06-29',4,'heritage house patio', -34.603722,-58.381592),

  (26,'550e8400-e29b-41d4-a716-446655440006','London',
      '2025-07-12','2025-07-14',1,'private room Westminster', 51.507351,-0.127758),

  (27,'550e8400-e29b-41d4-a716-446655440007','Paris',
      '2025-07-18','2025-07-20',2,'studio near Champs-Élysées', 48.856613,2.352222),

  (28,'550e8400-e29b-41d4-a716-446655440008','Berlin',
      '2025-06-30','2025-07-03',3,'family flat Brandenburg Gate', 52.520008,13.404954),

  (29,'550e8400-e29b-41d4-a716-446655440009','Rome',
      '2025-07-05','2025-07-09',2,'penthouse terrace view', 41.902782,12.496366),

  (30,'550e8400-e29b-41d4-a716-44665544000a','Madrid',
      '2025-07-15','2025-07-18',2,'loft art deco wifi', 40.416775,-3.703790),

  -- Anonymous sessions ------------------------------------------------------
  (NULL,'550e8400-e29b-41d4-a716-44665544000b','Amsterdam',
      '2025-07-02','2025-07-04',2,'houseboat canal', 52.367573,4.904139),

  (NULL,'550e8400-e29b-41d4-a716-44665544000c','Bern',
      '2025-07-09','2025-07-11',2,'alpine flat river view', 46.948091,7.447441),

  (NULL,'550e8400-e29b-41d4-a716-44665544000d','Stockholm',
      '2025-06-26','2025-06-28',1,'old town studio', 59.329323,18.068581),

  (NULL,'550e8400-e29b-41d4-a716-44665544000e','Oslo',
      '2025-07-24','2025-07-27',2,'cozy room opera house', 59.913868,10.752245),

  (NULL,'550e8400-e29b-41d4-a716-44665544000f','Copenhagen',
      '2025-07-30','2025-08-02',3,'nyhavn apartment canal view', 55.676098,12.568337),

  (NULL,'550e8400-e29b-41d4-a716-446655440010','Reykjavík',
      '2025-07-06','2025-07-09',2,'cabin hot tub', 64.146582,-21.942635),

  (NULL,'550e8400-e29b-41d4-a716-446655440011','Warsaw',
      '2025-06-23','2025-06-26',2,'boutique suite royal route', 52.229676,21.012229),

  (NULL,'550e8400-e29b-41d4-a716-446655440012','Prague',
      '2025-06-28','2025-07-01',2,'loft astronomical clock', 50.075539,14.437800),

  (NULL,'550e8400-e29b-41d4-a716-446655440013','Budapest',
      '2025-07-17','2025-07-20',4,'grand apartment thermal bath', 47.497913,19.040236),

  (NULL,'550e8400-e29b-41d4-a716-446655440014','Bucharest',
      '2025-07-12','2025-07-15',2,'studio victoriei', 44.426765,26.102537);


-- Seed data: 20 wish-lists
INSERT INTO wishlist (user_id, name, is_default) VALUES
  -- User 21
  (21, 'Favorites',                 TRUE ),
  (21, 'July 4 Weekend Ideas',      FALSE),

  -- User 22
  (22, 'My Main List',              TRUE ),
  (22, 'Canada Road-trip',          FALSE),

  -- User 23
  (23, 'Wish-List',                 TRUE ),
  (23, 'Loft Inspiration',          FALSE),

  -- User 24
  (24, 'Saved Stays',               TRUE ),
  (24, 'Family Getaways',           FALSE),

  -- User 25
  (25, 'Primary',                   TRUE ),
  (25, 'Patio Homes',               FALSE),

  -- User 26
  (26, 'Default',                   TRUE ),

  -- User 27
  (27, 'Main',                      TRUE ),

  -- User 28
  (28, 'Trips to Plan',             TRUE ),

  -- User 29
  (29, 'Rome & Beyond',             TRUE ),

  -- User 30-35
  (30, 'Dream Lofts',               TRUE ),
  (31, 'Houseboat Dreams',          TRUE ),
  (32, 'Luxury Skyscrapers',        TRUE ),
  (33, 'Budget City Breaks',        TRUE ),
  (34, 'Weekend Getaways',          TRUE ),
  (35, 'Beach-Side Villas',         TRUE );


-- Seed data: 25 rows for wishlist_item
INSERT INTO wishlist_item (wishlist_id, listing_id) VALUES
  ( 1,  1),  ( 1,  5),
  ( 2,  2),  ( 2, 10),
  ( 3,  3),  ( 3, 11),
  ( 4,  4),  ( 4, 12),
  ( 5,  6),  ( 5, 15),
  ( 6,  7),
  ( 7,  8),
  ( 9, 13),
  (10, 14),  (10, 20),
  (11, 21),
  (12, 22),
  (13, 23),
  (14, 24),
  (15, 25),
  (16, 26),
  (17, 27),
  (18, 28),
  (19, 29),
  (20, 30);
