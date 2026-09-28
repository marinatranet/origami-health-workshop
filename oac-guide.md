# Half-Day 3 — Claims Command Center & OAC Assistant

Days 1–2 build trusted claims data and a member-assistance workflow. Day 3 switches to the claims manager’s view: explore claim volumes, denials, payments and processing time. It uses a separate, prepared synthetic claims star dataset from the reference OAC workshop—not the tables produced in Days 1–2. Districts and coverage programs are fictional teaching categories, not actual business structures. Denials are not evidence of fraud.

## Duration

45 minutes is the reference core-lab estimate (admin preparation plus participant build), not a validated classroom duration. The presenter must rehearse and confirm the timebox; rebuilding the complete canvas from scratch may need longer. Slides and Q&A are separate. No fixed clock times are published.

## Before class — presenter

- Presenter: prepare a separate OAC training connection and schema, load the five supplied CSVs, and verify expected-results.json before class. Do not replace the AIDP Day 1 tables.
- Confirm each learner can use the connection, create/save a private dataset and workbook, and use OAC Assistant. Share sign-in details privately; never use shared admin credentials.
- Prepare a starter dataset and an Executive Overview workbook as a fallback, and rehearse indexing before class. No importable DVA/BAR workbook export is included in this download.
- Live OAC connection, imports, workbook, Assistant access/indexing and delivery timing are NOT yet verified for this workshop. This is a content/data handoff, not a deployed OAC environment.

## 1. Confirm the AI Lakehouse connection

**Objective:** Reach the prepared claims data safely.

**What to do:** Open the presenter-provided OAC connection and locate the five training tables.

**What you learn:** An analytics connection exposes prepared data without repeating ingestion.

1. Sign in to the OAC URL provided by your presenter. Open the approved AI Lakehouse connection. If you cannot see it, ask the presenter to check access; do not create credentials or infrastructure during class.
2. Confirm the separate training schema contains ORIGAMI_OAC_FACT_CLAIMS_MONTHLY, ORIGAMI_OAC_DIM_DATE, ORIGAMI_OAC_DIM_DISTRICT, ORIGAMI_OAC_DIM_COVERAGE_PROGRAM and ORIGAMI_OAC_DIM_CLAIM_TYPE.

**Checkpoint:** All five tables are visible. The schema is separate from the AIDP workshop outputs.

## 2. Create the claims dataset

**Objective:** Bring the claims fact and business dimensions into one model.

**What to do:** Create a dataset from the connection, starting with the fact table and adding four dimensions.

**What you learn:** A reusable dataset separates data modelling from dashboard design.

1. Choose Create → Dataset, select the approved connection and expand the training schema.
2. Add ORIGAMI_OAC_FACT_CLAIMS_MONTHLY first, then the four dimensions. Save as OrigamiClaimAnalysis_<your-slot> so you do not overwrite another learner’s work.

**Checkpoint:** The dataset contains one fact table and four dimensions; your saved name includes your assigned slot.

## 3. Join and profile the self-service model

**Objective:** Prevent incorrect totals before building visualizations.

**What to do:** Check four many-to-one joins, field roles, source counts and aggregate calculations.

**What you learn:** Correct grain and aggregation make business metrics trustworthy.

1. Join fact.service_month_date_key to date.date_key; fact.district_key to district.district_key; fact.program_key to coverage_program.program_key; fact.claim_type_key to claim_type.claim_type_key. Each dimension key must be unique. Use the fact as the preserved grain; do not join dimensions to each other.
2. Inspect profiles, nulls, distributions and sample values. Keys and descriptive fields are attributes; claim counts and amounts are additive measures. Parse full_date and week_start_date as dates. Use a year-month date for trends, not month name alone.
3. Define Denial rate as SUM(denied_claims) / SUM(claims_submitted), with a zero-denominator guard; format as a percentage. Never SUM or take an unweighted average of the stored row-level denial_rate.
4. For Processing days, use SUM(avg_processing_days * claims_submitted) / SUM(claims_submitted), guarded for zero. Label it “Processing days (approx.)”: it weights already-rounded group averages, not individual claim durations. The presenter must confirm the denominator before presenting it as an operational SLA.
5. Reconcile unfiltered and filtered totals with expected-results.json in the OAC ZIP. Confirm the joins do not duplicate or discard fact rows. Amounts use synthetic source units; do not relabel them as real local-currency financial results.

**Checkpoint:** The joined dataset reconciles to the supplied counts and totals, including the two filter checks.

## 4. Index the dataset for OAC Assistant

**Objective:** Enable questions over the prepared claims dataset.

