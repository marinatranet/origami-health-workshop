# Required workflow exercise

Complete the manual notebook and ML labs first. Use a unique participant job.
Create five Notebook tasks in this order:

| Task | Notebook | Successful predecessor |
|---|---|---|
| Bronze | 01_Bronze_Origami_Health.ipynb | None |
| Silver | 02_Silver_Origami_Health.ipynb | Bronze |
| Gold | 03_Gold_Origami_Health.ipynb | Silver |
| Lakehouse_Load | 04_Claims_Star_AI_Lakehouse_Load.ipynb | Gold |
| ML_Train_Test_Eval | 05_ML_Claims_Train_Test_Eval.ipynb | Lakehouse_Load |

Select each file from your named folder. Save participant parameters in every
file before running. Use the assigned Spark compute, 30-minute task timeout,
0 retries, maximum concurrency 1, manual execution and no schedule.
Set timeout and save each task before adding its successor.

Pending compute startup is normal. Success requires all five tasks terminal
Success plus persisted Lakehouse validation and ML_E2E_SUCCESS. A run with
failed tasks is not completion. Repair only the failed task and its dependents.

Snapshot overwrites and missing-key append are not CDC. Do not add changed
dimensions or late updates to this workshop load strategy. Agent and context
extension exercises are not tasks in this five-task workflow.
