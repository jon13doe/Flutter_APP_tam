import 'package:tam_app/global_imports.dart';

import 'package:tam_app/features/title_screen/index.dart';
import 'package:tam_app/features/main_screen/home_page/index.dart';
import 'package:tam_app/features/main_screen/models_page/index.dart';
import 'package:tam_app/features/main_screen/shows_page/index.dart';
import 'package:tam_app/features/main_screen/school_page/index.dart';
import 'package:tam_app/features/main_screen/app_bar/index.dart';
import 'package:tam_app/features/main_screen/navigation_bar/index.dart';


final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();


final GoRouter router = GoRouter(
  initialLocation: '/title',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/title',
      builder: (context, state) {
        return const TitleScreen();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          appBar: const TAMAppBar(),
          body: child,
          bottomNavigationBar: const TAMBottomNavigationBar(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const Home();
          },
          routes: [
            GoRoute(
              path: 'shows',
              builder: (context, state) {
                return const Shows();
              },
            ),
            GoRoute(
              path: 'models',
              builder: (context, state) {
                return const Models();
              },
            ),
            GoRoute(
              path: 'school',
              builder: (context, state) {
                return const School();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);