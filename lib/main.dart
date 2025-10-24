import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/messanger_swipe_actions.dart';
import 'screens/messanger_people.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/messanger_swipe_actions',
  routes: <RouteBase>[
    GoRoute(
      path: '/messanger_swipe_actions',
      builder: (BuildContext context, GoRouterState state) {
        return const MessangerSwipeActions();
      },
    ),
    GoRoute(
      path: '/messanger_people',
      builder: (BuildContext context, GoRouterState state) {
        return const MessangerPeople();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}
