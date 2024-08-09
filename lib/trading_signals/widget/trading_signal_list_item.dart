import 'package:demo_fitpage/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import '../../data/models/trading_signal.dart';

class TradingSignalListItem extends StatelessWidget {
  final TradingSignal signal;
  final bool isUnderlined;

  const TradingSignalListItem({
    super.key,
    required this.signal,
    this.isUnderlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          const Icon(
            Icons.circle,
            size: 10,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              signal.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
                decoration: isUnderlined
                    ? TextDecoration.none
                    : TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          signal.tag,
          style: TextStyle(
            color: signal.color.toColor(),
            decoration:
                isUnderlined ? TextDecoration.none : TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
