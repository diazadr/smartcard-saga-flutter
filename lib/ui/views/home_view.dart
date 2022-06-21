import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartcard_saga/ui/shared/ui_helper.dart';
import 'package:smartcard_saga/viewmodels/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initState(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/RFIDkit.png',
                      width: 150,
                    ),
                    verticalSpaceMedium,
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Nama Lengkap",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.deepOrange
                        )
                      ),
                      enabled: false,
                      controller: model.namaController,
                      keyboardType: TextInputType.text,
                    ),
                    verticalSpaceSmall,
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Mac",
                        labelStyle: TextStyle(
                          fontWeight : FontWeight.bold,
                          color: Colors.deepOrange,
                          fontSize: 22,
                          )
                        ),
                      enabled: false,
                      controller: model.macController,
                      keyboardType: TextInputType.text,
                      ),
                      verticalSpaceSmall,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Jam",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                            fontSize: 22
                          )
                        ),
                        enabled: false,
                        controller: model.jamController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceSmall,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Tanggal",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                            fontSize: 22
                          )
                        ),
                        enabled: false,
                        controller: model.dateController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceSmall,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Sekolah",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                            fontSize: 22
                          )
                        ),
                        enabled: false,
                        controller: model.sekolahController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceSmall,
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Id",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                            fontSize: 22
                          )
                        ),
                        enabled: false,
                        controller: model.idController,
                        keyboardType: TextInputType.text,
                      ),
                      verticalSpaceSmall,
                      ElevatedButton(onPressed: (){model.initState();}, child: Text('Refresh'))
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: (){model.clearData();},child: Text('Reset'),),
        ),
      ),
    );
  }
}