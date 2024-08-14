# Flutter Articles App

This application is a challenge Flutter app that consumes an API to display a list of articles and their details. It utilizes Clean Architecture and Bloc for state management.

## Requirements

- Flutter SDK >= 2.0.0
- Dart SDK
- A code editor like VSCode or Android Studio

## Instructions to Run the Application

1. Clone the repository:

    ```bash
    git clone https://github.com/fedecasani/flutter_article_app.git
    cd flutter_article_app
    ```

2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the application on your emulator or connected device:

    ```bash
    flutter run
    ```

## Architecture

### Clean Architecture

The app follows the principles of Clean Architecture, separating the different layers of the application to maintain modular and easy-to-maintain code:

- **Presentation Layer**: Contains the UI widgets and presentation logic handled by Bloc.
- **Domain Layer**: Contains the entities and use cases.
- **Data Layer**: Contains repository implementations that interact with APIs or databases.

### State Management

For state management, the app uses the Bloc pattern, which allows for a clear separation of business logic and the user interface.

### Themes

The application supports both light and dark modes, managed through Provider with a `ThemeNotifier` that allows the user to change the theme dynamically.

## Challenges Faced During Development

### Integration of Bloc with Clean Architecture

Combining Bloc with Clean Architecture required ensuring that the presentation layer was not overly coupled with the domain layer, which was achieved through the use of interfaces and dependency injection.

### State Management with Multiple Themes

Implementing dynamic theme switching without affecting the app's performance was challenging, but it was resolved by efficiently using Provider.

### API Error Handling

Handling errors while consuming the API was crucial for providing a good user experience, ensuring that unexpected responses were properly managed.

## Author

Developed by Fede.
