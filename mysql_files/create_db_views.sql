CREATE VIEW CPUs 
AS SELECT c.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN cpu c
ON (i.item_id = c.item_id);










CREATE VIEW `CustomerView` AS
SELECT first_name, last_name, customer_phone, email 
FROM customer AS c
INNER JOIN item as i
	ON c.item_name = i.item_name AND c.item_price = i.item_price 
INNER JOIN address as a
	ON c.street_number = a.street_number AND c.apt_no = a.apt_no AND c.street_name = a.street_name AND c.city = a.city AND c.country_id = a.country_id

    
CREATE VIEW 'VendorView' AS
SELECT first_name, last_name, customer_phone, email 
FROM customer AS c
INNER JOIN item as i
	ON c.item_id = i.item_id AND c.item_name = i.item_name AND c.item_price = i.item_price 
INNER JOIN address as a
	ON c.street_number = a.street_number AND c.apt_no = a.apt_no AND c.street_name = a.street_name AND c.city = a.city AND c.country_id = a.country_id
INNER JOIN shipping_method s
	ON c.method_name = s.method_name
