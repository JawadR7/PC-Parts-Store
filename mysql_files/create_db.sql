CREATE DATABASE IF NOT EXISTS pc_parts_store;
USE pc_parts_store;

CREATE TABLE country (
  country_id INT PRIMARY KEY,
  country_name VARCHAR(200),
  country_code CHAR(3)
);

CREATE TABLE address (
  address_id INT PRIMARY KEY,
  street_number VARCHAR(10),
  apt_no VARCHAR(10),
  street_name VARCHAR(200),
  city VARCHAR(100),
  country_id INT,
  FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(50),
  first_name VARCHAR(200),
  last_name VARCHAR(200),
  middle_initial CHAR(1),
  customer_phone VARCHAR(22),
  email VARCHAR(350)
);

CREATE TABLE customer_address (
  customer_id INT,
  address_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (address_id) REFERENCES address (address_id),
  PRIMARY KEY (customer_id, address_id)
);

CREATE TABLE vendor (
  vendor_id INT PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(50),
  vendor_name VARCHAR(200),
  vendor_phone VARCHAR(22),
  email VARCHAR(350)
);

CREATE TABLE vendor_address (
  vendor_id INT,
  address_id INT,
  FOREIGN KEY (vendor_id) REFERENCES vendor (vendor_id),
  FOREIGN KEY (address_id) REFERENCES address (address_id),
  PRIMARY KEY (vendor_id, address_id)
);

CREATE TABLE item (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat IN ('cpu', 'pow','mem','kul','sto','cas','mtb','gpu')),
  vendor_id INT,
  item_name VARCHAR(50) NOT NULL,
  item_desc VARCHAR(500),
  item_price DOUBLE(10,2) NOT NULL,
  CONSTRAINT item_pk PRIMARY KEY (item_id, item_cat)
);

CREATE TABLE cpu (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat = 'cpu'),
  manufacturer VARCHAR(50) NOT NULL,
  part_no VARCHAR(150) NOT NULL,
  cores INT,
  clock_speed DOUBLE(2,1),
  boosted_clock_speed DOUBLE(2,1),
  tdp INT,
  series VARCHAR(50),
  microarchitecture VARCHAR(50),
  core_family VARCHAR(50),
  socket VARCHAR(50),
  integrated_graphics VARCHAR(50),
  max_mem INT,
  ecc BOOLEAN,
  cooler_incl BOOLEAN,
  packaging VARCHAR(50),
  lithography INT,
  CONSTRAINT cpu_fk FOREIGN KEY (item_id, item_cat) REFERENCES item (item_id, item_cat),
  PRIMARY KEY (item_id, item_cat)
);

CREATE TABLE power_supply (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat = 'pow'),
  manufacturer VARCHAR(50) NOT NULL,
  model VARCHAR(50),
  part_no VARCHAR(150) NOT NULL,
  type VARCHAR(50),
  efficiency VARCHAR(50),
  wattage INT,
  length INT,
  modular VARCHAR(50),
  color VARCHAR(50),
  fanless BOOLEAN,
  atx_connectors INT,
  eps_connectors INT,
  pcle_connectors INT,
  sata_connectors INT,
  molex_connectors INT,
  CONSTRAINT pow_fk FOREIGN KEY (item_id, item_cat) REFERENCES item (item_id, item_cat),
  PRIMARY KEY (item_id, item_cat)
);

CREATE TABLE memory (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat = 'mem'),
  manufacturer VARCHAR(50) NOT NULL,
  part_no VARCHAR(150) NOT NULL,
  speed VARCHAR(50),
  form_factor VARCHAR(50),
  modules VARCHAR(50),
  capacity INT,
  per_gb_price DOUBLE(3, 2),
  color VARCHAR(50),
  first_word_latency INT,
  cas_word_latency INT,
  voltage INT,
  ecc BOOLEAN,
  heat_spreader BOOLEAN,
  CONSTRAINT mem_fk FOREIGN KEY (item_id, item_cat) REFERENCES item (item_id, item_cat),
  PRIMARY KEY (item_id, item_cat)
);

CREATE TABLE cpu_cooler (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat = 'kul'),
  manufacturer VARCHAR(50) NOT NULL,
  part_no VARCHAR(150) NOT NULL,
  rpm_low INT,
  rpm_high INT,
  noise_level_low INT,
  noise_level_high INT,
  color VARCHAR(50),
  height INT,
  socket VARCHAR(50),
  water_cooled BOOLEAN,
  fanless BOOLEAN,
  CONSTRAINT kul_fk FOREIGN KEY (item_id, item_cat) REFERENCES item (item_id, item_cat),
  PRIMARY KEY (item_id, item_cat)
);

