import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'home_repository.dart';

part 'home_repository_impl.g.dart';

class HomeRepositoryImpl extends HomeRepository {
  // TODO add your methods here
}

@riverpod
 HomeRepository homeRepository(HomeRepositoryRef ref) =>
    HomeRepositoryImpl();

