import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/career_profile.dart';

abstract class ProfileRepository {
  Future<CareerProfile> load();
  Future<void> save(CareerProfile profile);
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) => MockProfileRepository());

class MockProfileRepository implements ProfileRepository {
  CareerProfile _profile = const CareerProfile(
    name: 'Muhammad Karim',
    headline: 'Backend engineer, 5 yrs, Go and PostgreSQL',
    email: 'karim@gmail.com',
    notice: '1 month',
    salary: 'IDR 32 to 38 M / mo',
    signOff: 'Thank you for your time, Muhammad Karim',
    targetRoles: {'Backend Engineer', 'Platform Engineer'},
  );

  @override
  Future<CareerProfile> load() async => _profile;

  @override
  Future<void> save(CareerProfile profile) async => _profile = profile;
}
