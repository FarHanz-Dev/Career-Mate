import 'package:careermate/features/inbox/controller/inbox_controller.dart';
import 'package:careermate/features/inbox/data/application_repository.dart';
import 'package:careermate/features/inbox/models/application.dart';
import 'package:careermate/features/inbox/models/inbox_label.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<Application> all;

  setUp(() async => all = await MockApplicationRepository().fetchAll());

  List<String> companies(List<Application> list) => [for (final a in list) a.company];

  test('All hides archived, Archived shows only archived', () {
    final visible = filterApplications(all, label: InboxLabel.all);
    expect(visible.length, 7);
    expect(visible.any((a) => a.status == AppStatus.archived), isFalse);

    final archived = filterApplications(all, label: InboxLabel.archived);
    expect(archived.length, 3);
    expect(archived.every((a) => a.status == AppStatus.archived), isTrue);
  });

  test('status labels filter by status', () {
    expect(companies(filterApplications(all, label: InboxLabel.drafts)), ['Gojek', 'Kredivo']);
    expect(companies(filterApplications(all, label: InboxLabel.noResponse)), ['Traveloka']);
    expect(companies(filterApplications(all, label: InboxLabel.replied)), ['Xendit', 'Bukalapak']);
  });

  test('search matches company, role and CV name, ignoring case', () {
    expect(companies(filterApplications(all, label: InboxLabel.all, query: 'xen')), ['Xendit']);
    expect(
      companies(filterApplications(all, label: InboxLabel.all, query: 'platform engineer')),
      ['Gojek', 'eFishery'],
    );
    expect(
      companies(filterApplications(all, label: InboxLabel.all, query: 'cv_platform_v1')),
      ['Gojek', 'Bukalapak'],
    );
  });

  test('last 30 days drops older applications', () {
    // On Sep 16 the oldest non-archived application (Aug 24) is 23 days back.
    expect(
      filterApplications(all, label: InboxLabel.all, recentOnly: true, now: DateTime(2026, 9, 16)).length,
      7,
    );
    // On Oct 5 the cutoff is Sep 5, so only the three newest remain.
    expect(
      companies(
        filterApplications(all, label: InboxLabel.all, recentOnly: true, now: DateTime(2026, 10, 5)),
      ),
      ['Tokopedia', 'Gojek', 'Xendit'],
    );
  });
}
