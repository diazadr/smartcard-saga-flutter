import 'dart:async';

import 'package:smartcard_saga/constants/const.dart';
import 'package:smartcard_saga/constants/route_name.dart';
import 'package:smartcard_saga/services/navigation_service.dart';
import 'package:smartcard_saga/services/storage_service.dart';

import '../locator.dart';
import 'base_model.dart';


class StartUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();

  startTimer() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, handleStartUpLogic);
  }

  Future handleStartUpLogic() async {
    final data = await _storageService.getString(localDataUser);

    if (data == null) {
      _navigationService.replaceTo(loginViewRoute);
    } else {
      _navigationService.replaceTo(homeViewRoute);
    }
  }
}