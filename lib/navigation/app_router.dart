import 'package:demo_fitpage/trading_signals/widget/criteria_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_fitpage/navigation/routes.dart';
import 'package:demo_fitpage/trading_signals/widget/criteria_list_screen.dart';
import 'package:demo_fitpage/trading_signals/widget/home_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.criteria:
        return _generateRoute(
            settings,
            (_) => CriteriaListScreen(
                  indexPosition: (settings.arguments as Map)['indexPosition'],
                ));
      case Routes.criteriaDetail:
        return _generateRoute(
            settings,
            (_) => CriteriaDetailScreen(
                  criteriaDetail: (settings.arguments as Map)['criteriaDetail'],
                ));
      default:
        return _generateRoute(settings, (_) => const HomeScreen());
    }
  }

  static MaterialPageRoute<void> _generateRoute(
      RouteSettings settings, Widget Function(BuildContext) builder) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: builder,
    );
  }
}
