# Origami Health — Hands-on Data, Analytics & AI Workshop

Each hands-on session lasts 80 minutes. Half-Day 1 includes a 20-minute setup check (allow 15–20 minutes); the remaining 60 minutes cover the labs. Separate slide decks, breaks and Q&A are outside this guide. Keep the complete workshop day within three hours; start times are flexible and are not displayed.

AIDP pilot guide: runnable lab downloads, environment deployment and timed validation are still in preparation.

Claims, Benefits, Provider and Member Operations: build trusted data, investigate unusual claims, answer benefit inquiries with evidence, and explore operational and retail opportunities.

## Half-Day 1 · Setup and access check — allow 15–20 minutes

Use this 20-minute allowance to sign in to the prepared AIDP workspace, confirm your participant folder and isolated schema, open starter notebook 01, select the already-running compute and run the supplied read-only access check against the source volume and Lakehouse. Confirm the recovery snapshot and where to save evidence. This is an access check, not platform provisioning or software installation. Ask the facilitator to resolve failed checks; if still blocked, pair with a working participant and record what remains unresolved. If setup finishes in 15 minutes, use the remaining five minutes as lab support buffer within the same 80-minute block.

Save: A completed access checklist or a recorded blocker and agreed paired-work fallback.

## Half-Day 1 · Lab 1: Build Bronze and Silver HMO data products (25 min)

Turn claims, members, enrollment, plans and provider inputs into traceable, conformed data products.

### Before you begin

- Assigned participant folder and schema; running Spark compute; prepared synthetic source files and starter notebooks.
- The facilitator supplies the volume root and participant identifier. Sources include CSV plus JSON document-extraction signals; provider GeoJSON is an extension.

### Steps

1. Open starter notebook 01 and confirm your participant paths and snapshot date using the setup checklist.
2. Run the prepared Bronze cells. Inspect source lineage fields and the supplied input/accepted/rejected count summary.
3. Run the prepared Silver cells; inspect date normalization, deduplication and one quarantined invalid reference. Transformations and joins are provided, not authored from scratch.
4. Inspect one member with multiple dated plan enrollments and one flattened document-evidence record. Save the count/key check summary for Lab 2.
5. If execution exceeds the timebox, use the facilitator's validated recovery snapshot and label it clearly; record the pending live run for follow-up.

### Check your result

- Counts balance: input records equal accepted plus rejected after the documented deduplication policy.
- Every accepted foreign key resolves; invalid references are quarantined with reasons.
- Two participant runs write to different paths; the source files remain unchanged.

Save: Bronze and Silver datasets, a reject report and a source-to-output record trace.

## Half-Day 1 · Lab 2: Publish Claims and Benefits data to AI Lakehouse (25 min)

Expose consistent data for claims analysis, claim-level investigation and authorized member-benefit inquiry.

### Before you begin

- Lab 1 passes; participant tables, grants and the external catalog are prepared.
- The participant model includes both claims analytics and member/plan benefit access; monthly claim aggregates alone cannot answer individual member questions.

### Steps

1. Inspect the supplied grain diagram for claims, enrollment intervals and benefit versions.
2. Run the prepared notebook 03 Gold cells, then notebook 04 Lakehouse cells, against your assigned schema. Use the validated recovery snapshot if a run cannot finish within the timebox; record the live work still pending.
3. Run the supplied reconciliation query pack and compare claim counts and amounts with expected results. Inspect the key-quality report and one dated member-plan lookup.
4. Save the results and inspect prepared unchanged-source rerun evidence. Workflow dependencies and access controls are covered in the following governance checkpoint; full rebuild and rerun testing are extensions.

### Check your result

- Claims totals reconcile without fan-out; rates use total numerator divided by total denominator.
- Member-plan lookup returns only the assigned member and plans active on the selected date.
- Sequential rerun of unchanged fixtures produces no duplicate target rows; changed-source update behavior is tested separately before being claimed.

Save: Governed Claims and Benefits views, reconciliation evidence and a documented Day 2 data snapshot.

## Half-Day 1 · Governance exercise

Trace one synthetic claim from its source file through Silver to an approved Gold view. Inspect the prepared engineer, analyst and service-representative roles. Verify member identifiers and benefit usage are exposed only where needed. Compare existing controls with the target architecture; roadmap items such as richer lineage, ontology or agent discovery are discussion topics until availability is verified.

Save: A record trace and a role-to-data access check.

## Half-Day 2 · Lab 3: Score claims anomalies for investigation (15 min)

Prioritize unusual claims for investigator review and explain the supporting signals.

### Before you begin

- Prepared features, synthetic investigation outcomes, a seeded experiment and pre-trained model. Full training and AutoML configuration are facilitator preparation or take-home activities.
- A claim denial is not a fraud label. The original denial-risk notebook is a learning reference, not this lab's fraud model.

