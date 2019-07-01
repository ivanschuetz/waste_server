DROP TABLE IF EXISTS translations;
DROP TABLE IF EXISTS category_p_container;
DROP TABLE IF EXISTS category_container;
DROP TABLE IF EXISTS item_category;
DROP TABLE IF EXISTS category_pickup_company;
DROP TABLE IF EXISTS tag_tip;
DROP TABLE IF EXISTS item_tag;
DROP TABLE IF EXISTS p_container_hours;
DROP TABLE IF EXISTS container;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS p_container;
DROP TABLE IF EXISTS pickup_company;
DROP TABLE IF EXISTS tip;
DROP TABLE IF EXISTS tag;

CREATE TABLE IF NOT EXISTS translations
(
  tkey VARCHAR(150) NOT NULL,
  lang VARCHAR(7) NOT NULL,
  trans VARCHAR(1000) NOT NULL,
  UNIQUE (tkey, lang)
);

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
  item_id        INTEGER NOT NULL,
  category_id    INTEGER NOT NULL,
  UNIQUE         (item_id, category_id),
  FOREIGN KEY (item_id) REFERENCES item (id),
  FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE IF NOT EXISTS category_container
(
  category_id     INTEGER NOT NULL,
  container_id    INTEGER NOT NULL,
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
  url             VARCHAR(250),
  lat             float NOT NULL,
  lon             float NOT NULL,
  open            VARCHAR(2) NOT NULL,
  PRIMARY KEY     (id)
--  UNIQUE          (address)
);

CREATE TABLE IF NOT EXISTS category_p_container
(
  category_id     INTEGER NOT NULL,
  p_container_id    INTEGER NOT NULL,
  UNIQUE          (category_id, p_container_id),
  FOREIGN KEY (category_id) REFERENCES category (id),
  FOREIGN KEY (p_container_id) REFERENCES p_container (id)
);

CREATE TABLE IF NOT EXISTS p_container_hours
(
  p_container_id INTEGER NOT NULL,
  weekday VARCHAR(2) NOT NULL,
  start VARCHAR(50) NOT NULL,
  finish VARCHAR(50) NOT NULL,
  UNIQUE (p_container_id, weekday, start, finish)
);

CREATE TABLE IF NOT EXISTS pickup_company
(
  id serial,
  name VARCHAR(150) NOT NULL,
  city VARCHAR(150) NOT NULL,
  website VARCHAR(150),
  phone VARCHAR(150),
  email VARCHAR(150),
  PRIMARY KEY (id),
  UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS category_pickup_company
(
  category_id INTEGER NOT NULL,
  company_id INTEGER NOT NULL,
  min_weight FLOAT,
  website VARCHAR(150),
  UNIQUE (category_id, company_id),
  FOREIGN KEY (category_id) REFERENCES category (id),
  FOREIGN KEY (company_id) REFERENCES pickup_company (id)
);

CREATE TABLE IF NOT EXISTS tag
(
  id serial,
  name VARCHAR(150) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS item_tag
(
  item_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL,
  UNIQUE (item_id, tag_id),
  FOREIGN KEY (item_id) REFERENCES item (id),
  FOREIGN KEY (tag_id) REFERENCES tag (id)
);

CREATE TABLE IF NOT EXISTS tip
(
  id serial,
  text VARCHAR(150) NOT NULL,
  type INTEGER NOT NULL, -- 0 -> How to dispose, 1 -> Repurpose item
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tag_tip
(
  tag_id INTEGER NOT NULL,
  tip_id INTEGER NOT NULL,
  UNIQUE (tag_id, tip_id),
  FOREIGN KEY (tag_id) REFERENCES tag (id),
  FOREIGN KEY (tip_id) REFERENCES tip (id)
);

GRANT CONNECT ON DATABASE waste TO waste_app;
GRANT USAGE ON SCHEMA public TO waste_app;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO waste_app;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO waste_app;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO waste_app;
