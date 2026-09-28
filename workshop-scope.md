# Origami Health — workshop scope and reference comparison

This guide is a prepared-assets adaptation, not a one-to-one reproduction of every reference exercise. The reference contains a larger administrator setup and optional-extension curriculum. The two AIDP core sessions remain 90 minutes each; visual aids do not add mandatory tasks or time. Day 3 retains the reference's six-step OAC core on a separate synthetic dataset, with the source's unverified 45-minute estimate.

| Area | Reference workshop coverage | Current Origami treatment |
|---|---|---|
| Administrator Lab 0 | Compartment, policies, storage, workbench, catalogs, schemas, folders, compute and OAC setup | Pre-class administrator preparation; not a public click-by-click provisioning lab. Live identities and bindings stay private. |
| Bronze / Silver / Lakehouse | Notebook runs, workflow creation, dependencies, successful-run screenshots and a claims star handoff | Core notebook execution and validation retained; data adapted to claims and member benefits. Workflow authoring and live-run screenshot walkthrough remain outside the core. |
| Workflow orchestration | Create Bronze → Silver → Gold → Lakehouse tasks and inspect run outputs | Dependency illustration added; not an equivalent hands-on workflow-building exercise. |
| ML lifecycle | Train/test, experiments, metrics, parameters, model registration and batch scoring | Core uses a prepared scorer and human interpretation. Native experiment/registry build remains preparation or extension; registered-model parity is not verified. |
| Knowledge base | Create KB, add document source, configure ingestion and inspect completed jobs | Core tests prepared retrieval and citations. Ingestion construction is facilitator preparation; live Origami retrieval remains pending. |
| Agent construction | Configure supervisor, SQL/RAG executors and tools; attach compute; deploy; test | Core traces a prepared flow, edits one instruction and tests it. Full construction/deployment is not included in the 35-minute exercise; live Origami Copilot remains pending. |
| JSON / spatial | Dedicated context-extension notebooks, target table, validation and enriched analytics | Not ported as a runnable Origami lab; listed only as potential follow-up. |
| Facility Access DIY | Independent dashboard challenge on facility/access data | Not included in the core or current downloadable Origami exercises. |
| OAC | Connection, star dataset/profile, indexing, Executive Overview and Assistant | Six-step core retained. Separate original synthetic dataset, renamed objects, visual build specification and checks. No live Origami OAC workbook/export yet. |
| Visual evidence | Extensive screenshots of reference environment setup, workflows, results, ML, KB, agents and OAC | Concept diagrams and attributed Oracle UI references. Actual Origami result captures remain a gap; illustrative screenshots do not prove deployment. |
| Downloads and previews | PDF execution guide, browser asset viewer, notebook-only/SQL-only/raw/offline packs | Self-contained HTML/Markdown guide ZIP, complete AIDP participant ZIP and separate OAC ZIP. No standalone PDF or browser notebook/SQL viewer. Use the full AIDP pack because helpers and bindings are required. |
| Closeout | Final explanation and workshop quality checklist | Concise three-day learning check added; business discovery stays in separate slides/Q&A. |

## Priority follow-ups

1. Capture approved, sanitized Origami screenshots during a successful rehearsal: notebook outputs, Lakehouse results, KB ingestion/retrieval and Copilot tool traces. Add the actual OAC canvas after the presenter prepares it.
2. Prepare optional facilitator appendices for workflow authoring, full ML lifecycle and KB/agent construction without changing the 90-minute core.
3. Port JSON/spatial and the independent facility challenge only if an extended session is requested. They require their own data contracts, assets and tests.

## Source and interpretation

Compared against the [reference workshop source](https://github.com/Jayaramu24/public-healthcare-AIDP-workshop/blob/cea60a1cdb07e0f44b5db6f5b33407c2db56e97c/index.html), whose main revision was checked on 2026-09-28. The reference's screenshots document its example environment; they are not evidence that Origami is deployed or tested. Publisher and retail-opportunity exercises are not part of the reference six-step OAC core adopted here.
