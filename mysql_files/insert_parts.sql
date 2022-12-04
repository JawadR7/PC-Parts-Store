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
