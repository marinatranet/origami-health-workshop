# Validation scope and readiness checks

This edition includes the approved required-lab sequence, illustrative deployment
names and AI Powered Business Analytics as the final lab. All source data is
synthetic. Lab 0 is administrator-owned; participant access remains scoped.

## Verified reference execution
- The reference five-task workflow completed Bronze, Silver, Gold, Lakehouse
  load and ML successfully. Context extension and agents are separate exercises.
- Claims: 622 fact rows, 1,400 submitted claims, 121 denied, submitted amount
  1,239,912.67. Reference-key and grain checks passed on the supplied snapshot.
- ML: 303 training, 110 held-out test and 102 batch-score rows. The fitted artifact
  was logged/reloaded successfully; an interactive run was registered. A new
  workflow run does not automatically register a model version.
- Combined SQL/RAG agent testing invoked both tools successfully. SQL executes
  a predefined query; it is not an arbitrary natural-language SQL agent.

## Before delivering this workshop
- Generic notebook downloads have explicit configuration placeholders and were
  syntax-checked, but were not rerun as newly imported generic downloads in this
  documentation revision. Validate an import with an isolated test participant.
- Verify effective folder, volume, catalog, compute, model and KB permissions
  with a participant account. Admin visibility does not prove isolation.
- Earlier context, KB and OAC screenshots remain product references, not fresh
  execution evidence for every tenancy. Validate assigned connections locally.
- Fresh Database Users/privilege and participant-permission form screenshots
  remain a documentation follow-up. Existing result screens do not show all
  creation fields. Follow administrator instructions rather than copying names.
- Browser visual QA of the revised sidebar remains pending; static links and
  scripts were checked, and the PDF was rendered and inspected.

## Boundaries
- Snapshot overwrites and missing-key append are not CDC and do not handle
  changing dimension keys or revised fact measures without a reviewed strategy.
- ML recall is 0.105 at threshold 0.5: a teaching baseline, not production claims
  decisioning. Scores stay in participant storage, not automatically in OAC.
- Agent validation is in Playground, not a production endpoint. Operational
  actions and claims decisions remain human-owned.
- Facility Access Daily is an independent design challenge, not a supplied or
  verified end-to-end Facility loader.
