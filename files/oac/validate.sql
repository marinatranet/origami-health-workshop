-- Read-only: run after CSV import. Compare with expected-results.json.
SELECT 'dim_date' table_name, COUNT(*) row_count FROM ORIGAMI_OAC_DIM_DATE
UNION ALL
SELECT 'dim_district' table_name, COUNT(*) row_count FROM ORIGAMI_OAC_DIM_DISTRICT
UNION ALL
SELECT 'dim_coverage_program' table_name, COUNT(*) row_count FROM ORIGAMI_OAC_DIM_COVERAGE_PROGRAM
UNION ALL
SELECT 'dim_claim_type' table_name, COUNT(*) row_count FROM ORIGAMI_OAC_DIM_CLAIM_TYPE
UNION ALL
SELECT 'fact_claims_monthly' table_name, COUNT(*) row_count FROM ORIGAMI_OAC_FACT_CLAIMS_MONTHLY;

SELECT COUNT(*) fact_rows, SUM(claims_submitted) claims_submitted, SUM(denied_claims) denied_claims, SUM(total_submitted_amount) submitted_amount, SUM(total_paid_amount) paid_amount, SUM(denied_claims)/NULLIF(SUM(claims_submitted),0) denial_rate, SUM(avg_processing_days*claims_submitted)/NULLIF(SUM(claims_submitted),0) approx_processing_days FROM ORIGAMI_OAC_FACT_CLAIMS_MONTHLY;

-- Filter check: North Borough
SELECT COUNT(*) fact_rows, SUM(claims_submitted) claims_submitted, SUM(denied_claims) denied_claims, SUM(total_submitted_amount) submitted_amount, SUM(total_paid_amount) paid_amount, SUM(denied_claims)/NULLIF(SUM(claims_submitted),0) denial_rate, SUM(avg_processing_days*claims_submitted)/NULLIF(SUM(claims_submitted),0) approx_processing_days FROM ORIGAMI_OAC_FACT_CLAIMS_MONTHLY f WHERE f.district_key IN (SELECT district_key FROM ORIGAMI_OAC_DIM_DISTRICT WHERE district_name='North Borough');

-- Filter check: Outpatient
SELECT COUNT(*) fact_rows, SUM(claims_submitted) claims_submitted, SUM(denied_claims) denied_claims, SUM(total_submitted_amount) submitted_amount, SUM(total_paid_amount) paid_amount, SUM(denied_claims)/NULLIF(SUM(claims_submitted),0) denial_rate, SUM(avg_processing_days*claims_submitted)/NULLIF(SUM(claims_submitted),0) approx_processing_days FROM ORIGAMI_OAC_FACT_CLAIMS_MONTHLY f WHERE f.claim_type_key IN (SELECT claim_type_key FROM ORIGAMI_OAC_DIM_CLAIM_TYPE WHERE claim_type='Outpatient');

-- The fully joined fact count must equal the unjoined fact count.
SELECT COUNT(*) joined_fact_rows FROM ORIGAMI_OAC_FACT_CLAIMS_MONTHLY f
JOIN ORIGAMI_OAC_DIM_DATE d0 ON f.service_month_date_key = d0.date_key
JOIN ORIGAMI_OAC_DIM_DISTRICT d1 ON f.district_key = d1.district_key
JOIN ORIGAMI_OAC_DIM_COVERAGE_PROGRAM d2 ON f.program_key = d2.program_key
JOIN ORIGAMI_OAC_DIM_CLAIM_TYPE d3 ON f.claim_type_key = d3.claim_type_key;
