select
        (select CONCAT(first_name, ' ', last_name) from sps_raw_harvest.users u where u.id = ur.user_id) as user_name,
        (select email from sps_raw_harvest.users u where u.id = ur.user_id) as email,
        r.name as role_name,
        r.id as role_id
from
        sps-business-insight.sps_raw_harvest.user_roles ur,
        sps-business-insight.sps_raw_harvest.roles r
where
        r.id = ur.role_id
        and ur.role_id <> 612789 --All billable resources
        and ur.role_id <> 754039 --Team - Apphuset
        and ur.role_id <> 903545 --903545,Seven Peaks
        and ur.role_id <> 880331 --Morphosis
        and (select is_active from sps_raw_harvest.users u where u.id = ur.user_id) = true

order by
            (select CONCAT(first_name, ' ', last_name) from sps_raw_harvest.users u where u.id = ur.user_id)

/*


select * from   sps-business-insight.sps_raw_harvest.user_roles limit 10
select * from   sps-business-insight.sps_raw_harvest.roles limit 10

*/

/*

 Supitchaya (Aom) Woraphatkittikul,933640,4436265,2023-02-06 04:02:36.905000,2023-02-06 04:04:08.042000,1675656156917612000,2023-02-06 04:04:31.581000,0,933640,seo
Supitchaya (Aom) Woraphatkittikul,933641,4436265,2023-02-06 04:02:36.905000,2023-02-06 04:04:08.042000,1675656156915245000,2023-02-06 04:04:31.581000,0,933641,SEM



Accounting Seven Peaks,618072,4342651,2022-11-21 10:31:22.101000,2022-11-21 10:31:53.919000,1669026682806512006,2022-11-21 10:32:09.273000,0,618072,OP - Admin team
Accounting Seven Peaks,781262,4342651,2022-11-21 10:31:22.101000,2022-11-21 10:31:53.919000,1669026682716518001,2022-11-21 10:32:09.222000,0,781262,OP - Finance Team


 */