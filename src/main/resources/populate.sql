CREATE TABLE IF NOT EXISTS item
(
  id              serial,
  name            VARCHAR(150) NOT NULL,
  PRIMARY KEY     (id),
  UNIQUE          (name)
);

GRANT CONNECT ON DATABASE waste TO waste_app;
GRANT USAGE ON SCHEMA public TO waste_app;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO waste_app;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO waste_app;

INSERT INTO item(name) VALUES('Fruits') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(name) VALUES('Batteries') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(name) VALUES('Light bulb') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(name) VALUES('Neon lamp') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(name) VALUES('Electronics') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(name) VALUES('Diapers') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(name) VALUES('Tetra pak') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(name) VALUES('Furniture') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
