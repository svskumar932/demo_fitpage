import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/trading_signals/widget/trading_signal_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TradingSignalListItem tests', () {
    testWidgets('displays signal name and tag correctly',
        (WidgetTester tester) async {
      final signal = TradingSignal(
        id: 1,
        name: 'Signal Name',
        tag: 'Signal Tag',
        color: 'red',
        criteria: [],
      );
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TradingSignalListItem(signal: signal),
        ),
      ));
      expect(find.text('Signal Name'), findsOneWidget);
      expect(find.text('Signal Tag'), findsOneWidget);
      expect(find.byIcon(Icons.circle), findsOneWidget);
      final icon = tester.widget<Icon>(find.byIcon(Icons.circle));
      expect(icon.color, Colors.black); // Verify icon color
      expect(icon.size, 10.0);
    });

    testWidgets('applies underline decoration when isUnderlined isFalse',
        (WidgetTester tester) async {
      final signal = TradingSignal(
        id: 1,
        name: 'Signal Name',
        tag: 'Signal Tag',
        color: 'blue',
        criteria: [],
      );
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TradingSignalListItem(signal: signal),
        ),
      ));
      final titleText = tester.widget<Text>(find.text('Signal Name'));
      final subtitleText = tester.widget<Text>(find.text('Signal Tag'));
      expect(titleText.style!.decoration, TextDecoration.underline);
      expect(subtitleText.style!.decoration, TextDecoration.underline);
    });

    testWidgets('does not apply underline decoration when isUnderlined is true',
        (WidgetTester tester) async {
      final signal = TradingSignal(
        id: 1,
        name: 'Signal Name',
        tag: 'Signal Tag',
        color: 'red',
        criteria: [],
      );
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TradingSignalListItem(signal: signal, isUnderlined: true),
        ),
      ));
      final titleText = tester.widget<Text>(find.text('Signal Name'));
      final subtitleText = tester.widget<Text>(find.text('Signal Tag'));
      expect(titleText.style!.decoration, TextDecoration.none);
      expect(subtitleText.style!.decoration, TextDecoration.none);
    });

    testWidgets('uses correct color for tag', (WidgetTester tester) async {
      final signal = TradingSignal(
        id: 1,
        name: 'Signal Name',
        tag: 'Signal Tag',
        color: 'red',
        criteria: [],
      );
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: TradingSignalListItem(signal: signal),
        ),
      ));
      final subtitleText = tester.widget<Text>(find.text('Signal Tag'));
      expect(subtitleText.style!.color, Colors.red);
    });
  });
}
