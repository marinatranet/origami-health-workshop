-- REVIEW BEFORE RUNNING: new objects only, dedicated approved training schema.
-- No DROP, overwrite, credentials, grants, cloud provisioning or automatic data loads.

CREATE TABLE ORIGAMI_OAC_DIM_DATE (
  date_key NUMBER(12) NOT NULL,
  full_date DATE NOT NULL,
  calendar_year NUMBER(12) NOT NULL,
  calendar_quarter NUMBER(12) NOT NULL,
  month_number NUMBER(12) NOT NULL,
  month_name VARCHAR2(160) NOT NULL,
  week_start_date DATE NOT NULL,
  day_of_week VARCHAR2(160) NOT NULL,
  is_week_start VARCHAR2(160) NOT NULL,
  PRIMARY KEY (date_key)
);

CREATE TABLE ORIGAMI_OAC_DIM_DISTRICT (
  district_key NUMBER(12) NOT NULL,
  district_id VARCHAR2(160) NOT NULL,
  district_name VARCHAR2(160) NOT NULL,
  population NUMBER(12) NOT NULL,
  deprivation_index NUMBER(20,6) NOT NULL,
  elderly_pct NUMBER(20,6) NOT NULL,
  chronic_condition_pct NUMBER(20,6) NOT NULL,
  median_income_usd NUMBER(20,6) NOT NULL,
  PRIMARY KEY (district_key)
);

CREATE TABLE ORIGAMI_OAC_DIM_COVERAGE_PROGRAM (
  program_key NUMBER(12) NOT NULL,
  program_code VARCHAR2(160) NOT NULL,
  coverage_program VARCHAR2(160) NOT NULL,
  program_type VARCHAR2(160) NOT NULL,
  funding_source VARCHAR2(160) NOT NULL,
  PRIMARY KEY (program_key)
);

CREATE TABLE ORIGAMI_OAC_DIM_CLAIM_TYPE (
  claim_type_key NUMBER(12) NOT NULL,
  claim_type VARCHAR2(160) NOT NULL,
  service_category VARCHAR2(160) NOT NULL,
  diagnosis_group VARCHAR2(160) NOT NULL,
  PRIMARY KEY (claim_type_key)
);

CREATE TABLE ORIGAMI_OAC_FACT_CLAIMS_MONTHLY (
  service_month_date_key NUMBER(12) NOT NULL,
  district_key NUMBER(12) NOT NULL,
  program_key NUMBER(12) NOT NULL,
  claim_type_key NUMBER(12) NOT NULL,
  claims_submitted NUMBER(12) NOT NULL,
  approved_claims NUMBER(12) NOT NULL,
  denied_claims NUMBER(12) NOT NULL,
  pending_claims NUMBER(12) NOT NULL,
  total_submitted_amount NUMBER(20,6) NOT NULL,
  total_approved_amount NUMBER(20,6) NOT NULL,
  total_paid_amount NUMBER(20,6) NOT NULL,
  avg_processing_days NUMBER(20,6) NOT NULL,
  denial_rate NUMBER(20,6) NOT NULL,
  PRIMARY KEY (service_month_date_key, district_key, program_key, claim_type_key),
  FOREIGN KEY (service_month_date_key) REFERENCES ORIGAMI_OAC_DIM_DATE (date_key),
  FOREIGN KEY (district_key) REFERENCES ORIGAMI_OAC_DIM_DISTRICT (district_key),
  FOREIGN KEY (program_key) REFERENCES ORIGAMI_OAC_DIM_COVERAGE_PROGRAM (program_key),
  FOREIGN KEY (claim_type_key) REFERENCES ORIGAMI_OAC_DIM_CLAIM_TYPE (claim_type_key)
);
