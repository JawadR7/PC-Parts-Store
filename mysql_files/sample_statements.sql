-------------------------------------------------------------------
-- Vendors can insert items into database and list them for sale --
-------------------------------------------------------------------

-- SCENARIO: a vendor wants to list a new storage device for sale on the store.

-- first, the vendor will list the part on the store by creating an item entity in the item table
INSERT INTO pc_parts_store.item(item_id, item_cat, vendor_id, item_name, item_desc, item_price)
VALUES (9081,'sto',12,'Megaplate 4451','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',2406.99);

-- then, the vendor will provide the data for the item by inserting it in its corresponding part table. Constraints will ensure that the item is placed in the correct table.
INSERT INTO storage(item_id,item_cat,manufacturer,part_no,capacity,type,cache,form_factor,nvme) VALUES
 (9081,'sto','Mumenheiser','JL721',4498,'Internal',44,'NVME',1)


-- vendors can change the price of an item
UPDATE pc_parts_store.item SET item_price = 3000 WHERE item_id = 9013;


-------------------------------------
-- Vendors can view info of orders --
-------------------------------------

-- view amount of items in order 2 and what the grand total is
SELECT order_id AS 'Order ID', COUNT(line_id) AS 'Number of Items', SUM(price) AS 'Grand Total' FROM pc_parts_store.order_line WHERE order_id = 2;


-- view how many orders completed in 2021
SELECT COUNT(h.order_id) AS 'Completed Orders in 2021' FROM pc_parts_store.order_history AS h, pc_parts_store.order_status AS s
WHERE h.status_id = s.status_id AND s.status_value = "Completed" AND h.status_date LIKE "2021%";


-------------------------------------------------------------------------------
-- Customers can browse the catalog and sort items by various metrics/values --
-------------------------------------------------------------------------------

-- find the name, price and description of motherboards that have at least 2 M.2 slots, use the AM4 socket, and have in-built wifi
SELECT i.item_name AS 'Name', i.item_price AS 'Price', i.item_desc AS 'Description', 
m.manufacturer AS 'Manufacturer', m.part_no AS 'Part Number', m.m_2_slots AS 'M.2 Slots', m.socket AS 'Socket',
 m.wireless_networking AS 'Inbuilt Wifi' FROM pc_parts_store.motherboard AS m, pc_parts_store.item AS i
WHERE m_2_slots >= 2 AND socket = "AM4" AND wireless_networking = 1 AND m.item_id = i.item_id; 

-- find the average price of GPUs that have a clock speed of over 2 GHz
SELECT AVG(i.item_price) AS 'Average' FROM pc_parts_store.video_card AS v, pc_parts_store.item AS i
WHERE v.item_id = i.item_id AND v.clock_speed >= 2;


----------------------------------------------
-- Customers can place orders and view them --
----------------------------------------------

-- SCENARIO: a customer wants to order a CPU and a GPU

-- first, a new entry will be added to the cust_order table containing the new order details
INSERT INTO pc_parts_store.cust_order VALUES (21, '2021-04-30 15:23:23', 3725184, 5, 17);

-- then, an entry for each part is added to order_line. first, the CPU:
INSERT INTO order_line(line_id, order_id, item_id, price)
VALUES (41, 21, 9020, 1824.27);

-- next, the same is done for GPU (making sure to use the same order_id to keep it on the same order! in this case, it is order_id 21)
INSERT INTO order_line(line_id, order_id, item_id, price)
VALUES (42, 21, 9024, 6311.17);

-- now, create an entry into order_history to keep track of the order
INSERT INTO order_history(history_id, order_id, status_id, status_date)
VALUES (61,21,1,'2021-04-30 15:23:23');
-- ***** after that, the order is now completely in the database with all necessary data. *****


-- customers can view details of their orders
-- ex: display the name and description of each item in order 14
SELECT ol.order_id AS 'Order', i.item_name AS 'Name', i.item_desc AS 'Description' FROM pc_parts_store.order_line AS ol, pc_parts_store.item as i
WHERE ol.item_id = i.item_id AND ol.order_id = 14;


-------------------------------------------------------------------------------------------------------------
-- Customers and vendors can create accounts, and modify their info (password, phone, email, address, etc. --
-------------------------------------------------------------------------------------------------------------

-- CUSTOMER ACCOUNT CREATION (vendor account creation is the same process)
-- create entry in customer table containing all of customer's account details
INSERT INTO customer VALUES
(9522721, "iLoveSQL", "strongPassword123!@#$", "Frodo", "Baggins", "U", "5052349876", "ringbearer@gmail.com"),

-- create entry in address containing the customer's address information
INSERT INTO address (address_id, street_number, apt_no, street_name, city, country_id) VALUES 
(51, '32', 12, 'Bag End', 'The Shire', 9); 

-- finally, create entry in customer_address that links the customer's account to their address
INSERT INTO customer_address VALUES
(9522721, 51);


-- customers can modify their information, such as their phone number or their address
-- ex: updating phone number:
UPDATE pc_parts_store.customer SET customer_phone = 9871234444 WHERE customer_id = 1629800;

-- ex: updating the address (changing the apartment number):
UPDATE pc_parts_store.address SET apt_no = 33 WHERE address_id = (SELECT address_id FROM customer_address WHERE customer_id = 1629800);