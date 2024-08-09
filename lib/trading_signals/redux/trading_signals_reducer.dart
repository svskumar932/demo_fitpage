import 'package:demo_fitpage/trading_signals/redux/trading_signal_state.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_actions.dart';
import 'package:redux/redux.dart';

final tradingSignalReducer = combineReducers<TradingSignalState>([
  TypedReducer<TradingSignalState, FetchTradingSignalsAction>(
          _fetchTradingSignals)
      .call,
  TypedReducer<TradingSignalState, TradingSignalsLoadedAction>(
          _tradingSignalsLoaded)
      .call,
  TypedReducer<TradingSignalState, TradingSignalsErrorAction>(
          _tradingSignalsFailed)
      .call,
]);

TradingSignalState _fetchTradingSignals(
  TradingSignalState state,
  FetchTradingSignalsAction action,
) {
  return state.rebuild(
    (s) => s
      ..isLoading = true
      ..error = null,
  );
}

TradingSignalState _tradingSignalsLoaded(
  TradingSignalState state,
  TradingSignalsLoadedAction action,
) {
  return state.rebuild(
    (s) => s
      ..isLoading = false
      ..signals = action.signals,
  );
}

TradingSignalState _tradingSignalsFailed(
  TradingSignalState state,
  TradingSignalsErrorAction action,
) {
  return state.rebuild(
    (s) => s
      ..isLoading = false
      ..error = action.error,
  );
}
