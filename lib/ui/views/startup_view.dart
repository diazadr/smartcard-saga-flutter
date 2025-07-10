import 'package:flutter/material.dart';
import 'package:smartcard_saga/ui/shared/ui_helper.dart';
import 'package:smartcard_saga/viewmodels/startup_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/services.dart';

class StartUpView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.startTimer(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset('assets/RFIDkit.png',width: 300,height: 300),
              verticalSpaceMedium,
              CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
              verticalSpaceMedium,
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}