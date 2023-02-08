-- This function rounds the hours to the nearest quarter

-- Example: select sps_raw_harvest.QuarterRound(2.32)

CREATE OR REPLACE FUNCTION `sps-business-insight.sps_raw_harvest.QuarterRound`(Hour FLOAT64) RETURNS FLOAT64 AS (
(
    SIGN(Hour) * CEILING(ABS(Hour) * 4) / 4 )
);

