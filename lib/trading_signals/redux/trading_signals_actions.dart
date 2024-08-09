import 'package:demo_fitpage/data/models/trading_signal.dart';

class FetchTradingSignalsAction {}

class TradingSignalsLoadedAction {
  final List<TradingSignal> signals;

  TradingSignalsLoadedAction(this.signals);
}

class TradingSignalsErrorAction {
  final String error;

  TradingSignalsErrorAction(this.error);
}
