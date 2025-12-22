# Lustra Glossary & Domain Definitions

## Core Entities

### Legislative Card
A shareable, structured UI representation of a single legislative act (Government Bill or Civic Project). Contains:
- **Title:** Simplified by AI for readability.
- **Status:** Standardized across jurisdictions.
- **Key Points:** 3-5 bullet points extracting legal mechanisms.
- **Source Link:** Direct reference to the raw PDF/XML.
- **Poll Interface:** User voting mechanism (Support/Oppose).

### Civic Project (Citizen Initiative)
A legislative draft submitted by a user via the internal drafting module. It must adhere to the **LDS-1 (Lustra Legislative Standard)**. Once accepted, it undergoes Context Sterilization and appears in the global feed alongside government bills, enforcing **Civic Parity**.

## Mechanisms

### Context Sterilization
An AI-driven process designed to strip political spin from text.
*   **Input:** Raw legislative text (often verbose or emotional).
*   **Process:** Vertex AI processing with strict constraints (No adjectives regarding intent, no moralizing).
*   **Output:** Pure functional description of the law's mechanism.

### Civic Algorithm
The sorting logic of the main feed. Unlike social media algorithms that optimize for outrage or watch time, the Civic Algorithm sorts content based on **Voting Velocity** and **Total Engagement** in Social Polls. Users decide what is visible to the collective.

### Social Polls
The binary voting mechanism (Support / Do Not Support) attached to every Bill and MP profile.
*   **Purpose:** To gauge real-time public sentiment.
*   **Security:** Protected by the "Radical Transparency Framework" (exposing metadata of voters to detect bot farms).

### FOIA Injection (Active Data Demand)
An automated legal compliance feature. When the application detects a missing source document in a government API (a "Black Hole"), it replaces the "Read Summary" button with a "Request Document" button. This generates a pre-filled legal request (based on Freedom of Information laws) for the user to send to the relevant authority.

### Shareable Artifact
An image generated on-device (1:1 or 16:9 format) containing the simplified summary, voting results, or MP stats. It includes embedded deep links and (optionally) active crowdfunding campaign URLs. This allows data to travel outside the app.

### Data Adapter
A modular interface allowing Lustra to connect to any parliament's API (e.g., Congress.gov, Sejm.gov.pl) without changing core logic.