/// Placeholder mail copy for the mock backend. Bracketed text marks what was
/// pulled from the posting and the CV; the real generator will replace this.
String draftMailBody({
  required String company,
  required String role,
  required String cvFileName,
  required String location,
  required String name,
}) =>
    'Dear [Hiring Team at $company],\n\n'
    'I am applying for the [$role] role. Over the last [5 years] I have built '
    '[payment-adjacent services in Go and PostgreSQL], most recently '
    '[an idempotent ledger sync that cut reconciliation errors by 38%].\n\n'
    'Three things from your posting I have shipped directly:\n\n'
    '· [Go services at 8k rps behind gRPC]\n'
    '· [Kafka event pipelines with exactly-once delivery]\n'
    '· [Postgres partitioning for a 900M-row ledger]\n\n'
    'My CV is attached as [$cvFileName]. I am based in [$location] and can start within [one month].\n\n'
    'Thank you for your time,\n$name';

/// The same mail once sent: brackets resolved, shorter.
String sentMailBody({required String company, required String role, required String cvName}) =>
    'Dear Hiring Team at $company,\n\n'
    'I am applying for the $role role. Over the last 5 years I have built '
    'payment-adjacent services in Go and PostgreSQL, most recently an idempotent '
    'ledger sync that cut reconciliation errors by 38%.\n\n'
    'CV attached: $cvName.pdf.';

/// "[Jakarta]" -> "Jakarta". Brackets that survive editing are sent as plain text.
String stripBrackets(String body) =>
    body.replaceAllMapped(RegExp(r'\[([^\]]*)\]'), (m) => m[1]!);
