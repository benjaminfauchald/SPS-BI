-- This function rounds the hours to the nearest quarter

-- Example: select sps_raw_harvest.QuarterRound(2.32)

CREATE OR REPLACE PROCEDURE `sps-business-insight.sps.QuarterRound`(Hour FLOAT64) RETURNS FLOAT64 AS (
(
    SIGN(Hour) * CEILING(ABS(Hour) * 4) / 4 )
);

