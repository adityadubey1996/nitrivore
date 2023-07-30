import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nutrivine/utils/enums.dart';

class OrderScreenPreenter {
  late ValueNotifier<OrderScreenSelected> screenSelectedValueNotifier;
  GlobalKey<ScaffoldMessengerState> orderScreenKey = GlobalKey();
  Map<String, OrderScreenSelected> screenOptionMap = {
    'WELCOME': OrderScreenSelected.welcome,
    'SELECT SIZE': OrderScreenSelected.selectSize,
    'SELECT ITEMS': OrderScreenSelected.selectItems,
    'CHECKOUT': OrderScreenSelected.checkout,
  };

  StreamController<Map<String, bool>> streamControllerBottomContainerOptions =
      StreamController.broadcast();
  List<String> bottomContainerOptions = [
    'Privacy Policy',
    'Terms Of Use',
    'Terms Of Sale'
  ];
  Map<String, bool> mapbottomContainerOptions = {};

  TextEditingController pinCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  StreamController<bool> viewPricingLoadingState = StreamController.broadcast();

  void initState() {
    OrderScreenSelected orderScreenSelected = getOrderScreenSelected();
    screenSelectedValueNotifier = ValueNotifier(orderScreenSelected);
    for (var element in bottomContainerOptions) {
      mapbottomContainerOptions[element] = false;
    }
    pinCodeController.addListener(onPinCodeTextChange);
    emailController.addListener(onEmailTextChange);
  }

  updateControllerTypeOfbottomContainerOptions() {
    streamControllerBottomContainerOptions.add(mapbottomContainerOptions);
  }

  OrderScreenSelected getOrderScreenSelected() {
    try {
      return screenSelectedValueNotifier.value;
    } catch (e) {
      return OrderScreenSelected.welcome;
    }
  }

  void onBackClick() {
    Navigator.of(getContext()).pushReplacementNamed('home_screen');
  }

  BuildContext getContext() {
    return orderScreenKey.currentContext!;
  }

  void onAppBarItemClick(OrderScreenSelected screenSelected) {
    screenSelectedValueNotifier.value = screenSelected;
  }

  bool getIsSelectedFlagFromKey(String key) {
    OrderScreenSelected selectedScren = screenSelectedValueNotifier.value;
    OrderScreenSelected screenToCompareWith = screenOptionMap[key]!;
    return screenToCompareWith == selectedScren;
  }

  int getIsSelectedIndexFromKey(String key) {
    List<String> keyList = screenOptionMap.keys.toList();
    int index = keyList.indexWhere((element) => element == key);
    if (index != -1) {
      return index;
    }
    return 1;
  }

  void onPinCodeTextChange() {
    String text = pinCodeController.text;
  }

  void onEmailTextChange() {
    String text = emailController.text;
  }

  Future<bool> checkForPinCode(int pinCode) async {
    return false;
  }

  Future<void> onViewPricingButtonClick() async {
    viewPricingLoadingState.add(true);
    await Future.delayed(Duration(seconds: 1));
    viewPricingLoadingState.add(false);
  }
}
