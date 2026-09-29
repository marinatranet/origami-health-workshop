# Origami Health — Hands-on Data, Analytics & AI Workshop

Each AIDP hands-on session is planned for 90 minutes using prepared, tested assets. Day 1 includes 20 minutes of setup checks, 60 minutes of guided exercises and 10 minutes of catch-up; Day 2 includes 5 minutes of readiness, 75 minutes of guided exercises and 10 minutes of catch-up. Timing is an estimate until a classroom-style pilot passes. Separate slides, breaks and Q&A share the remaining 90 minutes of each three-hour day. No clock times are displayed. OAC uses a separate six-step reference lab; its source timing estimate awaits presenter rehearsal.

Asset preview available: notebooks, synthetic data, prepared model and exercise files are locally validated. See the release readiness checklist for facilitator rehearsal results. Knowledge-base/agent deployment, class access and timed delivery remain pending. OAC content and synthetic reference data are available; live OAC setup and rehearsal remain pending.

Claims, Benefits, Provider and Member Operations: build trusted data, investigate unusual claims, answer benefit inquiries with evidence, and explore claims-operations insights.

## Delivery assumptions — prepared assets

- Before class: participant accounts and permissions are tested, notebooks are imported, compute is warm, and source data, output schemas and the Lakehouse connection are ready.
- Day 2 starts with a validated Day 1 snapshot, a prepared scorer, an indexed benefits knowledge base and a preconnected Copilot. Training, indexing, tool connections and deployment are not participant tasks.
- Core tasks are mandatory; optional tasks are take-home or fast-finisher work. Catch-up time is reserved for assistance and saving results, not additional content.
- A timed pilot must include a participant unfamiliar with the instructions and representative concurrent load. Record actual completion and any fallback used; an instructor-only run does not validate class timing.

## Half-Day 1 · Setup and access check — allow 15–20 minutes


**Objective:** Get ready to work safely in your assigned environment.

**What to do:** Open notebook 00, select the assigned compute and run the access checks.

**Intended outcome:** Identify your workspace, data paths and compute; recognize when to ask for help.

Use this 20-minute allowance to sign in to the prepared AIDP workspace, confirm your participant folder and isolated schema, open notebook 00_setup_check.ipynb, select the already-running compute and run the supplied read-only access check against the source volume and Lakehouse. Confirm the recovery snapshot and where to save evidence. This is an access check, not platform provisioning or software installation. Ask the facilitator to resolve failed checks; if still blocked, pair with a working participant and record what remains unresolved. If setup finishes in 15 minutes, use the remaining five minutes as lab support buffer within the same 90-minute block.

Save: A completed access checklist or a recorded blocker and agreed paired-work fallback.

Files in the participant asset pack:

- day1/00_setup_check.ipynb

### Visual walkthrough

Open `index.html#setup` in the guide ZIP for diagrams, annotated reference screenshots and expected-result checkpoints.

#### Find your notebook and its compute

![Oracle AIDP notebook showing the workspace breadcrumb, attached compute and code cells.](screen-notebook-overview.png)

Product reference from Oracle documentation, not a live Origami capture. Example names and data differ.

- Top breadcrumb: check your assigned folder and notebook, not the example names shown here.
- Top right: confirm the facilitator-assigned Spark compute is active.
- Read the Markdown instructions above each cell. Run the first binding cell in every notebook.

## Half-Day 1 · Lab 1: Medallion architecture: Bronze/Silver (30 min)


**Objective:** Turn raw claims into trustworthy, traceable data.

**What to do:** Run Bronze/Silver, inspect one rejected record and reconcile accepted, rejected and duplicate counts.

**Intended outcome:** Explain what Bronze and Silver do, why records fail checks and how reconciliation prevents silent data loss.


### Before you begin

- Assigned participant folder and schema; running Spark compute; prepared synthetic source files and starter notebooks.
- The facilitator supplies the asset root, output root and participant identifier. Seven CSV sources include claims, members, plans, enrollments, providers, benefits and usage; document-related flags are precomputed synthetic inputs, not a live document extraction integration.

