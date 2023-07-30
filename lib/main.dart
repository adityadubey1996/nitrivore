import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrivine/middlewares/splash_screen_middleware.dart';
import 'package:nutrivine/models/app_state.dart';
import 'package:nutrivine/reducers/app_state_reducer.dart';
import 'package:nutrivine/routes.dart/app_routes.dart';
import 'package:nutrivine/screen/home_screen/home_view_desktop.dart';
import 'package:nutrivine/screen/splash_screen.dart';
import 'package:redux/redux.dart';
import 'package:nutrivine/reducers/app_state_reducer.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  // final store = Store(reducer, initialState: AppState(0));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: Store(reducer,
            initialState: AppState.initialState(),
            middleware: [SplashScreenMiddleWare()]),
        child: MaterialApp(
          onGenerateRoute: AppRouteGenerator.onGenerate,
          home: SplashScreen(),
          theme: ThemeData(fontFamily: 'Gustanlp-Medium'),
        ));
  }
}
