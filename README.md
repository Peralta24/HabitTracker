# 📱 HabitTracker – SwiftUI App

HabitTracker es una aplicación desarrollada en **SwiftUI** que permite registrar, visualizar y dar seguimiento a los hábitos diarios de un usuario.  
Los hábitos se guardan automáticamente usando **UserDefaults**, por lo que no se pierden al cerrar la app.

---

## 🚀 Funcionalidades principales

- 📌 **Agregar hábitos personalizados** con nombre y descripción  
- ✔️ **Marcar hábitos como completados** mediante un checkbox visual  
- 🔄 **Persistencia automática** usando `UserDefaults`  
- 📊 **Estadísticas por hábito**:
  - Veces completado
  - Estado actual del día
- 🗑️ **Eliminar hábitos** deslizando la celda
- 🔍 **Vista detallada del hábito**
- ➕ **Botón para incrementar el contador (+1)**
- 🎨 **Interfaz con colores suaves y moderna**
- 📂 **Sistema de navegación con persistencia usando NavigationPath**

---

## 🧱 Arquitectura del proyecto

La app está organizada en modelos, vistas y utilidades:

### **📌 Modelos**
#### `Habit.swift`
Define la estructura del hábito:

- `id`
- `name`
- `description`
- `isDone`
- `completionCount`

Implementa:
- `Codable`
- `Identifiable`
- `Hashable`
- `Equatable`

---

### **💾 Persistencia**
#### `UserDefaultsSave.swift`
Extiende `UserDefaults` para permitir guardar y recuperar objetos `Codable`:

- `setCodable(_:forkey:)`
- `codableObject(_:forkey:)`

Esto permite guardar la lista de hábitos y recuperarla fácilmente.

---

### **🧭 Navegación persistente**
#### `PathStore`
Guarda y restaura la navegación usando:

```swift
NavigationPath.CodableRepresentation
