-- Origami Health AIDP Workshop
-- Instructor-led Claims star schema in Autonomous AI Lakehouse
--
-- This script is the focused SQL path for the guided Claims workshop lane.
-- It creates only the dimensions and fact needed for the Claims star schema
-- plus the OAC-facing claims view.
--
-- AIDP stages dimensional Gold outputs under:
--   oci://<bucket>@<namespace>/origami/gold_dimensional/<object_name>/
--
-- Replace <gold_dimensional_stage_uri> with that object storage URI.

-- ============================================================
-- Claims star schema dimensions
-- ============================================================

CREATE TABLE origami_dim_date (
  date_key NUMBER PRIMARY KEY,
  full_date DATE,
  calendar_year NUMBER,
  calendar_quarter NUMBER,
  month_number NUMBER,
  month_name VARCHAR2(20),
  week_start_date DATE,
  day_of_week VARCHAR2(20),
  is_week_start VARCHAR2(1)
);

CREATE TABLE origami_dim_district (
  district_key NUMBER PRIMARY KEY,
  district_id VARCHAR2(10),
  district_name VARCHAR2(80),
  population NUMBER,
  deprivation_index NUMBER,
  elderly_pct NUMBER,
  chronic_condition_pct NUMBER,
  median_income_usd NUMBER
);

CREATE TABLE origami_dim_coverage_program (
  program_key NUMBER PRIMARY KEY,
  program_code VARCHAR2(12),
  coverage_program VARCHAR2(80),
  program_type VARCHAR2(80),
  funding_source VARCHAR2(100)
);

CREATE TABLE origami_dim_claim_type (
  claim_type_key NUMBER PRIMARY KEY,
  claim_type VARCHAR2(40),
  service_category VARCHAR2(80),
  diagnosis_group VARCHAR2(80)
);

-- ============================================================
-- Claims star schema fact
-- ============================================================

CREATE TABLE origami_fact_claims_monthly (
  service_month_date_key NUMBER,
  district_key NUMBER,
  program_key NUMBER,
  claim_type_key NUMBER,
  claims_submitted NUMBER,
  approved_claims NUMBER,
  denied_claims NUMBER,
  pending_claims NUMBER,
  total_submitted_amount NUMBER,
  total_approved_amount NUMBER,
  total_paid_amount NUMBER,
  avg_processing_days NUMBER,
  denial_rate NUMBER
);

-- Optional: create a credential once if loading from Object Storage.
-- BEGIN
--   DBMS_CLOUD.CREATE_CREDENTIAL(
--     credential_name => 'OBJ_STORE_CRED',
--     username        => '<oci_user>',
--     password        => '<auth_token>'
--   );
-- END;
-- /

-- ============================================================
-- Load Claims star schema tables
-- ============================================================

BEGIN
  DBMS_CLOUD.COPY_DATA(table_name => 'ORIGAMI_DIM_DATE', credential_name => 'OBJ_STORE_CRED',
    file_uri_list => '<gold_dimensional_stage_uri>/dim_date/*.csv',
    format => JSON_OBJECT('type' VALUE 'csv', 'skipheaders' VALUE '1', 'dateformat' VALUE 'YYYY-MM-DD'));
END;
/

BEGIN
  DBMS_CLOUD.COPY_DATA(table_name => 'ORIGAMI_DIM_DISTRICT', credential_name => 'OBJ_STORE_CRED',
    file_uri_list => '<gold_dimensional_stage_uri>/dim_district/*.csv',
    format => JSON_OBJECT('type' VALUE 'csv', 'skipheaders' VALUE '1'));
END;
/

BEGIN
  DBMS_CLOUD.COPY_DATA(table_name => 'ORIGAMI_DIM_COVERAGE_PROGRAM', credential_name => 'OBJ_STORE_CRED',
    file_uri_list => '<gold_dimensional_stage_uri>/dim_coverage_program/*.csv',
    format => JSON_OBJECT('type' VALUE 'csv', 'skipheaders' VALUE '1'));
END;
/

BEGIN
  DBMS_CLOUD.COPY_DATA(table_name => 'ORIGAMI_DIM_CLAIM_TYPE', credential_name => 'OBJ_STORE_CRED',
    file_uri_list => '<gold_dimensional_stage_uri>/dim_claim_type/*.csv',
    format => JSON_OBJECT('type' VALUE 'csv', 'skipheaders' VALUE '1'));
END;
/

BEGIN
  DBMS_CLOUD.COPY_DATA(table_name => 'ORIGAMI_FACT_CLAIMS_MONTHLY', credential_name => 'OBJ_STORE_CRED',
    file_uri_list => '<gold_dimensional_stage_uri>/fact_claims_monthly/*.csv',
    format => JSON_OBJECT('type' VALUE 'csv', 'skipheaders' VALUE '1'));
END;
/

-- ============================================================
-- OAC-facing view
-- ============================================================

CREATE OR REPLACE VIEW origami_oac_star_claims AS
SELECT
  d.full_date AS service_month,
  dis.district_id,
  dis.district_name,
  p.program_code,
  p.coverage_program,
  p.program_type,
  p.funding_source,
  ct.claim_type,
  ct.service_category,
  ct.diagnosis_group,
  f.claims_submitted,
  f.approved_claims,
  f.denied_claims,
  f.pending_claims,
  f.total_submitted_amount,
  f.total_approved_amount,
  f.total_paid_amount,
  f.avg_processing_days,
  f.denial_rate
FROM origami_fact_claims_monthly f
JOIN origami_dim_date d ON f.service_month_date_key = d.date_key
JOIN origami_dim_district dis ON f.district_key = dis.district_key
JOIN origami_dim_coverage_program p ON f.program_key = p.program_key
JOIN origami_dim_claim_type ct ON f.claim_type_key = ct.claim_type_key;
