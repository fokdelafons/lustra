# Lustra Civic Model

Lustra implements a layered civic system designed to restore agency to the citizen. It is not just a reader; it is an active tool for oversight and agenda setting.

## 1. The Participatory Layer (Civic Algorithm)
The "Front Page" of democracy should be decided by citizens, not editors or lobbyists.

*   **Logic:** The main feed defaults to "Popular Votes". Ranking is determined by the volume of interactions with the **Social Poll** module.
*   **Effect:** Legislation that is ignored by mainstream media but important to the community rises to the top.
*   **MP Accountability:** Member of Parliament profiles are ranked by user support, creating a real-time "Approval Rating" independent of election cycles.

### Social Polls & Anti-Farm (Radical Transparency)
To prevent bot farms from hijacking the Civic Algorithm, we do not rely on black-box blocking. Instead, we expose voting metadata to the community:
*   **Account Age Distribution:** Users can see if a spike in votes comes from accounts created <24h ago.
*   **Verification Status:** Votes are segmented by verified vs. unverified emails.
*   **Outcome:** Manipulation becomes visible and self-correcting through community scrutiny.

## 2. The Accountability Layer (FOIA Injection)
Many government APIs are incomplete or delayed ("Strategic Entropy"). Lustra converts this passive lack of data into active legal pressure.

*   **Trigger:** System detects a legislative event (e.g., Committee Vote) with a missing source file (`404` or `null`).
*   **Action:** The UI generates a "Demand Document" button.
*   **Payload:** A pre-filled Freedom of Information request (specific to the jurisdiction's law, e.g., Reg 1049/2001 in EU) targeted at the specific secretariat's email.
*   **Goal:** To make secrecy more administratively expensive than transparency.

## 3. The Distribution Layer (The Content Machine)
Lustra is designed to break the "App Silo". Information must travel where the people are (Social Media).

*   **Asset Generation:** The app renders high-quality images (Square/Story) of any Bill, MP, or Voting Record directly on the device.
*   **Context Export:** The share action copies a generated text block to the clipboard, including:
    *   The neutral summary.
    *   A deep link to the source.
    *   Relevant hashtags.
    *   *(Conditional)* A link to the active Crowdfunding Campaign if enabled via Remote Config.
*   **Philosophy:** We arm users with verified "Fact Cards" to win arguments and debunk disinformation on external platforms.

## 4. Civic Parity
In Lustra, a **Civic Project** (Citizen Initiative) is technically indistinguishable from a Government Bill. It uses the same data structure, the same AI analysis, and the same voting mechanism. This visual parity is intentional: it elevates citizen ideas to the level of state discourse.