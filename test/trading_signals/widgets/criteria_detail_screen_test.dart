import 'package:demo_fitpage/trading_signals/widget/criteria_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CriteriaDetailScreen', () {
    testWidgets('displays values list when type is value',
        (WidgetTester tester) async {
      final criteriaDetail = {
        'type': 'value',
        'values': [1, 2, 3],
      };
      await tester.pumpWidget(
          wrap(CriteriaDetailScreen(criteriaDetail: criteriaDetail)));
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('displays indicator details when type is indicator',
        (WidgetTester tester) async {
      final criteriaDetail = {
        'type': 'indicator',
        'study_type': 'test indicator',
        'parameter_name': 'test parameter',
        'default_value': 123,
      };
      await tester.pumpWidget(
          wrap(CriteriaDetailScreen(criteriaDetail: criteriaDetail)));
      expect(find.text('TEST INDICATOR'), findsOneWidget);
      expect(find.text('Set Parameters'), findsOneWidget);
      expect(find.text('Test Parameter'), findsOneWidget);
      expect(find.text('123'), findsOneWidget);
    });

    testWidgets('displays nothing when type is unknown',
        (WidgetTester tester) async {
      final criteriaDetail = {
        'type': 'unknown',
      };
      await tester.pumpWidget(
          wrap(CriteriaDetailScreen(criteriaDetail: criteriaDetail)));
      expect(find.byType(SizedBox), findsOneWidget);
    });
  });
}

Widget wrap(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}
