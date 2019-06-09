--\i /Users/ischuetz/dev/waste/server/src/main/resources/populate.sql

DROP TABLE item_container;
DROP TABLE category_p_container;
DROP TABLE category_container;
DROP TABLE container;
DROP TABLE item;
DROP TABLE item_category;
DROP TABLE category;
DROP TABLE p_container;

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

--CREATE TABLE IF NOT EXISTS item_container
--(
--  item_id         INTEGER,
--  container_id    INTEGER,
--  prio            INTEGER,
--  UNIQUE          (item_id, container_id),
--  FOREIGN KEY (item_id) REFERENCES item (id),
--  FOREIGN KEY (container_id) REFERENCES container (id)
--);

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

INSERT INTO p_container(id, name, address) VALUES(0, 'Recyclinghof Ilsenburger Straße', 'Ilsenburger Straße 18 - 20 10589 Berlin (Charlottenburg-Wilmersdorf)') ON CONFLICT (address) DO UPDATE SET address = EXCLUDED.address;
INSERT INTO p_container(id, name, address) VALUES(1, 'Recyclinghof Behmstraße', 'Behmstraße 74 10439 Berlin (Pankow)') ON CONFLICT (address) DO UPDATE SET address = EXCLUDED.address;
INSERT INTO p_container(id, name, address) VALUES(2, 'Recyclinghof Asgardstraße', 'Asgardstraße 3 Romain-Rolland-Straße 13089 Berlin (Pankow)') ON CONFLICT (address) DO UPDATE SET address = EXCLUDED.address;

INSERT INTO item(id, name) VALUES(0, 'Fruits') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(1, 'Batteries') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(2, 'Light bulb') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(3, 'Neon lamp') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(4, 'Electronics') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(5, 'Diapers') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(6, 'Tetra pak') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(7, 'Furniture') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO item_category(item_id, category_id) VALUES(0, 7) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(1, 3) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(2, 6) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(5, 6) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(6, 0) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(7, 1) ON CONFLICT DO NOTHING;

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

--INSERT INTO item_container(item_id, container_id, prio) VALUES(0, 2, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
----INSERT INTO item_container(item_id, container_id, prio) VALUES(0, 0, 1) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
----INSERT INTO item_container(item_id, container_id, prio) VALUES(1, 3, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
--INSERT INTO item_container(item_id, container_id, prio) VALUES(2, 0, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
--INSERT INTO item_container(item_id, container_id, prio) VALUES(3, 0, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
--INSERT INTO item_container(item_id, container_id, prio) VALUES(4, 1, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
--INSERT INTO item_container(item_id, container_id, prio) VALUES(4, 0, 1) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
--INSERT INTO item_container(item_id, container_id, prio) VALUES(5, 0, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
--INSERT INTO item_container(item_id, container_id, prio) VALUES(6, 4, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
--INSERT INTO item_container(item_id, container_id, prio) VALUES(7, 5, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
