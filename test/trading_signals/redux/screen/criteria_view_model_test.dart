import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/trading_signals/redux/screen/criteria_view_model.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signal_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';

import 'criteria_view_model_test.mocks.dart';

@GenerateMocks([], customMocks: [MockSpec<Store<AppState>>()])
void main() {
  group('CriteriaViewModel', () {
    late MockStore mockStore;

    setUp(() {
      mockStore = MockStore();
    });

    test('fromStore creates CriteriaViewModel with correct data', () {
      final signal = TradingSignal(
        id: 1,
        name: 'Test Signal',
        tag: 'TS',
        color: '#FF0000',
        criteria: ['criterion1', 'criterion2'],
      );
      when(mockStore.state).thenReturn(
        AppState.initialState().rebuild(
          (builder) => builder
            ..tradingSignalState.replace(
              TradingSignalState((b) => b
                ..signals = [
                  signal,
                ]
                ..isLoading = true
                ..error = null),
            ),
        ),
      );

      final viewModel = CriteriaViewModel.fromStore(mockStore, 0);

      expect(viewModel.signal, signal);
    });
  });
}
