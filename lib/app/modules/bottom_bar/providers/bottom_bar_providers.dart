import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarNotifier extends StateNotifier<int> {
  BottomBarNotifier() : super(0);
  void changeIndex(int newIndex) {
    state = newIndex;
  }
}

final bottomBarProvider = StateNotifierProvider<BottomBarNotifier, int>((ref) {
  return BottomBarNotifier();
});
