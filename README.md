# Simple Habit Tracker

> A streamlined application designed to facilitate habit tracking, allowing users to monitor their goals through a clear and direct interface.

## 📖 About the Project
# Habit Tracker 📝

Una aplicación nativa de iOS desarrollada en **SwiftUI** para gestionar hábitos diarios. Permite a los usuarios crear, seguir y persistir el progreso de sus actividades, manteniendo un registro histórico de las veces que se ha completado cada hábito.

## 🚀 Características Principales

* **Gestión de Hábitos (CRUD):** Crear nuevos hábitos con nombre y descripción, y eliminarlos de la lista.
* **Seguimiento de Progreso:**
    * Marcado rápido mediante *checkbox* en la lista principal.
    * Contador histórico de veces completadas (`completionCount`).
    * Estado visual (tachado/color) para indicar si el hábito ya se realizó hoy.
* **Persistencia de Datos:** Los hábitos y sus estadísticas se guardan automáticamente usando `UserDefaults`.
* **Navegación Inteligente:** La aplicación recuerda la ruta de navegación y el estado de la pantalla al cerrarse y abrirse nuevamente.

## 🛠 Tecnologías y Arquitectura

Este proyecto utiliza las últimas características de **Swift 5.9+** y **SwiftUI**:

### 1. Arquitectura de Datos (`@Observable`)
Se utiliza el macro `@Observable` (introducido en iOS 17) en la clase `Habits` para la gestión del estado. Esto permite que la vista se actualice automáticamente cuando cambian los datos, sin necesidad de `@Published` o `ObservableObject`.

### 2. Persistencia Personalizada (`UserDefaults` + `Codable`)
En lugar de usar bases de datos complejas para datos ligeros, se implementó una capa de persistencia eficiente:
* **Extensiones de UserDefaults:** Se creó una extensión (`UserDefaultsSave.swift`) para codificar y decodificar objetos JSON genéricos automáticamente.
* **Lógica de Guardado:** Los datos se guardan automáticamente mediante observadores de propiedades (`didSet`) en el array de hábitos.

### 3. Persistencia del Estado de Navegación (`NavigationPath`)
La clase `PathStore` se encarga de guardar la pila de navegación (`NavigationPath`) en el disco. Esto permite que si el usuario cierra la app estando en una pantalla de detalle, al volver a abrirla, la app restaura esa pantalla exacta.

### 4. Interfaz de Usuario
* **`NavigationStack`:** Para la gestión de rutas.
* **`List` & `SwipeActions`:** Para mostrar y eliminar elementos.
* **`Sheet`:** Para el formulario de ingreso de datos.
* **Lógica de Negocio en Vista:** Cálculo dinámico para incrementar o decrementar el contador de hábitos basándose en la interacción del usuario (lógica de toggle).

## 📂 Estructura del Proyecto

* `Habit.swift`: Modelo de datos que conforma a `Codable`, `Identifiable` y `Hashable`.
* `Habits` (en `ContentView`): ViewModel que gestiona la lógica de negocio y el array de hábitos.
* `ContentView.swift`: Vista principal con la lista y el checkbox interactivo.
* `AddHabitView.swift`: Formulario para ingresar nuevos hábitos.
* `DetailHabitView.swift`: Vista de detalle con estadísticas y botón de acción prominente.
* `UserDefaultsSave.swift`: Capa de abstracción para el guardado de datos.

