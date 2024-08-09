import 'package:built_value/built_value.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signal_state.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  TradingSignalState get tradingSignalState;

  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.initialState() => AppState(
        (builder) => builder
          ..tradingSignalState.replace(TradingSignalState.initialState()),
      );
}
