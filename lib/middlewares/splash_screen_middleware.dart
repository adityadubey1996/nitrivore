import 'package:nutrivine/actions/actions.dart';
import 'package:nutrivine/models/app_state.dart';
import 'package:nutrivine/models/splash_screen_state.dart';
import 'package:redux/redux.dart';

class SplashScreenMiddleWare extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) async {
    if (action is StartSplashScreenLoader) {
      print('action is StartSplashScreenLoader');
      action.isLoadingStarted = true;
      action.loadingMessage = 'loading started';

      next(action);
    }

    //  else if (action is UpdateSplashScreenLoader) {
    //     await Future.delayed(const Duration(seconds: 1));
    //     next(SplashScreenState(
    //         loaderMessage: 'Loading Started',
    //         isLoadingStarted: true,
    //         apiCallDone: action.apiCallDone,
    //         totalApiCall: 3));
    //   }
    next(action);
  }
}
