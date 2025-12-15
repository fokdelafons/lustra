# Lustra - Citizens Above Politics 🏛️

[![License: PolyForm Noncommercial](https://img.shields.io/badge/License-PolyForm%20Noncommercial-blue.svg)](https://polyformproject.org/licenses/noncommercial/1.0.0/)
[![Flutter](https://img.shields.io/badge/Built%20with-Flutter-02569B.svg)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/Platform-Web%20%7C%20iOS%20%7C%20Android-lightgrey.svg)](https://lustra.news)

**Lustra** is a digital public infrastructure designed to track legislation and empower civic oversight. It parses raw government data, uses AI to generate neutral summaries, and provides a civic platform for voting on bills and drafting citizen initiative legislation. It's meant to transform democracies from indirect to direct.

👉 **Live App:** [lustra.news](https://lustra.news)

---

## 🎯 The Mission
95% of legislation goes unnoticed because legal texts are unreadable for citizens. Media coverage is often biased or focused on outrage. Lustra aims to fix this by:
1.  **Direct Source Access:** Linking every summary to the raw PDF/XML source.
2.  **Context Sterilization:** Using LLMs with temperature=0 and strict JSON prompts to strip emotional language.
3.  **Civic Projects:** Enabling citizens to draft and vote on model laws (like *The Human Preservation Act*).

## 🛠️ Tech Stack
*   **Frontend:** Flutter (Mobile & Web Monorepo)
*   **Backend:** Firebase (Auth, Firestore, Cloud Functions) + Google Cloud Run
*   **AI Engine:** Vertex AI (Gemini Flash) via strictly typed API calls.
*   **CI/CD:** Codemagic / GitHub Actions

## 🧩 Architecture & Contributing
The project uses a Service-Oriented Architecture. 
*   **Note to Contributors:** Some legacy code comments are currently in Polish 🇵🇱. We are actively migrating documentation to English. Pull Requests translating comments are highly appreciated and a great way to start contributing!
*   **Refactoring:** We are in the process of breaking down larger UI monoliths into smaller widgets. Check the [Issues] tab for current tasks.

## 🔒 Transparency & AI Ethics
We believe in "Radical Transparency".
*   **System Prompts:** The exact instructions sent to our AI models are public and can be found in the app ("How it works" section).
*   **Logs:** We will publish raw AI input/output logs for contested bills soon. 

## 🌍 Bring Lustra to Your Country
Lustra is designed to be global. The core logic (AI, UI, Voting) is separated from data sources.

**Want to add Canada, Israel, or Ireland?**
You don't need to build an app. You just need to write a **Data Adapter**.
If you have access to official APIs/JSONs for:
1.  Legislation text (PDF/HTML) + status
2.  MP profiles
3.  Voting records

...you can integrate your country in a few days. We provide the base classes and instructions. Open an Issue titled "New Country: [Name]" to get started!

## 🚀 Getting Started (For Developers)

### Prerequisites
*   Flutter SDK (3.x+)
*   Firebase Project

### Setup
1.  Clone the repo.
2.  Create your own Firebase project.
3.  Add `firebase_options.dart` (use `flutterfire configure`).
4.  Run:
    ```bash
    flutter pub get
    flutter run
    ```

## 📄 License
This project is **Source Available** under the **PolyForm Noncommercial License 1.0.0**.
*   ✅ You are free to read, learn from, and fork this code for non-commercial, educational, or civic purposes.
*   ❌ You may NOT use this code for commercial purposes without explicit permission.

We chose this license to protect the project from corporate capture while keeping it open for the community.

---
*Maintained by the Lustra Initiative.*