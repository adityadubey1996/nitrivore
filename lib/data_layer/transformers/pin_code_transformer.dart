import 'package:nutrivine/data_layer/api/pin_code_api.dart';
import 'package:nutrivine/models/pin_code_state.dart';

class PinCodeTransFormer {
  Future<PinCodeState> getPinCodeDetails(int pinCode) async {
    final api = PinCodeApi();
    List<dynamic> response = await api.getAreaDetailsFromPinCode(pinCode);
    return PinCodeState(status: true, pinCode: pinCode, isLoading: false);
  }
}