CREATE TABLE storage (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat = 'sto'),
  manufacturer VARCHAR(50) NOT NULL,
  part_no VARCHAR(150) NOT NULL,
  capacity INT,
  per_gb_price DOUBLE(2, 2),
  type VARCHAR(50),
  cache INT,
  form_factor VARCHAR(50),
  nvme BOOLEAN,
  CONSTRAINT sto_fk FOREIGN KEY (item_id, item_cat) REFERENCES item (item_id, item_cat),
  PRIMARY KEY (item_id, item_cat)
);

CREATE TABLE pc_case (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat = 'cas'),
  manufacturer VARCHAR(50) NOT NULL,
  part_no VARCHAR(150) NOT NULL,
  type VARCHAR(50),
  color VARCHAR(50),
  incl_power_supply VARCHAR(50),
  side_panel VARCHAR(50),
  pow_supply_shroud BOOLEAN,
  front_panel_usb VARCHAR(50),
  mtb_form_factor VARCHAR(50),
  max_vid_card_lenth INT,
  drive_bays VARCHAR(50),
  exp_slots VARCHAR(50),
  dimensions VARCHAR(50),
  volume VARCHAR(50),
  CONSTRAINT cas_fk FOREIGN KEY (item_id, item_cat) REFERENCES item (item_id, item_cat),
  PRIMARY KEY (item_id, item_cat)
);


CREATE TABLE motherboard (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat = 'mtb'),
  manufacturer VARCHAR(50) NOT NULL,
  part_no VARCHAR(150) NOT NULL,
  socket VARCHAR(50),
  form_factor VARCHAR(50),
  chipset VARCHAR(50),
  max_mem INT,
  mem_type VARCHAR(50),
  mem_slots INT,
  mem_speed VARCHAR(250),
  color VARCHAR(50),
  pcle_slots VARCHAR(100),
  m_2_slots VARCHAR(100),
  sata_slots INT,
  ethernet VARCHAR(50),
  usb_2_headers VARCHAR(100),
  usb_3_2_headers VARCHAR(100),
  clock_speed DOUBLE(2,1),
  ecc BOOLEAN,
  wireless_networking VARCHAR(50),
  raid_support BOOLEAN,
  CONSTRAINT mtb_fk FOREIGN KEY (item_id, item_cat) REFERENCES item (item_id, item_cat),
  PRIMARY KEY (item_id, item_cat)
);

CREATE TABLE video_card (
  item_id INT,
  item_cat CHAR(3) NOT NULL CHECK (item_cat = 'gpu'),
  manufacturer VARCHAR(50) NOT NULL,
  model VARCHAR(50),
  part_no VARCHAR(150) NOT NULL,
  chipset VARCHAR(50),
  mem INT,
  mem_type VARCHAR(50),
  clock_speed DOUBLE(2,1),
  boosted_clock_speed DOUBLE(2,1),
  effective_mem_clk_speed DOUBLE(2,1),
  interface VARCHAR(50),
  color VARCHAR(50),
  frame_sync VARCHAR(50),
  length INT,
  tdp INT,
  case_exp_slot_width INT,
  total_slot_width INT,
  cooling VARCHAR(50),
  external_pow VARCHAR(50),
  hdmi_outputs INT,
  total_outputs INT,
  CONSTRAINT gpu_fk FOREIGN KEY (item_id, item_cat) REFERENCES item (item_id, item_cat),
  PRIMARY KEY (item_id, item_cat)
);

CREATE TABLE shipping_method (
  method_id INT PRIMARY KEY,
  method_name VARCHAR(100),
  cost DECIMAL(10, 2)
);

CREATE TABLE cust_order (
  order_id INT PRIMARY KEY,
  order_date DATETIME,
  customer_id INT,
  shipping_method_id INT,
  destination_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
  FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (method_id),
  FOREIGN KEY (destination_id) REFERENCES address (address_id)
);

CREATE TABLE order_line (
  line_id INT PRIMARY KEY,
  order_id INT,
  item_id INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
  FOREIGN KEY (item_id) REFERENCES item (item_id)
);

CREATE TABLE order_status (
	status_id INT PRIMARY KEY,
  status_value VARCHAR(50)
);

CREATE TABLE order_history (
  history_id INT PRIMARY KEY,
  order_id INT,
  status_id INT,
  status_date DATETIME,
  CONSTRAINT oh_fk_co FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
  CONSTRAINT oh_fk_st FOREIGN KEY (status_id) REFERENCES order_status (status_id)
);
