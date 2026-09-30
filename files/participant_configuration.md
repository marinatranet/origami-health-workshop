# Participant configuration handoff

Completed privately by the administrator. Example names in screenshots are illustrative.
No passwords, secrets, wallet contents or access tokens belong in this file.

| Value | Assigned value |
|---|---|
| AIDP login URL and region | Administrator supplies |
| Workspace | Administrator supplies |
| participant_id / named folder | Administrator supplies |
| Spark compute / AI compute | Administrator supplies |
| volume_base: exact shared raw /Volumes mount | Administrator supplies |
| output_base: exact personal /Volumes mount | Administrator supplies |
| target_catalog: external Lakehouse catalog | Administrator supplies |
| target_schema / Database Actions username and URL | Administrator supplies |
| table_prefix | origami |
| Standard catalog and schema for models/KB | Administrator supplies |
| Experiment | ORIGAMI_<participant_id>_Claims_Denial_Risk |
| Model name | Unique administrator-approved participant model name |
| Knowledge base and agent name | Unique administrator-approved participant names |
| Approved LLM region/model | Administrator supplies; Osaka/Command A is a tested example |
| OAC URL / connection / workbook | Administrator supplies |

Shared raw volume children: raw/, raw_json/, raw_spatial/, documents/.
Personal output volume children: bronze/, silver/, gold_stage/, ml/.
These are separate mounts even if the underlying bucket is shared.
The administrator creates IAM/AIDP permissions; a folder name or Python guard
does not enforce isolation. Check with a participant account, not ADMIN.

Keep preloaded values when they match this handoff. Restored common downloads
fail until placeholders are replaced. Save settings in every notebook before
workflow execution: interactive variables do not carry between tasks.
