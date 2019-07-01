--\i /Users/ischuetz/dev/waste/server/src/main/resources/populate_local.sql

BEGIN;
\i /Users/ischuetz/dev/waste/server/src/main/resources/init.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/translations_de.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/translations_tips_de.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/translations_en.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/translations_tips_en.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/containers.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/p_containers.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/categories.sql
\i /Users/ischuetz/dev/waste/waste_scrap/src/main/resources/p_containers_bsr.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/categories_to_containers.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/pickup_companies.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/categories_to_pickup_company.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/categories_to_p_containers.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/items.sql
\i /Users/ischuetz/dev/waste/waste_json_parser/src/main/resources/p_containers_glasiglas.sql
\i /Users/ischuetz/dev/waste/altkleider/src/main/resources/p_containers_clothes.sql
\i /Users/ischuetz/dev/waste/altkleider/src/main/resources/p_containers_clothes_item.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/opening_hours.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/tags.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/tips.sql
COMMIT;
