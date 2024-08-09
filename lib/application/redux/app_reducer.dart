import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return state.rebuild((builder) => builder
    ..tradingSignalState
        .replace(tradingSignalReducer(state.tradingSignalState, action)));
}
