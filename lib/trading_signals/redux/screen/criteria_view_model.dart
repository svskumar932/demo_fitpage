import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class CriteriaViewModel {
  final TradingSignal signal;
  final Function(dynamic, BuildContext) onCriteriaClick;

  CriteriaViewModel({
    required this.signal,
    required this.onCriteriaClick,
  });

  factory CriteriaViewModel.fromStore(Store<AppState> store, int index) {
    return CriteriaViewModel(
        signal: store.state.tradingSignalState.signals[index],
        onCriteriaClick: (criteriaDetail, context) {
          Navigator.of(context).pushNamed(
            Routes.criteriaDetail,
            arguments: {
              'criteriaDetail': criteriaDetail,
            },
          );
        });
  }
}
