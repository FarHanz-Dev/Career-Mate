import 'package:freezed_annotation/freezed_annotation.dart';

part 'career_profile.freezed.dart';

enum YearsBand {
  upTo2('0–2'),
  threeToFour('3–4'),
  fiveToSeven('5–7'),
  eightPlus('8+');

  const YearsBand(this.label);

  final String label;
}

enum WorkLocation {
  remote('Remote'),
  jakarta('Jakarta'),
  hybrid('Hybrid');

  const WorkLocation(this.label);

  final String label;
}

enum MailTone {
  formal(
    'Formal and short',
    'formal',
    'Three paragraphs, no adjectives. Safest for banks and enterprises.',
  ),
  warm(
    'Warm and specific',
    'warm',
    'Names one thing you admire about their product, then the evidence.',
  ),
  direct(
    'Direct, bullet-led',
    'direct',
    'Two lines, then three bullets of proof. Reads fast on a phone.',
  );

  const MailTone(this.label, this.short, this.note);

  final String label;

  /// One word, for the "Tone: formal" tag on the mail.
  final String short;
  final String note;
}

enum CvContextScope {
  primaryOnly('Primary CV only, tighter drafts'),
  allMarked('Every CV marked in the bank');

  const CvContextScope(this.label);

  final String label;
}

const targetRoleOptions = [
  'Backend Engineer',
  'Platform Engineer',
  'Site Reliability',
  'Data Engineer',
  'Solutions Architect',
  'Engineering Lead',
];

/// The standing context every draft reads, so the AI never has to be told who
/// the user is twice.
@freezed
abstract class CareerProfile with _$CareerProfile {
  const factory CareerProfile({
    required String name,
    required String headline,
    required String email,
    required String notice,
    required String salary,
    required String signOff,
    @Default(YearsBand.fiveToSeven) YearsBand years,
    @Default(<String>{}) Set<String> targetRoles,
    @Default(WorkLocation.remote) WorkLocation location,
    @Default(MailTone.formal) MailTone tone,
    @Default(CvContextScope.primaryOnly) CvContextScope cvScope,
    @Default(['English', 'Bahasa Indonesia']) List<String> languages,
  }) = _CareerProfile;
}
