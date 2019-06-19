INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(0, 'Kraftzone', 'Berlin', 'https://www.kraftzone.de', '03081799980', 'info@kraftzone.de')
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;
INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(1, 'Sondermann', 'Berlin', 'https://www.sondermann-sperrmuell.de', '030403674330', 'berlinentsorgung@gmail.com')
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;
INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(2, 'BSR', 'Berlin', 'https://www.bsr.de', '03075924900', null)
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;
INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(3, 'Sperrmüll Berlin Abholung & Entsorgung', 'Berlin', 'https://www.preiswert-sperrmuell-berlin.de', '03060590334', null)
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;
INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(4, 'Baerliner Sperrmüll Recycling', 'Berlin', null, '03024379057', null)
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;
INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(5, 'Studenten-Power®', 'Berlin', 'https://studenten-power.de', '03020169662', null)
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;

INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(5, 'Studenten-Power®', 'Berlin', 'https://studenten-power.de', '03020169662', null)
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;