### Steps

1. Confirm your participant paths and snapshot date in starter notebook 01 (3 minutes).
2. Run the prepared Bronze cells and inspect the lineage fields and count summary (7 minutes, including execution).
3. Run the prepared Silver cells. Locate one quarantined invalid reference and explain why it failed; transformations and joins are provided (12 minutes, including execution).
4. Compare accepted, rejected and deduplicated counts with the supplied expected results; save the summary for Lab 2 (8 minutes).

### Check your result

- The supplied count reconciliation passes; the chosen rejected row has an understandable reason.
- Your output is in the assigned participant location; the read-only source remains unchanged.

Save: A reconciliation summary and an explanation of one rejected record.

### Files in the participant asset pack

- day1/01_bronze.ipynb
- day1/02_silver.ipynb

### Optional / take-home — outside the core timebox

- Inspect multi-plan enrollment joins and precomputed document-evidence flags.
- Write a new transformation or rerun the complete pipeline from scratch.

### Facilitator preparation — before class

- Facilitator: verify the full key/reference test suite, participant isolation and expected counts before class. Run-time and queuing must fit inside the stated timeboxes.
- If a live run cannot finish, identify the facilitator recovery snapshot explicitly and record the live task as incomplete; viewing a snapshot is not successful execution.

### Visual walkthrough

Open `index.html#lab1` in the guide ZIP for diagrams, annotated reference screenshots and expected-result checkpoints.

#### Run one cell at a time

![Oracle AIDP Run menu, including Run selected cells and Run all.](screen-notebook-run.png)

Product reference from Oracle documentation, not a live Origami capture. Example names and data differ.

- Select the next code cell, then use Run selected cell(s) or the cell play control.
- Wait for completion and inspect the result before continuing. Do not start with Run all.
- The reference image shows Mac shortcuts; use the menu or play control on your laptop.

## Half-Day 1 · Lab 2: Publish Claims and Benefits data to AI Lakehouse (20 min)


**Objective:** Make validated claims and benefits data available for analysis.

**What to do:** Run Gold and Lakehouse notebooks; check claim totals and one member’s active plans.

**Intended outcome:** Distinguish claim-level facts from summaries and avoid double-counting when combining data.


### Before you begin

- Lab 1 passes; participant tables, grants and the external catalog are prepared.
- The participant model includes both claims analytics and member/plan benefit access; monthly claim aggregates alone cannot answer individual member questions.

### Steps

1. Inspect the prepared grain diagram and assigned target; do not configure the database connection (3 minutes).
2. Run the selected notebook 03 Gold cells, followed by the prepared notebook 04 Lakehouse cells (7 minutes, including execution).
3. Run two supplied checks: claim count/amount reconciliation and a dated active-plan lookup for one synthetic member (7 minutes).
4. Save the two query results and snapshot reference for Day 2 (3 minutes).

### Check your result

- Claim counts and amounts match expected results without join fan-out.
- The dated lookup returns the expected active plans for the authorized synthetic member.

Save: Two validated query results and the Day 2 snapshot reference.

### Files in the participant asset pack

- day1/03_gold.ipynb
- day1/04_lakehouse.ipynb

### Optional / take-home — outside the core timebox

- Inspect full duplicate/orphan/overlap checks and repeat-run evidence.
- Author workflow dependencies, connection settings or new Lakehouse tables.

### Facilitator preparation — before class

- Facilitator: prepare tables, grants, connections and query templates; verify full schemas, foreign keys, benefit versions, scope and unchanged-source rerun behavior ahead of class.
- This timebox assumes Gold and Lakehouse execution fits the seven-minute allowance under representative concurrency. Record a recovery snapshot as fallback rather than completed live publishing.

### Visual walkthrough

Open `index.html#lab2` in the guide ZIP for diagrams, annotated reference screenshots and expected-result checkpoints.

#### Keep the output that proves your check

