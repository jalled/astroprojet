import 'package:flutter/widgets.dart';

import '../../model/HoscopeModel.dart';

import '../ServiceHoroscope.dart';

enum HomeState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class UserModel extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  List<Horoscope> users = [];
  String message = '';

  UserModel() {
    _fetchUsers();
  }

  HomeState get homeState => _homeState;

  Future<void> _fetchUsers() async {
    _homeState = HomeState.Loading;
    try {
      await Future.delayed(Duration(seconds: 0));
      final apiusers = await UserApi.instance.getHoroscope();
      users = apiusers;
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }
}
