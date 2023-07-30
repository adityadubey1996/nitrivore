// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:nutrivine/actions/actions.dart';
import 'package:nutrivine/models/Loading_state.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<LoadingState>([
  TypedReducer<LoadingState, LoaderAction>(_setLoaded),
]);

LoadingState _setLoaded(LoadingState state, LoaderAction action) {
  if (action.isLoading) {
    return LoadingState(Loading.LoadingTrue);
  } else {
    return LoadingState(Loading.LoadingFalse);
  }
}
