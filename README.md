# CareerMate

Mobile app for [CareerMate](https://careermate.karimlabs.id), a mail tool for one job: sending job applications. The user drops in a screenshot of a job posting, CareerMate matches it against their CV, drafts the application mail, and the user sends it from their own Google account.

CareerMate sends mail and never reads the mailbox. Whether a recruiter replied is a state the user sets by hand.

## Status

The UI and its interactions are built from the design handoff and run on mock data. There is no backend yet, and Google sign-in, file upload and sending are stubbed.

| Done | Not yet |
| --- | --- |
| All screens: sign in, career profile (3 steps), inbox (swipe, multi-select, drawer, FAB menu), thread, add job, compose, CV Bank, CV detail, match breakdown, CV improvements | Real Google sign-in with the `gmail.send` scope (`AuthRepository`, `MailRepository`) |
| Design system in `lib/ui` (atoms, molecules, organisms, templates) on Material 3 with custom theme tokens | Screenshot and CV upload (`image_picker`, `file_picker`); the upload targets are marked `TODO(upload)` |
| Archivo bundled as TTF, Lucide icons, launcher icons for Android and iOS | Real API and local cache (`dio`, `drift` or `isar`) behind the repositories |

## Run it

```sh
flutter pub get
flutter run
```

The app starts on the sign-in screen. "Continue with Google" signs in as the mock account.

Generated code (`*.freezed.dart`) is committed. After changing a `@freezed` model:

```sh
dart run build_runner build
```

After changing the logo sources in `assets/icon/`:

```sh
dart run flutter_launcher_icons
```

Tests: `flutter test`.

## Where things are

| Path | What it is |
| --- | --- |
| `lib/app` | Theme tokens, router (`go_router`), app shell with drawer and bottom tabs, toast |
| `lib/ui` | Shared design system: `atoms`, `molecules`, `organisms`, `templates`. Atoms and molecules never import Riverpod |
| `lib/features/*` | One folder per domain: `data` (repository, mock data source), `models`, `controller` (Riverpod), `pages` |
| `lib/core` | Small shared utilities |
| `CareerMate Mobile App Design/design_handoff_careermate_mobile` | Design handoff: product README, `FLUTTER_IMPLEMENTATION.md`, HTML prototype, screenshots, logo SVGs |

Every repository has an in-memory mock (`Mock…Repository`) that uses the sample data from the prototype, so the backend can be swapped in without touching the UI.

## Stack

Flutter (Dart 3, Material 3 with a custom theme), `flutter_riverpod`, `go_router`, `freezed`. Planned for the backend work: `dio`, `google_sign_in` (`gmail.send` scope only), `image_picker` and `file_picker`.
