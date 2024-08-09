import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/data/api_service.dart';
import 'package:demo_fitpage/trading_signals/redux/trading_signals_middleware.dart';
import 'package:redux/redux.dart';

Future<List<Middleware<AppState>>> createMiddleware() async {
  final apiService = ApiService();
  return [
    ...createTradingSignalMiddleware(apiService: apiService),
  ];
}
