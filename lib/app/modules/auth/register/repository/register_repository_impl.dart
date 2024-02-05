import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'register_repository.dart';

part 'register_repository_impl.g.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  // TODO add your methods here
}

@riverpod
 RegisterRepository registerRepository(RegisterRepositoryRef ref) =>
    RegisterRepositoryImpl();

