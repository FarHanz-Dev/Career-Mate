# Handoff: CareerMate Mobile

## Overview
CareerMate (https://careermate.karimlabs.id) is a mail tool for one job: sending job applications. The user drops in a screenshot of a job posting, CareerMate matches it against their CV, drafts the application mail, and the user sends it from their own Google account. This bundle is the mobile app design: 10 screens with Gmail-like mechanics.

**Core rule:** CareerMate sends mail and never reads the mailbox. Whether a recruiter replied is a state the **user sets by hand**, by swiping a row or using the toggle in the thread. Treat it as bookkeeping. There is no conversation UI.

## About the design files
The files in `design/` are **design references built in HTML**. They show the intended look and behavior. They are not production code to copy. Rebuild these screens in **Flutter**. Atomic design applies to the UI and a light three-tier MVC applies to data. **See `FLUTTER_IMPLEMENTATION.md`** for the stack, the folder structure, the widget breakdown and the build order.

Open `design/CareerMate Mobile.dc.html` in a browser to click through the prototype. The screen jumper and the iOS/Android device toggle are part of the prototype tooling only. Do not ship them.

## Fidelity
**High fidelity.** Colors, type, spacing, copy and interactions are final. Rebuild them pixel-accurately. Design size: 402×874 (iPhone 16 Pro). Layouts must also flex to Android widths.

## Design tokens
Font: **Archivo** (Google Fonts) for both headings and body. Headings use weight 800; body uses 400, with 600 for emphasis.

Colors:
- accent `#0a66c2` (LinkedIn blue): primary actions, the match number, the sign-in field, the selection bar, swipe backgrounds
- accent ramp: 100 `#eef5fc`, 200 `#d7e8f8`, 300 `#b0d2f2`, 400 `#6ea9e3`, 500 `#2d80d2`, 600 `#0a66c2`, 700 `#084f97`, 800 `#073a6e`, 900 `#0a2b4f`
- bg `#f3f2f2`, surface `#eae9e9`, text `#201e1d`
- divider: `#201e1d` at 40% alpha
- neutrals: 300 `#d7d3d3`, 700 `#605d5d` (secondary text, kept at ≥5:1 contrast), 800 `#444141`
- active tab: bg accent-100, fg accent-800

Radius (default "Soft"): sm 3px, md 5px, lg 7px. The prototype also has two alternates: Sharp (0) and Rounded (8/12/16).

Spacing: 4px scale (4, 8, 12, 16, 20, 24, 32). The standard screen gutter is 16px.

Lines: rows are separated by 1px dividers and sections by 2px dividers. Surfaces are flat. Shadows only on floating layers (drawer, FAB menu): `0 12px 32px rgba(45,43,43,.22)`.

Uppercase labels: 10–11px, letter-spacing .1em, neutral-700 or accent-700.

Copy style: no em dashes anywhere. Sentence case, except section labels, which are uppercase.

## Screens
1. **Sign in.** The upper area is a full accent field. The logo (96px, inverse variant) sits left of a two-line "CAREER / MATE" title at 52px/800, line-height .94, tracking -.035em. Below the title: a 2px white rule (120px wide), the tagline "Read the posting. Match your CV. Send the mail." (17px/600), then 3 numbered steps (19px square badges, white at 22%). At the bottom is a white panel holding a single "Continue with Google" button (54px tall, white, Google G icon) and a note explaining that Google is the only way in. There is no email field.
2. **Career profile** (3 steps, with a progress rail of 3 segments, each 4px tall):
   - Step 1, You: name, headline, years (segmented 0–2 / 3–4 / …), target-role chips, location (segmented Remote / Jakarta / …).
   - Step 2, Your CV: a dashed upload target, then the parsed result showing file name, the count of skills, roles and certs found, skill tags, and a toggle for using it as context.
   - Step 3, Mail & terms: tone (3 options: "Formal and short", "Warm and specific", "Direct, bullet-led"), notice period, salary, sign-off, language. Ends with a profile summary.
3. **Inbox.**
   - Pinned search bar: hamburger on the left, input "Search company, role, CV", 30px logo tile on the right (opens the profile).
   - Status chips scroll horizontally under the search bar.
   - Header line: "{Label}, N applications", with the date range on the right.
   - Dense rows: a 38px square monogram (tapping it selects the row), the company (800 when unread, 400 when read), the date, the role, the CV version, a status tag, and a match bar (46×4) with the score number.
   - Swipe left archives; swipe right marks replied. The colored background shows the labels ARCHIVE and MARK REPLIED.
   - Multi-select swaps the search bar for an accent bar showing "N selected" with archive and other actions.
   - FAB: 58px, radius-lg, bottom-right, 70px above the bottom tabs. It opens a two-option menu: screenshot capture or manual mail.
   - Bottom tabs: icon plus title only (Inbox / CV Bank / Insights).
4. **Drawer** (284px, from the left): an accent header with the logo (30px, inverse), "CAREERMATE" and the account email. The list holds status labels (Drafts, Sent, Replied, No response, Archived) with counts. These labels take the place of Gmail folders.
5. **Thread.**
   - Top bar: back, company/role, Match and Archive icons.
   - Job posting card: role, location/level tags, and a **match pill** that opens Match breakdown. The pill is solid accent, white 11px/800 text, fully rounded, with a chevron. It is the only filled pill on the screen.
   - "Reply status, you set this": a 2-option segmented toggle, "They replied" / "No response yet".
   - Messages (posting, AI draft, sent) are collapsed by default. A SHOW/HIDE control expands each one. One edit action per message.
   - The thread ends at the sent mail.
6. **Add job (OCR):** upload a posting screenshot or paste its text, then a reading state (shimmer), then a confirm step listing what was read.
7. **Compose / Application mail:** the generated mail. Bracketed text marks what was pulled from the posting and the CV, and it can be edited before sending.
8. **CV Bank:** the same pinned search ("Search CV files"), then a file list with one checkbox per file that controls whether the file is in the AI's context. Unchecking a file keeps it without deleting it.
9. **CV detail:** the skills, experience and certifications that were read, plus the include/exclude choice.
10. **Match breakdown (Insights):** 4 dimensions with % bars and a one-line note each: Core skills, Experience depth, Domain language, and one more. Then an "Evidence" list where each posting requirement is paired with a quote from the CV and a check (✓) or gap marker.
11. **CV improvements:** one card per suggestion. Each card has a tag (GAP / KEYWORD / EVIDENCE / TRIM), its location in the CV, the expected lift (e.g. "+4 match"), the line as it stands, the rewrite, and Approve / Skip buttons.

Use the prototype for exact copy and sample data. The data is in the logic class at the bottom of the .dc.html file (`apps`, `dimensions`, `evidence`, `suggestions`, `toneOptions`).

## Interactions & state
- Navigation: Sign in → Career profile → Inbox. Rows open Thread. FAB → Add job → Compose. Tabs switch between Inbox, CV Bank and Insights (Match).
- Application `status` is one of DRAFT, SENT, REPLIED, NO RESPONSE (plus archived). Swipe-right and the thread toggle write REPLIED or NO RESPONSE.
- Row `unread` flag: unread rows use 800 weight for the company and date.
- Score color: score ≥85 uses accent, 75–84 uses accent-700, below 75 uses neutral-700.
- Swipe: track the pointer and translate the row; past a threshold it commits. Bottom tabs show only on Inbox and CV Bank.
- Search filters by company, role and CV name. Chips filter by status label.
- Mail is sent through the user's Gmail (Google OAuth with the gmail.send scope). The app never reads incoming mail.

## Assets
- `assets/careermate-logo.svg`: blue tile with white bars, for light backgrounds.
- `assets/careermate-logo-inverse.svg`: white tile with blue bars, for the accent field.
- Icons: simple 24px stroke icons, stroke-width 2 (Lucide/Feather style). Use Lucide.

## Files
- `screenshots/`: 14 PNGs of every screen and state at 2x (804×1748, for a 402×874 design). Status bar and device bezel are not included. Files: 01-sign-in, 02/03/04 career profile steps, 05-inbox, 06-inbox-drawer, 07-inbox-fab-menu, 08-thread, 09-add-job, 10-compose, 11-cv-bank, 12-cv-detail, 13-match-breakdown, 14-cv-improvements. When a screenshot and this README differ, the README and the prototype take precedence.
- `design/CareerMate Mobile.dc.html`: the full interactive prototype (all screens and state logic).
- `design/support.js`, `design/ios-frame.jsx`, `design/android-frame.jsx`: prototype runtime and device frames (reference only).
- `design/_ds/.../styles.css`: base tokens and classes (`.btn`, `.tag`, `.seg`, `.input`) from the Modernist system. The overrides in the .dc.html (blue accent, radii) take precedence.
