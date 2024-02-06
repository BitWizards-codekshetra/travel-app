import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_proj/app/modules/booking_history/view/booking_history_view.dart';
import 'package:hackathon_proj/app/modules/bottom_bar/providers/bottom_bar_providers.dart';
import 'package:hackathon_proj/app/modules/home/view/home_view.dart';
import 'package:hackathon_proj/app/modules/profile/view/profile_view.dart';

class BottomBarView extends ConsumerStatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  static const routeName = '/bottomBar';

  @override
  ConsumerState<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends ConsumerState<BottomBarView> {
  @override
  Widget build(BuildContext context) {
    final bottomBarScaffoldKey = GlobalKey<ScaffoldState>();
    final currentIndex = ref.watch(bottomBarProvider);
    return Scaffold(
      key: bottomBarScaffoldKey,
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeView(),
          BookingHistoryView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            ref.read(bottomBarProvider.notifier).changeIndex(index);
          },
          animationDuration: Duration(milliseconds: 400),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: [
            NavigationDestination(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              selectedIcon: Icon(
                Icons.home,
              ),
            ),
            NavigationDestination(
              label: 'Bookings',
              icon: Icon(
                Icons.receipt,
                color: Colors.black,
              ),
              selectedIcon: Icon(
                Icons.receipt,
              ),
            ),
            NavigationDestination(
              label: 'Settings',
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              selectedIcon: Icon(
                Icons.settings,
              ),
            ),
          ]),
    );
  }
}
