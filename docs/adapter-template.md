# 🔌 Data Adapter Specification (LDS-1 Backend Standard)

Unified data adapter for Lustra system.

## 1. Naming Convention
*   **Prefix:** Use the ISO 2-letter country code (e.g., `us`, `pl`, `de`, `ca`).
*   **Collections:**
    *   `global_legislations/{prefix}` (Bills)
    *   `global_votes/{prefix}` (Voting records)
    *   `global_deputies/{prefix}` (MPs/Senators)
    *   `metadata/{prefix}` (Config, current term, checkpoints)

---

## 2. Required Functions (The 5 Pillars).

For completed implementation, Firestore has to function as follows.

### 1. `updateTermMetadata` (The Config)
**Goal:** Get the current term number dynamically. Save only.
*   **Source:** API:
*   **Firestore Output (`{metadata/{prefix}/general_config`):**
    ```json
    {
      "currentTermNumber": number
    }
    ```

### 2. `updateLegislations` (The Indexer)
**Goal:** Fetch the list of all term bills + save static outputs. Can mix with updateLegislationsStatus, if some are unavailable at generic list level. Save only.
*   **Source:** Official API List Endpoint for the whole term.
*   **Firestore Output (`global_legislations/{prefix}`):**
    ```json
    {
      "id": String,
      "documentType": String,
      "subType": String|null,
      "titleOfficial": String,
      "term": Number,
      "printNumber": String,
      "fullContent": String,
      "processStartDate": Timestamp,
    }
    ```

### 3. `updateLegislationsStatus` (The Detailer)
**Goal:** Get the raw text (PDF/XML) and current status, change flags. Read Firestore and Save data and flags. Very conditional.
*   **Source:** Bill Details Endpoint, accessed by ID.
*   **Firestore Update:**
    ```json
    {
      "attachmentUrls": Array of Strings, always xmls first, later htmls and pdfs at last,
      "status": String, unified for all jurisdictions, engine does it automatically: if there is new one and its different from last, save the old one as lastStatus: String and update,
      "statusText": String, raw status text from API for mapping unified status,
      "lastStatus": String,
      "subStatus": String, unified for queries,
      "popularity": number, if there is no data - always initialize as 0.
      "summaryGeneratedAt": boolean, null, only if it's not initialized,
      "noDocument": boolean, if there are no attachmentUrls - set to true. If there are, set to false.
      "lastUpdated": Timestamp, updated only if there is new data & changes.
      "lastContentUpdate": Timestamp, always initialize if its not created, always update, if there are new attachmentUrls,
      "needsTextUpdate": boolean, true, if there is no attachmentUrls available, false if the data is updated,
      "sponsorsProcessed": boolean, optional, only if sponsors data available in API,
      "upcomingProceedingDates": Array of strings perhaps? Optional anyway.

    }
    ```

### 4. `updateDeputies` (The People)
**Goal:** Sync list of active MPs. Save only.
*   **Source:** Member Endpoint + eventual List Endpoint.
*   **Firestore Output (`global_deputies/{prefix}`):**
    ```json
    {
      "id": String, our standard is term_deputyNumber, usually we have to build it,
      "deputyNumber": String,
      "active": boolean, true, if mandate is active, false if it's not,
      "fullName": String,
      "firstName": String,
      "lastName": String,
      "club": String,
      "clubHistory": Array of Strings,
      "district": String,
      "districtNum": number,
      "imageUrl": String,
      "birthDate": Timestamp,
      "memberType": String,
      "parliamentaryHistory": Map{
        clubs: Array
          Map
            party: String,
            startYear: number
        leadership: Array
          Map
            term: number,
            type: String,
        terms: Array,
          Map
            memberType: String,
            term: number,
        },
      "popularity": number, if there is no data - always initialize as 0.
      "previousNames": Array of Strings,
      "term": number,
    }
    ```

### 5. `updateVotings` (The Accountability)
**Goal:** Sync voting results, add data for documents and individual MP decisions.
*   **Phase A (Summary to `global_legislations/{prefix}`):**
    ```json
    {
      "votesFor": number,
      "votesAgainst": number,
      "votesAbstain": number,
      "notParticipating": number,
      "votingNumber": number,
      "votingUrl": String,
      "votingDate": Timestamp,
    }
    ```
*   **Phase B (Details to `global_votes/{prefix}/{legislativeID}/{prefix}_voting_records/{votingNumber}`):** - get missing from legislation doc.
    ```json
    {
      "term": number,
      "chamber": String,
      "votingDate": Timestamp,
      "participantIds": Array of Strings,
      "participants": Array/Maps/Strings[
        { "deputyId": "deputy_10_001", "vote": "YES", "club": "Party A" },
        { "deputyId": "deputy_10_002", "vote": "NO", "club": "Party B" }
      ],
      "id": String,
      "legislationId": String,
      "lastUpdated": Timestamp,
      "documentType": String,
      "{prefix}_ai_title": String,
      "titleOfficial": String,
      "notParticipating": number,
      "voteQuestion": String,
      "votesFor": number,
      "votesAgainst": number,
      "votesAbstain": number,
      "votesOther": number,
      "votingNumber": number,
      "votingUrl": String,
      "votingDate": Timestamp,
    }
    ```

---

## 3. Implementation Tips & Best Practices

1.  **Idempotency is King:** Cloud functions can retry automatically. Your code must handle re-runs gracefully (use `merge: true` in Firestore).
2.  **Scope by Term:** Always scope your requests to the current Parliamentary Term to avoid fetching 50 years of history.
3.  **Performance:** If the API returns massive lists, implement pagination or date-based filtering.
4.  **Flexible Architecture:** If your country's API splits data differently, feel free to split functions.
5.  **Flags & Triggers:** Use internal flags (e.g., `needsProcessing: true`) to coordinate.
6.  **Engine-Level State Management (CRITICAL):** Do not write logic for `lastStatus` or `lastUpdated` in your adapter. The **Core Engine (`smartBatchWrite`)** handles this automatically. You only provide the *current* state. If the engine detects a change, it will archive the old value to `lastStatus` and reset `summaryGeneratedAt` before saving.
7.  **Standard SANITIZE 1.0:** Every string must be cleaned. The Engine enforces this, but ensure your parser doesn't introduce broken Unicode or control characters. Clean data = better AI summaries.
8.  **Deterministic Identity:** IDs must be constructed as `TERM_DOCTYPE_NUMBER`. Always use `.toUpperCase()` and replace spaces with underscores. This prevents duplicates like `10_hr_1` and `10_HR_1`.
9.  **User-Agent Rigor:** Always use `API_USER_AGENT` in your axios headers to prevent 403 Forbidden blocks from government firewalls.

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

