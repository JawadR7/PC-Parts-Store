-------------------------------------------------------------------
-- Jawad Rahman, Michel Renner, Charles Roeder, Omar Sheikh --
-- Dr. Houwei Cao --
-- CSCI 300 M01 --
-- 14 Dec 2022 --
-- Group Project: PC Components Store --
-------------------------------------------------------------------


----------------------------------------------
-- Create the Database, Entities, and Views --
----------------------------------------------

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
  pcie_connectors INT,
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
  incl_power_supply BOOLEAN,
  side_panel VARCHAR(50),
  pow_supply_shroud BOOLEAN,
  front_panel_usb VARCHAR(50),
  mtb_form_factor VARCHAR(50),
  max_vid_card_lenth INT,
  drive_bays VARCHAR(50),
  exp_slots INT,
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
  pcie_slots INT,
  m_2_slots INT,
  sata_slots INT,
  ethernet BOOLEAN,
  usb_2_headers INT,
  usb_3_2_headers INT,
  ecc BOOLEAN,
  wireless_networking BOOLEAN,
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
  effective_mem_clk_speed INT,
  interface VARCHAR(50),
  color VARCHAR(50),
  length INT,
  tdp INT,
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


---------------------------------------
-- Insert all data into the Database --
---------------------------------------

INSERT INTO country VALUES
(1, 'Afghanistan', 'AF'),
(2, 'Aland Islands', 'AX'),
(3, 'Albania', 'AL'),
(4, 'Algeria', 'DZ'),
(5, 'American Samoa', 'AS'),
(6, 'Andorra', 'AD'),
(7, 'Angola', 'AO'),
(8, 'Anguilla', 'AI'),
(9, 'Antarctica', 'AQ'),
(10, 'Antigua and Barbuda', 'AG'),
(11, 'Argentina', 'AR'),
(12, 'Armenia', 'AM'),
(13, 'Aruba', 'AW'),
(14, 'Australia', 'AU'),
(15, 'Austria', 'AT'),
(16, 'Azerbaijan', 'AZ'),
(17, 'Bahamas', 'BS'),
(18, 'Bahrain', 'BH'),
(19, 'Bangladesh', 'BD'),
(20, 'Barbados', 'BB'),
(21, 'Belarus', 'BY'),
(22, 'Belgium', 'BE'),
(23, 'Belize', 'BZ'),
(24, 'Benin', 'BJ'),
(25, 'Bermuda', 'BM'),
(26, 'Bhutan', 'BT'),
(27, 'Bolivia', 'BO'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ'),
(29, 'Bosnia and Herzegovina', 'BA'),
(30, 'Botswana', 'BW'),
(31, 'Bouvet Island', 'BV'),
(32, 'Brazil', 'BR'),
(33, 'British Indian Ocean Territory', 'IO'),
(34, 'Brunei Darussalam', 'BN'),
(35, 'Bulgaria', 'BG'),
(36, 'Burkina Faso', 'BF'),
(37, 'Burundi', 'BI'),
(38, 'Cambodia', 'KH'),
(39, 'Cameroon', 'CM'),
(40, 'Canada', 'CA'),
(41, 'Cape Verde', 'CV'),
(42, 'Cayman Islands', 'KY'),
(43, 'Central African Republic', 'CF'),
(44, 'Chad', 'TD'),
(45, 'Chile', 'CL'),
(46, 'China', 'CN'),
(47, 'Christmas Island', 'CX'),
(48, 'Cocos (Keeling) Islands', 'CC'),
(49, 'Colombia', 'CO'),
(50, 'Comoros', 'KM'),
(51, 'Congo', 'CG'),
(52, 'Congo, Democratic Republic of the Congo', 'CD'),
(53, 'Cook Islands', 'CK'),
(54, 'Costa Rica', 'CR'),
(55, 'Cote D\'Ivoire', 'CI'),
(56, 'Croatia', 'HR'),
(57, 'Cuba', 'CU'),
(58, 'Curacao', 'CW'),
(59, 'Cyprus', 'CY'),
(60, 'Czech Republic', 'CZ'),
(61, 'Denmark', 'DK'),
(62, 'Djibouti', 'DJ'),
(63, 'Dominica', 'DM'),
(64, 'Dominican Republic', 'DO'),
(65, 'Ecuador', 'EC'),
(66, 'Egypt', 'EG'),
(67, 'El Salvador', 'SV'),
(68, 'Equatorial Guinea', 'GQ'),
(69, 'Eritrea', 'ER'),
(70, 'Estonia', 'EE'),
(71, 'Ethiopia', 'ET'),
(72, 'Falkland Islands (Malvinas)', 'FK'),
(73, 'Faroe Islands', 'FO'),
(74, 'Fiji', 'FJ'),
(75, 'Finland', 'FI'),
(76, 'France', 'FR'),
(77, 'French Guiana', 'GF'),
(78, 'French Polynesia', 'PF'),
(79, 'French Southern Territories', 'TF'),
(80, 'Gabon', 'GA'),
(81, 'Gambia', 'GM'),
(82, 'Georgia', 'GE'),
(83, 'Germany', 'DE'),
(84, 'Ghana', 'GH'),
(85, 'Gibraltar', 'GI'),
(86, 'Greece', 'GR'),
(87, 'Greenland', 'GL'),
(88, 'Grenada', 'GD'),
(89, 'Guadeloupe', 'GP'),
(90, 'Guam', 'GU'),
(91, 'Guatemala', 'GT'),
(92, 'Guernsey', 'GG'),
(93, 'Guinea', 'GN'),
(94, 'Guinea-Bissau', 'GW'),
(95, 'Guyana', 'GY'),
(96, 'Haiti', 'HT'),
(97, 'Heard Island and Mcdonald Islands', 'HM'),
(98, 'Holy See (Vatican City State)', 'VA'),
(99, 'Honduras', 'HN'),
(100, 'Hong Kong', 'HK'),
(101, 'Hungary', 'HU'),
(102, 'Iceland', 'IS'),
(103, 'India', 'IN'),
(104, 'Indonesia', 'ID'),
(105, 'Iran, Islamic Republic of', 'IR'),
(106, 'Iraq', 'IQ'),
(107, 'Ireland', 'IE'),
(108, 'Isle of Man', 'IM'),
(109, 'Israel', 'IL'),
(110, 'Italy', 'IT'),
(111, 'Jamaica', 'JM'),
(112, 'Japan', 'JP'),
(113, 'Jersey', 'JE'),
(114, 'Jordan', 'JO'),
(115, 'Kazakhstan', 'KZ'),
(116, 'Kenya', 'KE'),
(117, 'Kiribati', 'KI'),
(118, 'Korea, Democratic People\'s Republic of', 'KP'),
(119, 'Korea, Republic of', 'KR'),
(120, 'Kosovo', 'XK'),
(121, 'Kuwait', 'KW'),
(122, 'Kyrgyzstan', 'KG'),
(123, 'Lao People\'s Democratic Republic', 'LA'),
(124, 'Latvia', 'LV'),
(125, 'Lebanon', 'LB'),
(126, 'Lesotho', 'LS'),
(127, 'Liberia', 'LR'),
(128, 'Libyan Arab Jamahiriya', 'LY'),
(129, 'Liechtenstein', 'LI'),
(130, 'Lithuania', 'LT'),
(131, 'Luxembourg', 'LU'),
(132, 'Macao', 'MO'),
(133, 'Macedonia, the Former Yugoslav Republic of', 'MK'),
(134, 'Madagascar', 'MG'),
(135, 'Malawi', 'MW'),
(136, 'Malaysia', 'MY'),
(137, 'Maldives', 'MV'),
(138, 'Mali', 'ML'),
(139, 'Malta', 'MT'),
(140, 'Marshall Islands', 'MH'),
(141, 'Martinique', 'MQ'),
(142, 'Mauritania', 'MR'),
(143, 'Mauritius', 'MU'),
(144, 'Mayotte', 'YT'),
(145, 'Mexico', 'MX'),
(146, 'Micronesia, Federated States of', 'FM'),
(147, 'Moldova, Republic of', 'MD'),
(148, 'Monaco', 'MC'),
(149, 'Mongolia', 'MN'),
(150, 'Montenegro', 'ME'),
(151, 'Montserrat', 'MS'),
(152, 'Morocco', 'MA'),
(153, 'Mozambique', 'MZ'),
(154, 'Myanmar', 'MM'),
(155, 'Namibia', 'NA'),
(156, 'Nauru', 'NR'),
(157, 'Nepal', 'NP'),
(158, 'Netherlands', 'NL'),
(159, 'Netherlands Antilles', 'AN'),
(160, 'New Caledonia', 'NC'),
(161, 'New Zealand', 'NZ'),
(162, 'Nicaragua', 'NI'),
(163, 'Niger', 'NE'),
(164, 'Nigeria', 'NG'),
(165, 'Niue', 'NU'),
(166, 'Norfolk Island', 'NF'),
(167, 'Northern Mariana Islands', 'MP'),
(168, 'Norway', 'NO'),
(169, 'Oman', 'OM'),
(170, 'Pakistan', 'PK'),
(171, 'Palau', 'PW'),
(172, 'Palestinian Territory, Occupied', 'PS'),
(173, 'Panama', 'PA'),
(174, 'Papua New Guinea', 'PG'),
(175, 'Paraguay', 'PY'),
(176, 'Peru', 'PE'),
(177, 'Philippines', 'PH'),
(178, 'Pitcairn', 'PN'),
(179, 'Poland', 'PL'),
(180, 'Portugal', 'PT'),
(181, 'Puerto Rico', 'PR'),
(182, 'Qatar', 'QA'),
(183, 'Reunion', 'RE'),
(184, 'Romania', 'RO'),
(185, 'Russian Federation', 'RU'),
(186, 'Rwanda', 'RW'),
(187, 'Saint Barthelemy', 'BL'),
(188, 'Saint Helena', 'SH'),
(189, 'Saint Kitts and Nevis', 'KN'),
(190, 'Saint Lucia', 'LC'),
(191, 'Saint Martin', 'MF'),
(192, 'Saint Pierre and Miquelon', 'PM'),
(193, 'Saint Vincent and the Grenadines', 'VC'),
(194, 'Samoa', 'WS'),
(195, 'San Marino', 'SM'),
(196, 'Sao Tome and Principe', 'ST'),
(197, 'Saudi Arabia', 'SA'),
(198, 'Senegal', 'SN'),
(199, 'Serbia', 'RS'),
(200, 'Serbia and Montenegro', 'CS'),
(201, 'Seychelles', 'SC'),
(202, 'Sierra Leone', 'SL'),
(203, 'Singapore', 'SG'),
(204, 'Sint Maarten', 'SX'),
(205, 'Slovakia', 'SK'),
(206, 'Slovenia', 'SI'),
(207, 'Solomon Islands', 'SB'),
(208, 'Somalia', 'SO'),
(209, 'South Africa', 'ZA'),
(210, 'South Georgia and the South Sandwich Islands', 'GS'),
(211, 'South Sudan', 'SS'),
(212, 'Spain', 'ES'),
(213, 'Sri Lanka', 'LK'),
(214, 'Sudan', 'SD'),
(215, 'Suriname', 'SR'),
(216, 'Svalbard and Jan Mayen', 'SJ'),
(217, 'Swaziland', 'SZ'),
(218, 'Sweden', 'SE'),
(219, 'Switzerland', 'CH'),
(220, 'Syrian Arab Republic', 'SY'),
(221, 'Taiwan, Province of China', 'TW'),
(222, 'Tajikistan', 'TJ'),
(223, 'Tanzania, United Republic of', 'TZ'),
(224, 'Thailand', 'TH'),
(225, 'Timor-Leste', 'TL'),
(226, 'Togo', 'TG'),
(227, 'Tokelau', 'TK'),
(228, 'Tonga', 'TO'),
(229, 'Trinidad and Tobago', 'TT'),
(230, 'Tunisia', 'TN'),
(231, 'Turkey', 'TR'),
(232, 'Turkmenistan', 'TM'),
(233, 'Turks and Caicos Islands', 'TC'),
(234, 'Tuvalu', 'TV'),
(235, 'Uganda', 'UG'),
(236, 'Ukraine', 'UA'),
(237, 'United Arab Emirates', 'AE'),
(238, 'United Kingdom', 'GB'),
(239, 'United States', 'US'),
(240, 'United States Minor Outlying Islands', 'UM'),
(241, 'Uruguay', 'UY'),
(242, 'Uzbekistan', 'UZ'),
(243, 'Vanuatu', 'VU'),
(244, 'Venezuela', 'VE'),
(245, 'Viet Nam', 'VN'),
(246, 'Virgin Islands, British', 'VG'),
(247, 'Virgin Islands, U.s.', 'VI'),
(248, 'Wallis and Futuna', 'WF'),
(249, 'Western Sahara', 'EH'),
(250, 'Yemen', 'YE'),
(251, 'Zambia', 'ZM'),
(252, 'Zimbabwe', 'ZW');

INSERT INTO address (address_id, street_number, apt_no, street_name, city, country_id) VALUES 
(1, '5', 54, 'Springview', 'Shitan', 14), 
(2, '50984', 73, 'Crescent Oaks', 'Bergvliet', 131),
(3, '6096', 81, 'Utah', 'Cojutepeque', 200),
(4, '76', 62, 'Kropf', 'San Vicente de Bique', 18),
(5, '5265', 196, 'Elgar', 'Połajewo', 94),
(6, '9', 150, 'Harbort', 'Shangzhuang', 204),
(7, '636', 94, 'Westend', 'San Cosme y Damián', 179),
(8, '0457', 195, 'Schmedeman', 'Tiel', 234),
(9, '62464', 78, 'Rutledge', 'Trai Ngau', 121),
(10, '158', 155, 'Kennedy', 'Zhexiao', 115),
(11, '66', 174, 'Reindahl', 'Formosa do Rio Preto', 17),
(12, '97043', 28, 'Fairview', 'Romilly-sur-Seine', 12),
(13, '17', 17, 'Hintze', 'Majagual', 196),
(14, '98', 206, 'Service', 'Rączna', 102),
(15, '09552', 204, 'Anthes', 'Songshu', 208),
(16, '813', 144, 'Springs', 'Titab', 94),
(17, '1137', 151, 'Portage', 'Orlovo', 95),
(18, '17', 106, 'La Follette', 'Tapera', 58),
(19, '37931', 232, 'School', 'Aryiropoúlion', 26),
(20, '6364', 234, 'Dryden', 'Aguada de Pasajeros', 211),
(21, '084', 70, 'Arrowood', 'Yasnyy', 25),
(22, '9', 123, 'Katie', 'Yotala', 147),
(23, '05', 127, 'Londonderry', 'Tomilino', 70),
(24, '55', 36, 'Kim', 'Zyuzino', 85),
(25, '3', 66, 'Lindbergh', 'Dengmingsi', 235),
(26, '3', 22, 'Summer Ridge', 'Bondoufle', 151),
(27, '6', 216, 'Ridgeview', 'Zhucun', 240),
(28, '05', 146, 'Clemons', 'Shizong', 71),
(29, '20', 188, 'Dapin', 'Wentugaole', 56),
(30, '8', 167, 'Rockefeller', 'Salto', 170),
(31, '9', 102, 'Manufacturers', 'Izyum', 12),
(32, '935', 229, 'Namekagon', 'Hallsberg', 189),
(33, '322', 2, 'Beilfuss', 'Winangun', 167),
(34, '61373', 42, 'Mcguire', 'Łeba', 190),
(35, '913', 108, 'Kings', 'Dzüünbulag', 58),
(36, '57', 155, 'Kim', 'Chesma', 194),
(37, '80741', 227, 'Cody', 'Su-dong', 95),
(38, '1', 65, 'Manitowish', 'Mwinilunga', 240),
(39, '1971', 129, 'Kingsford', 'Limit', 188),
(40, '66', 141, 'Ridgeview', 'Casal da Serra', 61),
(41, '1', 111, 'Briar Crest', 'Victoria', 90),
(42, '508', 170, 'Green', 'Rawang', 173),
(43, '248', 195, 'Melby', 'Sísion', 176),
(44, '5', 121, 'Lotheville', 'Drayton Valley', 234),
(45, '6', 213, 'Ridgeway', 'Pila', 12),
(46, '5', 19, 'Huxley', 'Riangbaring', 40),
(47, '20', 18, 'Buell', 'El Copé', 173),
(48, '16', 175, 'Fisk', 'Tapon', 42),
(49, '89', 32, 'Longview', 'Qianwei', 152),
(50, '8', 27, 'Oriole', 'Pogranichnyy', 109);

INSERT INTO customer VALUES
(4532741, "jdoe91", "34jdjd91s", "John", "Doe", "F", "7189628732", "jdoe24@gmail.com"),
(9728374, "mikejames23", "mjr0c4a", "Michael", "James", "S", "2419814263", "mjames111@yahoo.com"),
(2431827, "ngreen", "ng92iaks", "Naomi", "Green", NULL, "3472918273", "ngreenc3@gmail.com"),
(8662832, "77asanders", "82yshajfd", "Alex", "Sanders", NULL, "2531349281", "starsanders71@gmail.com"),
(7456233, "rkaysan2", "6sdg34ds", "Robert", "Kaysan", "L", "6197328123", "rkaysan2@gmail.com"),
(2356753, "jjones22", "jsdf1s223", "Joshua", "Jones", "W", "2437261523", "jjones22@gmail.com"),
(1625347, "nathan1", "sDfA2JJ11s", "Nathaniel", "Brown", NULL, "3478210394", "nathaniel29@gmail.com"),
(1629800, "pcartier23", "wlr1629vA", "Jordan", "Carter", NULL, "2227161629", "jcarter22@gmail.com"),
(1400928, "tredd1400", "ALLYT3frfr", "Michael", "White", NULL, "9801729823", "mwhite1400@hotmail.com"),
(5646283, "rbrownMC", "CMnworbr38", "Ronald", "Brown", "M", "3642518436", "rbrownMC@gmail.com"),
(2261283, "cjames21", "sjamc83AsC", "Cassandra", "James", NULL, "2418378273", "cassie717@aol.com"),
(6352817, "jthompson63", "7sahSChs2", "Jennifer", "Thompson", "B", "3472327832", "jethompson53@gmail.com"),
(4256123, "kcenat3", "ShAA32Xsjd", "Kyle", "Cenat", "J", "2432121726", "kcenat3@gmail.com"),
(3271252, "iiris22", "hsj26Ahhx", "Imani", "Iris", NULL, "9802917421", "irissees22@aol.com"),
(2861562, "cmatthews2871", "nxtdO0r23", "Chris", "Matthews", NULL, "1782639871", "cmatthews71@gmail.com"),
(3621827, "fnathans72", "AcSS234Abs", "Francis", "Nathans", NULL, "7182416382", "fnathans872@yahoo.com"),
(9162534, "sthatcher1", "hajkoOuA2s", "Steve", "Thatcher", "J", "3472518278", "sthatcher1@yahoo.com"),
(2152630, "susan02", "3JJhnM281a", "Susan", "Linville", "W", "3012102135", "susanwlinville@aol.com"),
(9720581, "anelson", "7sa6AAhmc", "Dustin", "Nelson", "A", "2676573600", "dnels82@gmail.com"),
(2363645, "lsmith4242", "42Ksja42Jy", "Leroy", "Smith", "C", "7404349775", "csmith21@yahoo.com"),
(3625152, "moore674", "M2jAAsOkj", "Felisha", "Moore", NULL, "8155294163", "moorehead2@gmail.com"),
(4261829, "george8", "password", "George", "Trent", "J", "9376040592", "gtrent4@gmail.com"),
(7281928, "dmoran7", "co8SSveAm", "Donald", "Moran", "M", "2282475514", "dmoran22@gmail.com"),
(6251827, "saguayo", "3MMsZ298Cj", "Stephen", "Aguayo", "C", "7189628732", "saguayo@hotmail.com"),
(1276391, "ndiaz223", "8jSaaCmHJ3", "Natalie", "Diaz", "D", "4252620131", "ndiaz84@gmail.com"),
(4342118, "mwells21", "WjMMa827Fg", "Melissa", "Wells", NULL, "4435571129", "mwells62352@aol.com"),
(7127356, "pryor1", "reNfr00a", "William", "Pryor", NULL, "5088925052", "wpryor21@aol.com"),
(2736483, "dellis489", "298SjkgMM", "Derick", "Ellis", "P", "8602366242", "dellis82@gmail.com"),
(7373646, "fall8211", "pWo00rDy5a", "Frank", "Hall", NULL, "6183150529", "chall800@gmail.com"),
(5262718, "jbarter231", "jHshfui429", "Jeffrey", "Barter", "I", "3172012123", "jbarter@gmail.com"),
(4532742, "tricia10", "riVrIcia22", "Tricia", "Rivera", "E", "3023825672", "riverat2@gmail.com"),
(3725184, "mcasady2", "7372mAAszC", "Marcus", "Casady", "A", "7853080408", "mcasady28@gmail.com"),
(7263641, "mattyh", "jfuAuf3272", "Matthew", "Houston", "T", "3396139825", "mhouston41@aol.com"),
(3267162, "dthomas64", "MdshCC2738A", "Maria", "Thomas", "F", "7189628732", "jdoe24@gmail.com"),
(6736253, "jewelgard", "3GamJsk9s1", "Jewel", "Gardner", "M", "8475381507", "jmgardner521@gmail.com"),
(2645142, "buenobruno", "84jdMMcnXx", "Bruno", "Lachance", NULL, "3606957685", "blachance@yahoo.com"),
(9730189, "kapa2", "MMmaA83ghCN", "Liisi", "Kapanen", NULL, "5037633686", "lkapa21@yahoo.com"),
(1490182, "daumiller73", "DAAmJs837a", "Debra", "Aumiller", "J", "6077349103", "daumiller@gmail.com"),
(8887263, "painter83", "OaaAhfbnX", "Caroline", "Painter", "M", "5804787747", "cpaint@yahoo.com"),
(4472289, "oscar01", "JJdusMAa92", "Oscar", "Amend", "E", "9255433456", "oscar97@gmail.com"),
(4965820, "jdyson83", "8KjaM2paB", "Jose", "Dyson", "M", "2086510569", "josemdyson@gmail.com"),
(3228389, "alvin21", "l0cKKsNa", "Alvin", "White", NULL, "8016376834", "awhite83@yahoo.com"),
(7488920, "twhite93", "aLwHii8sy", "Alvin", "White", "T", "8016376834", "alvinwhite@hotmail.com"),
(9928174, "jhughes83", "HuGmmJl4", "Jessica", "Hughes", "R", "6507548418", "jhughes82@gmail.com"),
(5252007, "roakes52", "RmMMaJ372", "Raymond", "Oakes", "J", "5402632020", "roakes23@gmail.com"),
(3392625, "lmcook28", "c02MMoJhHa", "Teresa", "Cook", NULL, "8307899875", "tcook43@yahoo.com"),
(4082327, "dgribble733", "pw0RddMaZ", "Dennis", "Gribble", NULL, "4357105690", "dgribble24@yahoo.com"),
(4498822, "mknowles26", "P009w0RdsZ", "Irene", "Knowles", NULL, "9785430605", "iknowles@gmail.com"),
(5454211, "jfarelly462", "FjjAm826A", "Jayne", "Farrelly", "C", "3366962701", "jfarrelly260@gmail.com"),
(9558271, "lfrisby27", "fRiSby37AA", "Lillian", "Frisby", NULL, "3096981640", "lfrisby@gmail.com");

INSERT INTO vendor VALUES
(1, "lenovo1", "l3Njs0voSZ", "Lenovo", "8552536686", NULL),
(2, "hpincorporated", "Hp99ZmsQQb", "HP", "8004746836", NULL),
(3, "dellcomputers", "d3LLdmAAz", "Dell", "8006249897", NULL),
(4, "appleios", "i0SnzDDeG", "Apple", "8002752273", NULL),
(5, "acerinc", "aC3RRjSzn", "Acer", "8666952237", NULL),
(6, "asuscom", "a5uSzUUdGc", "Asus", "8122822787", "b2b_help@asus.com"),
(7, "toshibacorp", "t05h0rPba", "Toshiba", "8004577777", NULL),
(8, "ibmcorporation", "iBBkajM381", "IBM", "8004264968", "mysphelp@us.ibm.com"),
(9, "intel1", "iNt3Ll4Ter", "Intel", "9163777000", "programs@intel.com"),
(10, "nvidiacorp1", "nGviTdiXa263", "Nvidia", "8007976530", "info@nvidia.com"),
(11, "amdincorp", "Am3fhHZZx", "AMD", "8772841566", "HW.Support@amd.com"),
(12, "corsairgaming", "g4m3Rc0rSzjHH", "Corsair", "8882224346", NULL),
(13, "samsungelec", "l3Njs0voSZ", "Samsung", "8007267864", NULL),
(14, "evgacorporation", "eVVzJ27H2a", "EVGA", "8888813842", NULL),
(15, "cmtechnologyinc", "jJtEcHH62jM", "Cooler Master", "8886245099", "store@coolermaster.com"),
(16, "microstarco2", "m5IsjznNfg", "MSI", "6262711004", "uaservice@msi.com"),
(17, "asrock02", "r05kSanmnzH", "ASRock", "9095908308", "support@asrockamerica.com"),
(18, "nzxtgaming", "n5JuGGfBaz", "NZXT", "8002289395", "service@nzxt.com"),
(19, "anteccomponents", "sjhdJan281Mz", "Antec", "8002226832", "support@antec.com"),
(20, "wdtechnology", "wDDmznJyd2M", "Western Digital", "8002754932", NULL);

INSERT INTO item(item_id, item_cat, vendor_id, item_name, item_desc, item_price)
VALUES (9001,'mem',13,'Tampflex 4912','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',5406.57) ,
       (9002,'gpu',5,'Ronstring 5478','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',7465.82) ,
       (9003,'cas',5,'Cardify 6943','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',9519.35) ,
       (9004,'mtb',10,'Gembucket 5319','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',3596.71) ,
       (9005,'kul',18,'Alpha 7397','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',845.62) ,
       (9006,'pow',12,'Flowdesk 6323','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',5394.4) ,
       (9007,'pow',18,'Quo Lux 8397','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',7711.76) ,
       (9008,'mem',3,'Kanlam 6954','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',6613.02) ,
       (9009,'kul',10,'Zoolab 1287','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',6656.15) ,
       (9010,'mem',15,'Ronstring 6570','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',1135.26) ,
       (9011,'mem',6,'Voyatouch 7326','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',6658.46) ,
       (9012,'kul',15,'Y-Solowarm 8812','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',2279.36) ,
       (9013,'pow',17,'Biodex 7163','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',1424.55) ,
       (9014,'kul',6,'Quo Lux 4850','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',5510.01) ,
       (9015,'sto',7,'Regrant 8485','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',3957.55) ,
       (9016,'kul',2,'Zaam-Dox 6031','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',5882.36) ,
       (9017,'sto',13,'Transcof 1561','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',2830.48) ,
       (9018,'cas',18,'Treeflex 3954','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',5614.16) ,
       (9019,'cpu',15,'Bitchip 6614','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',9109.73) ,
       (9020,'cpu',16,'Cardify 4458','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',1824.27) ,
       (9021,'mtb',3,'Overhold 6140','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',4774.79) ,
       (9022,'kul',3,'Zoolab 6909','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',3084.03) ,
       (9023,'mem',10,'Fintone 5758','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',9541.44) ,
       (9024,'gpu',18,'Zaam-Dox 8533','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',6311.17) ,
       (9025,'kul',18,'Zontrax 4260','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',4111.6) ,
       (9026,'gpu',19,'Y-Solowarm 6573','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',8245.19) ,
       (9027,'pow',5,'Fintone 5356','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',4298.35) ,
       (9028,'gpu',20,'Lotstring 6129','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',9987.03) ,
       (9029,'mtb',20,'Tampflex 3147','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',7220.33) ,
       (9030,'mtb',8,'Voyatouch 7211','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',388.94) ,
       (9031,'cpu',16,'Gembucket 8665','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',3529.39) ,
       (9032,'kul',18,'Prodder 1439','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',5196.88) ,
       (9033,'mtb',11,'Temp 8621','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',1098.43) ,
       (9034,'cas',17,'Y-Solowarm 6329','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',1321.62) ,
       (9035,'sto',11,'Y-Solowarm 8972','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',3386.99) ,
       (9036,'gpu',7,'Namfix 1536','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',1902.44) ,
       (9037,'mem',6,'Home Ing 7588','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',7732.53) ,
       (9038,'mtb',13,'Tresom 8517','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',7645.24) ,
       (9039,'sto',8,'Voyatouch 5112','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',2031.49) ,
       (9040,'cpu',5,'Tampflex 8482','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',5964.29) ,
       (9041,'cas',15,'Overhold 4279','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',9416.87) ,
       (9042,'cas',3,'Vagram 4650','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',369.29) ,
       (9043,'mtb',18,'Zathin 8744','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',4298.71) ,
       (9044,'cas',12,'Voyatouch 1722','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',9705.16) ,
       (9045,'mem',3,'Hatity 8005','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',8361.37) ,
       (9046,'cpu',18,'Alpha 7181','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',9107.21) ,
       (9047,'cpu',7,'Domainer 6052','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',6675.83) ,
       (9048,'cas',10,'Namfix 5699','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',5432.4) ,
       (9049,'sto',12,'Fintone 3193','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',2059.24) ,
       (9050,'gpu',16,'Latlux 7642','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',3942.17) ,
       (9051,'sto',8,'Asoka 4027','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',8754.43) ,
       (9052,'sto',6,'Transcof 5107','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',7468.1) ,
       (9053,'cas',14,'Zoolab 6989','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',7597.91) ,
       (9054,'kul',20,'Alphazap 1405','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',8815.04) ,
       (9055,'pow',20,'Alpha 8331','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',7137.04) ,
       (9056,'sto',10,'Regrant 4983','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',9340.05) ,
       (9057,'mem',12,'Toughjoyfax 6657','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',5701.61) ,
       (9058,'mem',18,'Prodder 3041','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',8208.8) ,
       (9059,'pow',19,'Span 8945','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',4744.23) ,
       (9060,'mtb',4,'Holdlamis 2116','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',9713.18) ,
       (9061,'cpu',6,'Lotstring 4693','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',822.52) ,
       (9062,'mem',13,'Tampflex 2238','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',7096.63) ,
       (9063,'mtb',17,'Tin 5756','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',921.53) ,
       (9064,'cpu',20,'Pannier 8361','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',6121.08) ,
       (9065,'cpu',13,'Duobam 3820','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem.',9676.99) ,
       (9066,'gpu',16,'Zamit 2870','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',7604.0) ,
       (9067,'sto',2,'It 8939','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',2123.22) ,
       (9068,'cas',6,'Konklux 4378','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',4297.83) ,
       (9069,'gpu',5,'Holdlamis 8819','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',1037.36) ,
       (9070,'cas',10,'Lotstring 6228','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',7287.35) ,
       (9071,'mtb',17,'Namfix 2937','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',9138.8) ,
       (9072,'pow',16,'Sub-Ex 5011','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',5883.59) ,
       (9073,'cpu',9,'Sonsing 8753','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',6080.4) ,
       (9074,'gpu',15,'Tres-Zap 6177','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',9224.29) ,
       (9075,'pow',15,'Home Ing 4225','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',2707.29) ,
       (9076,'pow',12,'Lotlux 1640','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',7865.85) ,
       (9077,'kul',18,'Fintone 5922','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',492.87) ,
       (9078,'pow',20,'Redhold 1222','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',5937.0) ,
       (9079,'sto',5,'Greenlam 6318','Sapien et ligula ullamcorper malesuada. Cras semper auctor neque vitae tempus. Pharetra pharetra massa massa ultricies. Molestie ac feugiat sed lectus.',3602.55) ,
       (9080,'gpu',2,'Prodder 1449','Leo a diam sollicitudin tempor id. Felis donec et odio pellentesque. Cursus risus at ultrices mi tempus imperdiet nulla. Eu facilisis sed odio morbi.',5061.63);


INSERT INTO customer_address(customer_id, address_id)
VALUES (1276391,1) ,
       (1400928,2) ,
       (1490182,3) ,
       (1625347,4) ,
       (1629800,5) ,
       (2152630,6) ,
       (2261283,7) ,
       (2356753,8) ,
       (2363645,9) ,
       (2431827,10) ,
       (2645142,11) ,
       (2736483,12) ,
       (2861562,13) ,
       (3228389,14) ,
       (3267162,15) ,
       (3271252,16) ,
       (3392625,17) ,
       (3621827,18) ,
       (3625152,19) ,
       (3725184,20) ,
       (4082327,21) ,
       (4256123,22) ,
       (4261829,23) ,
       (4342118,24) ,
       (4472289,25) ,
       (4498822,26) ,
       (4532741,27) ,
       (4532742,28) ,
       (4965820,29) ,
       (5252007,30) ,
       (5262718,31) ,
       (5454211,32) ,
       (5646283,33) ,
       (6251827,34) ,
       (6352817,35) ,
       (6736253,36) ,
       (7127356,37) ,
       (7263641,38) ,
       (7281928,39) ,
       (7373646,40) ,
       (7456233,41) ,
       (7488920,42) ,
       (8662832,43) ,
       (8887263,44) ,
       (9162534,45) ,
       (9558271,46) ,
       (9720581,47) ,
       (9728374,48) ,
       (9730189,49) ,
       (9928174,50);


INSERT INTO vendor_address(vendor_id, address_id)
VALUES (1,20) ,
       (2,19) ,
       (3,18) ,
       (4,17) ,
       (5,16) ,
       (6,15) ,
       (7,14) ,
       (8,13) ,
       (9,12) ,
       (10,11) ,
       (11,10) ,
       (12,9) ,
       (13,8) ,
       (14,7) ,
       (15,6) ,
       (16,5) ,
       (17,4) ,
       (18,3) ,
       (19,2) ,
       (20,1);

INSERT INTO shipping_method(method_id, method_name, cost)
VALUES (1,'luctus',472.46) ,
       (2,'sodales sed tincidunt',704.51) ,
       (3,'sem praesent',833.02) ,
       (4,'nunc rhoncus dui',862.56) ,
       (5,'magna vulputate',219.6) ,
       (6,'sodales',102.13) ,
       (7,'urna',921.72) ,
       (8,'at nibh',465.03) ,
       (9,'in blandit',758.8) ,
       (10,'nunc commodo placerat',85.21) ,
       (11,'luctus nec molestie',165.1) ,
       (12,'diam',227.64) ,
       (13,'faucibus',159.19) ,
       (14,'quam',332.38) ,
       (15,'arcu',342.81) ,
       (16,'ipsum',393.42) ,
       (17,'tincidunt in leo',328.84) ,
       (18,'lacinia aenean',618.78) ,
       (19,'nisl',992.65) ,
       (20,'blandit mi in',619.53);


INSERT INTO order_status(status_id, status_value)
VALUES (1,'Awaiting Payment') ,
       (2,'Awaiting Fulfillment') ,
       (3,'Awaiting Shipment') ,
       (4,'Awaiting Pickup') ,
       (5,'Partially Shipped') ,
       (6,'Manual Verification Required') ,
       (7,'Partially Refunded') ,
       (8,'Completed') ,
       (9,'Shipped') ,
       (10,'Canceled') ,
       (11,'Declined') ,
       (12,'Refunded') ,
       (13,'Disputed') ,
       (14,'Pending');

INSERT INTO cust_order(order_id, order_date, customer_id, shipping_method_id, destination_id)
VALUES (1,'2021-02-28 15:50:54',3725184,10,20) ,
       (2,'2018-07-11 03:05:26',5646283,5,50) ,
       (3,'2020-07-21 07:42:15',3625152,14,17) ,
       (4,'2022-06-26 08:48:59',3725184,11,20) ,
       (5,'2021-04-29 21:45:45',4472289,9,25) ,
       (6,'2017-12-10 12:04:12',4261829,20,1) ,
       (7,'2020-07-09 10:44:07',6251827,6,41) ,
       (8,'2019-12-17 06:32:43',4342118,13,30) ,
       (9,'2022-07-03 21:01:09',5262718,19,18) ,
       (10,'2017-08-24 11:39:41',5252007,12,38) ,
       (11,'2022-08-28 15:07:01',9730189,6,49) ,
       (12,'2020-08-17 21:41:26',9928174,15,50) ,
       (13,'2021-11-29 12:38:32',4082327,16,21) ,
       (14,'2018-06-11 05:01:15',3625152,18,19) ,
       (15,'2020-07-10 14:46:50',1625347,5,4) ,
       (16,'2020-07-26 22:59:59',4256123,9,22) ,
       (17,'2018-01-13 00:50:39',2261283,5,7) ,
       (18,'2020-03-15 10:03:31',3271252,1,21) ,
       (19,'2021-08-13 21:55:30',1625347,19,4) ,
       (20,'2022-08-31 06:44:35',2356753,3,8);

INSERT INTO order_line(line_id, order_id, item_id, price)
VALUES (1,7,9042,25.4) ,
       (2,9,9006,161.83) ,
       (3,3,9049,1492.25) ,
       (4,1,9026,658.38) ,
       (5,8,9057,2583.41) ,
       (6,16,9052,1513.01) ,
       (7,2,9075,2023.75) ,
       (8,4,9048,650.75) ,
       (9,5,9058,2029.44) ,
       (10,3,9041,667.22) ,
       (11,10,9078,1322.3) ,
       (12,18,9047,342.54) ,
       (13,3,9059,1098.86) ,
       (14,1,9049,987.19) ,
       (15,12,9064,1371.27) ,
       (16,13,9051,2882.83) ,
       (17,14,9064,401.25) ,
       (18,1,9038,1631.12) ,
       (19,20,9002,2728.51) ,
       (20,14,9066,2254.44) ,
       (21,5,9055,1588.94) ,
       (22,6,9023,281.37) ,
       (23,2,9057,1529.39) ,
       (24,17,9060,1764.95) ,
       (25,3,9064,1374.71) ,
       (26,2,9034,208.76) ,
       (27,15,9025,964.89) ,
       (28,2,9076,1717.03) ,
       (29,14,9026,532.91) ,
       (30,11,9049,1099.03) ,
       (31,11,9002,1597.38) ,
       (32,4,9074,459.82) ,
       (33,13,9037,1989.99) ,
       (34,1,9046,831.72) ,
       (35,20,9001,1386.5) ,
       (36,16,9030,2849.91) ,
       (37,19,9040,2002.42) ,
       (38,2,9030,2843.15) ,
       (39,9,9033,1587.51) ,
       (40,4,9068,18.92);

INSERT INTO order_history(history_id, order_id, status_id, status_date)
VALUES (1,17,14,'2018-01-13 00:50:39') ,
       (2,20,1,'2017-10-16 21:16:30') ,
       (3,9,14,'2022-07-03 21:01:09') ,
       (4,14,14,'2018-06-11 05:01:15') ,
       (5,12,14,'2020-08-17 21:41:26') ,
       (6,12,9,'2020-08-18 00:21:36') ,
       (7,15,14,'2020-07-10 14:46:50') ,
       (8,6,14,'2017-12-10 12:04:12') ,
       (9,6,9,'2017-12-11 14:14:12') ,
       (10,16,14,'2020-07-26 22:59:59') ,
       (11,14,1,'2018-06-11 05:55:45') ,
       (12,3,14,'2020-07-21 07:42:15') ,
       (13,16,9,'2020-07-28 22:59:59') ,
       (14,7,14,'2020-07-09 10:44:07') ,
       (15,5,14,'2021-04-29 21:45:45') ,
       (16,14,9,'2018-06-15 07:35:15') ,
       (17,12,8,'2020-08-19 22:11:16') ,
       (18,15,9,'2020-07-15 22:34:51') ,
       (19,11,14,'2022-08-28 15:07:01') ,
       (20,8,14,'2019-12-17 06:32:43') ,
       (21,7,10,'2020-07-09 11:34:17') ,
       (22,20,14,'2022-08-31 06:44:35') ,
       (23,20,6,'2022-08-31 09:05:56') ,
       (24,11,9,'2022-08-29 10:17:11') ,
       (25,18,14,'2020-03-15 10:03:31') ,
       (26,11,8,'2022-08-30 22:03:31') ,
       (27,19,14,'2021-08-13 21:55:30') ,
       (28,3,9,'2020-07-23 09:44:25') ,
       (29,20,1,'2022-09-01 19:00:06') ,
       (30,2,14,'2018-07-11 03:05:26') ,
       (31,2,10,'2018-07-11 04:12:47') ,
       (32,5,9,'2021-04-30 22:55:35') ,
       (33,5,2,'2021-05-01 02:37:34') ,
       (34,16,8,'2020-07-30 22:59:59') ,
       (35,15,13,'2020-07-17 02:45:02') ,
       (36,6,8,'2017-12-17 17:24:42') ,
       (37,19,9,'2021-08-13 22:45:31') ,
       (38,20,9,'2022-09-04 14:10:42') ,
       (39,13,14,'2021-11-29 12:38:32') ,
       (40,17,10,'2018-01-13 00:50:39') ,
       (41,3,8,'2020-08-03 10:12:45') ,
       (42,9,10,'2022-07-03 22:01:09') ,
       (43,1,14,'2021-02-28 15:50:54') ,
       (44,14,8,'2018-06-20 15:33:45') ,
       (45,13,10,'2021-11-29 14:38:32') ,
       (46,20,4,'2022-09-07 02:01:32') ,
       (47,10,14,'2017-08-24 11:39:41') ,
       (48,4,14,'2022-06-26 08:48:59') ,
       (49,10,10,'2017-08-24 12:49:38') ,
       (50,19,4,'2021-08-20 01:12:11') ,
       (51,20,8,'2022-09-10 09:09:09') ,
       (52,4,10,'2022-06-26 09:05:53') ,
       (53,5,8,'2021-05-03 03:57:44') ,
       (54,18,10,'2020-03-15 11:24:42') ,
       (55,19,8,'2021-08-21 09:15:40') ,
       (56,1,9,'2021-03-04 06:19:57') ,
       (57,1,8,'2022-03-16 09:17:59') ,
       (58,8,10,'2019-12-17 07:23:43') ,
       (59,20,14,'2019-08-24 16:43:56') ,
       (60,15,12,'2020-07-20 02:45:02');

INSERT INTO cpu(item_id,item_cat,manufacturer,part_no,cores,clock_speed,boosted_clock_speed,tdp,series,microarchitecture,core_family,socket,integrated_graphics,max_mem,ecc,cooler_incl,packaging,lithography) VALUES
 (9019,'cpu','Weber, Mertz and Lesch',895,26,1.5,1.8,85,'mi','nunc','dapibus','quis tortor','nisl',95,'0','1','Envelope',19)
,(9020,'cpu','Sawayn-Beahan',643,32,1.3,1.56,65,'maecenas tincidunt','in','libero','eget','ac enim',121,'1','1','Boxed',18)
,(9031,'cpu','Kilback-Gusikowski',543,3,1.5,1.8,65,'consequat morbi','sit','turpis','mi','tempor turpis',121,'0','1','Boxed',24)
,(9040,'cpu','Doyle-Conroy',529,30,2.2,2.64,115,'ipsum aliquam','phasellus id','lectus in','quam suspendisse','vestibulum',66,'1','0','Boxed',3)
,(9046,'cpu','Goldner-Dickinson',773,5,1.3,1.56,125,'suspendisse','porttitor','posuere','sed ante','duis',31,'1','1','Envelope',25)
,(9047,'cpu','Senger-Jast',796,4,2.4,2.88,95,'porttitor id','quis','pede justo','nullam','ligula',97,'0','1','Boxed',13)
,(9061,'cpu','Walsh, Jast and Smitham',739,3,2.1,2.52,95,'ante','leo','enim','sapien','duis',15,'0','1','Envelope',15)
,(9064,'cpu','Orn and Sons',160,26,3.1,3.72,115,'vel','in purus','cursus urna','vel enim','justo',116,'0','0','Envelope',20)
,(9065,'cpu','Purdy-Nader',869,19,2.5,3.0,125,'potenti nullam','pede ullamcorper','semper rutrum','at diam','pede posuere',40,'1','0','Envelope',13)
,(9073,'cpu','Boyer, Romaguera and Rippin',809,12,2.2,2.64,115,'in ante','quam','vitae','nulla','ante ipsum',23,'1','0','Envelope',11);

INSERT INTO pc_case(item_id,item_cat,manufacturer,part_no,type,color,incl_power_supply,side_panel,pow_supply_shroud,front_panel_usb,mtb_form_factor,max_vid_card_lenth,drive_bays,exp_slots,volume) VALUES
 (9003,'cas','Kertzmann-Jerde',54,'Mid_Tower','Indigo',1,'Tempered Glass',1,'Type-C','mini_ITX',351,2,9,20)
,(9018,'cas','Lesch Group',93,'mini_ITX','Fuscia',0,'None',0,'Type-C','mini_ITX',355,2,10,22)
,(9034,'cas','Lindgren-Emard',28,'Full_Tower','Fuscia',0,'None',0,'None','micro_ATX',334,6,7,23)
,(9041,'cas','Nader-Abernathy',55,'mini_ITX','Pink',0,'Tempered Glass',1,'Type-C','ATX',342,4,7,5)
,(9042,'cas','Kunze-Rohan',67,'Full_Tower','Green',1,'Acrylic',0,'None','micro_ATX',345,5,8,11)
,(9044,'cas','O''Conner-Jaskolski',33,'mini_ITX','Green',0,'None',0,'Type-A','ATX',333,4,5,11)
,(9048,'cas','Ryan-Reinger',75,'Full_Tower','Purple',0,'Acrylic',0,'Type-C','ATX',362,5,8,21)
,(9053,'cas','Farrell-Walsh',18,'Full_Tower','Mauv',0,'Acrylic',1,'Type-A','mini_ITX',379,3,6,17)
,(9068,'cas','Medhurst Inc',82,'mini_ITX','Orange',0,'Tempered Glass',1,'Type-C','ATX',302,6,9,25)
,(9070,'cas','Larkin-Reilly',40,'mini_ITX','Purple',1,'Tempered Glass',0,'None','ATX',361,6,7,21);

INSERT INTO video_card(item_id,item_cat,manufacturer,model,part_no,chipset,mem,mem_type,clock_speed,boosted_clock_speed,effective_mem_clk_speed,interface,color,length,tdp,hdmi_outputs,total_outputs) VALUES
 (9002,'gpu','Deckow, Schaden and Cremin',7062,66,81,4,'GDDR6',1.5,1.8,23959,'PCIE_x16','Blue',8,'350',0,1)
,(9024,'gpu','Metz Inc',7815,94,35,4,'HBM',1.1,1.32,38249,'PCIE_x8','Puce',3,'700',2,0)
,(9026,'gpu','Bashirian Group',1167,60,44,22,'HBM',2.5,3.0,17946,'PCIE_x16','Red',49,'600',2,0)
,(9028,'gpu','Schmidt, Hirthe and Hessel',6655,13,88,30,'GDDR5',2.7,3.24,26422,'PCIE_x16','Pink',18,'350',4,0)
,(9036,'gpu','Fisher-Wolf',5610,50,68,25,'DDR4',3.7,4.44,30228,'PCIE_x8','Orange',13,'600',3,4)
,(9050,'gpu','Von LLC',9376,86,28,23,'GDDR6',2.4,2.88,26997,'PCIE_x8','Teal',27,'250',4,1)
,(9066,'gpu','Daugherty-Miller',0481,15,21,22,'DDR4',1.8,2.16,31832,'PCIE_x8','Puce',41,'250',3,3)
,(9069,'gpu','Borer-Wiza',5101,34,62,17,'DDR4',4.0,4.8,18001,'PCIE_x8','Aquamarine',35,'250',2,0)
,(9074,'gpu','Bruen-White',9176,69,16,1,'HBM',4.0,4.8,20001,'PCIE_x8','Pink',45,'250',2,1)
,(9080,'gpu','Daniel Inc',5877,60,22,31,'GDDR5',1.4,1.68,37973,'PCIE_x8','Aquamarine',28,'200',1,4);

INSERT INTO cpu_cooler(item_id,item_cat,manufacturer,part_no,rpm_low,rpm_high,noise_level_low,noise_level_high,color,height,socket,water_cooled,fanless) VALUES
 (9005,'kul','Treutel, McDermott and Bergnaum',80,1147,1605.8,4,5.6,'Goldenrod',71,'AM4',0,1)
,(9009,'kul','Gerlach, Gerhold and Kuvalis',20,1232,1724.8,4,5.6,'Teal',54,'TR4',1,0)
,(9012,'kul','Graham, Vandervort and Ebert',60,681,953.4,24,33.6,'Red',97,'AM5',0,0)
,(9014,'kul','Casper Group',57,923,1292.2,36,50.4,'Blue',33,'TR4',0,0)
,(9016,'kul','O''Keefe-Weissnat',40,1717,2403.8,2,2.8,'Teal',76,'LGA1700',0,0)
,(9022,'kul','Dibbert-Carroll',66,1001,1401.4,11,15.4,'Violet',78,'LGA1151',1,0)
,(9025,'kul','Erdman-Brakus',4,1404,1965.6,33,46.2,'Yellow',43,'LGA1700',1,0)
,(9032,'kul','Collins Group',49,846,1184.4,15,21,'Teal',17,'LGA1700',1,0)
,(9054,'kul','Schultz-Collins',95,1483,2076.2,9,12.6,'Pink',22,'LGA1200',0,1)
,(9077,'kul','Bernier, Mills and Keebler',81,644,901.6,12,16.8,'Green',53,'LGA1700',0,1);

INSERT INTO memory(item_id,item_cat,manufacturer,part_no,speed,form_factor,modules,capacity,color,first_word_latency,cas_word_latency,voltage,ecc,heat_spreader) VALUES
 (9001,'mem','Koelpin-Kozey',332,2037,'DDR4',4,'128','Red',10,15,3,1,1)
,(9008,'mem','Weimann Inc',393,3038,'DDR4',2,'128','Khaki',9,18,1,1,0)
,(9010,'mem','Bergnaum and Sons',381,2100,'DDR2',2,'4','Violet',10,15,2,1,0)
,(9011,'mem','Brakus-Sipes',61,4729,'DDR4',1,'16','Yellow',10,17,1,0,1)
,(9023,'mem','Bosco Group',482,1842,'DDR5',4,'32','Purple',11,18,3,0,0)
,(9037,'mem','Farrell Group',172,2470,'DDR2',4,'128','Orange',9,19,1,1,0)
,(9045,'mem','Ullrich and Sons',310,1536,'DDR5',4,'32','Blue',9,15,3,0,1)
,(9057,'mem','Little Inc',233,5481,'DDR2',2,'64','Goldenrod',9,17,3,1,0)
,(9058,'mem','Macejkovic Inc',342,3372,'DDR4',4,'16','Red',10,19,2,0,1)
,(9062,'mem','Powlowski-Runolfsdottir',56,5909,'DDR2',3,'32','Fuscia',10,16,3,1,1);

INSERT INTO motherboard(item_id,item_cat,manufacturer,part_no,socket,form_factor,chipset,max_mem,mem_type,mem_slots,mem_speed,color,pcie_slots,m_2_slots,sata_slots,ethernet,usb_2_headers,usb_3_2_headers,ecc,wireless_networking,raid_support) VALUES
 (9004,'mtb','Gorczany, Kassulke and Stoltenberg',13,'LGA1200','mini_ITX','Intel',32,'DDR5',6,1768,'Aquamarine',4,4,2,1,0,0,1,1,1)
,(9021,'mtb','Schaden, McLaughlin and Beer',95,'LGA1151','mini_ITX','AMD',8,'DDR2',7,5158,'Khaki',2,3,2,0,2,1,0,1,0)
,(9029,'mtb','Mertz, Lueilwitz and Bauch',23,'AM4','ATX','AMD',128,'DDR4',1,4906,'Fuscia',3,2,1,1,5,4,1,0,0)
,(9030,'mtb','Bailey LLC',214,'LGA1200','micro_ATX','AMD',32,'DDR3',2,1631,'Green',3,1,1,1,2,2,0,1,0)
,(9033,'mtb','Hessel Inc',103,'AM4','ATX','Intel',16,'DDR3',1,4465,'Red',2,3,3,1,5,3,0,1,0)
,(9038,'mtb','Huels-Rogahn',124,'AM4','mini_ITX','AMD',32,'DDR5',1,5100,'Aquamarine',4,3,3,1,2,1,1,1,0)
,(9043,'mtb','Hartmann, Hyatt and Skiles',396,'AM4','micro_ATX','AMD',8,'DDR5',7,2849,'Indigo',1,2,3,1,3,5,1,0,0)
,(9060,'mtb','Bayer Group',270,'AM5','mini_ITX','Intel',32,'DDR5',2,4471,'Khaki',4,1,3,1,1,2,1,1,0)
,(9063,'mtb','Homenick-Farrell',264,'AM4','ATX','Intel',16,'DDR4',4,3210,'Puce',4,4,1,0,2,1,0,1,0)
,(9071,'mtb','Schaden Inc',224,'AM4','ATX','Intel',8,'DDR2',6,3910,'Indigo',2,1,4,0,3,2,0,0,1);

INSERT INTO storage(item_id,item_cat,manufacturer,part_no,capacity,type,cache,form_factor,nvme) VALUES
 (9015,'sto','Kuhlman, Satterfield and Stoltenberg','IK801',4518,'Internal',75,'SATA_HDD',0)
,(9017,'sto','Mitchell-Morissette','LJ307',7901,'Internal',98,'NVME',1)
,(9035,'sto','Auer Inc','OO714',5380,'Internal',68,'NVME',1)
,(9039,'sto','Harber-Dibbert','MZ606',4108,'External',110,'SATA_SSD',0)
,(9049,'sto','Weissnat-Jast','QW894',6452,'External',16,'EXTERNAL_HDD',0)
,(9051,'sto','Dickens-Kovacek','LN067',9907,'External',44,'NVME',1)
,(9052,'sto','Effertz, Beier and Beer','GE771',8731,'External',39,'SATA_HDD',0)
,(9056,'sto','Kling Inc','VJ257',1747,'Internal',78,'SATA_HDD',0)
,(9067,'sto','Batz and Sons','UT527',3383,'External',29,'SATA_HDD',0)
,(9079,'sto','Simonis, Upton and Lakin','XU363',8019,'External',37,'SATA_SSD',0);

INSERT INTO power_supply(item_id,item_cat,manufacturer,model,part_no,type,efficiency,wattage,length,modular,color,fanless,atx_connectors,eps_connectors,pcie_connectors,sata_connectors,molex_connectors) VALUES
 (9006,'pow','Crist LLC',139,'XF684','micro_ATX','Standard',962,197,'Semi','Crimson',1,3,1,1,4,5)
,(9007,'pow','Kassulke-Smith',357,'NM240','micro_ATX','Bronze',1323,206,'Non','Puce',1,3,1,0,0,0)
,(9013,'pow','McGlynn-Parker',430,'AO665','ATX','Gold',1758,393,'Non','Khaki',0,3,2,0,0,4)
,(9027,'pow','Casper and Sons',17,'FS740','ATX','Titanium',1068,281,'Non','Crimson',0,4,3,0,2,0)
,(9055,'pow','Denesik, Ankunding and Ortiz',352,'TV816','micro_ATX','Gold',1972,389,'Full','Pink',0,4,1,1,0,4)
,(9059,'pow','Welch, Koelpin and Morar',215,'AI461','micro_ATX','Gold',1757,321,'Full','Green',1,4,3,1,0,5)
,(9072,'pow','Miller, Moen and Jacobi',229,'BG177','micro_ATX','Standard',1481,353,'Full','Pink',0,1,4,1,4,5)
,(9075,'pow','Moore-Hammes',210,'TX044','micro_ATX','Bronze',1793,149,'Semi','Mauv',0,4,1,0,4,0)
,(9076,'pow','Spinka Group',134,'BY866','micro_ATX','Platinum',1435,182,'Semi','Khaki',1,2,1,0,1,0)
,(9078,'pow','Effertz-Balistreri',107,'PD991','ATX','Bronze',1774,166,'Semi','Purple',0,2,2,1,1,0);



-- Database Functionalities and Use Cases below: --

-------------------------------------------------------------------
-- Vendors can insert items into database and list them for sale --
-------------------------------------------------------------------

-- SCENARIO: a vendor wants to list a new storage device for sale on the store.

-- first, the vendor will list the part on the store by creating an item entity in the item table
INSERT INTO pc_parts_store_3.item(item_id, item_cat, vendor_id, item_name, item_desc, item_price)
VALUES (9181,'sto',12,'Megaplate 4451','Sit amet tellus cras adipiscing enim. Morbi tincidunt augue interdum velit euismod. Mattis pellentesque id nibh tortor id aliquet lectus proin.',2406.99);

-- then, the vendor will provide the data for the item by inserting it in its corresponding part table. Constraints will ensure that the item is placed in the correct table.
INSERT INTO storage(item_id,item_cat,manufacturer,part_no,capacity,type,cache,form_factor,nvme) VALUES
 (9181,'sto','Mumenheiser','JL721',4498,'Internal',44,'NVME',1);


-- vendors can change the price of an item
UPDATE item SET item_price = 3000 WHERE item_id = 9013;


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
 m.wireless_networking AS 'Inbuilt Wifi' FROM motherboard AS m, item AS i
WHERE m_2_slots >= 2 AND socket = "AM4" AND wireless_networking = 1 AND m.item_id = i.item_id; 

-- find the average price of GPUs that have a clock speed of over 2 GHz
SELECT AVG(i.item_price) AS 'Average' FROM video_card AS v, item AS i
WHERE v.item_id = i.item_id AND v.clock_speed >= 2;


----------------------------------------------
-- Customers can place orders and view them --
----------------------------------------------

-- SCENARIO: a customer wants to order a CPU and a GPU

-- first, a new entry will be added to the cust_order table containing the new order details
INSERT INTO cust_order VALUES (21, '2021-04-30 15:23:23', 3725184, 5, 17);

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
SELECT ol.order_id AS 'Order', i.item_name AS 'Name', i.item_desc AS 'Description' FROM order_line AS ol, item as i
WHERE ol.item_id = i.item_id AND ol.order_id = 14;


-------------------------------------------------------------------------------------------------------------
-- Customers and vendors can create accounts, and modify their info (password, phone, email, address, etc. --
-------------------------------------------------------------------------------------------------------------

-- CUSTOMER ACCOUNT CREATION (vendor account creation is the same process)
-- create entry in customer table containing all of customer's account details
INSERT INTO customer VALUES
(9522721, "iLoveSQL", "strongPassword123!@#$", "Frodo", "Baggins", "U", "5052349876", "ringbearer@gmail.com");

-- create entry in address containing the customer's address information
INSERT INTO address (address_id, street_number, apt_no, street_name, city, country_id) VALUES 
(51, '32', 12, 'Bag End', 'The Shire', 9); 

-- finally, create entry in customer_address that links the customer's account to their address
INSERT INTO customer_address VALUES
(9522721, 51);


-- customers can modify their information, such as their phone number or their address
-- ex: updating phone number:
UPDATE customer SET customer_phone = 9871234444 WHERE customer_id = 1629800;

-- ex: updating the address (changing the apartment number):
UPDATE address SET apt_no = 33 WHERE address_id = (SELECT address_id FROM customer_address WHERE customer_id = 1629800);
