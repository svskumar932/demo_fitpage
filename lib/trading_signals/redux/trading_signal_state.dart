import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:built_value/built_value.dart';

part 'trading_signal_state.g.dart';

abstract class TradingSignalState
    implements Built<TradingSignalState, TradingSignalStateBuilder> {
  List<TradingSignal> get signals;
  bool get isLoading;
  String? get error;

  TradingSignalState._();

  factory TradingSignalState(
          [void Function(TradingSignalStateBuilder) updates]) =
      _$TradingSignalState;

  factory TradingSignalState.initialState() => TradingSignalState(
        (builder) => builder
          ..signals = []
          ..error = null
          ..isLoading = false,
      );
}
