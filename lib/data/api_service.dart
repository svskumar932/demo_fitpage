import 'package:demo_fitpage/data/models/trading_signal.dart';
import 'package:demo_fitpage/resources/app_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<TradingSignal>> fetchTradingSignals() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((signal) => TradingSignal.fromJson(signal)).toList();
    } else {
      throw Exception('Failed to load trading signals');
    }
  }
}
