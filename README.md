# bloc_starter_project

A Bloc Flutter project with the infamous counter App.

[_TOC_]]

## Setup
### Installation
- [Flutter](https://docs.flutter.dev/get-started/install)
- [Flutter Version Manager](https://fvm.app/docs/getting_started/installation/)
- [VS Code](https://code.visualstudio.com/download) or [Android Studio](https://developer.android.com/studio)
- [lefthook](https://github.com/evilmartians/lefthook/blob/master/docs/install.md#homebrew)

### In Project

Launch the following command to install the project's Flutter SDK:

```
lefthook install
fvm install
```
## Launch the Application (Dev Mode)
Use the following commands:

```
fvm flutter pub get
fvm flutter run
```

## VS Code Setup
If you are using VS Code, here is some useful additional setup you can add to your `settings.json`:

```
{
  ...
  "dart.flutterSdkPath": ".fvm/flutter_sdk",
  "dart.lineLength": 120,
  "[dart]": {
    "editor.lightbulb.enabled": true,
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [120],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false,
    "editor.defaultFormatter": "Dart-Code.dart-code"
  },
  "dart.debugExternalPackageLibraries": true,
  "dart.debugSdkLibraries": true,
  ...
}
```

I would also recommend turning on autosave `onFocusChange`

## Useful commands
### Models and Mocks generation
Each time a model class or a class that is mocked in a test is updated, the following command should be launched:
```
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

It allows:
- Generating the serialization methods of the models
- Generating the mocks of the classes annotated in GenerateMocks at the beginning of a test

### Formatting code
The code should always be formatted correctly and respect the linter rules before being committed. To automatically format your code, use this command:
```
fvm dart format --output none --set-exit-if-changed -l "120" .
```
And to check if the code respects the linter rules, use:
```
fvm flutter analyze
```

## Launch Autoamted tests
In this project, there are multiple types of automated tests:
- Unit tests
- Golden tests
- Integration tests (commonly called E2E tests)

To launch the unit tests and the golden tests, go to the project's root and use the following commands:
```
fvm flutter test
```

Make sure to generate your mocks before launching the tests with:
```
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## Links

The project's structure is based on clean architecture. Here are some useful links to check out before your Flutter coding journey for this project:
- [Clean architecture tutorial with flutter](https://www.youtube.com/watch?v=KjE2IDphA_U)
- [Article about clean code](https://www.invivoo.com/lart-clean-code-environnement-java/)

This project also uses Bloc state management:

- Here is a link to the [Bloc documentation](https://bloclibrary.dev/#/)