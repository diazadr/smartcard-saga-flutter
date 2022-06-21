import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcard_saga/constants/const.dart';
import 'package:smartcard_saga/constants/route_name.dart';
import 'package:smartcard_saga/locator.dart';
import 'package:smartcard_saga/services/alert_service.dart';
import 'package:smartcard_saga/services/navigation_service.dart';
import 'package:smartcard_saga/services/rmq_service.dart';
import 'package:smartcard_saga/services/storage_service.dart';
import 'package:smartcard_saga/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class LoginViewModel extends BaseModel {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController hostController = TextEditingController();
  TextEditingController vhostController = TextEditingController();
  TextEditingController queuesSensorController = TextEditingController();
  TextEditingController guidController = TextEditingController();

  final RmqService _rmqService = locator<RmqService>();
  final StorageService _storageService = locator<StorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();

  void getTask() async {
    showData();
  }

  void showData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString('datadevice');

    var result = convert.jsonDecode(data!);

    var guid = result['guid'];
    guidController.text = guid;
    await _storageService.setString(localDataGuid, guid);
    print('[Login Guid] $guid');
  }

  void loginAccount(BuildContext context) async {
    try {
      String user = userController.text;
      String pass = passController.text;
      String host = hostController.text;
      String vHost = vhostController.text;
      String queuesSensor = queuesSensorController.text;

      if(userController.text.isNotEmpty &&
          hostController.text.isNotEmpty &&
          vhostController.text.isNotEmpty &&
          passController.text.isNotEmpty &&
          queuesSensorController.text.isNotEmpty
      ) {
        await _storageService.setString(localDataUser, user);
        await _storageService.setString(localDataHost, host);
        await _storageService.setString(localDataVHost, vHost);
        await _storageService.setString(localDataPass, pass);
        await _storageService.setString(localDataQSensor, queuesSensor);
        print('[Login user] $user');
        print('[Login host] $host');
        print('[Login vHost] $vHost');
        print('[Login pass] $pass');
        print('[Login Sensor] $queuesSensor');
        _alertService.showSucces(context, "Succes", "Credential Data Saved",
                () {
              _navigationService.replaceTo(homeViewRoute);
                });
      } else {
        _alertService.showWarning(context, "Warning", "Please fill all field",_navigationService.pop);
        print('kosong');
      }
    } catch (e) {
      print('error');
      _alertService.showError(context, 'Error', 'Your Credential Not Correct',_navigationService.pop)
      ;
    }
  }

  void checkDataQr() async {
    _navigationService.navigateTo(qrViewRoute);
  }
}