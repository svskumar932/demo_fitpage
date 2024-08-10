import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_reducer.dart';

// This is the root reducer for the application.
// It combines all the individual reducers into a single reducer function.
AppState appReducer(AppState state, dynamic action) {
  // Rebuild the AppState using the builder pattern.
  return state.rebuild((builder) => builder
    // Update the tradingSignalState by calling the tradingSignalReducer.
    ..tradingSignalState
        .replace(tradingSignalReducer(state.tradingSignalState, action)));
}
