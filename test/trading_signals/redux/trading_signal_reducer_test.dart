import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signal_state.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_actions.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_reducer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TradingSignalReducer', () {
    test('FetchTradingSignalsAction sets isLoading to true and clears error',
        () {
      final initialState = TradingSignalState.initialState();
      final action = FetchTradingSignalsAction();
      final nextState = tradingSignalReducer(initialState, action);

      expect(nextState.isLoading, isTrue);
      expect(nextState.error, isNull);
    });

    test(
        'TradingSignalsLoadedAction sets isLoading to false and updates signals',
        () {
      final initialState = TradingSignalState.initialState();
      final signals = [
        TradingSignal(
          id: 1,
          name: 'Signal 1',
          tag: 'S1',
          color: '#FF0000',
          criteria: ['Criteria 1'],
        ),
      ];
      final action = TradingSignalsLoadedAction(signals);
      final nextState = tradingSignalReducer(initialState, action);

      expect(nextState.isLoading, isFalse);
      expect(nextState.signals, signals);
    });

    test('TradingSignalsErrorAction sets isLoading to false and updates error',
        () {
      final initialState = TradingSignalState.initialState();
      final action = TradingSignalsErrorAction('Test error');
      final nextState = tradingSignalReducer(initialState, action);

      expect(nextState.isLoading, isFalse);
      expect(nextState.error, 'Test error');
    });
  });
}
