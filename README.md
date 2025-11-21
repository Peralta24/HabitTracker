# Simple Habit Tracker

> A streamlined application designed to facilitate habit tracking, allowing users to monitor their goals through a clear and direct interface.

## 📖 About the Project

This project was built with a singular focus: simplicity. It allows users to register and track the habits they want to achieve without unnecessary complexity. The application features a clean UI with visual feedback, ensuring users can easily distinguish between pending and completed tasks.

## ✨ Key Features

* **Persistent Data:** Habits are saved locally using `UserDefaults` with custom JSON encoding, ensuring data remains available after closing the app.
* **Smart Navigation:** Implements `PathStore` to save and restore the navigation stack state.
* **Progress Tracking:** Visual counters track how many times a habit has been completed (`completionCount`).
* **Interactive UI:**
    * Custom checkbox logic with immediate visual feedback (strikethrough and color changes).
    * Dynamic background colors.
* **Habit Management:** easy-to-use forms to add new habits with descriptions and initial status.

## 🛠️ Tech Stack

* **Language:** Swift 5+
* **UI Framework:** SwiftUI
* **Architecture:** MVVM (using the `@Observable` macro for data binding).
* **Storage:** `UserDefaults` (Custom extensions for `Codable` support).

