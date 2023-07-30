import 'package:nutrivine/actions/actions.dart';

class LoadingState {
  final Loading loadingStatus;
  LoadingState(this.loadingStatus);

  factory LoadingState.initial() {
    return LoadingState(Loading.LoadingTrue);
  }
}
