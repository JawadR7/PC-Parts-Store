CREATE VIEW CPU_VIEW 
AS SELECT c.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN cpu c
ON (i.item_id = c.item_id);

CREATE VIEW POWERSUPPLY_VIEW 
AS SELECT p.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN power_supply p
ON (i.item_id = p.item_id);

CREATE VIEW MEMORY_VIEW 
AS SELECT m.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN memory m
ON (i.item_id = m.item_id);

CREATE VIEW CPUCOOLER_VIEW 
AS SELECT o.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN cpu_cooler o
ON (i.item_id = o.item_id);

CREATE VIEW STORAGE_VIEW 
AS SELECT s.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN storage s
ON (i.item_id = s.item_id);

CREATE VIEW PCCASE_VIEW 
AS SELECT r.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN pc_case r
ON (i.item_id = r.item_id);

CREATE VIEW MOTHERBOARD_VIEW 
AS SELECT m.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN motherboard m
ON (i.item_id = m.item_id);

CREATE VIEW VIDEOCARD_VIEW 
AS SELECT v.*, i.item_id AS base_item_id, i.item_name, i.vendor_id, i.item_desc, i.item_cat AS base_item_cat, i.item_price 
FROM item i INNER JOIN video_card v
ON (i.item_id = v.item_id);

