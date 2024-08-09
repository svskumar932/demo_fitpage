import 'package:demo_fitpage/application/widget/dashed_line_painter.dart';
import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/trading_signals/widget/home_screen.dart';
import 'package:demo_fitpage/trading_signals/widget/trading_signal_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreen', () {
    testWidgets('displays loading indicator when isLoading istrue',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrap(const HomeScreen(), isLoading: true));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error message when error is not null',
        (WidgetTester tester) async {
      await tester.pumpWidget(wrap(const HomeScreen(), error: 'Test error'));
      expect(find.text('Error: Test error'), findsOneWidget);
    });

    testWidgets('displays trading signal list when signals are available',
        (WidgetTester tester) async {
      final signals = [
        TradingSignal(
            id: 1,
            name: 'Signal 1',
            tag: 'Tag 1',
            color: '#FF0000',
            criteria: []),
        TradingSignal(
            id: 2,
            name: 'Signal 2',
            tag: 'Tag 2',
            color: '#00FF00',
            criteria: []),
      ];
      await tester.pumpWidget(wrap(const HomeScreen(), signals: signals));
      expect(find.text('Signal 1'), findsOneWidget);
      expect(find.text('Signal 2'), findsOneWidget);
    });

    testWidgets('highlights selected signal', (WidgetTester tester) async {
      final signals = [
        TradingSignal(
            id: 1,
            name: 'Signal 1',
            tag: 'Tag 1',
            color: '#FF0000',
            criteria: []),
        TradingSignal(
            id: 2,
            name: 'Signal 2',
            tag: 'Tag 2',
            color: '#00FF00',
            criteria: []),
      ];
      await tester.pumpWidget(wrap(const HomeScreen(), signals: signals));
      await tester.tap(find.text('Signal 1'));
      await tester.pumpAndSettle();
      expect(find.byType(TradingSignalListItem), findsNWidgets(2));
    });
  });
}

Widget wrap(Widget child,
    {bool isLoading = false,
    String? error,
    List<TradingSignal> signals = const []}) {
  return MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (error != null) {
            return Center(child: Text('Error: $error'));
          } else {
            return ListView.builder(
              itemCount: signals.length,
              itemBuilder: (context, index) {
                final signal = signals[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: TradingSignalListItem(
                          signal: signal,
                          isUnderlined: false,
                        ),
                      ),
                      CustomPaint(
                        size: const Size(double.infinity, 1),
                        painter: DashedLinePainter(),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    ),
  );
}
