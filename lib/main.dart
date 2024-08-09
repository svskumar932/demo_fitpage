import 'package:demo_fitpage/application/redux/app_middleware.dart';
import 'package:demo_fitpage/application/redux/app_reducer.dart';
import 'package:demo_fitpage/application/redux/app_state.dart';
import 'package:demo_fitpage/navigation/app_router.dart';
import 'package:demo_fitpage/trading_signals/widget/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

Future<void> main() async {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: await createMiddleware(),
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}
