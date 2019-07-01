--\i /home/ivan/sql/populate.sql

BEGIN;
\i /home/ivan/sql/init.sql
\i /home/ivan/sql/translations_de.sql
\i /home/ivan/sql/translations_tips_de.sql
\i /home/ivan/sql/translations_en.sql
\i /home/ivan/sql/translations_tips_en.sql
\i /home/ivan/sql/containers.sql
\i /home/ivan/sql/p_containers.sql
\i /home/ivan/sql/categories.sql
\i /home/ivan/sql/p_containers_bsr.sql
\i /home/ivan/sql/categories_to_containers.sql
\i /home/ivan/sql/pickup_companies.sql
\i /home/ivan/sql/categories_to_pickup_company.sql
\i /home/ivan/sql/categories_to_p_containers.sql
\i /home/ivan/sql/items.sql
\i /home/ivan/sql/p_containers_glasiglas.sql
\i /home/ivan/sql/p_containers_clothes.sql
\i /home/ivan/sql/p_containers_clothes_item.sql
\i /home/ivan/sql/opening_hours.sql
\i /home/ivan/sql/tags.sql
\i /home/ivan/sql/tips.sql
COMMIT;
