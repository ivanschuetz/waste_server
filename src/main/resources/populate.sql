--\i /Users/ischuetz/dev/waste/server/src/main/resources/populate.sql

DROP TABLE category_p_container;
DROP TABLE category_container;
DROP TABLE item_category;
DROP TABLE category_pickup_company;
DROP TABLE container;
DROP TABLE item;
DROP TABLE category;
DROP TABLE p_container;
DROP TABLE pickup_company;

CREATE TABLE IF NOT EXISTS container
(
  id              serial,
  name            VARCHAR(150) NOT NULL,
  color           VARCHAR(150) NOT NULL,
  PRIMARY KEY     (id),
  UNIQUE          (name)
);

CREATE TABLE IF NOT EXISTS item
(
  id              serial,
  name            VARCHAR(150) NOT NULL,
  PRIMARY KEY     (id),
  UNIQUE          (name)
);

CREATE TABLE IF NOT EXISTS category
(
  id              serial,
  name            VARCHAR(150) NOT NULL,
  PRIMARY KEY     (id),
  UNIQUE          (name)
);

CREATE TABLE IF NOT EXISTS item_category
(
  item_id        INTEGER,
  category_id    INTEGER,
  UNIQUE         (item_id, category_id),
  FOREIGN KEY (item_id) REFERENCES item (id),
  FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE IF NOT EXISTS category_container
(
  category_id     INTEGER,
  container_id    INTEGER,
  UNIQUE          (category_id, container_id),
  FOREIGN KEY (category_id) REFERENCES category (id),
  FOREIGN KEY (container_id) REFERENCES container (id)
);

CREATE TABLE IF NOT EXISTS p_container
(
  id              serial,
  name            VARCHAR(150) NOT NULL,
  address         VARCHAR(150) NOT NULL,
  company         VARCHAR(150) NOT NULL,
  phone           VARCHAR(150),
  url             VARCHAR(150),
  lat             float NOT NULL,
  lon             float NOT NULL,
  PRIMARY KEY     (id),
  UNIQUE          (address)
);

CREATE TABLE IF NOT EXISTS category_p_container
(
  category_id     INTEGER,
  p_container_id    INTEGER,
  UNIQUE          (category_id, p_container_id),
  FOREIGN KEY (category_id) REFERENCES category (id),
  FOREIGN KEY (p_container_id) REFERENCES p_container (id)
);

CREATE TABLE IF NOT EXISTS pickup_company
(
  id serial,
  name VARCHAR(150) NOT NULL,
  city VARCHAR(150) NOT NULL,
  website VARCHAR(150) NOT NULL,
  phone VARCHAR(150) NOT NULL,
  email VARCHAR(150),
  PRIMARY KEY (id),
  UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS category_pickup_company
(
  category_id INTEGER,
  company_id INTEGER,
  min_weight FLOAT,
  website VARCHAR(150),
  UNIQUE (category_id, company_id),
  FOREIGN KEY (category_id) REFERENCES category (id),
  FOREIGN KEY (company_id) REFERENCES pickup_company (id)
);

GRANT CONNECT ON DATABASE waste TO waste_app;
GRANT USAGE ON SCHEMA public TO waste_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO waste_app;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO waste_app;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO waste_app;

INSERT INTO container(id, name, color) VALUES(0, 'Restmüll', '000000') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(1, 'Elektro', 'FFA500') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(2, 'Bio', 'A0522D') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
--INSERT INTO container(id, name, color) VALUES(3, 'Batterien', 'D3D3D3') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(4, 'Gelbe Tonne', 'FFFF00') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(5, 'Sperrmüll', '666666') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(6, 'Blaue Tonne', '0000FF') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(7, 'Weißglas', 'FFFFFF') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(8, 'Buntglas', '00FF00') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;

INSERT INTO category(id, name) VALUES(0, 'Verpackungen') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(1, 'Sperrmüll') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(2, 'Papier') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(3, 'Energiesparlampen') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(4, 'Weißglas') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(5, 'Elektro') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(6, 'Hausmüll') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(7, 'Bio') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(8, 'Buntglas') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO p_container(id, name, address, company, phone, url, lat, lon)
VALUES(0, 'Recyclinghof Ilsenburger Straße', 'Ilsenburger Straße 18 - 20 10589 Berlin (Charlottenburg-Wilmersdorf)', 'BSR', null, 'https://www.bsr.de/recyclinghoefe-20503.php?currRCLocation=b7cbf766-6f66-467b-8571-1ec23f8eb6f6', 52.526746, 13.311367)
ON CONFLICT (address) DO UPDATE SET address = EXCLUDED.address, company = EXCLUDED.company, phone = EXCLUDED.phone, url = EXCLUDED.url, lat = EXCLUDED.lat, lon = EXCLUDED.lon;
INSERT INTO p_container(id, name, address, company, phone, url, lat, lon)
VALUES(1, 'Recyclinghof Behmstraße', 'Behmstraße 74 10439 Berlin (Pankow)', 'BSR', null, 'https://www.bsr.de/recyclinghoefe-20503.php?currRCLocation=d2578029-138e-4eef-b911-fbbc57736119', 52.550883, 13.402125)
ON CONFLICT (address) DO UPDATE SET address = EXCLUDED.address, company = EXCLUDED.company, phone = EXCLUDED.phone, url = EXCLUDED.url, lat = EXCLUDED.lat, lon = EXCLUDED.lon;
INSERT INTO p_container(id, name, address, company, phone, url, lat, lon)
VALUES(2, 'Recyclinghof Asgardstraße', 'Asgardstraße 3 Romain-Rolland-Straße 13089 Berlin (Pankow)', 'BSR', null, 'https://www.bsr.de/recyclinghoefe-20503.php?currRCLocation=7671a544-5cd0-452b-b063-3daf7a42a1fd', 52.580358, 13.436043)
ON CONFLICT (address) DO UPDATE SET address = EXCLUDED.address, company = EXCLUDED.company, phone = EXCLUDED.phone, url = EXCLUDED.url, lat = EXCLUDED.lat, lon = EXCLUDED.lon;
INSERT INTO p_container(id, name, address, company, phone, url, lat, lon)
VALUES(3, 'Glas container', '10178 Berlin Oranienburger Straße ggü. Nr. 17 / Mombijoupark', 'Glasiglus', null, 'https://www.berlin-recycling.de/service/standorte-glasiglus', 52.523965, 13.3974459)
ON CONFLICT (address) DO UPDATE SET address = EXCLUDED.address, company = EXCLUDED.company, phone = EXCLUDED.phone, url = EXCLUDED.url, lat = EXCLUDED.lat, lon = EXCLUDED.lon;

INSERT INTO item(id, name) VALUES(0, 'Fruits') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(1, 'Batteries') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(2, 'Light bulb') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(3, 'Neon lamp') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(4, 'Electronics') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(5, 'Diapers') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(6, 'Tetra pak') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(7, 'Furniture') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(8, 'White glas') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO item_category(item_id, category_id) VALUES(0, 7) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(1, 3) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(2, 6) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(3, 5) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(4, 5) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(5, 6) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(6, 0) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(7, 1) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(8, 4) ON CONFLICT DO NOTHING;

INSERT INTO category_container(category_id, container_id) VALUES(0, 4) ON CONFLICT DO NOTHING;
INSERT INTO category_container(category_id, container_id) VALUES(2, 6) ON CONFLICT DO NOTHING;
INSERT INTO category_container(category_id, container_id) VALUES(4, 7) ON CONFLICT DO NOTHING;
INSERT INTO category_container(category_id, container_id) VALUES(6, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_container(category_id, container_id) VALUES(7, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_container(category_id, container_id) VALUES(8, 8) ON CONFLICT DO NOTHING;

INSERT INTO category_p_container(category_id, p_container_id) VALUES(0, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(0, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(0, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(1, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(1, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(1, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(2, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(2, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(2, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(3, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(3, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(3, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(4, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(4, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(4, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(4, 3) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(5, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(5, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(5, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(6, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(6, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(6, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(7, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(7, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(7, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(8, 0) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(8, 1) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(8, 2) ON CONFLICT DO NOTHING;
INSERT INTO category_p_container(category_id, p_container_id) VALUES(8, 3) ON CONFLICT DO NOTHING;

INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(0, 'Kraftzone', 'Berlin', 'https://www.kraftzone.de', '03081799980', 'info@kraftzone.de')
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;
INSERT INTO pickup_company(id, name, city, website, phone, email)
VALUES(1, 'Sondermann', 'Berlin', 'https://www.sondermann-sperrmuell.de', '030403674330', 'berlinentsorgung@gmail.com')
ON CONFLICT (name) DO UPDATE SET city = EXCLUDED.city, website = EXCLUDED.website, phone = EXCLUDED.phone, email = EXCLUDED.email;

INSERT INTO category_pickup_company(category_id, company_id, min_weight, website) VALUES(5, 0, null, 'https://www.kraftzone.de/elektroschrott-entsorgung-berlin') ON CONFLICT DO NOTHING;
INSERT INTO category_pickup_company(category_id, company_id, min_weight, website) VALUES(1, 1, null, null) ON CONFLICT DO NOTHING;
