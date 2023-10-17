import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:base_flutter/presentation/initializer/initializer.screen.dart';
import 'package:base_flutter/presentation/route_error/route_error.screen.dart';
import 'package:base_flutter/presentation/sample_module/sample_module.screen.dart';

part 'route_param.dart';

part 'routes.dart';

class Nav {
  static final GoRouter goRoutes = GoRouter(
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => RouteErrorScreen(error: state.error),
    routes: [
      TransitionRoute(
        name: RoutePath.initializer,
        nameAlt: RoutePath.initializer,
        page: (context, state) => InitializerScreen(state: state),
        routes: [
          TransitionRoute(
            name: RoutePath.sampleModule,
            nameAlt: RoutePath.sampleModule,
            page: (context, state) => const SampleModuleScreen(),
          ),
        ],
      ),
    ],
  );
}

// ignore: non_constant_identifier_names
GoRoute TransitionRoute({
  required String name,
  required Widget Function(BuildContext, GoRouterState)? page,
  String? nameAlt,
  bool isShellRouting = false,
  List<RouteBase> routes = const <RouteBase>[],
}) {
  return GoRoute(
    path: name,
    name: nameAlt,
    pageBuilder: !isShellRouting
        ? null
        : (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: page!.call(context, state),
              transitionDuration: const Duration(milliseconds: 50),
              transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
            );
          },
    builder: isShellRouting
        ? null
        : (context, state) {
            return page!.call(context, state);
          },
    routes: routes,
  );
}
