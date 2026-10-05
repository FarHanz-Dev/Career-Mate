# CareerMate

Mobile app for [CareerMate](https://careermate.karimlabs.id), a mail tool for one job: sending job applications. The user drops in a screenshot of a job posting, CareerMate matches it against their CV, drafts the application mail, and the user sends it from their own Google account.

CareerMate sends mail and never reads the mailbox. Whether a recruiter replied is a state the user sets by hand.

## Status

Design handoff only. The Flutter app is not started yet.

## Where things are

Everything lives in [`CareerMate Mobile App Design/design_handoff_careermate_mobile`](<CareerMate Mobile App Design/design_handoff_careermate_mobile>):

| Path | What it is |
| --- | --- |
| `README.md` | Product overview, design tokens, the 10 screens, interactions and state |
| `FLUTTER_IMPLEMENTATION.md` | Stack, architecture, folder structure and build order for the Flutter app |
| `design/CareerMate Mobile.dc.html` | Interactive HTML prototype (open in a browser) |
| `screenshots/` | 14 PNGs of every screen and state |
| `assets/` | Logo SVGs |

## Planned stack

Flutter (Dart 3, Material 3 with a custom theme), `flutter_riverpod`, `go_router`, `dio`, `freezed`, `google_sign_in` (`gmail.send` scope only).
