import 'package:flutter/material.dart';

class HomeScreenPresenter {
  void initialize() {}

  void navigateToOrderScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('order_screen');
  }
}
