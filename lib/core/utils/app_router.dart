import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mnjz_store/Features/home/presentation/views/home_view.dart';
import 'package:mnjz_store/Features/layout/presentation/views/layout_view.dart';
import 'package:mnjz_store/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = "/homeView";
  static const kLayoutView = "/layoutView";
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kLayoutView,
        builder: (BuildContext context, GoRouterState state) {
          return const LayoutView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