![Oracle AIDP table output with Copy and Download CSV controls highlighted.](screen-notebook-results.png)

Product reference from Oracle documentation, not a live Origami capture. Example names and data differ.

- For a displayed result table, find Copy or Download beside the output.
- Save your Origami claim reconciliation and active-plan query result, not these example rows.
- A finished cell is not enough: compare the values with the expected results below.

## Half-Day 1 · Governance exercise


**Objective:** Understand where data came from and who may access it.

**What to do:** Trace one claim across layers and inspect a prepared allowed/denied access test.

**Intended outcome:** Distinguish a data trace from an access control; folder names alone do not enforce security.

Trace one supplied synthetic claim from source through Silver to a Gold view (5 minutes). Inspect one prepared allowed/denied access test and explain where scope is enforced (5 minutes). Full role setup, workflow authoring and native-lineage verification are facilitator preparation or follow-up work; declared lineage is not proof of runtime-native lineage.

Save: A record trace and a role-to-data access check.

Files in the participant asset pack:

- day1/governance.md

### Visual walkthrough

Open `index.html#governance` in the guide ZIP for diagrams, annotated reference screenshots and expected-result checkpoints.

## Half-Day 1 · Catch-up and save results — 10 minutes


**Objective:** Leave Day 1 with a clear, reusable evidence trail.

**What to do:** Finish core checks, save results and record incomplete tasks or fallback snapshots.

**Intended outcome:** Distinguish verified execution from a viewed example and explain what Day 2 can safely reuse.

Use this reserved time for help, pending core checks and saving the reconciliation/query evidence. Do not add new mandatory content. Record incomplete live tasks and any recovery snapshot used.

Save: Saved Day 1 evidence and an honest completion checklist.

## Half-Day 2 · Day 2 readiness check


**Objective:** Confirm that Day 2’s prepared services and data are available.

**What to do:** Check your Day 1 snapshot, scorer, knowledge base and assigned Copilot; report missing dependencies.

**Intended outcome:** Recognize how the AI exercises depend on validated data and preconfigured services.

Reconnect, open the assigned scorer, knowledge base and preconnected Copilot, and confirm the validated Day 1 snapshot. Account fixes and deployment are pre-class tasks. Escalate any blocker to the facilitator rather than attempting a fresh setup.

Save: Readiness confirmed or a recorded blocker.

## Half-Day 2 · Lab 3: Score claims anomalies for investigation (15 min)


**Objective:** Use a model score to prioritize human review, not declare fraud.

**What to do:** Run the prepared scorer, compare a flagged claim with a legitimate example and record the reason.

**Intended outcome:** Interpret a review flag, recognize false positives and retain the model/version reference.


### Before you begin

- Prepared features, synthetic investigation outcomes, a seeded experiment and pre-trained model. Full training and AutoML configuration are facilitator preparation or take-home activities.
- A claim denial is not a fraud label. The original denial-risk notebook is a learning reference, not this lab's fraud model.

### Steps

1. Inspect the prepared feature/label card and its human-review boundary (3 minutes).
2. Run the prepared scorer and open the review queue (5 minutes, including execution).
3. Inspect one flagged claim and the supplied legitimate/false-positive example; explain the reason code without asserting fraud (5 minutes).
4. Save the claim reference, score/model version and one review observation (2 minutes).

### Check your result

- The selected score has a model/version reference and evidence supporting its review priority.
- The explanation distinguishes an unusual claim from confirmed fraud.

Save: One annotated investigation example with its score/version reference.

### Files in the participant asset pack

- day2/05_claim_scoring.ipynb
- model/prepared_model.json

### Optional / take-home — outside the core timebox

- Inspect precision/recall and review-capacity tradeoffs in the seeded experiment.
- Run training, compare AutoML candidates or change thresholds.

### Facilitator preparation — before class

- Facilitator: train the model, verify leakage-safe splits, evaluation and registered-model/batch-scorer parity; preflight scoring and provide seeded results as a labelled fallback.

