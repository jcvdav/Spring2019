WITH
  longline_info AS (
  SELECT
    year,
    CAST(ssvid AS STRING) AS ssvid,
    best.best_flag
  FROM
    `world-fishing-827.gfw_research.vi_ssvid_byyear_v20190430`
  WHERE
    best.best_vessel_class = "drifting_longlines" ),
  #
  #
  #
  #
  ########
  tracks AS (
  SELECT
    EXTRACT(YEAR
    FROM
      _Partitiontime) AS year,
    EXTRACT(MONTH
    FROM
      _Partitiontime) AS month,
    ssvid,
    ROUND(FLOOR(lat/1)*1 + 0.5, 2) AS lat,
    ROUND(FLOOR(lon/1)*1 + 0.5, 2) AS lon,
    SUM(hours) AS hours
  FROM
    `world-fishing-827.gfw_research.pipe_production_b_fishing`
  CROSS JOIN
    UNNEST(regions.ocean) AS ocean
  WHERE
    ssvid IN (
    SELECT
      DISTINCT(ssvid)
    FROM
      longline_info)
    AND nnet_score > 0.5
  GROUP BY
    year,
    month,
    ssvid,
    lat,
    lon),
  #
  #
  #
  #
  ########
  tracks_and_info AS (
  SELECT
    *
  FROM
    tracks
  LEFT JOIN
    longline_info
  USING
    (year,
      ssvid))
  #
  #
  #
  #
  ########
SELECT
  year,
  month,
  best_flag,
  lon,
  lat,
  SUM(hours) AS hours
FROM
  tracks_and_info
GROUP BY
  year,
  month,
  best_flag,
  lon,
  lat