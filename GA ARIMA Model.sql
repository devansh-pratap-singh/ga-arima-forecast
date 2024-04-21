CREATE OR REPLACE MODEL `web_analytics.ga_arima_model`
OPTIONS (
  model_type = 'ARIMA_PLUS',
  time_series_timestamp_col = 'parsed_date',
  time_series_data_col = 'total_visits',
  auto_arima = TRUE,
  data_frequency = 'AUTO_FREQUENCY',
  decompose_time_series = FALSE
) AS
SELECT
PARSE_TIMESTAMP("%Y%m%d", date) AS parsed_date,
SUM(totals.visits) AS total_visits
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
GROUP BY date;