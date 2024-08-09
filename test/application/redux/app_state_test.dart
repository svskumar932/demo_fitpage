import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signal_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppState', () {
    test('initialState() returns AppState with initial TradingSignalState', () {
      final appState = AppState.initialState();
      final expectedState = TradingSignalState.initialState();
      expect(appState.tradingSignalState.signals, expectedState.signals);
      expect(appState.tradingSignalState.isLoading, expectedState.isLoading);
      expect(appState.tradingSignalState.error, expectedState.error);
    });

    test('updates() function updates AppState correctly', () {
      final appState = AppState.initialState().rebuild((builder) => builder
        ..tradingSignalState.replace(TradingSignalState((b) => b
          ..signals = [
            TradingSignal(
              id: 1,
              name: 'name',
              tag: 'tag',
              color: 'color',
              criteria: [],
            ),
          ]
          ..isLoading = true
          ..error = null)));
      expect(appState.tradingSignalState.isLoading, true);
      expect(appState.tradingSignalState.error, null);
      expect(appState.tradingSignalState.signals[0].id, equals(1));
      expect(appState.tradingSignalState.signals[0].name, equals('name'));
      expect(appState.tradingSignalState.signals[0].tag, equals('tag'));
      expect(appState.tradingSignalState.signals[0].color, equals('color'));
      expect(appState.tradingSignalState.signals[0].criteria, equals([]));
    });
  });
}
