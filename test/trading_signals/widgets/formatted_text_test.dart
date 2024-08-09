import 'package:demo_fitpage/trading_signals/widget/formatted_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('FormattedText', () {
    testWidgets('displays regular text', (WidgetTester tester) async {
      await tester
          .pumpWidget(wrap(FormattedText(text: 'Hello world', onTap: (_) {})));
      expect(find.text('Hello world'), findsOneWidget);
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
