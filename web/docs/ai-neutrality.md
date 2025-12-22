# AI Neutrality Architecture

Lustra uses Large Language Models (LLMs) exclusively as **text processing engines**, not as creative agents.

## The "Iron Box" Constraints
To ensure neutrality, we apply the following constraints to every API call:

1.  **Role Definition:** System prompt defines the AI as an "Apolitical Analyst" or "Legislative Clerk".
2.  **Temperature 0.0:** Eliminates randomness. The same input must yield the same output.
3.  **JSON Enforcement:** The model is forced to output structured JSON. This prevents "preamble bloat" and conversational filler.
4.  **Forbidden Patterns:**
    *   "This bill is good/bad because..."
    *   "Critics say..." / "Supporters say..." (We do not report on discourse, only on text).
    *   Speculation on future political fallout.

## Verification
*   **Logs:** We maintain logs of Input/Output for audit.
*   **Source Linking:** Every summary has a `[Source]` button leading to the government domain (`.gov`, `.pl`). The AI is never the final authority; the document is.