class LoaderAction {
  bool isLoading;
  LoaderAction(this.isLoading);
}

class UpdateSplashScreenLoader {
  int apiCallDone;
  int totalApiCall;
  bool isLoadingStarted;
  UpdateSplashScreenLoader(
      this.apiCallDone, this.totalApiCall, this.isLoadingStarted);
}

class StartSplashScreenLoader {
  bool isLoadingStarted;
  String loadingMessage;
  int apiCallDone;
  int totalApiCall;
  StartSplashScreenLoader(this.isLoadingStarted, this.loadingMessage,
      this.apiCallDone, this.totalApiCall);
}

class EndSplashScreenLoader {
  bool isLoadingEnded;
  EndSplashScreenLoader(this.isLoadingEnded);
}

class GetAreaFromPinCode {
  bool isLoading;
  bool status;
  int pinCode;
  // String response
  GetAreaFromPinCode(this.isLoading, this.status, this.pinCode);
}

class EndGetAreaFromPinCode {
  bool isLoading;
  bool status;
  int pinCode;
  // String response
  EndGetAreaFromPinCode(this.isLoading, this.status, this.pinCode);
}

enum Loading { LoadingTrue, LoadingFalse }
