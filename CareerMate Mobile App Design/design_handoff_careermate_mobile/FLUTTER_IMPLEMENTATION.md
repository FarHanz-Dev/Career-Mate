# Implementation guide: Flutter

This guide adds the tech stack and architecture to README.md. Treat it as the default plan. Deviate wherever a simpler option is easier to maintain or performs better. Maintainability and performance come before strict adherence to any pattern.

## Stack
- **Flutter** (stable, Dart 3). Material 3 base with a custom theme. Do not use default Material styling.
- **State:** `flutter_riverpod`, with Notifier/AsyncNotifier as controllers.
- **Routing:** `go_router`, with a `StatefulShellRoute` for the 3 bottom tabs.
- **Networking:** `dio`.
- **Models:** `freezed` + `json_serializable`.
- **Auth:** `google_sign_in` with the `gmail.send` scope only. CareerMate never requests read scopes.
- **Local cache:** `drift` or `isar` for applications and CVs, so the app is offline-first for viewing. Only add this if needed.
- **Fonts and icons:** `google_fonts` (Archivo) or bundled Archivo TTFs (preferred, no runtime fetch). Icons from `lucide_icons`.
- **Files and capture:** `file_picker` and `image_picker` for CV upload and posting screenshots. OCR and matching run on the backend.

## Architecture: three-tier MVC, kept light
```
Presentation (View)       atomic widgets + pages, no business logic
      │ watches / calls
Controller (logic tier)   Riverpod Notifiers: UI state, user intents
      │ calls
Data (Model tier)         Repositories → DataSources (API, local DB) + Models
```
Rules, kept to a minimum:
- Views never call a repository directly. They go through a controller.
- Controllers expose immutable state (freezed) and intent methods, e.g. `markReplied(id)` and `archive(ids)`.
- Repositories hide where data comes from (remote API or local cache). One repository per domain: `ApplicationRepository`, `CvRepository`, `MatchRepository`, `ProfileRepository`, `MailRepository`, `AuthRepository`.
- Add a separate use-case/service layer only when a piece of logic is shared by two or more controllers. Otherwise keep the logic in the controller.

## Folder structure (feature-first, atomic design inside the UI)
```
lib/
  main.dart
  app/            router.dart, theme/ (tokens.dart, app_theme.dart), di.dart
  core/           network/ (dio client, interceptors), errors/, utils/
  ui/             shared atomic design system
    atoms/        CmButton, CmTag, CmIconButton, CmLogo, CmDivider, CmScoreBar, CmMonogram, CmCheckbox, CmText styles
    molecules/    CmSearchBar, CmSegmented, CmChipRow, CmMatchPill, CmStepBadge, CmLabeledField, CmSwipeBackground
    organisms/    ApplicationRow (swipeable), InboxHeader, SelectionBar, LabelDrawer, FabMenu, BottomTabs,
                  ThreadMessage (collapsible), ReplyStatusToggle, EvidenceList, DimensionBar, SuggestionCard
    templates/    TabScaffold (search + list + FAB + tabs), DetailScaffold (back bar + scroll), StepFlowScaffold (rail + steps)
  features/
    auth/         data/ (auth_repository.dart), controller/, pages/sign_in_page.dart
    profile/      data/, controller/profile_flow_controller.dart, pages/ (profile_flow_page + step_you, step_cv, step_terms)
    inbox/        data/application_repository.dart, models/application.dart, controller/inbox_controller.dart, pages/inbox_page.dart
    thread/       controller/, pages/thread_page.dart
    add_job/      data/ (ocr upload), controller/, pages/
    compose/      data/mail_repository.dart, controller/, pages/
    cv_bank/      data/cv_repository.dart, models/cv_file.dart, controller/, pages/ (cv_bank_page, cv_detail_page)
    insights/     data/match_repository.dart, models/ (match_result, evidence), controller/, pages/ (match_page, improve_page)
```
Pages are the "pages" level of atomic design. They compose templates and organisms and connect them to controllers. Atoms and molecules must be pure, with no Riverpod imports, so they stay reusable and cheap to rebuild.

## Theme tokens (`app/theme/tokens.dart`)
Map the README tokens directly:
```dart
abstract class CmColors {
  static const accent = Color(0xFF0A66C2);
  static const accent100 = Color(0xFFEEF5FC), accent700 = Color(0xFF084F97), accent800 = Color(0xFF073A6E);
  static const bg = Color(0xFFF3F2F2), surface = Color(0xFFEAE9E9), text = Color(0xFF201E1D);
  static const divider = Color(0x66201E1D); // 40%
  static const neutral300 = Color(0xFFD7D3D3), neutral700 = Color(0xFF605D5D), neutral800 = Color(0xFF444141);
}
abstract class CmRadius { static const sm = 3.0, md = 5.0, lg = 7.0; }
abstract class CmSpace { static const s1 = 4.0, s2 = 8.0, s3 = 12.0, s4 = 16.0, s5 = 20.0, s6 = 24.0, s8 = 32.0; }
```
Put these in a `ThemeExtension` so widgets read them from `Theme.of(context)`. Do not hardcode values inside widgets.

## Core models
```dart
enum AppStatus { draft, sent, replied, noResponse, archived }
@freezed class Application { id, company, role, location, level, cvId, status, unread, score, sentAt, posting, draft, sentMail }
@freezed class CvFile { id, name, inContext, skills, roles, certifications, updatedAt }
@freezed class MatchResult { score, dimensions: List<Dimension>, evidence: List<Evidence> }
@freezed class Suggestion { id, tag, where, lift, before, after }
@freezed class CareerProfile { name, headline, years, targetRoles, location, tone, notice, salary, signOff, language }
```
Reply status is local bookkeeping. `markReplied` / `markNoResponse` update the cache optimistically, then sync to the API.

## Performance notes
- Build the inbox with `ListView.builder` (or `SliverList`), use `itemExtent` or `prototypeItem` for the fixed-height rows, and make rows `const` where possible.
- For each row, use `ref.watch(provider.select(...))` so a status change rebuilds only the affected row.
- Implement swipe with `Dismissible` or a small custom `GestureDetector` with a threshold. Avoid heavy animation packages.
- Draw the logo with `CustomPainter` (3 rounded rects) or `flutter_svg` from `assets/careermate-logo.svg`. Use it everywhere through `CmLogo(size, inverse)`.
- Collapse thread messages by default and render the body only when expanded.
- Debounce search by 250 ms and filter on the cached list.
- Upload screenshots compressed (max ~1600px long side).

## Suggested build order
1. Theme tokens and the atoms/molecules (check them in a simple widget gallery page).
2. Sign in and Google auth.
3. Inbox (rows, swipe, select, drawer, FAB, tabs) with mock repositories.
4. Thread and the reply-status toggle.
5. Add job → Compose → send through Gmail.
6. CV Bank and CV detail.
7. Insights: Match breakdown and CV improvements.
8. Career profile flow (3 steps).
9. Swap the mock data sources for the real API and add the local cache.

Start every repository with a `Mock…DataSource` that uses the sample data from the prototype, so the UI can be built before the backend is ready.
