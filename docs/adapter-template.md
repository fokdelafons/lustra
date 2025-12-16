# 🔌 Data Adapter Specification (LDS-1 Backend Standard)

To add a new country to Lustra, you don't need to touch the mobile app code. You only need to implement a **Data Adapter** in the backend (Cloud Functions) that fetches data from your country's official API and saves it to Firestore following this schema.

## 1. Naming Convention
*   **Prefix:** Use the ISO 2-letter country code (e.g., `us`, `pl`, `de`, `ca`).
*   **Collections:**
    *   `{prefix}_legislations` (Bills)
    *   `{prefix}_votes` (Voting records)
    *   `{prefix}_deputies` (MPs/Senators)
    *   `{prefix}_metadata` (Config, current term, checkpoints)

---

## 2. Required Functions (The 7 Pillars) - this is the proposition, the most important is output to database!

You need to implement the following scheduled functions. Use the US/PL implementation as a reference.

### 1. `updateLegislations` (The Indexer)
**Goal:** Fetch the list of recent bills.
*   **Source:** Official API List Endpoint.
*   **Suggestion:** Works best as fast lists saver for data, that don't change, like ID.
*   **Firestore Output (`{prefix}_legislations`):**
    ```json
    {
      "id": "{term}_{bill_number}", // Unique ID, process id might also work
      "documentType": "HCONRES", // or just bill or resolution if there is no process
      "titleOfficial": "Official Title of the Bill",
      "term": 10, // Parliamentary Term Number
      "printNumber": "123", // Original ID
      "lastUpdated": Timestamp
    }
    ```

### 2. `updateLegislationsStatus` (The Detailer)
**Goal:** Get the raw text (PDF/XML) and current status.
*   **Source:** Bill Details Endpoint.
*   **Suggestions:** It is possible that it has to read existing database, to check if there is a record, and if there is not - create one, for a flag.
*   **Firestore Update:**
    ```json
    {
      "fullContent": "https://api.gov/bill/123/text.xml", // CRITICAL for AI, XML's are bests.
      "attachmentUrls": ["https://api.gov/bill/123.pdf"], // Used as official source for end user.
      "status": "In Committee / Passed / Rejected", // if there is big amount of statuses overall - consider adding subStatus as well (accepted, rejected, process, calendar)
      "documentDate": Timestamp, // newest status
      "documentType": "HCONRES", // if there is big amount of documentTypes overall - consider adding subType as well (resolution, bill)
      "processStartDate": Timestamp,
      "popularity": 0, // Default
      "summaryGeneratedAt": null, // We do summaries on initial project and final one, to save costs. Reset flag, when status is final.
      "noDocument": true, // flag for mini-FOIA request in the front end if there is no fullContent. Change to false ASAP after getting fullContent.
      "lastUpdated": Timestamp,
      "description": "Short official description", // optional
      "relatedPrintIds": "Map for attachments, amendmends" // optional

    }
    ```

### 3. `updateDeputies` (The People)
**Goal:** Sync list of active MPs.
*   **Source:** Member Endpoint.
*   **Firestore Output (`{prefix}_deputies`):**
    ```json
    {
      "id": "{term}_{deputy_id}", // unique ID with term
      "active": true,
      "fullName": "John Doe",
      "club": "Party Name",
      "district": "New York",
      "imageUrl": "https://gov.site/photos/jdoe.jpg",
      "birthDate": "1980",
      "parliamentaryHistory": {
        // Map of past terms/parties
      }
    }
    ```

### 4. `updateVotings` (The Accountability)
**Goal:** Sync voting results and individual MP decisions.
*   **Phase A (Summary to `{prefix}_legislations`):**
    ```json
    {
      "votesFor": 250,
      "votesAgainst": 100,
      "votesAbstain": 10,
      "notParticipating": 40,
      "votingNumber": 55,
      "votingUrl": "https://gov.site/votes/55.xml"
    }
    ```
*   **Phase B (Details to `{prefix}_votes`):**
    ```json
    {
      "term": 10,
      "votingDate": Timestamp,
      "participantIds": ["deputy_10_001", "deputy_10_002"],
      "participants": [
        { "deputyId": "deputy_10_001", "vote": "YES", "club": "Party A" },
        { "deputyId": "deputy_10_002", "vote": "NO", "club": "Party B" }
      ],
      "id": "117_HCONRES_11",
      "lastUpdated": Timestamp,
      "documentType": "HCONRES",
      "{prefix}"_ai_title: "Congress Can Assemble Outside Washington D.C. in Emergencies" // Save all ai titles from phase A document here
    }
    ```

### 5. `updateInterpellations` (The Optional Activity)
*Note: If your country doesn't have interpellations, use Sponsorships or any other additional activity and create new collection.
**Goal:** Link MPs to Bills they authored/sponsored.
*   **Firestore Update:** Add references to the Deputy document or Legislation document.

### 6. `updateFutureProceedings` (The Calendar)
**Goal:** What is happening next?
*   **Source:** Calendar/Schedule Endpoint.
*   **Firestore Update (`{prefix}_legislations`):**
    ```json
    {
      "status": "Scheduled for Reading",
      "upcomingProceedingDates": ["2025-12-20", "2025-12-22"]
    }
    ```

### 7. `updateTermMetadata` (The Config)
**Goal:** Get the current term number dynamically.
*   **Firestore Output (`{prefix}_metadata/general_config`):**
    ```json
    {
      "currentTermNumber": 119
    }
    ```

---

## 3. Implementation Tips & Best Practices

1.  **Idempotency is King:** Cloud functions can retry automatically. Your code must handle re-runs gracefully (use `merge: true` in Firestore).
2.  **Scope by Term:** Always scope your requests to the current Parliamentary Term to avoid fetching 50 years of history.
3.  **Performance:** If the API returns massive lists, implement pagination or date-based filtering (`lastUpdated > X`). Avoid fetching unchanged documents. Or implement two functionalities - initial database update + catchup. So far it was problem only in the US.
4.  **Flexible Architecture:** The 7 functions above are the *Goal*, not the strict rule. If your country's API splits data differently (e.g., separate endpoints for status and text), feel free to split `updateLegislationsStatus` into two helper functions. Sometimes you have to be creative.
5.  **Flags & Triggers:** You might need extra internal flags (e.g., `needsProcessing: true`) to coordinate between functions. Document them.
6.  **Need Help?** If you are stuck on mapping specific data structures, open a Discussion. We can share snippets from our private US/PL adapters as a reference or help design the logic.

## 4. Example: US Congress Adapter
*(Reference implementation logic)*

*   **API:** `api.congress.gov`
*   **Auth:** API Key Header
*   **Mapping:**
    *   `bioguideId` -> `deputyNumber`
    *   `rollNumber` -> `votingNumber`
    *   `partyName` -> `club`

**Ready to start?**
1.  Open an Issue `[New Country] Adapter for X`.
2.  Develop on your own **local Firebase Emulator** or a free Firebase project.
3.  Submit a Pull Request. Once approved, **we will deploy it to the Lustra Production Cloud**.

