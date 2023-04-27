import 'package:animiated_sidebar_menu/common/router/auth.dart';
import 'package:animiated_sidebar_menu/data/network/model/token_data.dart';
import 'package:animiated_sidebar_menu/presentation/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final routeNotifier = RouterNotifier(ref: ref);

  return GoRouter(
    routes: routeNotifier.routes,
    initialLocation: MainScreen.routePath,
    refreshListenable: routeNotifier,
    redirect: routeNotifier.redirect,
  );
}

class RouterNotifier extends ChangeNotifier {
  final Ref ref;

  RouterNotifier({
    required this.ref,
  }) {
    ref.listen<TokenData?>(authProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: MainScreen.routePath,
          name: MainScreen.routeName,
          builder: (context, state) => const MainScreen(),
        ),
      ];


  String? redirect(BuildContext context, GoRouterState state) {
    return null;
  }
}
