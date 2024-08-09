import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_actions.dart';
import 'package:redux/redux.dart';
import '../../data/api_service.dart';

List<Middleware<AppState>> createTradingSignalMiddleware(
    {required ApiService apiService}) {
  return [
    TypedMiddleware<AppState, FetchTradingSignalsAction>(
            _fetchTradingSignals(apiService))
        .call,
  ];
}

Middleware<AppState> _fetchTradingSignals(ApiService apiService) {
  return (Store<AppState> store, action, NextDispatcher next) async {
    next(action);
    try {
      final signals = await apiService.fetchTradingSignals();
      store.dispatch(TradingSignalsLoadedAction(signals));
    } catch (e) {
      store.dispatch(TradingSignalsErrorAction(e.toString()));
    }
  };
}
