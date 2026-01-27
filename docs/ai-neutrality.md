# AI Neutrality & Hallucination Defense Protocol
**Version:** 1.1
**Status:** Active Production

Lustra uses Large Language Models (LLMs) exclusively as **text processing engines**, not as creative agents. We do not believe in "perfect neutrality." Instead, we engineer a specific **"Citizen Bias"**: ignoring political theater to focus exclusively on financial impact, civil liberties, and legal obligations.

## I. The "Iron Box" Constraints (Layer 1)
To ensure deterministic output, we apply the following hard constraints to every API call:

1.  **Role Definition:** System prompts rigidly define the AI as an "Apolitical Analyst" or "Legislative Clerk". It is forbidden from adopting a persona or expressing empathy.
2.  **Temperature 0.0:** Eliminates randomness. The same input must yield the same output.
3.  **JSON Enforcement:** The model is forced to output strict JSON schemas. This prevents "preamble bloat," conversational filler, and moralizing lectures.
4.  **Forbidden Patterns (Regex & Prompt Injection):**
    *   "This bill is good/bad because..."
    *   "Critics say..." / "Supporters say..." (We do not report on discourse, only on the legal text).
    *   Speculation on future political fallout.

## II. The Generalizer-Judge-Surgeon Pipeline (Layer 2)
We do not trust generative models. We trust verification loops. Our architecture uses a multi-agent system to detect and excise hallucinations before they reach the database.

### Workflow Diagram
```mermaid
graph TD
    Input[Legislation Source] --> Selector{Length > 20k Tokens?}
    Selector -->|No| Flash[Generalizer: Flash (System 1)]
    Selector -->|Yes| Pro[Generalizer: Pro (System 2)]
    Flash -->|Draft JSON| Judge[The Judge: Flash Lite]
    Pro -->|Draft JSON| Judge
    Judge -->|Fact Check| Decision{Pass?}
    Decision -->|YES| Publish[(Firestore)]
    Decision -->|NO| Loop[Retry Loop]
    Loop -->|Fail < 2x| Flash
    Loop -->|Fail > 2x| Surgeon[The Surgeon: Pro]
    Surgeon -->|Grounding Repair| HTMLready
```

### Agent Roles

#### 1. The Generalizer (Drafter)
*   **Model:** Gemini Flash (Short texts) / Gemini Pro (Long texts).
*   **Task:** Compress legal jargon into plain language (EL5).
*   **Constraint:** Must output in 8 languages simultaneously within a strict JSON structure.
*   **Bias Setting:** "Citizen Perspective" – Prioritize wallet impact and legal duties over preamble fluff.

#### 2. The Judge (Auditor)
*   **Model:** Gemini Flash Lite (Heuristic-focused).
*   **Task:** Binary Fact-Checking. It does not "read" the law; it compares the Source Text vs. The Summary.
*   **Detection Protocol:**
    *   **Fabricated Entities:** Checks if names, dates, amounts, and organizations in the Summary exist in the Source.
    *   **Logical Contradiction:** Checks if "bans" became "mandates".
*   **Output:** `is_valid: boolean`, `issue: "fabricated_entity" | "contradiction" | "none"`.

#### 3. The Surgeon (Fixer)
*   **Model:** Gemini Pro (High Reasoning).
*   **Task:** Executed ONLY if the Judge flags an error.
*   **Fundamental Rule:** "NO NEW INFORMATION". The Surgeon cannot write new content. It can only excise the hallucinated sentence or rewrite it using direct grounding from the source text.
*   **Procedure:** Sentence-by-sentence verification against the provided Source Text.

## III. Empirical Findings & Design Decisions

### The "Smart Model" Paradox
During development (Audited Q3 2025), we observed that higher-reasoning models (GPT-4, Gemini Pro) performed **worse** on short, simple bills than faster models.
*   **Observation:** When given a simple task, "smart" models tend to over-abstract or philosophize, missing concrete details (e.g., omitting a specific fine amount because it deemed it "trivial detail").
*   **Solution:** We use "dumber," faster models (Flash) for initial drafting of short texts to ensure literal adherence to facts, and reserve "smart" models (Pro) strictly for long-context comprehension and the "Surgeon" repair role.

### The "Citizen Bias"
Neutrality is often confused with "both-sidesism." We reject this. If a bill raises taxes by 10%, a "neutral" summary might say "The bill adjusts fiscal policy."
Lustra's **Citizen Bias** mandates: "The bill increases income tax by 10%."
This is an engineering decision: **Precision > Politeness.**

## IV. Verification for Users
*   **Source Linking:** Every summary contains a direct `[Source]` deep link to the government domain (`.gov`, `.pl`, etc.). The AI is never the final authority; the document is.
*   **Open Source:** This pipeline logic is available for inspection in our tech tab.