### Visual walkthrough

Open `index.html#lab3` in the guide ZIP for diagrams, annotated reference screenshots and expected-result checkpoints.

## Half-Day 2 · Lab 4: Test the Benefits Knowledge Base (15 min)


**Objective:** Answer benefit questions using the right policy evidence.

**What to do:** Test one supported and one unsupported question; check the cited plan, version and effective date.

**Intended outcome:** Verify a grounded answer and recognize when missing evidence requires an explicit limitation.


### Before you begin

- Fictional Origami Health benefit guides, plan schedules, exclusions, FAQs and service procedures with document IDs, versions and effective dates.
- A validated, pre-ingested knowledge base and participant permissions are ready before class. Source configuration, ingestion and index creation are facilitator preparation or take-home extensions.

### Steps

1. Open the prepared knowledge base and inspect the plan/version metadata (3 minutes).
2. Ask one supplied benefit-limit question and verify its cited passage, plan, version and inquiry date (6 minutes).
3. Ask one unsupported-service question and confirm an insufficient-evidence response rather than an invented policy (4 minutes).
4. Save the two results and citations or refusal explanation (2 minutes).

### Check your result

- The supported answer cites the expected current plan document and section.
- The unsupported answer reports the evidence gap without inventing benefit terms.

Save: Two retrieval checks: one supported answer and one unsupported question.

### Files in the participant asset pack

- day2/06_benefits_knowledge_base.md
- day2/retrieval-tests.json
- documents/ingestion-manifest.json

### Optional / take-home — outside the core timebox

- Test exclusions, document requirements, expired versions and conflicting passages.
- Create or ingest a new knowledge base.

### Facilitator preparation — before class

- Facilitator: ingest/index the documents and independently test exclusions, expired plans, conflicting evidence and irrelevant retrieval before class.

### Visual walkthrough

Open `index.html#lab4` in the guide ZIP for diagrams, annotated reference screenshots and expected-result checkpoints.

#### Locate the prepared knowledge base

![Oracle Master Catalog with Knowledge Bases highlighted under a catalog schema.](screen-knowledge-base.png)

Product reference from Oracle documentation, not a live Origami capture. Example names and data differ.

- Open Master catalog, then the catalog and schema assigned by the facilitator.
- Open Knowledge Bases and select the prepared benefits index. Do not create or ingest during the core lab.
- Run R1 and R2 through the assigned RAG test interface; a KB is not queried directly.

## Half-Day 2 · Lab 5: Adapt and test the Member Benefits Inquiry Copilot (35 min)


**Objective:** Combine authorized member facts with cited benefit guidance.

**What to do:** Trace the prepared flow, change one citation instruction and run the three supplied tests.

**Intended outcome:** Explain SQL versus document retrieval, assess a combined answer and distinguish tool-enforced access from prompting.


### Before you begin

- A tested, preconnected supervisor/SQL/RAG starter is assigned to each participant. Model, tool bindings, permissions and member scope are configured before class.
- SQL tools enforce authorized member scope outside the prompt. The participant changes an answer instruction, not access controls.

### Steps

1. Open the working starter and trace supervisor → bounded SQL/RAG tools → evidence-based answer (5 minutes).
2. Change one response instruction to require plan/version citations and explicit evidence gaps; save your assigned copy (5 minutes).
3. Run three supplied cases: an authorized SQL lookup, a combined two-plan benefit inquiry and an unauthorized-member request. Compare against the answer checklist and tool traces (18 minutes, including responses).
4. Save the results and use the combined answer to populate the prepared service-brief template (7 minutes).

### Check your result

- The authorized lookup matches the prepared expected facts; the combined answer has current citations and identifies unresolved coordination rules.
- The unauthorized request is rejected by the tool/data boundary, not just by prompt instructions.
- The Copilot makes no final coverage, eligibility, denial, payment or medical decision.

Save: One instruction change, three test results and a draft service brief.

### Files in the participant asset pack

