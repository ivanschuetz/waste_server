--\i /Users/ischuetz/dev/waste/server/src/main/resources/populate.sql

BEGIN;
\i /Users/ischuetz/dev/waste/server/src/main/resources/init.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/translations_de.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/translations_en.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/containers.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/categories.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/categories_to_containers.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/pickup_companies.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/categories_to_pickup_company.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/items.sql
\i /Users/ischuetz/dev/waste/altkleider/src/main/resources/output.sql
\i /Users/ischuetz/dev/waste/altkleider/src/main/resources/output_item.sql
\i /Users/ischuetz/dev/waste/waste_json_parser/src/main/resources/output.sql
\i /Users/ischuetz/dev/waste/waste_scrap/src/main/resources/output.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/opening_hours.sql
COMMIT;
