INSERT INTO item(id, name) VALUES(0, 'item_fruits') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(1, 'item_battery') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(2, 'item_light_bulb') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(3, 'item_neon_lamp') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(4, 'item_electro') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(5, 'item_diapers') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(6, 'item_tetra_pak') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(7, 'item_furniture') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(8, 'item_glas_white') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item(id, name) VALUES(9, 'item_clothes') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;

INSERT INTO item(id, name) VALUES(10, 'item_med_passed') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(10, 6) ON CONFLICT DO NOTHING;
--TODO add entry for meds category

INSERT INTO item(id, name) VALUES(11, 'item_noodles_plastic_window') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(11, 2) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(12, 'item_energy_saving_lamp') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(12, 3) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(13, 'item_coffee_filter_unbleached') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(13, 7) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(14, 'item_cheese_rind_unwaxed') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(14, 7) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(15, 'item_tempo') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(15, 6) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(16, 'item_baking_paper') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(16, 6) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(17, 'item_coffee_capules') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(17, 0) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(18, 'item_old_pictures') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(18, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(19, 'item_letter_envelope') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(19, 2) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(20, 'item_letter_envelope_plastic_window') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(20, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(21, 'item_can') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(21, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(22, 'item_paper_bag') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(22, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(23, 'item_plastic_container') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(23, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(24, 'item_metal_big') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(24, 6) ON CONFLICT DO NOTHING;
INSERT INTO item(id, name) VALUES(25, 'item_screw') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(25, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(26, 'item_nails') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(26, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(27, 'item_plants_dead') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(27, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(28, 'item_foliage') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(28, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(29, 'item_wallpaper') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(29, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(30, 'item_glas_window') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(30, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(31, 'item_glas_mirror') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(31, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(32, 'item_vacuum_cleaner_bag') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(32, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(33, 'item_rubber') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(33, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(34, 'item_hygienic') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(34, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(35, 'item_sticky_tape') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(35, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(36, 'item_leather') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(36, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(37, 'item_porcelain') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(37, 6) ON CONFLICT DO NOTHING;

-- todo replace this repeated item
--INSERT INTO item(id, name) VALUES(38, 'item_porcelain') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
--INSERT INTO item_category(item_id, category_id) VALUES(38, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(39, 'item_ceramic') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(39, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(40, 'item_kitchen_sponge') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(40, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(41, 'item_kitchen_cloth') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(41, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(42, 'item_street_litter') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(42, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(43, 'item_cigarette_butt') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(43, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(45, 'item_egg_shells') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(45, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(46, 'item_garden_trash') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(46, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(47, 'item_coffee_tea_rests') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(47, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(48, 'item_vegetables') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(48, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(49, 'item_lawn') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(49, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(50, 'item_meat_cooked') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(50, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(51, 'item_food_rests') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(51, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(52, 'item_weed') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(52, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(52, 'item_weed') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(52, 7) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(53, 'item_bones') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(53, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(54, 'item_meat_raw') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(54, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(55, 'item_food_liquids') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(55, 6) ON CONFLICT DO NOTHING;

-- TODO replace duplicate
--INSERT INTO item(id, name) VALUES(56, 'item_food_liquids') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
--INSERT INTO item_category(item_id, category_id) VALUES(56, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(57, 'item_diapers_compostable') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(57, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(58, 'item_pot') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(58, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(59, 'item_pan') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(59, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(60, 'item_cabel') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(60, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(61, 'item_toy_children') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(61, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(62, 'item_bowl_plastic') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(62, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(63, 'item_flower_pot_plastic') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(63, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(64, 'item_cd') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(64, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(65, 'item_dvd') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(65, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(66, 'item_newspaper') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(66, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(67, 'item_prospects') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(67, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(68, 'item_catalog') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(68, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(69, 'item_paper') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(69, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(70, 'item_packing_paper') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(70, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(71, 'item_packing_cardboard') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(71, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(72, 'item_can_drink') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(72, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(73, 'item_can_conserves') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(73, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(74, 'item_aluminium') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(74, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(75, 'item_drinks_composite_material') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(75, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(76, 'item_milk_bag') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(76, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(77, 'item_juice_bag') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(77, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(78, 'item_plastic_film') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(78, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(79, 'item_plastic_bag') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(79, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(80, 'item_yoghurt_cup') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(80, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(81, 'item_plastic_bottles_disposable') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(81, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(82, 'item_paper_laminated') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(82, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(83, 'item_glas_green') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(83, 8) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(84, 'item_glas_brown') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(84, 11) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(85, 'item_glas_non_brown_or_white') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(85, 8) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(86, 'item_pillow') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(86, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(87, 'item_shoes') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(87, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(88, 'item_bed_clothes') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(88, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(89, 'item_bed_cover') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(89, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(90, 'item_curtains') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(90, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(91, 'item_mattress') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(91, 1) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(91, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(93, 'item_table_cloth') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(93, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(94, 'item_cap') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(94, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(95, 'item_hat') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(95, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(96, 'item_knitted_materials') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(96, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(97, 'item_socks') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(97, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(98, 'item_underwear') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(98, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(99, 'item_broken_clothes_wool') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(99, 9) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(100, 'item_broken_clothes_synth') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(100, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(101, 'item_broken_shoes') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(101, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(102, 'item_clothes_painting_or_oil') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(102, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(103, 'item_fridge') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(103, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(104, 'item_oven') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(104, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(105, 'item_bed') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(105, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(106, 'item_table') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(106, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(107, 'item_chair') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(107, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(108, 'item_microwave') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(108, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(109, 'item_cutlery') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(109, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(110, 'item_dead_pet');
INSERT INTO item_category(item_id, category_id) VALUES(110, 12);
INSERT INTO item(id, name) VALUES(111, 'item_dead_cat');
INSERT INTO item_category(item_id, category_id) VALUES(111, 12);
INSERT INTO item(id, name) VALUES(112, 'item_dead_dog');
INSERT INTO item_category(item_id, category_id) VALUES(112, 12);
INSERT INTO item(id, name) VALUES(113, 'item_dead_rat_pet');
INSERT INTO item_category(item_id, category_id) VALUES(113, 12);
INSERT INTO item(id, name) VALUES(114, 'item_dead_rabbit');
INSERT INTO item_category(item_id, category_id) VALUES(114, 12);
INSERT INTO item(id, name) VALUES(115, 'item_dead_parrot');
INSERT INTO item_category(item_id, category_id) VALUES(115, 12);

-- new

-- TODO cat
--INSERT INTO item(id, name) VALUES(110, 'item_pipe') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
--INSERT INTO item_category(item_id, category_id) VALUES(110, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(111, 'item_lab_tubes') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(111, 1) ON CONFLICT DO NOTHING;

-- TODO cat
--INSERT INTO item(id, name) VALUES(112, 'item_lab_sulfur') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
--INSERT INTO item_category(item_id, category_id) VALUES(112, 1) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(113, 'item_nail_polish') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(113, 100032) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(114, 'item_rechargeable_battery') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(114, 100012) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(115, 'item_aerosol_can_not_dangerous') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(115, 10) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(116, 'item_aerosol_can_dangerous') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(116, 100032) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(117, 'item_computer') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(117, 1) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(117, 5) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(118, 'item_harddrive') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(118, 100013);

INSERT INTO item(id, name) VALUES(119, 'item_speakers') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(119, 5);
-- TODO-small

INSERT INTO item(id, name) VALUES(120, 'item_watch') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(120, 100013);

INSERT INTO item(id, name) VALUES(121, 'item_clock') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(121, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(121, 5);

INSERT INTO item(id, name) VALUES(122, 'item_ventilator') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(122, 5);
-- TODO-small

INSERT INTO item(id, name) VALUES(123, 'item_car_parts') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(123, 13) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(124, 'item_air_conditioner') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(124, 5);
-- TODO-small

INSERT INTO item(id, name) VALUES(125, 'item_printer') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(125, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(125, 5);

INSERT INTO item(id, name) VALUES(126, 'item_scanner') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(126, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(126, 5);

INSERT INTO item(id, name) VALUES(127, 'item_coffee_machine') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(127, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(127, 5);

INSERT INTO item(id, name) VALUES(128, 'item_notebook') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(128, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(129, 'item_books') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(129, 2) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(129, 2) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(130, 'item_thermometer_mercury') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(130, 100030) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(130, 'item_thermometer_digital') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(130, 100013);

INSERT INTO item(id, name) VALUES(131, 'item_injection_used') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(131, 100001) ON CONFLICT DO NOTHING;
-- TODO confirm

INSERT INTO item(id, name) VALUES(132, 'item_injection_not_used') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
--INSERT INTO item_category(item_id, category_id) VALUES(132, ??) ON CONFLICT DO NOTHING; TODO

INSERT INTO item(id, name) VALUES(133, 'item_tool_metal') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(133, 100000) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(133, 100010) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(134, 'item_hammer') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
--INSERT INTO item_category(item_id, category_id) VALUES(134, ??) ON CONFLICT DO NOTHING; TODO

INSERT INTO item(id, name) VALUES(135, 'item_saw') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
--INSERT INTO item_category(item_id, category_id) VALUES(135, ??) ON CONFLICT DO NOTHING; TODO

INSERT INTO item(id, name) VALUES(135, 'item_screwdriver') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
--INSERT INTO item_category(item_id, category_id) VALUES(135, ??) ON CONFLICT DO NOTHING; TODO

INSERT INTO item(id, name) VALUES(136, 'item_boring_machine') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(136, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(136, 5);

INSERT INTO item(id, name) VALUES(137, 'item_paint_brush') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(137, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(138, 'item_make_up_plastic') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(138, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(139, 'item_make_up_plastic') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(139, 0) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(140, 'item_magnet') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(140, 100002) ON CONFLICT DO NOTHING;
-- TODO small

INSERT INTO item(id, name) VALUES(141, 'item_tampon') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(141, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(142, 'item_condom') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(142, 6) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(143, 'item_ear_plugs') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(143, 6) ON CONFLICT DO NOTHING; -- TODO confirm

INSERT INTO item(id, name) VALUES(144, 'item_cage_metal_small') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(144, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(144, 5);

INSERT INTO item(id, name) VALUES(145, 'item_cage_metal_large') ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name;
INSERT INTO item_category(item_id, category_id) VALUES(145, 100002) ON CONFLICT DO NOTHING;

INSERT INTO item(id, name) VALUES(146, 'item_cage_grid_metal_small');
INSERT INTO item_category(item_id, category_id) VALUES(146, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(146, 5);

INSERT INTO item(id, name) VALUES(147, 'item_cage_grid_metal_large');
INSERT INTO item_category(item_id, category_id) VALUES(147, 100002);

INSERT INTO item(id, name) VALUES(148, 'item_binoculars');
INSERT INTO item_category(item_id, category_id) VALUES(148, 6); -- TODO confirm - kein wertstoff, sperrmuell?

INSERT INTO item(id, name) VALUES(149, 'item_microscope');
--INSERT INTO item_category(item_id, category_id) VALUES(149, ?); -- TODO

INSERT INTO item(id, name) VALUES(150, 'item_hair_human');
INSERT INTO item_category(item_id, category_id) VALUES(150, 7);

INSERT INTO item(id, name) VALUES(151, 'item_hair_animal');
INSERT INTO item_category(item_id, category_id) VALUES(151, 7);

INSERT INTO item(id, name) VALUES(152, 'item_cotton_buds');
INSERT INTO item_category(item_id, category_id) VALUES(152, 6);

INSERT INTO item(id, name) VALUES(153, 'item_cleaning_pad');
INSERT INTO item_category(item_id, category_id) VALUES(153, 6);

INSERT INTO item(id, name) VALUES(154, 'item_steel_wool');
INSERT INTO item_category(item_id, category_id) VALUES(154, 6);

INSERT INTO item(id, name) VALUES(155, 'item_usb_stick');
INSERT INTO item_category(item_id, category_id) VALUES(155, 100013);

INSERT INTO item(id, name) VALUES(156, 'item_breathing_mask');
INSERT INTO item_category(item_id, category_id) VALUES(156, 6); -- TODO confirm

INSERT INTO item(id, name) VALUES(157, 'item_adapter_electro');
INSERT INTO item_category(item_id, category_id) VALUES(157, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(157, 5);

INSERT INTO item(id, name) VALUES(158, 'item_stamp');
INSERT INTO item_category(item_id, category_id) VALUES(158, 2); -- TODO confirm

INSERT INTO item(id, name) VALUES(159, 'item_vitamines');
INSERT INTO item_category(item_id, category_id) VALUES(159, 6);

INSERT INTO item(id, name) VALUES(160, 'item_sticky_notes');
INSERT INTO item_category(item_id, category_id) VALUES(160, 2); -- TODO confirm

INSERT INTO item(id, name) VALUES(161, 'item_ash');
INSERT INTO item_category(item_id, category_id) VALUES(161, 6);

INSERT INTO item(id, name) VALUES(162, 'item_lamp');
INSERT INTO item_category(item_id, category_id) VALUES(162, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(162, 5);
INSERT INTO item_category(item_id, category_id) VALUES(162, 1);

INSERT INTO item(id, name) VALUES(163, 'item_apple_watch');
INSERT INTO item_category(item_id, category_id) VALUES(163, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(163, 5);
-- TODO apple store?

INSERT INTO item(id, name) VALUES(164, 'item_couch');
INSERT INTO item_category(item_id, category_id) VALUES(164, 1);

INSERT INTO item(id, name) VALUES(165, 'item_sofa');
INSERT INTO item_category(item_id, category_id) VALUES(165, 1);

INSERT INTO item(id, name) VALUES(166, 'item_chair');
INSERT INTO item_category(item_id, category_id) VALUES(166, 1); -- TODO klapstuhl

INSERT INTO item(id, name) VALUES(167, 'item_water_cooker');
INSERT INTO item_category(item_id, category_id) VALUES(167, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(167, 5);

INSERT INTO item(id, name) VALUES(168, 'item_laundry_rack_metal');
INSERT INTO item_category(item_id, category_id) VALUES(168, 100000);
INSERT INTO item_category(item_id, category_id) VALUES(168, 1);

-- TODO schrottplaetze in berlin ?

INSERT INTO item(id, name) VALUES(169, 'item_laundry_rack_plastic');
INSERT INTO item_category(item_id, category_id) VALUES(169, 10);
INSERT INTO item_category(item_id, category_id) VALUES(169, 1);

INSERT INTO item(id, name) VALUES(170, 'item_washing_machine');
INSERT INTO item_category(item_id, category_id) VALUES(170, 5);
INSERT INTO item_category(item_id, category_id) VALUES(170, 1);

INSERT INTO item(id, name) VALUES(171, 'item_haar_drier');
INSERT INTO item_category(item_id, category_id) VALUES(171, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(171, 5);

INSERT INTO item(id, name) VALUES(172, 'item_phone');
INSERT INTO item_category(item_id, category_id) VALUES(172, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(172, 5);

INSERT INTO item(id, name) VALUES(173, 'item_iphone');
INSERT INTO item_category(item_id, category_id) VALUES(173, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(173, 5);

INSERT INTO item(id, name) VALUES(174, 'item_smartphone');
INSERT INTO item_category(item_id, category_id) VALUES(174, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(174, 5);

INSERT INTO item(id, name) VALUES(175, 'item_grease');
INSERT INTO item_category(item_id, category_id) VALUES(175, 6);

INSERT INTO item(id, name) VALUES(175, 'item_grease');
INSERT INTO item_category(item_id, category_id) VALUES(175, 6);

INSERT INTO item(id, name) VALUES(176, 'item_foto_albums');
INSERT INTO item_category(item_id, category_id) VALUES(176, 6); -- TODO confirm

INSERT INTO item(id, name) VALUES(177, 'item_litter_pets');
INSERT INTO item_category(item_id, category_id) VALUES(177, 6);

INSERT INTO item(id, name) VALUES(178, 'item_wifi_audio');
INSERT INTO item_category(item_id, category_id) VALUES(178, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(178, 5);

INSERT INTO item(id, name) VALUES(179, 'item_headphones');
INSERT INTO item_category(item_id, category_id) VALUES(179, 100013);
INSERT INTO item_category(item_id, category_id) VALUES(179, 5);

INSERT INTO item(id, name) VALUES(180, 'item_jacket');
INSERT INTO item_category(item_id, category_id) VALUES(180, 9);

INSERT INTO item(id, name) VALUES(181, 'item_socks');
INSERT INTO item_category(item_id, category_id) VALUES(181, 9);

INSERT INTO item(id, name) VALUES(182, 'item_skirt');
INSERT INTO item_category(item_id, category_id) VALUES(182, 9);

INSERT INTO item_category(item_id, category_id) VALUES(0, 7) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(1, 3) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(2, 6) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(3, 5) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(4, 5) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(5, 6) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(6, 0) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(7, 1) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(8, 4) ON CONFLICT DO NOTHING;
INSERT INTO item_category(item_id, category_id) VALUES(9, 9) ON CONFLICT DO NOTHING;
