-------------------------------------------------------------------
-- Vendors can insert items into database and list them for sale --
-------------------------------------------------------------------

-- vendors can insert their parts into the respective parts tables

-- vendors can list a part on the store by creating an item entity in the item table

-- vendors can change the price of an item


-------------------------------------
-- Vendors can view info of orders --
-------------------------------------

-- view price of order 7

-- view how many orders completed between January 1st 2021 and December 31st 2021





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


-------------------------------------
-- Customers can view their orders --
-------------------------------------








----------------------------------------------------------------------------
-- Customers can modify their info (password, phone, email, address, etc. --
----------------------------------------------------------------------------