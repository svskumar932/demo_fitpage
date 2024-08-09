import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/trading_signals/redux/screen/trading_signal_view_model.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signal_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';

import 'trading_signal_view_model_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<Store<AppState>>()])
void main() {
  group('TradingSignalViewModel', () {
    late MockStore mockStore;

    setUp(() {
      mockStore = MockStore();
    });

    test('fromStore creates TradingSignalViewModel with correct data', () {
      final signal = TradingSignal(
        id: 1,
        name: 'Test Signal',
        tag: 'TS',
        color: 'red',
        criteria: ['criterion1', 'criterion2'],
      );
      when(mockStore.state).thenReturn(
        AppState.initialState().rebuild(
          (builder) => builder
            ..tradingSignalState.replace(
              TradingSignalState(
                (b) => b
                  ..signals = [
                    signal,
                  ]
                  ..isLoading = true
                  ..error = null,
              ),
            ),
        ),
      );

      final viewModel = TradingSignalViewModel.fromStore(mockStore);

      expect(viewModel.isLoading, true);
      expect(viewModel.error, isNull);
      expect(viewModel.signals, [signal]);
    });
  });
}
