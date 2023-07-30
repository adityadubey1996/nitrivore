class PinCodeState {
  bool status;
  int pinCode;
  bool isLoading;
  PinCodeState(
      {required this.status, required this.pinCode, required this.isLoading});
  factory PinCodeState.initial() {
    return PinCodeState(
      status: false,
      pinCode: 0,
      isLoading: false,
    );
  }
}
