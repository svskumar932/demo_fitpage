import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:redux/redux.dart';

class TradingSignalViewModel {
  final List<TradingSignal> signals;
  final bool isLoading;
  final String? error;

  TradingSignalViewModel({
    required this.signals,
    required this.isLoading,
    required this.error,
  });

  factory TradingSignalViewModel.fromStore(Store<AppState> store) {
    return TradingSignalViewModel(
      signals: store.state.tradingSignalState.signals,
      isLoading: store.state.tradingSignalState.isLoading,
      error: store.state.tradingSignalState.error,
    );
  }
}
