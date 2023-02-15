
/*
This function shows all the roles the differnt users have, based on a pre-defined list
 */
--CREATE OR REPLACE PROCEDURE `sps.sp_roles_show`()
--BEGIN

select
    first_name,
    last_name,
    email,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 880331) as BU_Morph,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) as BU_SPS,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 932319) as Contractor_Savycom,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 924293) as Eng_Delivery_team,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 754039) as Team_Apphuset,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 287358) as Team_Delivery,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 284579) as Team_Design,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 475492) as Team_Eng_Backend,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 882456) as Team_Eng_Cloud,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 241695) as Team_Eng_Mobile,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 262970) as Team_Eng_QA,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 327255) as Team_Eng_Web,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 535066) as Team_Marketing,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 934745) as Team_Marketing_Ext,
    (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 876423) as Team_Product
from
    sps-business-insight.sps_raw_harvest.users u
where
    is_active = true
--END


/*
This is the full Role list

select * from sps-business-insight.sps_raw_harvest.roles order by name


These are currently the roles I am checking for
BU - Morphosis	-	880331
BU - Seven Peaks	-	903545

Contractor - Savvycom	-	932319

Eng - Delivery team		924293
Team - Apphuset		754039
Team_Delivery
Team_Design284579
Team_Eng_Backend		475492
Team_Eng_Cloud882456
Team_Eng_Mobile -	241695
Team_Eng_QA	-	262970
Team_Eng_Web	-	327255
Team_Marketing	-	535066
Team_Marketing Ext	-	934745
Team_Product	-	876423
BU - Seven Peaks	-	903545
Contractor - Savvycom	-	932319

Eng - Delivery team		924293
Team - Apphuset		754039
Team_Delivery
Team_Design284579
Team_Eng_Backend		475492
Team_Eng_Cloud882456
Team_Eng_Mobile -	241695
Team_Eng_QA	-	262970
Team_Eng_Web	-	327255
Team_Marketing	-	535066
Team_Marketing Ext	-	934745
Team_Product	-	876423



 */