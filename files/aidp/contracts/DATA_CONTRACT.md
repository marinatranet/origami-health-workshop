# Origami data contract v1

Seven synthetic source CSVs use explicit string schemas at landing. Monetary source values are PHP decimal strings; Silver converts to integer centavos, never relabels another currency. One PHP equals 100 centavos. Source IDs are stable. Gold joins claims to their billed enrollment, never to all active member plans. Monthly grain is service month × provider × service; numerator counts and amount sums reconcile to claim detail. Member-plan grain is enrollment interval, not member.

Snapshot contract: bounded full overwrite only in the assigned disposable Delta paths. External Lakehouse tables must be pre-created; identical snapshot rows are inserted only when missing, and any changed or unexpected existing row stops the load. No concurrent writers per participant. This is not general CDC/upsert or production retention design.

Fixture: 725 raw claim rows = 720 accepted + 4 rejected + 1 deterministic duplicate. Duplicates are separated before DQ by lowest source_record_id per claim_id. Accepted/rejected/duplicate source IDs are disjoint and exhaustive. Bronze retains original fields and adds ingestion metadata; business fingerprints exclude only Bronze metadata. Invalid data is not silently corrected.

Gold tables, natural keys and exact expected fingerprints are generated from the fixed seed. Date strings are ISO calendar dates; effective intervals are inclusive. BASE/PLUS 2026 are current at the snapshot; BASE 2025 is historical. Benefit usage is authoritative synthetic input and is not inferred by summing claims.

Source reference keys, model labels and local fixture checks are validated offline. Live Spark schemas, Delta persistence, database grants, native lineage, registered-model parity and agent retrieval remain separate acceptance gates. OAC/household data is outside this asset version.
