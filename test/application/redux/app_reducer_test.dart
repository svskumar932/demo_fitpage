import 'package:demo_fitpage/application/redux/app_reducer.dart';
import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_actions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('appReducer', () {
    test('updates TradingSignalState based on action', () {
      final initialState = AppState.initialState();
      final action = FetchTradingSignalsAction();
      final nextState = appReducer(initialState, action);
      expect(
          nextState.tradingSignalState, isNot(initialState.tradingSignalState));
    });

    test('returns same state for unknown action', () {
      final initialState = AppState.initialState();
      const action = 'unknown_action';
      final nextState = appReducer(initialState, action);
      expect(nextState, initialState);
    });
  });
}
