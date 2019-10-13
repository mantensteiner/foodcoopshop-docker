mysql -uroot -pmysecret -e "CREATE DATABASE foodcoopshop_db"; 
mysql -uroot -pmysecret -e "CREATE USER 'fcs_db_user@foodcoopshop_db' IDENTIFIED BY 'mypassword';";
mysql -uroot -pmysecret -e "GRANT ALL PRIVILEGES ON * . * TO 'fcs_db_user@foodcoopshop_db'";

mysql -uroot -pmysecret foodcoopshop_db < /home/sql/clean-db-structure.sql
mysql -uroot -pmysecret foodcoopshop_db < /home/sql/clean-db-data-de_DE.sql

# After account creation
#mysql -uroot -pmysecret foodcoopshop_db -e "UPDATE fcs_customer SET id_default_group = 5 WHERE id_customer=1;"
#mysql -uroot -pmysecret foodcoopshop_db -e "UPDATE fcs_customer SET active = 1 WHERE id_customer=1;"