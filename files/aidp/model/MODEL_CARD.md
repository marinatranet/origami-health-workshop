# Prepared synthetic investigation-priority model

Version: origami-review-logistic-1.0. Standardized logistic regression, three point-in-time inputs: log submitted amount, missing-attachment signal and pre-existing duplicate-invoice signal. The label is synthetic review need, not claim denial, proven fraud or a coverage outcome. No member demographics are used.

Prepared locally with fixed seed 42. Training events precede April 2026 and labels must be observed by the training cutoff. April validation labels must be mature by May; May/June is held-out test data. Preprocessing is fit on training only. Hyperparameters and threshold 0.5 are fixed; the test period does not select them. Locally computed metrics and no-skill prevalence are in local_evaluation.json. This is not customer performance and probability calibration/fairness are not established.

Class activity: score the 720 accepted claims and explain one flag. C0601 is a deliberately legitimate high-value example. Coefficient/reason contributions are non-causal.

Artifact: portable JSON learned weights and preprocessing. SHA-bound pure-Python scorer is in shared/origami_core.py; no pickle or downloaded executable model. Local serialized-score parity is tested. MLflow logging, registration, registered-model parity, runtime performance, native lineage and endpoint deployment remain NOT VERIFIED. Do not describe this file as a registered or deployed model. Admin training is separate from participant scoring and does not approve/promote a model.
