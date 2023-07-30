import 'package:nutrivine/actions/actions.dart';
import 'package:nutrivine/models/app_state.dart';
import 'package:redux/redux.dart';

class PinCodeGetterMiddleWare extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) async{
    if (action is GetAreaFromPinCode) {
      action.isLoading = true;
      next(action);

    }
  }
}
