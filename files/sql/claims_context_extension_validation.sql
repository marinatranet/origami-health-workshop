-- Origami Health AIDP Workshop
-- Validation pack for Round 2 Claims context enrichment.

-- 1. Confirm the extension context table is populated.
SELECT
  COUNT(*) AS context_rows,
  COUNT(DISTINCT district_key) AS district_count,
  COUNT(DISTINCT context_month_date_key) AS month_count
FROM origami_fact_district_claims_context;

-- Expected pattern:
-- context_rows > 0, district_count matches the loaded Claims districts, month_count matches the available event months.

-- 2. Show the highest priority districts where claims pressure, capacity pressure, and access gaps overlap.
SELECT
  context_month,
  district_name,
  denied_claims,
  denial_rate,
  avg_processing_days,
  high_capacity_event_count,
  diversion_event_count,
  residents_per_facility,
  access_gap_score,
  claims_context_priority_score,
  recommended_action
FROM origami_claims_district_context_v
ORDER BY claims_context_priority_score DESC
FETCH FIRST 10 ROWS ONLY;

-- Expected pattern:
-- top rows should explain where claims review and public-health operations should coordinate.

-- 3. Compare claims denial rate with JSON capacity pressure and spatial access pressure by district.
SELECT
  district_name,
  ROUND(AVG(denial_rate), 4) AS avg_denial_rate,
  ROUND(AVG(avg_ed_wait_minutes), 1) AS avg_ed_wait_minutes,
  ROUND(AVG(access_gap_score), 1) AS avg_access_gap_score,
  ROUND(AVG(claims_context_priority_score), 1) AS avg_context_priority_score
FROM origami_claims_district_context_v
GROUP BY district_name
ORDER BY avg_context_priority_score DESC;

-- Expected pattern:
-- districts with high context priority should combine claims, operational, and access signals.