**What to do:** Configure search indexing, run it and wait for successful completion.

**What you learn:** Assistant needs an accessible, indexed dataset before it can answer data questions.

1. From the dataset’s Actions menu, choose Inspect → Search. Set Index Dataset For to Assistant and Homepage (wording can vary by version). Review the indexed fields, save and select Run Now.
2. Wait until indexing completes; starting an index is not completion. If the Assistant option is missing, ask the presenter to verify availability and the Use Assistant in Workbooks permission. Do not change tenancy access yourself.

**Checkpoint:** Indexing has completed and the workbook’s Assistant is available; otherwise record the blocker and use the presenter’s prepared example.

## 5. Build the Executive Overview canvas

**Objective:** Turn claim metrics into a claims manager’s decision view.

**What to do:** Build or open the prepared canvas, then validate every visual with filters.

**What you learn:** Different chart types answer different operational questions.

1. Create a workbook from your dataset, or open a private copy of the presenter’s prepared workbook. Save as Origami Claims Command Center_<your-slot>; name the canvas Executive Overview. Use Freeform layout and the title Origami Claims Processing Command Center.
2. Add district_name and claim_type as canvas filters. Build the six KPI tiles and five analysis visuals in the layout below. Use full_date at month grain for sparklines and the trend.
3. Arrange the KPI tiles across the top. Hide repeated measure titles, format counts/amounts/percentages appropriately, and keep labels readable. High/low markers, rounded cards and subtle shadows are optional finishing touches.
4. Apply North Borough, reset, then apply Outpatient. Check the KPI results against the supplied reference totals and confirm every relevant chart responds. Clear filters, save, and capture one evidence screenshot.

**Checkpoint:** Both filters work across the canvas, numbers reconcile, and your private workbook is saved.

### Dashboard build specification

| Visual | Fields and configuration |
|---|---|
| KPI: Claims submitted | SUM(claims_submitted); monthly bar sparkline |
| KPI: Claims denied | SUM(denied_claims); monthly line sparkline |
| KPI: Denial rate | Ratio of summed denied/submitted claims; monthly area sparkline |
| KPI: Submitted amount | SUM(total_submitted_amount); monthly line/area sparkline |
| KPI: Paid amount | SUM(total_paid_amount); monthly bar sparkline |
| KPI: Processing days (approx.) | Claims-weighted rounded group averages; monthly line sparkline |
| Heatmap: Where are denial rates high? | Rows coverage_program; columns claim_type; color calculated Denial rate |
| Donut: Which districts contribute denials? | Category district_name; value SUM(denied_claims) |
| Table: Which claim types need review? | claim_type, SUM(denied_claims), calculated Denial rate; sort denied claims descending |
| Bubble: Where do volume and time combine? | Label claim_type; X SUM(claims_submitted); Y approximate Processing days; size SUM(claims_submitted) |
| Trend: How is denial rate changing? | Month on X; calculated Denial rate on Y; forecast only if available and meaningful, outside the core checkpoint |

## 6. Ask questions with OAC Assistant

**Objective:** Explore claims patterns in natural language and verify the answers.

**What to do:** Ask the four questions below, inspect the resulting visuals and compare them with the dashboard.

**What you learn:** Analytics AI answers dataset questions; it is different from the benefits-document Copilot in Day 2.

1. Open Assistant in the workbook. Ask one question at a time; check the metric, aggregation, filters and time grain before interpreting the result.
2. Which districts contribute the most denied claims?
3. Which claim types need denial review?
4. Compare denied claims and processing days by claim type.
5. How is denial rate trending by month?
6. Open Additional Insights if offered. Save one useful visualization to your canvas and write one supported observation plus one follow-up question. If Assistant uses the stored denial_rate incorrectly, reformulate using the governed calculation and validate against the dashboard.

**Checkpoint:** Save one verified answer and its evidence. Do not ask policy-coverage questions here or treat denials as proof of fraud.

## Scope and product references

The original six-step core is retained. Publisher, retail-opportunity analysis and the spatial/JSON extension are not part of this copied core. No live OAC deployment or workbook export is included.

- [Oracle: multi-table datasets](https://docs.oracle.com/en/cloud/paas/analytics-cloud/tutorial-mutli-table-data-set/index.html)
- [Oracle: configure and use Analytics AI Assistant](https://docs.oracle.com/en/cloud/paas/analytics-cloud/tutorial-oa-assistant/index.html)
- [Oracle: KPI tile sparklines](https://docs.oracle.com/en/cloud/paas/analytics-cloud/tutorial-tile-spark-chart/)
