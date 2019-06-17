--\i /Users/ischuetz/dev/waste/server/src/main/resources/populate.sql

BEGIN;
\i /Users/ischuetz/dev/waste/server/src/main/resources/init.sql
\i /Users/ischuetz/dev/waste/server/src/main/resources/items.sql
\i /Users/ischuetz/dev/waste/altkleider/src/main/resources/output.sql
\i /Users/ischuetz/dev/waste/altkleider/src/main/resources/output_item.sql
\i /Users/ischuetz/dev/waste/waste_json_parser/src/main/resources/output.sql
COMMIT;
