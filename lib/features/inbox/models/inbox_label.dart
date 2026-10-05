import 'application.dart';

/// Status labels take the place of Gmail folders.
enum InboxLabel {
  all('All'),
  drafts('Drafts'),
  sent('Sent'),
  replied('Replied'),
  noResponse('No response'),
  archived('Archived');

  const InboxLabel(this.title);

  final String title;

  bool matches(AppStatus status) => switch (this) {
    all => status != AppStatus.archived,
    drafts => status == AppStatus.draft,
    sent => status == AppStatus.sent,
    replied => status == AppStatus.replied,
    noResponse => status == AppStatus.noResponse,
    archived => status == AppStatus.archived,
  };
}
