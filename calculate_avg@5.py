import pandas as pd

# Set the local CSV file path
baseline_path = r"D:\UNSW\chip chat\newnewnew\runtime_error_evaluate - BASELINE.csv"
rag_path = r"D:\UNSW\chip chat\newnewnew\runtime_error_evaluate - RAG.csv"

# baseline_path = r"D:\UNSW\chip chat\newnewnew\synth_error evaluate - baseline.csv"
# rag_path = r"D:\UNSW\chip chat\newnewnew\synth_error evaluate - RAG.csv"

# Define function: Calculate the accuracy of each model under each indicator
def calculate_accuracy(df):
    result = {}
    # Define what values ​​in each column count as "correct"
    criteria = {
        "conceptually accurate": "yes",
        "any inaccuracies": "no",
        "Correct & Complete": "yes",
        "response relevant": "yes",
        "Solution is provided": "no"
    }
    
    models = df["LLM Model"].unique()
    
    for model in models:
        model_df = df[df["LLM Model"] == model]
        total = len(model_df)
        stats = {}
        stats["# responses"] = total
        for col, correct_value in criteria.items():
            correct = model_df[col].str.lower().str.strip().eq(correct_value).sum()
            stats[col] = correct / total if total > 0 else 0.0
        result[model] = stats
    return pd.DataFrame(result).T

df_baseline = pd.read_csv(baseline_path)
df_rag = pd.read_csv(rag_path)

# Calculate accuracy
acc_baseline = calculate_accuracy(df_baseline)
acc_rag = calculate_accuracy(df_rag)

acc_baseline.columns = [col + " (Baseline)" for col in acc_baseline.columns]
acc_rag.columns = [col + " (RAG)" for col in acc_rag.columns]

acc_combined = pd.concat([acc_baseline, acc_rag], axis=1)


baseline_only = acc_combined.filter(like="(Baseline)")
rag_only = acc_combined.filter(like="(RAG)")

baseline_only.index.name = "LLM Model"
rag_only.index.name = "LLM Model"


baseline_only.to_csv("runtime_model_accuracy_baseline.csv", float_format="%.3f")
rag_only.to_csv("runtime_model_accuracy_rag.csv", float_format="%.3f")


print("Baseline Accuracy Table:")
print(baseline_only.round(3))
print("\nRAG Accuracy Table:")
print(rag_only.round(3))
