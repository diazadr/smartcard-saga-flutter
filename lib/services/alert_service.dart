import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcard_saga/locator.dart';
import 'package:smartcard_saga/services/navigation_service.dart';

class AlertService{
  final NavigationService _navigationService = locator<NavigationService>();

  void showSignOut(BuildContext context, String title, String desc,
      VoidCallback onSignout, VoidCallback onCancel) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "YES",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onSignout,
          ),
          TextButton(
            child: const Text(
              "NO",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onCancel,
          )
        ],
      ));
  }

  void showSucces(
      BuildContext context, String title, String desc, VoidCallback onCancel) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "Done",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onCancel,
          )
        ],
      ));
  }

  void showError(
      BuildContext context, String title, String desc, VoidCallback onCancel) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "DONE",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: onCancel,
          ),
        ],
      )
    );
  }

  void showWarning(
      BuildContext context, String title, String desc, VoidCallback onCancel) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "DONE",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
            onPressed: onCancel,
          )
        ],
      ));
  }

  void showAlert(BuildContext context, String title, String desc,
      VoidCallback onYes, VoidCallback onCancel) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(desc),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "YES",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: onYes,
            ),
            TextButton(
              child: const Text(
                "NO",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: onCancel,
            )
          ],
        ));
  }



}