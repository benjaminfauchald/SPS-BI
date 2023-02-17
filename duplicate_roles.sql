CREATE OR REPLACE PROCEDURE call `sps-business-insight.sps.sp_harvest_duplicate_roles`()
BEGIN
    select
        first_name,
        last_name,
        email,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 880331) >0 then 1 else 0 END) as BU_Morph,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 903545) >0 then 1 else 0 END) as BU_SPS,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 932319) >0 then 1 else 0 END) as Contractor_Savycom,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 924293) >0 then 1 else 0 END)  as Eng_Delivery_team,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 754039) >0 then 1 else 0 END)  as Team_Apphuset,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 287358) >0 then 1 else 0 END)  as Team_Delivery,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 284579) >0 then 1 else 0 END)  as Team_Design,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 475492) >0 then 1 else 0 END)  as Team_Eng_Backend,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 882456) >0 then 1 else 0 END)  as Team_Eng_Cloud,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 241695) >0 then 1 else 0 END)  as Team_Eng_Mobile,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 262970) >0 then 1 else 0 END)  as Team_Eng_QA,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 327255) >0 then 1 else 0 END)  as Team_Eng_Web,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 535066) >0 then 1 else 0 END)  as Team_Marketing,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 934745) >0 then 1 else 0 END)  as Team_Marketing_Ext,
        (select CASE WHEN (select max(role_id) from sps-business-insight.sps_raw_harvest.user_roles ur where ur.user_id = u.id and ur.role_id = 876423) >0 then 1 else 0 END)  as Team_Product
    from
        sps-business-insight.sps_raw_harvest.users u
    where
        is_active = true;
END
