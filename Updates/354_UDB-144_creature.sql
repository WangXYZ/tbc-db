-- Duplicates
-- Duplicates removed
DELETE FROM creature WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM creature_addon WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM creature_movement WHERE id IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM game_event_creature WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM game_event_creature_data WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,55768,56020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,
56033,56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM creature_battleground WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,5576856020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,
56033,56047,56027,56048,56025,56024,56066,56036,56038,56065);
DELETE FROM creature_linking WHERE guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,5576856020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,
56047,56027,56048,56025,56024,56066,56036,56038,56065) 
OR master_guid IN (55802,55783,55805,55749,55807,55803,55752,55986,55757,5576856020,56023,56062,56056,56022,56030,56021,56052,56031,56050,56035,56064,56051,56029,56059,56058,56034,56045,56033,56047,56027,56048,56025,
56024,56066,56036,56038,56065);

-- Silanna -- gossip
UPDATE creature_template SET GossipMenuId = 7316 WHERE entry = 16862;
DELETE FROM gossip_menu WHERE entry = 7316; 
INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(7316, 8684, 0, 0);

-- Gatewatcher Aendor  -- gossip
UPDATE creature_template SET GossipMenuId = 7828 WHERE entry = 18790;

-- Harassed Citizen  -- gossip
UPDATE creature_template SET GossipMenuId = 7834 WHERE entry = 18792;

-- Ranger Selron -- missing equipment added
UPDATE creature_template SET equipmentTemplateid = 112 WHERE entry = 15940;

