import 'dart:async';
import 'dart:html';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:nutrivine/actions/actions.dart';
import 'package:nutrivine/models/app_state.dart';
import 'package:nutrivine/presenter/presenter_class/splash_screen_stream_class.dart';
import 'package:nutrivine/screen/splash_screen.dart';

class SplashScreenPresenter {
  final StreamController<List<SplashScreenStreamClass>> _imageListController =
      StreamController.broadcast();

  final StreamController<SplashScreenStreamClass> _controller =
      StreamController.broadcast();

  //  final StreamController<SplashScreenStreamClass> _screenSize =
  //     StreamController.broadcast();
  late Stream stream;
  StreamController<SplashScreenStreamClass> get attributeController =>
      _controller;

  late SplashScreenStreamClass apiData;
  void initState() {
    apiData = SplashScreenStreamClass('loading Started', 0, 3);
    startListeningToScreenSizeChange();
  }

  void startListeningToScreenSizeChange() {
    // _screenSize.stream.listen((event) {

    // });
  }

  void startSplashScreen(ViewModel store, BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      apiData = SplashScreenStreamClass('updated message 1', 1, 3);
      updateController();
      Future.delayed(const Duration(seconds: 1)).then((value) {
        apiData = SplashScreenStreamClass('updated message 1', 2, 3);
        updateController();

        Future.delayed(const Duration(seconds: 1)).then((value) {
          apiData = SplashScreenStreamClass('updated message 1', 3, 3);
          updateController();
        }).then((value) {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            store.endSplashScreenLoader();
            Navigator.of(context).pushReplacementNamed('home_screen');
          });
        });
      });
    });
  }

  void updateController() {
    _controller.add(apiData);
  }
}
