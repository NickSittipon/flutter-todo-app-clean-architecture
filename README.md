# Todo App Clean Architecture


## Tech Stack & Packages

- 🚀 **Flutter**  
  UI framework for building natively compiled applications for mobile, web, and desktop from a single codebase.

- 🗄️ **Isar**  
  A high-performance NoSQL local database optimized for Flutter apps, used for storing ToDo tasks efficiently on device.

- 📂 **Path Provider**  
  Provides platform-specific locations to store data, such as the app’s documents directory, used here for locating storage path for Isar database.

- 🧩 **Flutter BLoC**  
  State management library implementing the BLoC (Business Logic Component) pattern to separate presentation and business logic cleanly.

## Layer Details:

- **Presentation Layer**: Flutter UI components, BLoC state management  
- **Domain Layer**: Business logic, use cases, entities, and repository interfaces  
- **Data Layer**: API calls, local storage, repository implementations

## 🚀 Getting Started

Follow these steps to run the Flutter app:

1. **Install dependencies**  
   Run the following command to install all required packages:  
   `flutter pub get`

2. **Run the app**  
   Launch the application using:  
   `flutter run`

  https://github.com/user-attachments/assets/23e18f87-ef60-4499-8785-e2103dbf2969