### Steps

1. Inspect the prepared feature snapshot and label definition. Check that the time-based split excludes post-scoring decisions and investigator outcomes from input features.
2. Run the prepared scorer and inspect the seeded experiment's baseline comparison. Full training and AutoML setup are take-home extensions.
3. Inspect the supplied evaluation: precision, recall and precision-at-review-capacity on held-out synthetic data. For anomaly-only scores, inspect ranking without claiming supervised accuracy.
4. Inspect the resulting queue: one current score per claim and model version, reason codes, scoring timestamp and review priority.
5. Open two flagged and one unflagged example. Explain one false positive and how review capacity changes the threshold.

### Check your result

- Every scored claim has a model/version reference and an interpretable evidence trail.
- Registered model and batch scorer match on the same test rows; a rules baseline is labelled separately.
- The queue says suspected anomaly or review priority; it never asserts that a member or provider committed fraud.

Save: A scored investigator queue and a short model evaluation record.

## Half-Day 2 · Lab 4: Test the Benefits Knowledge Base (15 min)

Retrieve the right benefit passage for the right plan, service and effective date.

### Before you begin

- Fictional Origami Health benefit guides, plan schedules, exclusions, FAQs and service procedures with document IDs, versions and effective dates.
- A validated, pre-ingested knowledge base and participant permissions are ready before class. Source configuration, ingestion and index creation are facilitator preparation or take-home extensions.

### Steps

1. Open the prepared knowledge base. Inspect its manifest, plan IDs, document versions, effective dates and source configuration.
2. Run three supplied retrieval questions covering a service limit, an exclusion and supporting documents. Check the cited plan, version and section/page.
3. Run one unsupported-service question and inspect the prepared expired-document and conflicting-evidence test results. Record gaps or escalation rather than accepting invented policy.
4. Save the retrieval evaluation sheet. Creating and ingesting a new index is a take-home extension.

### Check your result

- Three expected answers cite the correct source and version.
- An out-of-scope or unsupported question is identified correctly.
- An expired or mismatched plan document is not treated as current benefit evidence.

Save: A benefits knowledge base and a retrieval evaluation sheet.

## Half-Day 2 · Lab 5: Complete the Member Benefits Inquiry Copilot (40 min)

Help a service representative answer an inquiry by combining authorized member-plan facts with cited benefit documents.

### Before you begin

- Labs 2 and 4 pass; AI compute, a starter flow, approved SQL tools and three evaluation cases are prepared. Participants complete routing, evidence instructions and connections rather than author every component from scratch.
- SQL tools use approved views and enforce member scope through trusted session/tool parameters, not through a member ID accepted freely from the prompt.

### Steps

1. Open the starter flow. Complete supervisor routing for member/plan questions to SQL, document questions to RAG and combined questions to both.
2. Connect the prepared Member and Plan SQL tools and Benefits RAG executor. Inspect trusted member scope, plan/date filtering and required document/version/section citations.
3. Complete the response instructions: member context, active plans, structured and document evidence, gaps and recommended review step.
4. Run three required cases: a SQL-only lookup, a RAG-only benefit question and a combined two-plan inquiry. Flag unresolved coordination-of-benefits rules without automatically selecting coverage.
5. Inspect the facilitator's prepared negative-test traces for unauthorized member access, missing policy, conflicting versions and instructions embedded in documents. Rerun the unauthorized-access case; additional negative tests are fast-finisher exercises. All negative tests must pass during facilitator preparation.
6. Save the flow and evaluation evidence. Pass the combined answer to the service-brief exercise for human review.

### Check your result

- SQL totals and member-plan facts match the governed views; policy statements have resolvable citations.
- Unauthorized member requests fail at the tool/data boundary.
- No final coverage, eligibility, denial, payment or medical decision is made by the Copilot.

Save: Supervisor + Member/Plan SQL + Benefits RAG flow, evaluation record and draft service brief.

Example questions:

- For my authorized synthetic member and the selected inquiry date, show the active plans and relevant benefit usage. Explain the source of each fact.
- What does the current benefit guide say about this service, including limits, exclusions and required documents? Cite the plan and section.
- This synthetic member has two active plans. Compare the relevant evidence, identify missing coordination rules and draft a service brief for a representative to review.
- The plan data and policy passage disagree. Show the conflict, avoid a definitive coverage answer and identify the review required.

## Half-Day 2 · Human-in-the-loop service brief

Review the prefilled service-brief template from the Copilot exercise. Verify a synthetic member reference, inquiry date, active plans, data evidence, document citations, missing facts, proposed next step and owner. Begin in DRAFT. A representative marks REVIEWED, EDIT_REQUIRED or ESCALATED and records a rationale. Any case creation or message sending is a separate sandbox integration; this exercise ends with a reviewed draft.

Save: A completed brief with reviewer decision, timestamp and rationale.
