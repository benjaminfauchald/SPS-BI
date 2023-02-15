
/*
This function shows all the roles the differnt users have, based on a pre-defined list
 */
CREATE OR REPLACE PROCEDURE `sps.sp_roles_show`(sps_role_id INT64)
BEGIN

select
    first_name,
    last_name,
    email,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 880331) as BU_Morph,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as BU_SPS,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 932319) as Contractor_Savycom,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Eng_Delivery_team,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Apphuset,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Delivery,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Design,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Eng_Backend,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Eng_Cloud,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Eng_Mobile,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Eng_QA,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Eng_Web,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Marketing,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Marketing_Ext,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as Team_Product

from sps-business-insight.sps_raw_harvest.users u;
END




/*
This is the full Role list

select * from sps-business-insight.sps_raw_harvest.roles


These are currently the roles I am checking for
BU - Morphosis	1,039	THB 615,324	880331

BU - Seven Peaks	6,133	THB 5,938,975	903545
Contractor - Savvycom	65	THB 28,200	932319
Copywriter	56	THB 9,180	912047
Design	639	THB 427,997	912042
Design Lead	44	THB 27,200	912044

Eng - Delivery team	34	THB 56,000	924293
Team - Apphuset	1,534	THB 1,567,800	754039
Team_Delivery	420	THB 808,702	287358
Team_Design	1,159	THB 625,622	284579
Team_Eng_Backend	1,256	THB 1,000,085	475492
Team_Eng_Cloud	292	THB 507,300	882456
Team_Eng_Mobile	1,328	THB 585,457	241695
Team_Eng_QA	1,307	THB 1,777,550	262970
Team_Eng_Web	1,384	THB 1,017,435	327255
Team_Marketing	121	THB 43,027	535066
Team_Marketing Ext	120	THB 40,527	934745
Team_Product	141	THB 283,200	876423


Eng - Management	15	THB 54,600	908890
Marketing	147	THB 37,562	934001
Role - Head	15	THB 54,600	908401
Role - Junior	171	THB 138,300	908387
Role - Mid	284	THB 179,509	911981
Role - Senior	140	THB 90,200	911980
UI Design	912	THB 607,600	933637
UX Design	1,368	THB 911,400	933639
UX Research Team	270	THB 172,793	933636
UX Researcher	135	THB 86,397	912043


 */