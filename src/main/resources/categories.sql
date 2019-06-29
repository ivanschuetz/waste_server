INSERT INTO category(id, name) VALUES(0, 'category_packaging') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(1, 'category_bulky') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(2, 'category_paper') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(3, 'category_energy_saving_lamps') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(4, 'category_glas_white') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(5, 'category_electro') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
-- TODO hausmuell in bsr is not residual! it means paper|residual|bio|glas|electro
-- TODO usw. siehe https://de.wikipedia.org/wiki/Hausm%C3%BCll
-- TODO difference is the quantity -- do we need a new construct for this or are new categories enough?
-- TODO (new categories for large quantities, where "large" appears in translation. Default is non-large.)
-- TODO this means that we have to associate BSR both with the "hausmuell" cats + new large cats, where applicable
-- TODO don't forget to preserve current category ids in BSR output file, as these are references from sql files here!
INSERT INTO category(id, name) VALUES(6, 'category_residual') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(7, 'category_bio') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(8, 'category_glas_green') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(9, 'category_clothes') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(10, 'category_scrap') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(11, 'category_glas_brown') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(12, 'category_dead_pet') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;

-- TODO associate these categories with p-containers (and companies?). right now only categories scrapped from bsr
-- TODO are used to associate.

-- new
--
INSERT INTO category(id, name) VALUES(13, 'category_car_parts') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(14, 'category_drain') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO category(id, name) VALUES(15, 'category_toilet') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
-- TODO p containers/ pickup

