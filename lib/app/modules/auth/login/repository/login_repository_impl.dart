import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'login_repository.dart';

part 'login_repository_impl.g.dart';

class LoginRepositoryImpl extends LoginRepository {
  // TODO add your methods here
}

@riverpod
 LoginRepository loginRepository(LoginRepositoryRef ref) =>
    LoginRepositoryImpl();

