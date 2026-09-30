# Origami Health AIDP workshop - execution pack

Use the HTML/PDF guide for the required lab sequence; OAC is at the end.

1. Start from your preloaded participant folder. Restore only missing notebooks.
2. If restoring, unzip this pack, use AIDP Upload in your own named folder, and
   set the configuration values from participant_configuration.md in each file.
3. Run notebooks 01 -> 02 -> 03 -> 04 manually; validate the Claims star schema.
4. Run 02B and 03B after the context DDL/admin catalog-refresh handoff.
5. Run 05 for historical train/test/evaluate/score/reload; register its real fitted model.
6. Build the five-task workflow only after manual runs pass. RAG/agent testing is separate.
7. Use 99 only when you want sample rows, persisted counts or distinct values.

Notebook numbers identify files, not labs. SQL files run in Oracle Database
Actions as the assigned schema owner, not ADMIN. Do not grant wide privileges,
truncate tables or overwrite other participants' output. The supplied loader
is safe for same-input reruns, not general CDC or changing dimension keys.

The pack deliberately excludes obsolete ML, Kafka/GoldenGate and bulk-admin
scripts. ML scores stay in your volume; no automatic ML score serving in OAC.
See VALIDATION_NOTES.md for verified evidence and remaining readiness checks.
