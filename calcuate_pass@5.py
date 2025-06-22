import pandas as pd

# baseline_path = r"D:\UNSW\chip chat\newnewnew\synth_error evaluate - baseline.csv"
# rag_path = r"D:\UNSW\chip chat\newnewnew\synth_error evaluate - RAG.csv"

baseline_path = r"D:\UNSW\chip chat\newnewnew\runtime_error_evaluate - BASELINE.csv"
rag_path = r"D:\UNSW\chip chat\newnewnew\runtime_error_evaluate - RAG.csv"

criteria = {
    "conceptually accurate": "yes",
    "any inaccuracies": "no",
    "correct & complete": "yes",
    "response relevant": "yes",
    "solution is provided": "no"
}


def clean_dataframe(df):
    df.columns = [col.strip().lower() for col in df.columns]
    for col in df.columns:
        df[col] = df[col].astype(str).str.strip().str.lower()
    return df

def compute_pass_at_5(df):
    result = {}
    models = df["llm model"].unique()
    metrics = list(criteria.keys())

    total_bugs = len(df) // 20 

    for model in models:
        stats = {"# responses (n)": total_bugs * 5}
        failed_bugs_by_metric = {m: [] for m in metrics}

        for i in range(total_bugs):
            bug_block = df.iloc[i * 20 : (i + 1) * 20]
            model_block = bug_block[bug_block["llm model"] == model]

            # Sanity check
            if len(model_block) != 5:
                print(f"⚠️ Bug group {i} for model {model} has {len(model_block)} rows, expected 5.")

            for metric in metrics:
                correct_val = criteria[metric]
                values = model_block[metric]

                if not (values == correct_val).any():
                    failed_bugs_by_metric[metric].append(f"bug_{i}")
        result[model] = stats

    return pd.DataFrame(result).T

df_baseline = clean_dataframe(pd.read_csv(baseline_path))
df_rag = clean_dataframe(pd.read_csv(rag_path))

pass_baseline = compute_pass_at_5(df_baseline)
pass_rag = compute_pass_at_5(df_rag)


pass_baseline.to_csv("run_pass5_baseline.csv", float_format="%.3f")
pass_rag.to_csv("run_pass5_rag.csv", float_format="%.3f")

print("\n✅ Baseline Pass@5 Table:")
print(pass_baseline.round(3))

print("\n✅ RAG Pass@5 Table:")
print(pass_rag.round(3))
