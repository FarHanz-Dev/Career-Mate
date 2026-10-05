import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/profile_repository.dart';
import '../models/career_profile.dart';

part 'profile_flow_controller.freezed.dart';

/// The saved profile. Drafts read it for name, tone and sign-off.
class CareerProfileController extends AsyncNotifier<CareerProfile> {
  @override
  Future<CareerProfile> build() => ref.watch(profileRepositoryProvider).load();

  Future<void> save(CareerProfile profile) async {
    await ref.read(profileRepositoryProvider).save(profile);
    state = AsyncData(profile);
  }
}

final careerProfileProvider =
    AsyncNotifierProvider<CareerProfileController, CareerProfile>(CareerProfileController.new);

@freezed
abstract class ProfileFlowState with _$ProfileFlowState {
  const factory ProfileFlowState({
    required int step,
    required CareerProfile profile,
  }) = _ProfileFlowState;
}

/// Three steps: you, your CV, mail and terms. Edits live here until saved, so
/// "Skip for now" discards them.
class ProfileFlowController extends Notifier<ProfileFlowState> {
  static const stepCount = 3;

  @override
  ProfileFlowState build() =>
      ProfileFlowState(step: 0, profile: ref.read(careerProfileProvider).requireValue);

  void _edit(CareerProfile Function(CareerProfile) f) =>
      state = state.copyWith(profile: f(state.profile));

  void goToStep(int step) => state = state.copyWith(step: step.clamp(0, stepCount - 1));
  void next() => goToStep(state.step + 1);
  void back() => goToStep(state.step - 1);

  void setName(String v) => _edit((p) => p.copyWith(name: v));
  void setHeadline(String v) => _edit((p) => p.copyWith(headline: v));
  void setEmail(String v) => _edit((p) => p.copyWith(email: v));
  void setYears(YearsBand v) => _edit((p) => p.copyWith(years: v));
  void setLocation(WorkLocation v) => _edit((p) => p.copyWith(location: v));
  void setTone(MailTone v) => _edit((p) => p.copyWith(tone: v));
  void setCvScope(CvContextScope v) => _edit((p) => p.copyWith(cvScope: v));
  void setNotice(String v) => _edit((p) => p.copyWith(notice: v));
  void setSalary(String v) => _edit((p) => p.copyWith(salary: v));
  void setSignOff(String v) => _edit((p) => p.copyWith(signOff: v));

  void toggleRole(String role) => _edit((p) {
    final roles = {...p.targetRoles};
    if (!roles.remove(role)) roles.add(role);
    return p.copyWith(targetRoles: roles);
  });

  Future<void> save() => ref.read(careerProfileProvider.notifier).save(state.profile);
}

final profileFlowControllerProvider =
    NotifierProvider.autoDispose<ProfileFlowController, ProfileFlowState>(ProfileFlowController.new);
