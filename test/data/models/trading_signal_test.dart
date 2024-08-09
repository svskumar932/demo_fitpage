import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TradingSignal', () {
    test(
        'TradingSignal.fromJson() creates aTradingSignal object from valid JSON',
        () {
      final json = {
        'id': 1,
        'name': 'Test Signal',
        'tag': 'TS',
        'color': 'red',
        'criteria': ['criterion1', 'criterion2'],
      };

      final signal = TradingSignal.fromJson(json);

      expect(signal.id, 1);
      expect(signal.name, 'Test Signal');
      expect(signal.tag, 'TS');
      expect(signal.color, 'red');
      expect(signal.criteria, ['criterion1', 'criterion2']);
    });

    test('TradingSignal.fromJson() throws a TypeError for missing "id" key',
        () {
      final json = {
        'name': 'Test Signal',
        'tag': 'TS',
        'color': 'red',
        'criteria': ['criterion1', 'criterion2'],
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('TradingSignal.fromJson() throws a TypeError for missing "name" key',
        () {
      final json = {
        'id': 1,
        'tag': 'TS',
        'color': 'red',
        'criteria': ['criterion1', 'criterion2'],
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('TradingSignal.fromJson() throws a TypeError for missing "tag" key',
        () {
      final json = {
        'id': 1,
        'name': 'Test Signal',
        'color': 'red',
        'criteria': ['criterion1', 'criterion2'],
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('TradingSignal.fromJson() throws a TypeError for missing "color" key',
        () {
      final json = {
        'id': 1,
        'name': 'Test Signal',
        'tag': 'TS',
        'criteria': ['criterion1', 'criterion2'],
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test(
        'TradingSignal.fromJson() throws a TypeError for missing "criteria" key',
        () {
      final json = {
        'id': 1,
        'name': 'Test Signal',
        'tag': 'TS',
        'color': 'red',
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('TradingSignal.fromJson() throws a TypeError for incorrect "id" type',
        () {
      final json = {
        'id': '1', // Incorrect type
        'name': 'Test Signal',
        'tag': 'TS',
        'color': 'red',
        'criteria': ['criterion1', 'criterion2'],
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test(
        'TradingSignal.fromJson() throws a TypeError for incorrect "name" type',
        () {
      final json = {
        'id': 1,
        'name': 123, // Incorrect type
        'tag': 'TS',
        'color': 'red',
        'criteria': ['criterion1', 'criterion2'],
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test('TradingSignal.fromJson() throws a TypeError for incorrect "tag" type',
        () {
      final json = {
        'id': 1,
        'name': 'Test Signal',
        'tag': 123, // Incorrect type
        'color': 'red',
        'criteria': ['criterion1', 'criterion2'],
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test(
        'TradingSignal.fromJson() throws a TypeError for incorrect "color" type',
        () {
      final json = {
        'id': 1,
        'name': 'Test Signal',
        'tag': 'TS',
        'color': 123, // Incorrect type
        'criteria': ['criterion1', 'criterion2'],
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });

    test(
        'TradingSignal.fromJson() throws a TypeError for incorrect "criteria" type',
        () {
      final json = {
        'id': 1,
        'name': 'Test Signal',
        'tag': 'TS',
        'color': 'red',
        'criteria': 123, // Incorrect type
      };

      expect(() => TradingSignal.fromJson(json), throwsA(isA<TypeError>()));
    });
  });
}
