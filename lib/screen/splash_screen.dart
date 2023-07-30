import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nutrivine/actions/actions.dart';
import 'package:nutrivine/models/Loading_state.dart';
import 'package:nutrivine/models/splash_screen_state.dart';
import 'package:nutrivine/presenter/presenter_class/splash_screen_stream_class.dart';
import 'package:nutrivine/presenter/splash_screen_presenter.dart';
import 'package:nutrivine/screen/home_screen/home_view_desktop.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:redux/redux.dart';
import 'package:nutrivine/models/app_state.dart';
import 'package:nutrivine/reducers/app_state_reducer.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenPresenter presenter = SplashScreenPresenter();
  @override
  void initState() {
    super.initState();

    StartSplashScreenLoader(true, 'loading started', 0, 3);
    presenter.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 14);
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) {
          presenter.initState();
          store.dispatch(StartSplashScreenLoader(true, 'loading started', 0,
              store.state.splashScreenState.totalApiCall));
        },
        builder: (context, value) {
          SplashScreenState splashScreenState = value.splashScreenState;
          if (splashScreenState.isLoadingStarted) {
            presenter.startSplashScreen(value, context);
          }
          return splashScreenState.isLoadingStarted
              ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  StreamBuilder<SplashScreenStreamClass>(
                    stream: presenter.attributeController.stream,
                    initialData: presenter.apiData,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return Column(
                          children: [
                            Stack(alignment: Alignment.center, children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(
                                  value: snapshot.data!.apicallDone /
                                      snapshot.data!.totalApiCall,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.black),
                                  backgroundColor:
                                      Colors.black.withOpacity(0.3),
                                  strokeWidth: 4,
                                ),
                              ),
                              Text(
                                '${((snapshot.data!.apicallDone / snapshot.data!.totalApiCall) * 100).toStringAsFixed(0)}%',
                                style: style,
                              ),
                            ]),
                            SizedBox(
                              height: 15,
                            ),
                            Text(snapshot.data!.loaderMessage, style: style),
                          ],
                        );
                      } else {
                        return Text('Error');
                      }
                    },
                  ),
                ])
              : Container(
                  child: Text('something went wrong'),
                );
        },
        converter: (Store<AppState> state) => ViewModel.create(state));
  }
}

class ViewModel {
  SplashScreenState splashScreenState;
  Function(bool isLoading) changeLoadingState;
  Function(bool startSplashScreenLoading) startSplashScreenLoader;
  Function endSplashScreenLoader;

  ViewModel(
      {required this.changeLoadingState,
      required this.startSplashScreenLoader,
      required this.splashScreenState,
      required this.endSplashScreenLoader});

  factory ViewModel.create(Store<AppState> store) {
    ViewModel temp = ViewModel(
        splashScreenState: store.state.splashScreenState,
        changeLoadingState: (isLoading) {
          if (isLoading) {
            store.dispatch(LoaderAction(isLoading));
          } else {
            store.dispatch(LoaderAction(false));
          }
        },
        startSplashScreenLoader: (startSplashScreenLoading) {
          store.dispatch(StartSplashScreenLoader(true, 'loading started', 0,
              store.state.splashScreenState.totalApiCall));
        },
        endSplashScreenLoader: () {
          store.dispatch(EndSplashScreenLoader(true));
        });

    return temp;
  }
}
