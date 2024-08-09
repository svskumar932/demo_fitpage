import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class FormattedText extends StatefulWidget {
  final String text;
  final Function(String) onTap;

  const FormattedText({super.key, required this.text, required this.onTap});
  @override
  FormattedTextState createState() => FormattedTextState();
}

class FormattedTextState extends State<FormattedText> {
  String? _clickedValue;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];
    RegExp regExp = RegExp(r'(\$-?\d+)');
    Iterable<RegExpMatch> matches = regExp.allMatches(widget.text);
    int startIndex = 0;

    if (matches.isEmpty) {
      // No dollar-sign segments, return plain text
      return Text(
        widget.text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      );
    }

    for (var match in matches) {
      if (match.start > startIndex) {
        spans.add(TextSpan(
          text: widget.text.substring(startIndex, match.start),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ));
      }

      String numberText = match.group(0)!.substring(1); // Extract number part
      String originalText = match.group(0)!;

      // Add onTap to ".( "
      spans.add(TextSpan(
        text: '.(', // Added space for better visual separation
        style: const TextStyle(
          color: Colors.purple,
          fontSize: 18,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _handleTap(originalText); // Return $1 for .().
          },
      ));

      spans.add(TextSpan(
        text: numberText,
        style: TextStyle(
          color: _clickedValue != null ? Colors.red : Colors.purple,
          fontSize: 18,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _handleTap(originalText);
          },
      ));

      // Add onTap to ")."
      spans.add(TextSpan(
        text: ').', // Added space for better visual separation
        style: const TextStyle(
          color: Colors.purple,
          fontSize: 18,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            _handleTap(originalText); // Return $1 for .().
          },
      ));

      startIndex = match.end;
    }

    // Add remaining text after the last match
    if (startIndex < widget.text.length) {
      spans.add(TextSpan(
        text: widget.text.substring(startIndex),
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }

  void _handleTap(String tappedText) {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel previous timer if active
    }
    setState(() {
      _clickedValue = tappedText;
    });
    widget.onTap(tappedText);

    _timer = Timer(const Duration(seconds: 1), () {
      setState(() {
        _clickedValue = null;
      });
    });
  }
}
