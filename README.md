# Demo Application

A demo application build to quickstart a Flutter application using MVVM architecture.

## Components

This project contains following components:

1. **Model**: data objects
2. **Provider**: source of data
    1. **Local Provider**: local storage
    2. **API Provider**: network calls
3. **Repository**: accessing data layer
4. **View Model**: ui <-> repository connection logic
5. **View**: user interface (ui)

## Libraries

Following libraries are used to build up the above components:

1. **[Dio](https://pub.dev/packages/dio)**: API calls
2. **[Get It](https://pub.dev/packages/get_it)**: Dependency Injection
3. **[Stacked](https://pub.dev/packages/stacked)**: MVVM Architecture + Navigation + Dialogs
4. **[Shared Preferences](https://pub.dev/packages/shared_preferences)**: Local Storage