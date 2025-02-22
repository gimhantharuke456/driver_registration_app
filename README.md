# Driver Registration App

## Overview

The **Driver Registration App** is a Flutter-based mobile application that provides a multi-step registration process for drivers. The app collects essential details such as personal information, license details, vehicle details, and bank details. While no API calls are required, the UI and logic are implemented as if interacting with a backend.

## Features

- Multi-step registration flow
- Clean UI with Flutter best practices
- State management using Provider
- Form validation
- File upload UI for license and documents

## Screens

1. **Driver Registration Screen** - Collects personal details.
2. **File Upload Screen** - Allows drivers to upload necessary documents.
3. **Bank Details Screen** - Captures bank account details.
4. **Success Screen** - Confirms successful registration.

## Technologies Used

- **Flutter** (Latest Version)
- **Dart**
- **Provider** (State Management)
- **Flutter Widgets & Forms**

## Installation & Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/gimhantharuke456/driver_registration_app
   ```
2. Navigate to the project directory:
   ```sh
   cd driver-registration-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Project Structure

```
lib/
├── core/                   # Core utilities (e.g., navigation, constants)
├── features/               # Feature-based modules
│   ├── bank_details/       # Bank details module
│   ├── driver_details/     # Driver personal details module
│   ├── file_upload/        # File upload module
├── presentation/           # UI components and widgets
├── main.dart               # App entry point
```

## Best Practices Followed

- **Separation of Concerns**: UI, logic, and state management are separated.
- **Provider for State Management**: Ensures efficient data handling.
- **Form Validation**: Provides user-friendly validation messages.
- **Modular Code Structure**: Easy to maintain and extend.

## License

This project is licensed under the MIT License.

---

**Developed for the Senior Flutter Developer Job Application.**
