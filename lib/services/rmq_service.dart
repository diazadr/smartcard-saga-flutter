import 'dart:convert';
import 'package:dart_amqp/dart_amqp.dart';
import 'package:smartcard_saga/services/storage_service.dart';

import '../locator.dart';

class RmqService{
  late Client client;
  String namaLengkap = '';
  String mac = '';
  String rfid = '';
  String jam = '';
  String date = '';
  String sekolah = '';
  String id = '';

  void publish(String message, String host, String user, String pass, String vHost, String queues){
    ConnectionSettings settings = ConnectionSettings(
      host: host,
      authProvider: PlainAuthenticator(user, pass),
      virtualHost: vHost
    );
    Client client = Client(settings: settings);
    client.channel().then((Channel channel) {
      print('[RMQ Service] host $host');
      print('[RMQ Service] username $user');
      print('[RMQ Service] password $pass');
      print('[RMQ Service] vHost $vHost');
      return channel.queue(queues, durable: true);
    }).then((Queue queue){
      queue.publish(message);
      client.close();
    });

  }

  void subscribe(Function sensor, String host, String user, String pass, String vHost){
    ConnectionSettings settings = ConnectionSettings(
      host: host,
      authProvider: PlainAuthenticator(user, pass),
      virtualHost: vHost
    );
    client = Client(settings: settings);
    //print("Subscribe Data RMQ Succes");
    print('baca user RMQ $user');
    client.connect().then((value){
      print('[Subscribe Data] $settings');
      //actuator();
      sensor();
    });
  }

  void dataDevice(String queueRmq, Function value){
    client
        .channel()
        .then((Channel channel) => channel.queue(queueRmq, durable: true))
        .then((Queue queue) => queue.consume())
        .then((Consumer consumer) => consumer.listen((AmqpMessage message) async {
      value(message.payloadAsString);
      var result = await jsonDecode(message.payloadAsString);
      print(message.payloadAsString);
      namaLengkap = result['nama_lengkap'];
      mac = result['mac'];
      rfid = result['rfid'];
      jam = result['jam'];
      date = result['date'];
      sekolah = result['sekolah'];
      id = result['_id'];
    }));
  }
}