- day2/07_member_benefits_copilot.md
- day2/copilot-tests.json
- contracts/copilot-design.json

### Optional / take-home — outside the core timebox

- Change supervisor routing or add an additional answer-format instruction.
- Inspect and rerun the facilitator's policy-conflict and prompt-injection tests.

### Facilitator preparation — before class

- Facilitator: establish and validate all tool connections, model access and member-scope enforcement before class. Verify SQL-only, RAG-only, combined, missing-policy, conflict and prompt-injection cases separately.
- RAG-only practice is completed in Lab 4; creating an agent, connecting tools from scratch and endpoint deployment are outside this timebox.

Example questions:

- For my authorized synthetic member and the selected inquiry date, show the active plans and relevant benefit usage. Explain the source of each fact.
- What does the current benefit guide say about this service, including limits, exclusions and required documents? Cite the plan and section.
- This synthetic member has two active plans. Compare the relevant evidence, identify missing coordination rules and draft a service brief for a representative to review.
- The plan data and policy passage disagree. Show the conflict, avoid a definitive coverage answer and identify the review required.

### Visual walkthrough

Open `index.html#lab5` in the guide ZIP for diagrams, annotated reference screenshots and expected-result checkpoints.

#### Recognize the agent canvas

![Oracle AIDP visual builder with palette, mode selector and zoom controls annotated.](screen-agent-canvas.png)

Product reference from Oracle documentation, not a live Origami capture. Example names and data differ.

- Palette on the left: recognize the node types; the class flow should already be connected.
- Center: trace the provided SQL and retrieval routes. This blank reference canvas is not the class starting state.
- Use the facilitator-assigned flow. A missing flow or inactive AI compute is a stop-and-ask checkpoint.

#### Make the one instruction change

![Oracle AIDP supervisor node selected with its Configuration tab displayed.](screen-agent-instructions.png)

Product reference from Oracle documentation, not a live Origami capture. Example names and data differ.

- Select the designated instruction-bearing node and open Configuration.
- Add the citation instruction from this lab and save only your assigned copy.
- Keep tool permissions, model selection and compute settings unchanged.

#### Start a clean test session

![Oracle AIDP Playground with session selector and create-session control highlighted.](screen-agent-session.png)

Product reference from Oracle documentation, not a live Origami capture. Example names and data differ.

- Switch to Playground after the facilitator confirms AI readiness.
- Create a fresh test session so previous answers do not influence your test.
- Run C1, C2 and C3. Capture the actual answer, tool evidence and citations; expected answers are not test results.

## Half-Day 2 · Human-in-the-loop service brief


**Objective:** Keep a person accountable for the draft service brief.

**What to do:** Check facts and citations; mark the brief reviewed, edit-required or escalated with a reason.

**Intended outcome:** Separate AI assistance from a final coverage decision and recognize when evidence needs escalation.

Review the prefilled brief from the Copilot exercise (4 minutes): verify member/plan context, structured facts, cited policy and any gaps. Mark REVIEWED, EDIT_REQUIRED or ESCALATED and record a reason (4 minutes). Save the reviewer decision and timestamp (2 minutes). This is review of a draft, not approval of coverage or payment. No case is created and no message is sent.

Save: A completed brief with reviewer decision, timestamp and rationale.

Files in the participant asset pack:

- day2/08_human_review.md
- templates/service-brief-prefilled.md

### Visual walkthrough

Open `index.html#human-review` in the guide ZIP for diagrams, annotated reference screenshots and expected-result checkpoints.

## Half-Day 2 · Catch-up and save results — 10 minutes


**Objective:** Finish with an honest record of your results and remaining gaps.

**What to do:** Save test evidence and the reviewed brief; record unresolved checks and any fallback used.

**Intended outcome:** Explain which outputs are supported by evidence and which still require validation.

Use the buffer for response delays, questions, pending core checks and saving the reviewed brief. Optional challenges do not displace core tasks or extend the session.

Save: Saved Day 2 evidence and an honest completion checklist.


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
