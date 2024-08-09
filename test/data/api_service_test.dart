import 'package:demo_fitpage/data/api_service.dart';
import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/resources/app_constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'api_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('ApiService', () {
    late MockClient mockClient;
    late ApiService apiService;

    setUp(() {
      mockClient = MockClient();
      apiService = ApiService();
    });

    test('fetchTradingSignals returns a list of TradingSignal on success',
        () async {
      final response = http.Response(
          '[{"id": 1, "name": "Signal 1", "tag": "S1", "color":"#FF0000", "criteria": ["Criteria 1"]}]',
          200);
      when(mockClient.get(Uri.parse(url))).thenAnswer((_) async => response);

      final signals = await apiService.fetchTradingSignals();

      expect(signals, isA<List<TradingSignal>>());
    });
  });
}
