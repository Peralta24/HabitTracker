# 📱 HabitTracker – SwiftUI App

> **Track your daily habits seamlessly with data persistence.**

**HabitTracker** is a robust SwiftUI application designed to help users create, track, and visualize their daily habits. All data is automatically saved using **UserDefaults**, ensuring that your progress persists even after closing the application.

---

## 🚀 Features

This app includes a comprehensive set of features to manage habits effectively:

* **📌 Create Habits:** Add custom habits with a unique name and description.
* **✔️ Quick Actions:** Mark habits as completed instantly using a custom checkbox component.
* **🔄 Data Persistence:** Automatic saving and loading using `UserDefaults` with Codable support.
* **📊 Statistics & Insights:**
    * View total completion counts.
    * Track daily completion status.
* **🔍 Detail View:** Explore specific details for each habit.
* **➕ Increment Counter:** Manually add +1 to the habit completion count.
* **🗑️ User Friendly:** Delete habits easily with a "swipe-to-delete" gesture.
* **📂 Smart Navigation:** State restoration and navigation persistence using `NavigationPath`.
* **🎨 UI/UX:** Modern, clean, and native SwiftUI design.

---

## 🛠️ Technologies Used

![Swift](https://img.shields.io/badge/Swift-5.0-orange?style=flat-square&logo=swift)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Framework-blue?style=flat-square&logo=swift)
![Xcode](https://img.shields.io/badge/Xcode-15%2B-157CFC?style=flat-square&logo=Xcode)

-   **Language:** Swift 5
-   **Framework:** SwiftUI
-   **Storage:** UserDefaults + Codable extensions
-   **Navigation:** NavigationStack + NavigationPath
-   **Architecture:** Lightweight MVVM (Model-View-ViewModel)

---

## 📸 Screenshots

| Habit List | Habit Details |
|:---:|:---:|
| ![Habit List](Images/habits_list.png) | ![Habit Detail](Images/habit_detail.png) |
| *Main view with swipe actions* | *Detailed view with counters* |

---

## 🧱 Project Structure

The application follows a clean architecture, separating logic into Models, Persistence layers, and Views.

### 📌 Model
* **`Habit.swift`**
    * Defines the core data structure.
    * Properties: `id` (UUID), `name`, `description`, `isDone`, `completionCount`.
    * Conforms to: `Codable`, `Identifiable`, `Hashable`, `Equatable`.

### 💾 Persistence Layer
* **`UserDefaultsSave.swift`**
    * Extends `UserDefaults` to support custom objects.
    * Functions: `setCodable(_:forKey:)` and `codableObject(_:forKey:)`.
* **`PathStore.swift`**
    * Manages navigation state persistence.
    * Uses `NavigationPath.CodableRepresentation` to save the user's current screen across sessions.

### 📱 User Interface (Views)
* **`ContentView.swift`**
    * The main hub of the app. Displays the list, handles the "Add" button, swipe-to-delete logic, and background styling.
* **`AddHabitView.swift`**
    * Form to input habit name and description. Includes validation and save logic.
* **`DetailHabitView.swift`**
    * Displays deep insights: Description, status, and a button to increment the completion count.
* **`CheckBoxView.swift`**
    * A reusable, custom UI component.
    * Logic: `Image(systemName: checked ? "checkmark.square.fill" : "square")`.

---

## 🧩 Installation & Setup

To run this project locally on your machine:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/Peralta24/HabitTracker.git](https://github.com/Peralta24/HabitTracker.git)
    ```

2.  **Open in Xcode:**
    Navigate to the project folder and open `HabitTracker.xcodeproj`.

3.  **Run the App:**
    Select your target simulator (e.g., iPhone 15 Pro) and press **Cmd + R**.

---

## 📝 Notes

* The project uses **MVVM principles** to keep the logic separated from the UI.
* **NavigationPersistence** is a key feature, ensuring the user returns to the exact same screen if the app is terminated by the system.
