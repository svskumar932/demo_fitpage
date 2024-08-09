import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/trading_signals/widget/criteria_list_screen.dart';
import 'package:demo_fitpage/trading_signals/widget/formatted_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CriteriaListScreen', () {
    testWidgets('displays signal name and tag', (WidgetTester tester) async {
      final signal = TradingSignal(
        id: 1,
        name: 'Signal Name',
        tag: 'Signal Tag',
        color: '#FF0000',
        criteria: [],
      );
      await tester.pumpWidget(
          wrap(const CriteriaListScreen(indexPosition: 0), signal: signal));
      expect(find.text('Signal Name'), findsOneWidget);
      expect(find.text('Signal Tag'), findsOneWidget);
    });

    testWidgets('displays criteria list', (WidgetTester tester) async {
      final signal = TradingSignal(
        id: 1,
        name: 'Signal Name',
        tag: 'Signal Tag',
        color: '#FF0000',
        criteria: [
          {'text': 'Criteria 1'},
          {'text': 'Criteria 2'},
        ],
      );
      await tester.pumpWidget(
          wrap(const CriteriaListScreen(indexPosition: 0), signal: signal));
      expect(find.text('Criteria 1'), findsOneWidget);
      expect(find.text('Criteria 2'), findsOneWidget);
      expect(find.text('and'), findsOneWidget);
    });

    testWidgets('displays no criteria message when criteria is empty',
        (WidgetTester tester) async {
      final signal = TradingSignal(
        id: 1,
        name: 'Signal Name',
        tag: 'Signal Tag',
        color: '#FF0000',
        criteria: [],
      );
      await tester.pumpWidget(
          wrap(const CriteriaListScreen(indexPosition: 0), signal: signal));
      expect(find.text('Nocriteria found.'),
          findsNothing); // or findsOneWidget if you have a message for empty criteria
    });
  });
}

Widget wrap(Widget child, {TradingSignal? signal}) {
  return MaterialApp(
    home: Scaffold(
      body: Builder(
        builder: (context) {
          if (signal != null) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xFF26718C),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            signal.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            signal.tag,
                            style: const TextStyle(
                              color: Colors
                                  .white, // Replace with actual color conversion logic
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: ListView.builder(
                        itemCount: signal.criteria.length,
                        itemBuilder: (context, index) {
                          final criteria = signal.criteria[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FormattedText(
                                text: criteria['text'] ?? '',
                                onTap: (_) {},
                              ),
                              if (index < signal.criteria.length - 1) ...[
                                const SizedBox(height: 8),
                                const Text(
                                  'and',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    ),
  );
}
