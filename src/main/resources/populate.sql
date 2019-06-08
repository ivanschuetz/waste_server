--\i /Users/ischuetz/dev/waste/server/src/main/resources/populate.sql

--DROP TABLE item_container;
--DROP TABLE container;
--DROP TABLE item;

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

CREATE TABLE IF NOT EXISTS item_container
(
  item_id         INTEGER,
  container_id    INTEGER,
  prio            INTEGER,
  UNIQUE          (item_id, container_id),
  FOREIGN KEY (item_id) REFERENCES item (id),
  FOREIGN KEY (container_id) REFERENCES container (id)
);

GRANT CONNECT ON DATABASE waste TO waste_app;
GRANT USAGE ON SCHEMA public TO waste_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO waste_app;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO waste_app;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO waste_app;

INSERT INTO container(id, name, color) VALUES(0, 'General', '000000') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(1, 'Electronic', 'FFA500') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(2, 'Bio', 'A0522D') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(3, 'Batteries', 'D3D3D3') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(4, 'Plastic', 'FFFF00') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(5, 'Sperr', '666666') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;

INSERT INTO item(id, name) VALUES(0, 'Fruits') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(1, 'Batteries') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(2, 'Light bulb') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(3, 'Neon lamp') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(4, 'Electronics') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(5, 'Diapers') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(6, 'Tetra pak') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(7, 'Furniture') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO item_container(item_id, container_id, prio) VALUES(0, 2, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(0, 0, 1) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(1, 3, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(2, 0, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(3, 0, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(4, 1, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(4, 0, 1) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(5, 0, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(6, 4, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;
INSERT INTO item_container(item_id, container_id, prio) VALUES(7, 5, 0) ON CONFLICT (item_id, container_id) DO UPDATE SET prio = EXCLUDED.prio;