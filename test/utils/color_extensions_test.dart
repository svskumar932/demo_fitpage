import 'package:demo_fitpage/utils/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('StringExtensions', () {
    test('toColor() returns green for "green"', () {
      expect('green'.toColor(), Colors.green);
    });

    test('toColor() returns red for "red"', () {
      expect('red'.toColor(), Colors.red);
    });

    test('toColor() returns grey for unknown colors', () {
      expect('blue'.toColor(), Colors.grey);
      expect(''.toColor(), Colors.grey);
      expect('invalid'.toColor(), Colors.grey);
    });
  });
}
