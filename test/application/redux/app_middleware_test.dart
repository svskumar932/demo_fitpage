import 'package:demo_fitpage/application/redux/app_middleware.dart';
import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  group('createMiddleware', () {
    test('returns a list of middleware', () async {
      final middleware = await createMiddleware();
      expect(middleware, isA<List<Middleware<AppState>>>());
    });

    test('includes trading signal middleware', () async {
      final middleware = await createMiddleware();
      // Assuming createTradingSignalMiddleware returns at least one middleware
      expect(middleware.length, greaterThanOrEqualTo(1));
    });
  });
}
