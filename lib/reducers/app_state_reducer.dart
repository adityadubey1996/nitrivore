import 'package:flutter/material.dart';
import 'package:nutrivine/models/app_state.dart';
import 'package:nutrivine/reducers/loading_reducer.dart';
import 'package:nutrivine/reducers/pin_code_reducer.dart';
import 'package:nutrivine/reducers/splash_screen_reducer.dart';

enum Act { Add, Subtract }

AppState reducer(AppState previousState, action) {
  return AppState(
      isLoading: loadingReducer(previousState.isLoading, action),
      splashScreenState:
          splashScreenReducer(previousState.splashScreenState, action),
      pinCodeState: pinCodeReducer(previousState.pinCodeState, action));
}
