import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/trading_signals/redux/screen/criteria_view_model.dart';
import 'package:demo_fitpage/trading_signals/widget/formatted_text.dart';
import 'package:demo_fitpage/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../data/models/trading_signal.dart';

class CriteriaListScreen extends StatelessWidget {
  final int indexPosition;

  const CriteriaListScreen({
    super.key,
    required this.indexPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, CriteriaViewModel>(
        converter: (store) => CriteriaViewModel.fromStore(store, indexPosition),
        builder: (context, viewModel) {
          TradingSignal signal = viewModel.signal;
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Container(
                    width: double.infinity,
                    color: const Color(0xFF26718C),
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          signal.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          signal.tag,
                          style: TextStyle(
                            color: signal.color.toColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: ListView.builder(
                      itemCount: signal.criteria.length,
                      itemBuilder: (context, index) {
                        final criteria = signal.criteria[index];
                        // String text =
                        //     criteria['text'].escapeSpecialCharacters();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormattedText(
                              text: criteria['text'],
                              onTap: (linkableKey) {
                                final type = criteria['type'];
                                final variable = criteria[type];
                                final criteriaDetail = variable[linkableKey];
                                viewModel.onCriteriaClick(
                                  criteriaDetail,
                                  context,
                                );
                              },
                            ),
                            if (index < signal.criteria.length - 1) ...[
                              const SizedBox(height: 8),
                              const Text(
                                'and',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
