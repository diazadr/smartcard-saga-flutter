import 'dart:convert';

CardDataModel cardDataModelFromJson(String str) => CardDataModel.fromJson(json.decode(str));

String cardDataModelToJson(CardDataModel data) => json.encode(data.toJson());

class CardDataModel {
  CardDataModel({
    required this.namaLengkap,
    required this.mac,
    required this.rfid,
    required this.jam,
    required this.date,
    required this.sekolah,
    required this.id,
});

  String namaLengkap;
  String mac;
  String rfid;
  String jam;
  DateTime date;
  String sekolah;
  String id;

  factory CardDataModel.fromJson(Map<String, dynamic> json) => CardDataModel(
    namaLengkap: json["nama_lengkap"],
    mac: json["mac"],
    rfid: json["rfid"],
    jam: json["jam"],
    date: DateTime.parse(json["date"]),
    sekolah: json["sekolah"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "nama_lengkap": namaLengkap,
    "mac": mac,
    "rfid": rfid,
    "jam": jam,
    "date": date.toIso8601String(),
    "sekolah": sekolah,
    "_id": id,
  };

  String get getNama => namaLengkap;
  String get getMac => mac;
  String get Rfid => rfid;
  String get getJam => jam;
  DateTime get getDate => date;
  String get getSekolah => sekolah;
  String get getId => id;

  set getNama(String value){
    namaLengkap = value;
  }
  set getMac(String value){
    mac = value;
  }
  set getRfid(String value){
    rfid = value;
  }
  set getJam(String value){
    jam = value;
  }
  set getDate(DateTime value){
    date = value;
  }
  set getSekolah(String value){
    sekolah = value;
  }
  set getId(String value){
    id = value;
  }
}