import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'profile_repository.dart';

part 'profile_repository_impl.g.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  // TODO add your methods here
}

@riverpod
 ProfileRepository profileRepository(ProfileRepositoryRef ref) =>
    ProfileRepositoryImpl();

