-- Run in Database Actions as your assigned schema owner, never ADMIN.
-- These expected values apply only to the unchanged supplied sample.
-- 1. Counts: Date 864, District 5, Coverage 5, Claim Type 6, fact 622.
SELECT 'origami_dim_date' table_name, COUNT(*) row_count FROM origami_dim_date
UNION ALL SELECT 'origami_dim_district',COUNT(*) FROM origami_dim_district
UNION ALL SELECT 'origami_dim_coverage_program',COUNT(*) FROM origami_dim_coverage_program
UNION ALL SELECT 'origami_dim_claim_type',COUNT(*) FROM origami_dim_claim_type
UNION ALL SELECT 'origami_fact_claims_monthly',COUNT(*) FROM origami_fact_claims_monthly;

-- 2. Every check must return zero. Null keys are included as failures.
SELECT 'fact_duplicate_grain' check_name, COUNT(*) failures FROM (
 SELECT service_month_date_key,district_key,program_key,claim_type_key
 FROM origami_fact_claims_monthly
 GROUP BY service_month_date_key,district_key,program_key,claim_type_key
 HAVING COUNT(*) > 1)
UNION ALL SELECT 'fact_orphan_or_null_reference',COUNT(*)
FROM origami_fact_claims_monthly f
LEFT JOIN origami_dim_date d ON d.date_key=f.service_month_date_key
LEFT JOIN origami_dim_district di ON di.district_key=f.district_key
LEFT JOIN origami_dim_coverage_program p ON p.program_key=f.program_key
LEFT JOIN origami_dim_claim_type c ON c.claim_type_key=f.claim_type_key
WHERE d.date_key IS NULL OR di.district_key IS NULL OR p.program_key IS NULL OR c.claim_type_key IS NULL
UNION ALL SELECT 'date_duplicate_or_null_key',COUNT(*) FROM (SELECT date_key FROM origami_dim_date GROUP BY date_key HAVING COUNT(*) > 1 OR date_key IS NULL)
UNION ALL SELECT 'district_duplicate_or_null_key',COUNT(*) FROM (SELECT district_key FROM origami_dim_district GROUP BY district_key HAVING COUNT(*) > 1 OR district_key IS NULL)
UNION ALL SELECT 'coverage_program_duplicate_or_null_key',COUNT(*) FROM (SELECT program_key FROM origami_dim_coverage_program GROUP BY program_key HAVING COUNT(*) > 1 OR program_key IS NULL)
UNION ALL SELECT 'claim_type_duplicate_or_null_key',COUNT(*) FROM (SELECT claim_type_key FROM origami_dim_claim_type GROUP BY claim_type_key HAVING COUNT(*) > 1 OR claim_type_key IS NULL)
;

-- 3. Totals: claims 1400, denied 121, submitted amount 1239912.67.
-- Compare with source/Silver sums, not only with these reference constants.
SELECT SUM(claims_submitted) claims_submitted,
       SUM(denied_claims) denied_claims,
       ROUND(SUM(total_submitted_amount),2) submitted_amount
FROM origami_fact_claims_monthly;
