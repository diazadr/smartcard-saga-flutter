import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:smartcard_saga/constants/route_name.dart';
import 'package:smartcard_saga/locator.dart';
import 'package:smartcard_saga/constants/const.dart';
import 'package:smartcard_saga/services/alert_service.dart';
import 'package:smartcard_saga/services/navigation_service.dart';
import 'package:smartcard_saga/services/rmq_service.dart';
import 'package:smartcard_saga/services/storage_service.dart';
import 'package:smartcard_saga/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  final RmqService _rmqService = locator<RmqService>();
  final StorageService _storageService = locator<StorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();

  TextEditingController namaController = TextEditingController();
  TextEditingController macController = TextEditingController();
  TextEditingController rfidController = TextEditingController();
  TextEditingController jamController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController sekolahController = TextEditingController();
  TextEditingController idController = TextEditingController();

  late Timer timer;


  void initState() async {
    setBusy(true);
    subscribeData();
    setBusy(false);
  }

  void subscribeData() async {
    final host = await _storageService.getString(localDataHost);
    final user = await _storageService.getString(localDataUser);
    final pass = await _storageService.getString(localDataPass);
    final vHost = await _storageService.getString(localDataVHost);
    _rmqService.subscribe(
      await sensorRfid,
      host!.toString(),
      user!.toString(),
      pass!.toString(),
      vHost!.toString(),
    );
  }

  void sensorRfid() async {
    final queues = await _storageService.getString(localDataQSensor);
    _rmqService.dataDevice(
      queues.toString(),
      await setValueSensor
    );
    print('[Queue Rfid] $queues');
  }

  void setValueSensor(String message) async {
    setBusy(true);
    namaController.text = _rmqService.namaLengkap;
    macController.text = _rmqService.mac;
    rfidController.text = _rmqService.rfid;
    jamController.text = _rmqService.jam;
    DateTime date = DateTime.parse(_rmqService.date).toLocal();
    dateController.text = date.toString();
    sekolahController.text = _rmqService.sekolah;
    idController.text = _rmqService.id;
    setBusy(false);
  }

  void clearData() async {
    await _storageService.clearStorage();
    _navigationService.replaceTo(loginViewRoute);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}