import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_proj/app/modules/ask_ai/model/aski_ai_response/place.dart';
import 'package:hackathon_proj/app/modules/ask_ai/view/ask_ai_view.dart';
import 'package:hackathon_proj/app/modules/auth/login/view/login_view.dart';
import 'package:hackathon_proj/app/modules/auth/register/view/register_view.dart';
import 'package:hackathon_proj/app/modules/book_hotel/view/book_hotel_view.dart';
import 'package:hackathon_proj/app/modules/book_hotel/view/hotel_details.dart';
import 'package:hackathon_proj/app/modules/booking_history/view/booking_history_view.dart';
import 'package:hackathon_proj/app/modules/bottom_bar/view/bottom_bar_view.dart';
import 'package:hackathon_proj/app/modules/home/view/home_view.dart';
import 'package:hackathon_proj/app/modules/onboarding/view/onboarding_view.dart';
import 'package:hackathon_proj/app/modules/profile/view/profile_view.dart';
import 'package:hackathon_proj/app/modules/splash/splash_screen.dart';

import '../../modules/place_details/view/place_details_view.dart';

///
/// for getting routers that are present in the app
///
///
final globalNavigatorKey = GlobalKey<NavigatorState>();
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: SplashView.routeName,
      navigatorKey: globalNavigatorKey,
      routes: [
        /// for showing onboarding

        GoRoute(
          path: SplashView.routeName,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: OnboardingView.routeName,
          builder: (context, state) => OnboardingView(),
        ),

        GoRoute(
          path: ProfileView.routeName,
          builder: (context, state) => const ProfileView(),
        ),

        GoRoute(
          path: HotelDetailView.routeName,
          builder: (context, state) => HotelDetailView(),
        ),

        GoRoute(
          path: AskAiView.routeName,
          builder: (context, state) => AskAiView(),
        ),

        GoRoute(
          path: BookingHistoryView.routeName,
          builder: (context, state) => BookingHistoryView(),
        ),

        GoRoute(
          path: LoginView.routeName,
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          path: BottomBarView.routeName,
          builder: (context, state) => BottomBarView(),
        ),
        GoRoute(
          path: HomeView.routeName,
          builder: (context, state) => HomeView(),
        ),

        GoRoute(
            // path: CancelBookingView.routeName,
            // pageBuilder: (context, state) =>
            //     appTransiton(context, state, const CancelBookingView()),

            path: PlaceDetailsView.routeName,
            name: PlaceDetailsView.routeName,
            pageBuilder: (context, state) {
              final Place details = state.extra as Place;
              return appTransiton(
                  context, state, PlaceDetailsView(placeDescription: details));
            }),

        GoRoute(
          path: BookHotelView.routeName,
          builder: (context, state) => BookHotelView(),
        ),

        GoRoute(
          path: RegisterView.routeName,
          builder: (context, state) => RegisterView(),
        )
      ],
    );
  },
);

CustomTransitionPage appTransiton(
    BuildContext context, GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
