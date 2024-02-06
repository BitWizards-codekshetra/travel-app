import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'setting_repository.dart';

part 'setting_repository_impl.g.dart';

class SettingRepositoryImpl extends SettingRepository {
  // TODO add your methods here
}

@riverpod
 SettingRepository settingRepository(SettingRepositoryRef ref) =>
    SettingRepositoryImpl();

