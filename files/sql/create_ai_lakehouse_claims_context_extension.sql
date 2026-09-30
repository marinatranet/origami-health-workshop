-- Origami Health AIDP Workshop
-- Round 2 extension: JSON capacity + spatial access context for the existing Claims analytics product.
--
-- Run this after the instructor-led Claims star schema has been created:
--   origami_dim_date
--   origami_dim_district
--   origami_dim_coverage_program
--   origami_dim_claim_type
--   origami_fact_claims_monthly
--
-- The extension does not alter the Claims star schema. It adds one district-month
-- context fact and an OAC-ready view that can be joined/blended with Claims visuals.

CREATE TABLE origami_fact_district_claims_context (
  context_month_date_key NUMBER,
  district_key NUMBER,
  claims_submitted NUMBER,
  denied_claims NUMBER,
  denial_rate NUMBER,
  avg_processing_days NUMBER,
  total_submitted_amount NUMBER,
  total_paid_amount NUMBER,
  capacity_event_count NUMBER,
  avg_occupancy_rate NUMBER,
  max_occupancy_rate NUMBER,
  avg_waiting_room_count NUMBER,
  avg_ed_wait_minutes NUMBER,
  high_capacity_event_count NUMBER,
  diversion_event_count NUMBER,
  supply_alert_event_count NUMBER,
  avg_triage_acuity_score NUMBER,
  facility_count NUMBER,
  catchment_count NUMBER,
  residents_per_facility NUMBER,
  access_gap_score NUMBER,
  operations_access_risk_score NUMBER,
  claims_context_priority_score NUMBER,
  recommended_action VARCHAR2(300)
);

CREATE OR REPLACE VIEW origami_claims_district_context_v AS
SELECT
  dt.full_date AS context_month,
  dd.district_id,
  dd.district_name,
  dd.population,
  dd.deprivation_index,
  f.claims_submitted,
  f.denied_claims,
  f.denial_rate,
  f.avg_processing_days,
  f.total_submitted_amount,
  f.total_paid_amount,
  f.capacity_event_count,
  f.avg_occupancy_rate,
  f.max_occupancy_rate,
  f.avg_waiting_room_count,
  f.avg_ed_wait_minutes,
  f.high_capacity_event_count,
  f.diversion_event_count,
  f.supply_alert_event_count,
  f.avg_triage_acuity_score,
  f.facility_count,
  f.catchment_count,
  f.residents_per_facility,
  f.access_gap_score,
  f.operations_access_risk_score,
  f.claims_context_priority_score,
  f.recommended_action
FROM origami_fact_district_claims_context f
JOIN origami_dim_date dt
  ON f.context_month_date_key = dt.date_key
JOIN origami_dim_district dd
  ON f.district_key = dd.district_key;

