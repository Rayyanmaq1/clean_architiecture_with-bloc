# Flutter News App

This is a Flutter project that utilizes the News API to display news articles. The app follows the principles of Clean Architecture and uses BLoC as the state management solution.
[All Thanks to Flutter Guys](https://www.youtube.com/watch?v=7V_P6dovixg).

## Project Structure

The project is structured as follows:

!<img width="286" alt="Screenshot 2023-08-03 at 3 39 37 PM" src="https://github.com/Rayyanmaq1/clean_architiecture_with-bloc/assets/71687063/1f2b0923-3067-4cda-a821-5c9a1d2e55a3">


## State Management

The app uses the BLoC pattern for state management. Each feature in the `features` directory has its own BLoC for managing the state and business logic. BLoC helps to separate the UI and business logic, making the codebase more maintainable and testable.

## Dependencies

The project uses the following dependencies:

- `flutter_bloc`: For implementing the BLoC pattern and state management.
- `bloc`: The core library for BLoC pattern.
- `equatable`: For simplifying equality comparisons between objects.
- `get_it`: For service locator, providing dependency injection.
- `intl`: For internationalization and formatting dates and numbers.
- `floor`: For local database operations.
- `retrofit`: For making API calls to the News API.
- `flutter_hooks`: For implementing hooks in Flutter.
- `cached_network_image`: For loading and caching images from the web.
- `retrofit_generator`: For generating code for the Retrofit library.
- `floor_generator`: For generating code for the Floor database.
- `build_runner`: For running code generation tasks.
- `dio`: For making HTTP requests and handling network-related tasks.

These dependencies are defined in the `pubspec.yaml` file.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository to your local machine using Git.

```bash
git clone https://github.com/your-username/flutter-news-app.
```

2. Install the required dependencies by running the following command in the project root directory:

```bash
flutter pub get
```

3. Connect a physical device or use an emulator to run the app:

```bash
Flutter run
```

## Conclusion

Thank you for checking out the Flutter News App! We hope you find it useful and informative. If you have any questions or feedback, feel free to reach out to us. Happy reading!

## Contact

- Email: [rayyanmaq1@gmail.com](mailto:your-email@example.com)

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

We would like to thank [News API](https://newsapi.org/) for providing the news data used in this app.

## Further Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [News API Documentation](https://newsapi.org/docs)
- [Flutter Community](https://flutter.dev/community)
- [Awesome Flutter](https://github.com/Solido/awesome-flutter)
