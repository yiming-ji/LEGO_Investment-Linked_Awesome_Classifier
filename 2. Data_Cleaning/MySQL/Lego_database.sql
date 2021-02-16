# Part 1. Create Schema
#Create Schema
DROP schema if exists lego_test;
CREATE schema lego_test;
USE lego_test;

#Create inventories table and import csv
DROP TABLE if exists inventories;
CREATE TABLE inventories
(id INT NOT NULL PRIMARY KEY, version INT, set_num VARCHAR(20));
#add foreign key
ALTER TABLE inventories
ADD FOREIGN KEY (set_num) REFERENCES sets(set_num);

#Create inventory_parts table and import csv
DROP TABLE if exists inventory_parts;
CREATE TABLE inventory_parts
(inventory_id INT, part_num VARCHAR(20), color_id INT, quantity INT, is_spare VARCHAR(5));
#add foreign keys
ALTER TABLE inventory_parts
ADD FOREIGN KEY (color_id) REFERENCES colors(id);
ALTER TABLE inventory_parts
ADD FOREIGN KEY (inventory_id) REFERENCES inventories(id);
ALTER TABLE inventory_parts
ADD FOREIGN KEY (part_num) REFERENCES parts(part_num);

#Create inventory_minifigs table and import csv
DROP TABLE if exists inventory_minifigs;
CREATE TABLE inventory_minifigs
(inventory_id INT, fig_num varchar(20), quantity INT);
#add foreign key
ALTER TABLE inventory_minifigs
ADD FOREIGN KEY (inventory_id) REFERENCES inventories(id);

#Create inventory_sets table and import csv
DROP TABLE if exists inventory_sets;
CREATE TABLE inventory_sets
(inventory_id INT, set_num varchar(20), quantity INT);
ALTER TABLE inventory_sets
ADD FOREIGN KEY (set_num) REFERENCES sets(set_num);
ALTER TABLE inventory_sets
ADD FOREIGN KEY (inventory_id) REFERENCES inventories(id);

#Create parts table and import csv
DROP TABLE if exists parts;
CREATE TABLE parts
(part_num varchar(20), name varchar(250), part_cat_id INT);
ALTER TABLE parts
ADD PRIMARY KEY (part_num);
ALTER TABLE parts
ADD FOREIGN KEY (part_cat_id) REFERENCES parts_categories(id);

#Create parts_category table and import csv
DROP TABLE if exists parts_categories;
CREATE TABLE parts_categories
(id INT NOT NULL PRIMARY KEY, name varchar(200), part_count INT);

#Create colors table and import csv
DROP TABLE if exists colors;
CREATE TABLE colors
(id INT NOT NULL PRIMARY KEY, name varchar(200), rgb varchar(6), is_trans VARCHAR(5));

#Create themes table and import csv
DROP TABLE if exists themes;
CREATE TABLE themes
(id INT NOT NULL PRIMARY KEY, name varchar(40) NULL, parent_id INT);

#Create sets table and import csv
DROP TABLE if exists sets;
CREATE TABLE sets
(set_num varchar(20), name varchar(256), year INT, theme_id INT, num_parts INT);
ALTER TABLE sets
ADD PRIMARY KEY (set_num);
ALTER TABLE sets
ADD FOREIGN KEY (theme_id) REFERENCES themes(id);

# Create annual_growth table and import csv
DROP TABLE if exists annual_value_growth;
CREATE TABLE annual_value_growth
(set_num varchar(20), rrp FLOAT, annual_growth FLOAT);
ALTER TABLE annual_value_growth
ADD FOREIGN KEY (set_num) REFERENCES sets(set_num);

# Part 2. Join above tables together

# Create a View with lego designs
CREATE VIEW lego_design AS
SELECT s.set_num, s.name AS set_name, s.year AS release_year, s.num_parts, s.theme_id, t.name AS theme_name, t.parent_id AS theme_parent_id, i.id AS inventory_id,  im.fig_num, im.quantity AS minifig_quantity,
ip.color_id, c.name AS color_name, c.is_trans AS color_trans, ip.part_num, p.name AS part_name, ip.quantity AS inventory_part_quantity, ip.is_spare AS inventory_part_spare, p.part_cat_id, pc.name AS part_category_name, pc.part_count AS category_part_count
FROM sets AS s
LEFT JOIN themes AS t
ON s.theme_id = t.id
LEFT JOIN inventories AS i
ON s.set_num = i.set_num
LEFT JOIN inventory_minifigs AS im
ON i.id = im.inventory_id
LEFT JOIN inventory_parts AS ip
ON i.id = ip.inventory_id
LEFT JOIN colors AS c
ON ip.color_id = c.id
LEFT JOIN parts AS p
ON ip.part_num = p.part_num
LEFT JOIN parts_categories AS pc
ON p.part_cat_id = pc.id;

# Check total number of rows
SELECT COUNT(*)
FROM lego_design;

# Create a View to join lego designs with pricing information
DROP VIEW IF EXISTS lego_database;
CREATE VIEW lego_database AS
SELECT ag.set_num, ag.rrp, ag.annual_growth, ld.set_name, ld.release_year, ld.num_parts, ld.theme_id, ld.theme_name, ld.theme_parent_id, ld.inventory_id, ld.fig_num, ld.minifig_quantity,
ld.color_id, ld.color_name, ld.color_trans, ld.part_num, ld.part_name, ld.inventory_part_quantity, ld.inventory_part_spare, ld.part_cat_id, ld.part_category_name, ld.category_part_count
FROM annual_value_growth AS ag
LEFT JOIN lego_design AS ld
ON ag.set_num = ld.set_num;

# Check total number of rows
SELECT COUNT(*)
FROM lego_database;













