import 'package:demo_fitpage/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_fitpage/navigation/routes.dart';

void main() {
  group('AppRouter', () {
    test(
        'returns MaterialPageRoute with CriteriaListScreen for Routes.criteria',
        () {
      const settings =
          RouteSettings(name: Routes.criteria, arguments: {'indexPosition': 1});
      final route =
          AppRouter.onGenerateRoute(settings) as MaterialPageRoute<void>;
      expect(route.settings.name, Routes.criteria);
      expect((settings.arguments as Map)['indexPosition'], 1);
    });

    test(
        'returns MaterialPageRoute with CriteriaDetailScreen for Routes.criteriaDetail',
        () {
      const settings = RouteSettings(
          name: Routes.criteriaDetail,
          arguments: {'criteriaDetail': 'detail info'});
      final route =
          AppRouter.onGenerateRoute(settings) as MaterialPageRoute<void>;
      expect(route.settings.name, Routes.criteriaDetail);
      expect((settings.arguments as Map)['criteriaDetail'], 'detail info');
    });

    test('returns MaterialPageRoute with HomeScreen for unknown routes', () {
      const settings = RouteSettings(name: 'unknownRoute');
      final route =
          AppRouter.onGenerateRoute(settings) as MaterialPageRoute<void>;
      expect(route.settings.name, 'unknownRoute');
    });
  });
}
