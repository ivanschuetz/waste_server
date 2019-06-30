INSERT INTO container(id, name, color) VALUES(0, 'container_general', '000000') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(1, 'container_electro', 'FFA500') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(2, 'container_bio', 'CC7722') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
--INSERT INTO container(id, name, color) VALUES(3, 'Batterien', 'D3D3D3') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(5, 'container_bulky', '666666') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(6, 'container_blue', '0000FF') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(7, 'container_glas_white', 'FFFFFF') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(8, 'container_glas_green', '006400') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(9, 'container_glas_brown', 'A52A2A') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;
INSERT INTO container(id, name, color) VALUES(10, 'container_scrap', 'FFA500,FFFF00') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name, color = EXCLUDED.color;

-- TODO remove orange and "merge" with yellow. Call first bsr and confirm it's the same thing.
