# `Flutter + Supabase` app template
<p>
  <a href="https://github.com/SandroMaglione">
    <img alt="GitHub: SandroMaglione" src="https://img.shields.io/github/followers/SandroMaglione?label=Follow&style=social" target="_blank" />
  </a>
  <a href="https://twitter.com/SandroMaglione">
    <img alt="Twitter: SandroMaglione" src="https://img.shields.io/twitter/follow/SandroMaglione.svg?style=social" target="_blank" />
  </a>
  <a href="https://github.com/SandroMaglione/flutter-supabase-template">
    <img src="https://img.shields.io/github/stars/SandroMaglione/flutter-supabase-template?logo=github" />
  </a>
  <img src="https://img.shields.io/github/license/SandroMaglione/flutter-supabase-template?logo=github" />
</p>

This app is a complete setup for a production ready [**Flutter**](https://flutter.dev/) application using [**Supabase**](https://supabase.com/) for [authentication](https://supabase.com/docs/guides/auth), [database](https://supabase.com/docs/guides/database), [storage](https://supabase.com/docs/guides/storage), and [more](https://supabase.com/docs/).

## 🚀 How to run the app 

> Make sure you [installed](https://docs.flutter.dev/get-started/install) Flutter and Dart in your machine

1. Clone or fork the repository
```shell
git clone https://github.com/SandroMaglione/flutter-supabase-template.git
```

2. Install the packages required
```shell
flutter pub get
```

3. Run the build command ([`build_runner`](https://pub.dev/packages/build_runner))
```shell
flutter packages pub run build_runner build  
```

4. Update [`.vscode/launch.json`](.vscode/launch.json) `args` with your Supabase project URL (`SUPABASE_URL`) and Key (`SUPABASE_ANNON_KEY`):
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Production",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_prod.dart",
      "args": [
        "--dart-define=SUPABASE_URL=Url",
        "--dart-define=SUPABASE_ANNON_KEY=Key"
      ]
    }
  ]
}
```
5. Run the app 🚀

## 🧱 Structure of the project
The project is organized in [releases](https://github.com/SandroMaglione/flutter-supabase-template/releases), each containing a specific set of changes for **one feature**:
1. [Environment variables](https://github.com/SandroMaglione/flutter-supabase-template/tree/v1-env-vars) 
2. [Routing (`auto_route`)](https://github.com/SandroMaglione/flutter-supabase-template/tree/v2-navigation) 
3. [Dependency injection (`injectable`)](https://github.com/SandroMaglione/flutter-supabase-template/tree/v3-dep-injection) 
4. [Supabase authentication](https://github.com/SandroMaglione/flutter-supabase-template/tree/v4-supabase-auth) 
5. [Supabase database](https://github.com/SandroMaglione/flutter-supabase-template/tree/v5-supabase-database) 
6. [Functional programming (`fpdart`)](https://github.com/SandroMaglione/flutter-supabase-template/tree/v6-functional-programming) 

You can review each set of changes individually by [**looking at each release**](https://github.com/SandroMaglione/flutter-supabase-template/tags).

> **Note**: Each feature is build on top of the previous one.

### 📃 Packages used ([pubspec.yaml](pubspec.yaml))
- [supabase_flutter](https://pub.dev/packages/supabase_flutter): Supabase SDK for Flutter's applications
- [auto_route](https://pub.dev/packages/auto_route): Routing and navigation using auto-generation
- [injectable](https://pub.dev/packages/injectable) ([get_it](https://pub.dev/packages/get_it)): Dependency injection using auto-generation
- [fpdart](https://pub.dev/packages/fpdart): Functional programming in dart and flutter

> **Note**: This setup is opinionated. There are many other possible solutions and packages to achieve the same (or better) result. It would be interesting to start a discussion about each solution (by [opening new PRs](https://github.com/SandroMaglione/flutter-supabase-template/pulls) implementing other options)

## 👨🏼‍🏫 Guides and tutorials
Each feature in the app has a [**blog post**](https://www.sandromaglione.com/) associated with it that explains more in the details the changes made:
1. [Environment variables](https://www.sandromaglione.com/techblog/how-to-use-environmental-variables-in-flutter)
2. [Routing (`auto_route`)](https://www.sandromaglione.com/techblog/how-to-setup-routing-flutter-app)
3. [Dependency injection (`injectable`)](https://www.sandromaglione.com/techblog/how_to_implement_dependecy_injection_in_flutter)
4. [Supabase authentication](https://www.sandromaglione.com/techblog/flutter-supabase-authentication-complete-tutorial)
5. [Supabase database](https://www.sandromaglione.com/techblog/flutter-supabase-database-complete-tutorial)
6. [Functional programming (`fpdart`)](https://www.sandromaglione.com/techblog/flutter-dart-functional-programming-fpdart-supabase-app)

## 🛣 Roadmap
- [x] Adding support for [Supabase database](https://supabase.com/docs/guides/database)
- [x] Improving the code using [**fpdart**](https://pub.dev/packages/fpdart) (Functional Programming)
- [ ] Adding support for [Supabase storage](https://supabase.com/docs/guides/storage)

## 🙏🏼 Contribution
Every feedback, feature request, and contribution is gladly accepted:
- Create a [new issue request](https://github.com/SandroMaglione/flutter-supabase-template/issues)
- Create a [new PR for contributions](https://github.com/SandroMaglione/flutter-supabase-template/pulls)