-- UDB EQUIPMENT BACKPORT (AND RE ID)
insert into `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) values('112','12993','0','0');


-- Solanin <Bag Vandor>
UPDATE creature SET position_x = 9308.556641, position_y = -6554.437500, position_z = 34.680603, orientation = 2.170510, Spawndist = 0, MovementType = 2 WHERE guid = 68009;
DELETE FROM creature_movement WHERE id = 68009;
UPDATE creature_template SET MovementType = 2 WHERE entry = 18947;
DELETE FROM creature_movement_template WHERE entry = 18947;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(18947,1,9308.556641,-6554.437500,34.680603,30000,0,2.170510,0,0),
(18947,2,9308.9,-6549.6,34.6871,0,0,1.39769,0,0),
(18947,3,9310.42,-6547.2,34.6966,0,0,0.598403,0,0),
(18947,4,9312.12,-6546.47,35.6365,10000,1894701,0.175858,0,0),
(18947,5,9309.84,-6546.45,34.6963,0,0,2.7783,0,0),
(18947,6,9306.75,-6544.39,34.6448,0,0,2.46178,0,0),
(18947,7,9304.57,-6542.03,34.7358,10000,1894701,2.2458,0,0),
(18947,8,9300.32,-6553.67,34.6046,15000,0,4.53523,0,0),
(18947,9,9302.13,-6550.81,34.623,0,0,0.597241,0,0),
(18947,10,9305.58,-6548.93,34.6424,0,0,0.118943,0,0),
(18947,11,9311.03,-6549.56,34.7268,14000,1894702,6.04085,0,0),
(18947,12,9308.556641,-6554.437500,34.680603,0,0,2.170510,0,0),
(18947,13,9308.556641,-6554.437500,34.680603,180000,0,2.170510,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1894701,1894702); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1894701,3,1,16,0,0,0,0,0,0,0,0,0,0,0,0,'Kneel'),
(1894702,1,3,0,0,0,0,0,0,0,0,0,0,0,0,3.19456,''),
(1894702,3,0,0,0,0,0,0,2000000472,0,0,0,0,0,0,0,''),
(1894702,8,0,0,0,0,0,0,2000000473,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry BETWEEN 2000000472 AND 2000000473;
INSERT INTO db_script_string (entry, content_default, sound, type, language, emote, comment) VALUES
(2000000472,'Gah! Every time I load something into the wagon, it reappears here within moments!',0,0,0,6,NULL),
(2000000473,'I should have better than to have given Silanna that tome of cantrips.',0,0,0,1,NULL);

-- Silvermoon Guardian #1
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 56871;
-- Silvermoon Guardian #2
UPDATE creature SET position_x = 9310.937500, position_y = -7261.342285, position_z = 13.262838, orientation = 5.123657, spawndist = 0, MovementType = 2 WHERE guid = 56870;
DELETE FROM creature_movement WHERE id = 56870;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(56870,1,9313.76,-7233.52,14.3607,0,0,1.45192,0,0),(56870,2,9321.56,-7210.41,14.9568,0,0,1.24771,0,0),(56870,3,9324.87,-7190.41,15.5912,0,0,1.56187,0,0),
(56870,4,9322.9,-7169.13,15.6939,0,0,1.77393,0,0),(56870,5,9315.66,-7141.71,16.3783,0,0,1.96635,0,0),(56870,6,9308.27,-7128.08,16.3927,0,0,2.14307,0,0),
(56870,7,9288.27,-7098.95,15.0777,0,0,2.13914,0,0),(56870,8,9282.51,-7083.99,12.7755,0,0,1.59093,0,0),(56870,9,9283.83,-7072.6,11.6658,0,0,1.24928,0,0),
(56870,10,9279.03,-7084.2,12.8351,0,0,4.68382,0,0),(56870,11,9285.3,-7100.68,15.1796,0,0,5.29093,0,0),(56870,12,9305.98,-7130.13,16.3521,0,0,5.34748,0,0),
(56870,13,9313.23,-7142.95,16.3343,0,0,4.9375,0,0),(56870,14,9320.03,-7170.39,15.744,0,0,4.97834,0,0),(56870,15,9321.99,-7191.2,15.5395,0,0,4.49454,0,0),
(56870,16,9318.65,-7209.67,15.0213,0,0,4.31233,0,0),(56870,17,9311.12,-7233.62,14.4968,0,0,4.78671,0,0),(56870,18,9310.98,-7261.15,13.2516,180000,0,4.80736,0,0);
-- Link
DELETE FROM creature_linking WHERE guid = 56871;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(56871, 56870, 1+128+512);

-- Silvermoon Guardian #3-4 missing  -- UDB empty guids used
DELETE FROM creature WHERE guid IN (55802,55783);
INSERT INTO creature VALUES 
(55802,16221,530,1,0,0,9151.62,-6702.86,24.3109,5.83393,360,0,0,1215,0,0,2),
(55783,16221,530,1,0,0,9151.19,-6702.51,24.2865,5.83943,360,0,0,1124,0,0,0);
DELETE FROM creature_movement WHERE id = 55802;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(55802,1,9151.62,-6702.86,24.3109,1000,1622101,5.83393,0,0),(55802,2,9175.54,-6714.2,26.0494,0,0,6.06954,0,0),(55802,3,9200.73,-6718.44,25.8468,0,0,5.97397,0,0),
(55802,4,9209.32,-6722.74,25.632,0,0,5.7894,0,0),(55802,5,9221.76,-6734.95,25.2283,0,0,5.37707,0,0),(55802,6,9237.28,-6759.91,24.9455,0,0,5.20429,0,0),
(55802,7,9244.59,-6788.33,23.7142,0,0,4.91369,0,0),(55802,8,9246.93,-6818.23,19.3459,0,0,4.81944,0,0),(55802,9,9243.49,-6833.1,17.0062,0,0,4.26574,0,0),
(55802,10,9224.17,-6858.76,12.2348,5000,0,4.14008,0,0),(55802,11,9245.08,-6830.3,17.4443,0,0,1.22389,0,0),(55802,12,9245.33,-6792.53,23.2525,0,0,1.72419,0,0),
(55802,13,9240.97,-6767.78,24.67,0,0,1.96609,0,0),(55802,14,9224.66,-6739.66,25.1088,0,0,2.21899,0,0),(55802,15,9214,-6727.22,25.3519,0,0,2.43498,0,0),
(55802,16,9203.12,-6718.08,25.8748,0,0,2.65724,0,0),(55802,17,9177.27,-6714.54,26.1012,0,0,3.00518,0,0),(55802,18,9152.85,-6704.02,24.4276,0,0,2.72557,0,0),
(55802,19,9130.06,-6693.25,23.2046,0,0,2.78841,0,0),(55802,20,9100.87,-6685.34,20.8723,0,0,2.98004,0,0),(55802,21,9083.46,-6682.89,19.3495,0,0,3.06251,0,0),
(55802,22,9065.56,-6682.98,16.7473,5000,0,3.16068,0,0),(55802,23,9093.29,-6683.31,20.3039,0,0,0.206017,0,0),(55802,24,9101.51,-6680.65,20.9162,0,0,0.731448,0,0),
(55802,25,9103.88,-6674.12,21.7294,0,0,1.98259,0,0),(55802,26,9099.35,-6657.52,22.0418,0,0,1.4165,0,0),(55802,27,9102.42,-6647.26,23.2374,0,0,1.07485,0,0),
(55802,28,9121.32,-6626.45,26.7952,0,0,0.662514,0,0),(55802,29,9136.62,-6618.55,29.0918,0,0,0.415898,0,0),(55802,30,9157.46,-6615.65,30.7248,0,0,0.262746,0,0),
(55802,31,9168.71,-6610.88,31.2371,0,0,0.747337,0,0),(55802,32,9179.42,-6600.27,31.8366,0,0,0.888709,0,0),(55802,33,9193.47,-6583.44,32.6952,0,0,0.69393,0,0),
(55802,34,9224.49,-6560.81,31.9586,0,0,0.686076,0,0),(55802,35,9245.92,-6548.87,31.942,0,0,0.344427,0,0),(55802,36,9258.16,-6547.53,33.2162,0,0,6.26633,0,0),
(55802,37,9291.08,-6553.81,34.5914,0,0,0.120587,0,0),(55802,38,9296.64,-6552.64,34.6026,0,0,0.448883,0,0),(55802,39,9301.53,-6550.26,34.6231,0,0,0.8675,0,0),
(55802,40,9305.17,-6546.33,34.6403,5000,0,0.941328,0,0),(55802,41,9296.7,-6552.85,34.602,0,0,3.57241,0,0),(55802,42,9289.65,-6554.36,34.5911,0,0,3.11924,0,0),
(55802,43,9258.17,-6547.61,33.2113,0,0,3.16243,0,0),(55802,44,9245.94,-6549.07,31.9428,0,0,3.48776,0,0),(55802,45,9224.78,-6560.53,31.9582,0,0,3.77443,0,0),
(55802,46,9193.19,-6583.57,32.6867,0,0,4.08623,0,0),(55802,47,9185.34,-6590.89,32.376,0,0,4.12125,0,0),(55802,48,9174.6,-6606.27,31.49,0,0,4.06234,0,0),
(55802,49,9168.63,-6611.54,31.2102,0,0,3.79531,0,0),(55802,50,9155.36,-6616.81,30.5532,0,0,3.32799,0,0),(55802,51,9137.52,-6618.39,29.2279,0,0,3.43245,0,0),
(55802,52,9127.76,-6621.33,27.8341,0,0,3.72541,0,0),(55802,53,9107.5,-6640.04,24.401,0,0,4.03878,0,0),(55802,54,9099.88,-6651.96,22.5778,0,0,4.52023,0,0),
(55802,55,9098.93,-6659.86,21.8473,0,0,4.85172,0,0),(55802,56,9104.61,-6676.34,21.5272,0,0,4.84386,0,0),(55802,57,9103.24,-6680.22,21.0557,0,0,4.10324,0,0),
(55802,58,9098.15,-6683.2,20.6473,0,0,3.38224,0,0),(55802,59,9064.97,-6683.33,16.6582,5000,0,3.21495,0,0),(55802,60,9101.57,-6684.97,20.8846,0,0,6.12485,0,0),
(55802,61,9130.73,-6693.28,23.2326,1000,1622102,5.93243,0,0),(55802,62,9151.19,-6702.86,24.2903,0,0,5.78321,0,0);
-- Link
DELETE FROM creature_linking WHERE guid = 55783;
INSERT INTO creature_linking (guid, master_guid, flag) VALUES
(55783, 55802, 1+128+512);
DELETE FROM dbscripts_on_creature_movement WHERE id IN (1622101,1622102); 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1622101,0,21,1,0,0,0,0,0,0,0,0,0,0,0,0,'active'),
(1622102,0,21,0,0,0,0,0,0,0,0,0,0,0,0,0,'unactive');

-- Feral Dragonhawk Hatchling
UPDATE creature SET position_x = 9313.291992, position_y = -7065.535156, position_z = 13.551550, spawndist = 10, MovementType = 1 WHERE guid = 55751;
UPDATE creature SET position_x = 9335.414063, position_y = -7095.564941, position_z = 15.955358, spawndist = 10, MovementType = 1 WHERE guid = 55750;
UPDATE creature SET position_x = 9241.479492, position_y = -7053.126465, position_z = 11.785850, spawndist = 10, MovementType = 1 WHERE guid = 55781;
UPDATE creature SET position_x = 9251.087891, position_y = -7116.528320, position_z = 20.209023, spawndist = 10, MovementType = 1 WHERE guid = 55782;
UPDATE creature SET position_x = 9280.127930, position_y = -7136.915039, position_z = 18.425961, spawndist = 10, MovementType = 1 WHERE guid = 55806;
UPDATE creature SET position_x = 9286.713867, position_y = -7275.848633, position_z = 17.298273, spawndist = 10, MovementType = 1 WHERE guid = 55747;
UPDATE creature SET position_x = 9193.906250, position_y = -7090.962891, position_z = 19.812313, spawndist = 10, MovementType = 1 WHERE guid = 55804;
UPDATE creature SET position_x = 9143.990234, position_y = -7090.308594, position_z = 24.407694, spawndist = 10, MovementType = 1 WHERE guid = 55818;
UPDATE creature SET position_x = 9144.131836, position_y = -6652.943359, position_z = 31.736256, spawndist = 10, MovementType = 1 WHERE guid = 55763;
UPDATE creature SET position_x = 9195.083008, position_y = -6625.637695, position_z = 34.585335, spawndist = 10, MovementType = 1 WHERE guid = 55799;
UPDATE creature SET position_x = 9273.759766, position_y = -6798.623535, position_z = 22.505522, spawndist = 10, MovementType = 1 WHERE guid = 55778;
UPDATE creature SET spawndist = 10, MovementType = 1 WHERE guid = 55771;

-- Plagueboner Pillager
UPDATE creature SET spawndist = 15, MovementType = 1 WHERE guid IN (56055,56028,56057,56053,56054,56061,56044,56032,56060,56049,56041,56075,56076,56042,56077,56073,56071,56040,56039,56072,56070,56078);
UPDATE creature SET position_x = 9028.840820, position_y = -6913.795410, position_z = 16.769503, orientation = 6.149659, spawndist = 0, MovementType = 2 WHERE guid = 56043; -- this one!!!
DELETE FROM creature_movement WHERE id = 56043;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, orientation, model1, model2) VALUES
(56043,1,9044.67,-6916.71,14.3831,0,0,6.12086,0,0),(56043,2,9073,-6918.1,16.9192,0,0,0.010458,0,0),(56043,3,9092.31,-6918.52,17.3978,0,0,5.88917,0,0),
(56043,4,9121.12,-6931.48,13.1917,0,0,5.84204,0,0),(56043,5,9142.13,-6939.05,9.19041,0,0,5.94022,0,0),(56043,6,9176.79,-6939.88,5.15922,2000,1565401,6.22688,0,0);
DELETE FROM dbscripts_on_creature_movement WHERE id = 1565401; 
INSERT INTO dbscripts_on_creature_movement (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1565401,1,18,0,0,0,0,0x04,0,0,0,0,0,0,0,0,'desp');

-- Rotlimb Cannibal
UPDATE creature_template SET inhabittype = 1 WHERE entry = 15655;
UPDATE creature SET position_x = 9134.863281, position_y = -6999.031250, position_z = 9.883224, spawndist = 10, MovementType = 1 WHERE guid = 56080;

-- Springpaw panther
UPDATE creature SET position_x = 9337.779297, position_y = -6581.497070, position_z = 40.059837, spawndist = 10, MovementType = 1 WHERE guid = 55923;

