class SplashScreenState {
  SplashScreenState({
    required this.loaderMessage,
    required this.isLoadingStarted,
    required this.apiCallDone,
    required this.totalApiCall,
  });
  String loaderMessage;
  int apiCallDone;
  int totalApiCall;
  bool isLoadingStarted;

  factory SplashScreenState.initial() {
    return SplashScreenState(
        loaderMessage: 'loading not Started',
        apiCallDone: 0,
        isLoadingStarted: false,
        totalApiCall: 3);
  }
}
