# RootCause-Bench: LLM-Based Analysis of Hardware Design Failures

This is the official repository for the paper:

> **"Towards LLM-based Root Cause Analysis of Hardware Design Failures"**  
> _Siyu Qiu, Muzhi Wang, Raheel Afsharmazayejani, Mohammad Moradi Shahmiri, Benjamin Tan, Hammond Pearce_  
> [IEEE Xplore Link] | [arXiv Link Coming Soon]

---

## 📦 Project Overview

This repository contains:

- 🐞 A manually labeled dataset of **34 hardware design bugs** (19 synthesis, 15 runtime)
- 💬 Prompt/response logs for four LLMs
- 🧠 RAG-enhanced model interface for improved debugging
- 📊 Evaluation scripts for **Pass@5** and **Avg@5** metrics

---

## 📂 Folder Descriptions

### `prompt/`
Contains structured prompts for each bug scenario.
- `runtime_errors/`: 15 bugs with runtime-related failure prompts.
- `synthesis_errors/`: 19 bugs with synthesis failure prompts.

Each bug folder typically contains:
- LLM prompt as input

### `runtime_errors/` & `synthesis_errors/`
HDL bug directories.
Each folder (e.g., `bug_01/`) contains:
- `rtl/`: Faulty RTL (`.v` or `.vhd`)
- `testbech/`: testbench (for runtime error)
- `llm_response/`: including all the model of LLM response
- `vivado/`: xdc file and vivado project

---

## 📜 Script Descriptions

| File                      | Description                                                  |
|---------------------------|--------------------------------------------------------------|
| `calculate_pass@5.py`     | Computes **Pass@5**: at least one correct fix in top 5       |
| `calculate_avg@5.py`      | Computes **Avg@5**: average score across top 5 responses     |
| `deepseek_runtime.py`     | Uses DeepSeek model for runtime prompts            |
| `deepseek_synth.py`       | Uses DeepSeek model for synthesis prompts                    |
| `main_runtime.py`         | Uses OpenAI model for runtime prompts           |
| `main_synthesis.py`       | Uses OpenAI model for synthesis prompts                                 |

---

## 📊 Supporting Files

- `error_list.xlsx`: Labels and bug info for runtime errors (e.g., bug type, error output).
- `error_list_synth.xlsx`: Same for synthesis errors.
- `run_model_accuracy_baseline.xlsx`: Accuracy stats for baseline runs.
- `run_model_accuracy_rag.xlsx`: Accuracy from RAG-enhanced prompts or retrieval.

---

## 📬 Contact

Maintainer: **Siyu Qiu**
Email: *siyu.qiu1@student.unsw.edu.au*

