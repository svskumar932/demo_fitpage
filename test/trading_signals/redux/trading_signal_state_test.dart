import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signal_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TradingSignalState', () {
    test('initialState returns TradingSignalState with default values', () {
      final initialState = TradingSignalState.initialState();

      expect(initialState.signals, isEmpty);
      expect(initialState.isLoading, isFalse);
      expect(initialState.error, isNull);
    });

    test('TradingSignalState can be created with custom values', () {
      final signals = [
        TradingSignal(
          id: 1,
          name: 'Signal 1',
          tag: 'S1',
          color: 'red',
          criteria: ['Criteria 1'],
        ),
      ];
      final state = TradingSignalState(
        (b) => b
          ..signals = signals
          ..isLoading = true
          ..error = 'Error message',
      );

      expect(state.signals, signals);
      expect(state.isLoading, isTrue);
      expect(state.error, 'Error message');
    });
  });
}
