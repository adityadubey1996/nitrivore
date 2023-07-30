import 'package:nutrivine/models/Loading_state.dart';
import 'package:nutrivine/models/pin_code_state.dart';
import 'package:nutrivine/models/splash_screen_state.dart';

class AppState {
  LoadingState isLoading;
  SplashScreenState splashScreenState;
  PinCodeState pinCodeState;
  AppState({
    required this.isLoading,
    required this.splashScreenState,
    required this.pinCodeState,
  });

  factory AppState.initialState() {
    return AppState(
        isLoading: LoadingState.initial(),
        splashScreenState: SplashScreenState.initial(),
        pinCodeState: PinCodeState.initial());
  }
}
