# 📱 HabitTracker – SwiftUI App

**HabitTracker** is a SwiftUI application that allows users to create, track, and visualize their daily habits.  
All habits are saved automatically using **UserDefaults**, ensuring your data persists even after closing the app.

---

## 🚀 Features

- 📌 Create custom habits with a name and description  
- ✔️ Mark habits as completed using a custom checkbox  
- 🔄 Automatic data persistence using UserDefaults  
- 📊 Habit statistics, including:  
  - Total completion count  
  - Daily completion status  
- 🗑️ Delete habits by swiping  
- 🔍 Detailed habit view  
- ➕ Add +1 to the habit count  
- 🎨 Modern and clean UI design  
- 📂 Navigation persistence with `NavigationPath`  

---

## 🧱 Project Structure

The app is organized with models, views, and utilities for clarity and maintainability.

---

### 📌 Model

### `Habit.swift`

Defines the Habit model with:

- `id`  
- `name`  
- `description`  
- `isDone`  
- `completionCount`  

Implements:

- `Codable`  
- `Identifiable`  
- `Hashable`  
- `Equatable`  

---

### 💾 Persistence

### `UserDefaultsSave.swift`

Adds Codable support to UserDefaults through:

- `setCodable(_:forKey:)`
- `codableObject(_:forKey:)`

Allows simple storage and retrieval of habit data.

---

### 🧭 Navigation Persistence

### `PathStore.swift`

Stores and restores navigation using:

- `NavigationPath.CodableRepresentation`

Ensures the app remembers the navigation state across sessions.

---

### 📋 Main List Logic

### `ContentView.swift`

Includes:

- Habit list display  
- Custom checkbox logic  
- Add button  
- Swipe-to-delete  
- Background styling  
- `Habits` observable class integration  

---

### 🆕 Add New Habit

### `AddHabitView.swift`

Allows users to:

- Enter a habit name  
- Add a description  
- Optionally mark it as completed  
- Save the habit  

---

### 📊 Habit Details

### `DetailHabitView.swift`

Shows:

- Habit name  
- Habit description  
- Daily status  
- Total completion count  
- Button to increment habit count  

---

### ✔️ Custom Checkbox Component

### `CheckBoxView.swift`

Reusable checkbox using:

```swift
Image(systemName: checked ? "checkmark.square.fill" : "square")

## 🛠️ Technologies Used

- Swift 5  
- SwiftUI  
- UserDefaults + Codable  
- NavigationStack + NavigationPath  
- Lightweight MVVM  
- Xcode 15+  

---

## 📸 Screenshots (Optional)

![Habit List](Images/habits_list.png)  
![Habit Detail](Images/habit_detail.png)

---

## 🧩 Installation & Setup

Clone the repository:

```bash
git clone https://github.com/Peralta24/HabitTracker.git
