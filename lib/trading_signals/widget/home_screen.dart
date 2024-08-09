import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/application/widget/dashed_line_painter.dart';
import 'package:demo_fitpage/trading_signals/redux/screen/trading_signal_view_model.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_actions.dart';
import 'package:demo_fitpage/trading_signals/widget/trading_signal_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, TradingSignalViewModel>(
        converter: (store) => TradingSignalViewModel.fromStore(store),
        onInit: (store) => store.dispatch(FetchTradingSignalsAction()),
        builder: (context, viewModel) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.error != null) {
            return Center(child: Text('Error: ${viewModel.error}'));
          } else {
            return ListView.builder(
              itemCount: viewModel.signals.length,
              itemBuilder: (context, index) {
                final signal = viewModel.signals[index];
                final isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          viewModel.onSignalTap(index, context);
                        },
                        child: TradingSignalListItem(
                          signal: signal,
                          isUnderlined: isSelected,
                        ),
                      ),
                      CustomPaint(
                        size: const Size(double.infinity, 1),
                        painter: DashedLinePainter(),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
