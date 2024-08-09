import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class TradingSignalViewModel {
  final List<TradingSignal> signals;
  final bool isLoading;
  final String? error;
  final Function(int, BuildContext) onSignalTap;

  TradingSignalViewModel({
    required this.signals,
    required this.isLoading,
    required this.error,
    required this.onSignalTap,
  });

  factory TradingSignalViewModel.fromStore(Store<AppState> store) {
    return TradingSignalViewModel(
      signals: store.state.tradingSignalState.signals,
      isLoading: store.state.tradingSignalState.isLoading,
      error: store.state.tradingSignalState.error,
      onSignalTap: (indexPosition, context) {
        Navigator.of(context).pushNamed(
          Routes.criteria,
          arguments: {
            'indexPosition': indexPosition,
          },
        );
      },
    );
  }
}
