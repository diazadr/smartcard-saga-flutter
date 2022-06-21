import 'package:flutter/material.dart';
import 'package:smartcard_saga/ui/shared/ui_helper.dart';
import 'package:smartcard_saga/viewmodels/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = true;

  String _password = "";

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Image.asset(
                        'assets/RFIDkit.png',
                        width: 100,
                      ),
                      const Text(
                        "LOGIN CREDENTIAL",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange
                        ),
                      )
                    ],
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "User",
                      border: OutlineInputBorder(),
                      hintText: "smkn13bandung"
                    ),
                    controller: model.userController,
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      hintText: "xxxxxxxx",
                      suffixIcon: IconButton(
                        onPressed: _toggle,
                        icon: Icon(
                          _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey,
                        ),
                      )
                    ),
                    obscureText: _obscureText,
                    controller: model.passController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Host",
                      border: OutlineInputBorder(),
                      hintText: "cloudrmq.pptik.id"
                    ),
                    controller: model.hostController,
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Virtual Host",
                      border: OutlineInputBorder(),
                      hintText: "/smkn13bandung"
                    ),
                    controller: model.vhostController,
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Queues Device",
                      border: OutlineInputBorder(),
                      hintText: "smkn2_diaz"
                    ),
                    controller: model.queuesSensorController,
                    keyboardType: TextInputType.text,
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: const Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                        ),
                        onPressed: () {
                          model.loginAccount(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}