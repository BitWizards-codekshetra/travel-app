import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'onboarding_repository.dart';

part 'onboarding_repository_impl.g.dart';

class OnboardingRepositoryImpl extends OnboardingRepository {
  // TODO add your methods here
}

@riverpod
 OnboardingRepository onboardingRepository(OnboardingRepositoryRef ref) =>
    OnboardingRepositoryImpl();

