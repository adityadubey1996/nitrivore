import 'package:nutrivine/actions/actions.dart';
import 'package:nutrivine/models/splash_screen_state.dart';
import 'package:redux/redux.dart';

final splashScreenReducer = combineReducers<SplashScreenState>([
  TypedReducer<SplashScreenState, StartSplashScreenLoader>(
      _setLoaderSplashScreen),
  TypedReducer<SplashScreenState, EndSplashScreenLoader>(
      _endLoaderSplashScreen),
]);

SplashScreenState _endLoaderSplashScreen(
    SplashScreenState state, EndSplashScreenLoader action) {
  if (action.isLoadingEnded) {
    SplashScreenState updatedState = SplashScreenState(
        loaderMessage: '',
        isLoadingStarted: false,
        apiCallDone: state.totalApiCall,
        totalApiCall: state.totalApiCall);
    return updatedState;
  }

  return state;
}

SplashScreenState _setLoaderSplashScreen(
    SplashScreenState state, StartSplashScreenLoader action) {
  SplashScreenState updatedState = SplashScreenState(
      loaderMessage: action.loadingMessage,
      isLoadingStarted: action.isLoadingStarted,
      apiCallDone: action.apiCallDone,
      totalApiCall: action.totalApiCall);
  return updatedState;
}
