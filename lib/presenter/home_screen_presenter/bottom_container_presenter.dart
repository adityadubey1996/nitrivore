import 'dart:async';

import 'package:flutter/material.dart';

class BottomContainerPresenter {
  List<String> typeOfFood = ['Smoothies'];
  List<String> companyOptions = [
    'Help&FAQ',
    'Contact Us',
    'Food Safety',
    'Corporate Orders',
    'Careers'
  ];
  List<String> socialProfile = ['Twitter', 'Facebook', 'Instagram'];

  Map<String, bool> maptypeOfFood = {};
  Map<String, bool> mapcompanyOptions = {};
  Map<String, bool> mapsocialProfile = {};
  StreamController<Map<String, bool>> streamControllertypeOfFood =
      StreamController.broadcast();
  StreamController<Map<String, bool>> streamControllercompanyOptions =
      StreamController.broadcast();
  StreamController<Map<String, bool>> streamControllersocialProfile =
      StreamController.broadcast();

  TextEditingController textControllerForEmailField = TextEditingController();
  void initialize() {
    for (var element in typeOfFood) {
      maptypeOfFood[element] = false;
    }
    for (var element in socialProfile) {
      mapsocialProfile[element] = false;
    }
    for (var element in companyOptions) {
      mapcompanyOptions[element] = false;
    }
    updateControllersocialProfile();
    updateControllerCompanyOptionsProfile();
    updateControllerTypeOfFoodProfile();
    // for (var element in [...typeOfFood, ...companyOptions, ...socialProfile]) {
    //   map[element] = false;
    // }
  }

  updateControllersocialProfile() {
    streamControllersocialProfile.add(mapsocialProfile);
  }

  updateControllerCompanyOptionsProfile() {
    streamControllercompanyOptions.add(mapcompanyOptions);
  }

  updateControllerTypeOfFoodProfile() {
    streamControllercompanyOptions.add(maptypeOfFood);
  }
}
