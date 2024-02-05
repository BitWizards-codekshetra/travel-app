import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'edit_profile_repository.dart';

part 'edit_profile_repository_impl.g.dart';

class EditProfileRepositoryImpl extends EditProfileRepository {
  // TODO add your methods here
}

@riverpod
 EditProfileRepository editProfileRepository(EditProfileRepositoryRef ref) =>
    EditProfileRepositoryImpl();

