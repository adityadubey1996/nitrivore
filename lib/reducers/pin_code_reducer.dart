import 'package:nutrivine/actions/actions.dart';
import 'package:nutrivine/models/pin_code_state.dart';
import 'package:nutrivine/models/splash_screen_state.dart';
import 'package:redux/redux.dart';

final pinCodeReducer = combineReducers<PinCodeState>([
  TypedReducer<PinCodeState, GetAreaFromPinCode>(_startPinCodeApiCall),
  TypedReducer<PinCodeState, EndGetAreaFromPinCode>(_endPinCodeApiCall),
]);

PinCodeState _startPinCodeApiCall(
    PinCodeState state, GetAreaFromPinCode action) {
  if (action.isLoading) {
    PinCodeState updatedState = PinCodeState(
        isLoading: action.isLoading, status: false, pinCode: action.pinCode);
    return updatedState;
  }

  return state;
}

PinCodeState _endPinCodeApiCall(
    PinCodeState state, EndGetAreaFromPinCode action) {
  if (!action.isLoading) {
    PinCodeState updatedState = PinCodeState(
        isLoading: action.isLoading, status: false, pinCode: action.pinCode);
    return updatedState;
  }

  return state;
}
