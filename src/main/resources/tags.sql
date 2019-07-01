INSERT INTO tag(id, name) VALUES(0, 'tag_cooked_food_and_bio');
INSERT INTO item_tag(item_id, tag_id) VALUES (322, 0);
INSERT INTO item_tag(item_id, tag_id) VALUES (370, 0);

INSERT INTO tag(id, name) VALUES(1, 'tag_cutlery');
INSERT INTO item_tag(item_id, tag_id) VALUES (140, 1);

INSERT INTO tag(id, name) VALUES(3, 'tag_data_storage_electronic');
INSERT INTO item_tag(item_id, tag_id) VALUES (240, 3);
INSERT INTO item_tag(item_id, tag_id) VALUES (550, 3);

INSERT INTO tag(id, name) VALUES(4, 'tag_books_with_covers');
INSERT INTO item_tag(item_id, tag_id) VALUES (50, 4);
INSERT INTO item_tag(item_id, tag_id) VALUES (51, 4);
INSERT INTO item_tag(item_id, tag_id) VALUES (348, 4);

INSERT INTO tag(id, name) VALUES(5, 'tag_grease');
INSERT INTO item_tag(item_id, tag_id) VALUES (223, 5);
INSERT INTO item_tag(item_id, tag_id) VALUES (250, 5); -- TODO confirm
-- TODO add more oil items

INSERT INTO tag(id, name) VALUES(6, 'tag_fish_bones'); -- TODO add item

INSERT INTO tag(id, name) VALUES(7, 'tag_drinks_liquid_content');
INSERT INTO item_tag(item_id, tag_id) VALUES (328, 7);
INSERT INTO item_tag(item_id, tag_id) VALUES (280, 7);

INSERT INTO tag(id, name) VALUES(8, 'tag_potentially_big_furniture_or_scrap');
-- TODO these are already marked as only sperrmuell - do we need this tipp?
-- TODO or we mark them as e.g. scrap but then we rather need tipp to divide it in parts if it's small
INSERT INTO item_tag(item_id, tag_id) VALUES (88, 7);
INSERT INTO item_tag(item_id, tag_id) VALUES (497, 7);

INSERT INTO tag(id, name) VALUES(9, 'tag_sim_card'); -- TODO add item

INSERT INTO tag(id, name) VALUES(10, 'tag_personal_id_document');
INSERT INTO item_tag(item_id, tag_id) VALUES (369, 10);
-- TODO add item (perso)

INSERT INTO tag(id, name) VALUES(11, 'tag_knife'); -- TODO add item
INSERT INTO tag(id, name) VALUES(12, 'tag_fork'); -- TODO add item
INSERT INTO tag(id, name) VALUES(13, 'tag_spoon'); -- TODO add item
