import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_providers.g.dart';

@riverpod
class SelectedChoice extends _$SelectedChoice {
  @override
  String build() {
    return '';
  }

  void selectCategories(String value) {
    state = value;
  }
}
