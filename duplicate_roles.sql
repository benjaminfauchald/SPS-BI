--CREATE OR REPLACE PROCEDURE sps.duplicate_roles(test STRING)
    --OPTIONS(strict_mode=FALSE)
--    BEGIN
        select
                (select CONCAT(first_name, ' ', last_name) from sps-business-insight.harvest.users u where u.id = ur.user_id) as user_name,
                (select email from sps-business-insight.harvest.users u where u.id = ur.user_id) as email,
                r.name as role_name,
                r.id as role_id,
                ur.user_id as user_id
        from
                sps-business-insight.harvest.user_roles ur,
                sps-business-insight.harvest.roles r
        where
                r.id = ur.role_id
                and ur.role_id <> 612789 --All billable resources
                and ur.role_id <> 754039 --Team - Apphuset
                and ur.role_id <> 903545 --903545,Seven Peaks
                and ur.role_id <> 880331 --Morphosis


                and
               (
               ur.role_id = 475492 -- Eng Backend Team
                or id = 882456 -- ENG Cloud Team
                or id = 924293 -- Eng Delivery Team
                or id = 908890 -- Eng Management Team
                or id = 241695 -- Eng Mobile Team
                or id = 262970 -- Eng QA Team
                or id = 327255 -- Eng Web Team
                or id = 908401 -- Head
                or id = 535066  --"OP - Marketing team"
                or id = 911980 --"Senior"
                or id = 912045 -- "UI Design"
              )

                and (select is_active from sps-business-insight.harvest.users u where u.id = ur.user_id) = true

        order by
                    (select CONCAT(first_name, ' ', last_name) from sps-business-insight.harvest.users u where u.id = ur.user_id);
    --END

--call sps-business-insight.sps.duplicate_roles
/*

select ''

CREATE OR REPLACE PROCEDURE mydataset.create_customer(name STRING)
BEGIN
DECLARE id STRING;
SET id = GENERATE_UUID();
INSERT INTO mydataset.customers (customer_id, name)
  VALUES(id, name);
SELECT FORMAT("Created customer %s (%s)", id, name);
END
select * from   sps-business-insight.sps_raw_harvest.user_roles limit 10
select * from   sps-business-insight.sps_raw_harvest.roles limit 10

*/

/*

 Supitchaya (Aom) Woraphatkittikul,933640,4436265,2023-02-06 04:02:36.905000,2023-02-06 04:04:08.042000,1675656156917612000,2023-02-06 04:04:31.581000,0,933640,seo
Supitchaya (Aom) Woraphatkittikul,933641,4436265,2023-02-06 04:02:36.905000,2023-02-06 04:04:08.042000,1675656156915245000,2023-02-06 04:04:31.581000,0,933641,SEM



Accounting Seven Peaks,618072,4342651,2022-11-21 10:31:22.101000,2022-11-21 10:31:53.919000,1669026682806512006,2022-11-21 10:32:09.273000,0,618072,OP - Admin team
Accounting Seven Peaks,781262,4342651,2022-11-21 10:31:22.101000,2022-11-21 10:31:53.919000,1669026682716518001,2022-11-21 10:32:09.222000,0,781262,OP - Finance Team


 */