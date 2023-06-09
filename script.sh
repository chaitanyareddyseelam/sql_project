psql -U postgres -h localhost -d sakila -c "COPY actor TO stdout WITH (FORMAT CSV, HEADER);" > actor.csv
psql -U postgres -h localhost -d sakila -c "COPY category TO stdout WITH (FORMAT CSV, HEADER);" > category.csv
psql -U postgres -h localhost -d sakila -c "COPY film TO stdout WITH (FORMAT CSV, HEADER);" > film.csv
psql -U postgres -h localhost -d sakila -c "COPY film_actor TO stdout WITH (FORMAT CSV, HEADER);" > film_actor.csv
psql -U postgres -h localhost -d sakila -c "COPY film_category TO stdout WITH (FORMAT CSV, HEADER);" > film_category.csv
psql -U postgres -h localhost -d sakila -c "COPY address TO stdout WITH (FORMAT CSV, HEADER);" > address.csv
psql -U postgres -h localhost -d sakila -c "COPY city TO stdout WITH (FORMAT CSV, HEADER);" > city.csv
psql -U postgres -h localhost -d sakila -c "COPY country TO stdout WITH (FORMAT CSV, HEADER);" > country.csv
psql -U postgres -h localhost -d sakila -c "COPY customer TO stdout WITH (FORMAT CSV, HEADER);" > customer.csv
psql -U postgres -h localhost -d sakila -c "COPY inventory TO stdout WITH (FORMAT CSV, HEADER);" > inventory.csv
psql -U postgres -h localhost -d sakila -c "COPY language TO stdout WITH (FORMAT CSV, HEADER);" > language.csv
psql -U postgres -h localhost -d sakila -c "COPY payment TO stdout WITH (FORMAT CSV, HEADER);" > payment.csv
psql -U postgres -h localhost -d sakila -c "COPY payment_p2007_01 TO stdout WITH (FORMAT CSV, HEADER);" > payment_p2007_01.csv
psql -U postgres -h localhost -d sakila -c "COPY payment_p2007_02 TO stdout WITH (FORMAT CSV, HEADER);" > payment_p2007_02.csv
psql -U postgres -h localhost -d sakila -c "COPY payment_p2007_03 TO stdout WITH (FORMAT CSV, HEADER);" > payment_p2007_03.csv
psql -U postgres -h localhost -d sakila -c "COPY payment_p2007_04 TO stdout WITH (FORMAT CSV, HEADER);" > payment_p2007_04.csv
psql -U postgres -h localhost -d sakila -c "COPY payment_p2007_05 TO stdout WITH (FORMAT CSV, HEADER);" > payment_p2007_05.csv
psql -U postgres -h localhost -d sakila -c "COPY payment_p2007_06 TO stdout WITH (FORMAT CSV, HEADER);" > payment_p2007_06.csv
psql -U postgres -h localhost -d sakila -c "COPY rental TO stdout WITH (FORMAT CSV, HEADER);" > rental.csv
psql -U postgres -h localhost -d sakila -c "COPY staff TO stdout WITH (FORMAT CSV, HEADER);" > staff.csv
psql -U postgres -h localhost -d sakila -c "COPY store TO stdout WITH (FORMAT CSV, HEADER);" > store.csv
