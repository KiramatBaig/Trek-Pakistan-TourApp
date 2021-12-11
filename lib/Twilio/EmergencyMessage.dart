import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
class TwilioEmergencyScreen extends StatefulWidget {
  final String email;final String location;
  TwilioEmergencyScreen(this.email,this.location);

  @override
  _TwilioEmergencyScreenState createState() => _TwilioEmergencyScreenState();
}
class _TwilioEmergencyScreenState extends State<TwilioEmergencyScreen> {
  TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC8717780368ee0f71968604fef288f6ca',
        authToken: '1b4afd15af70c047965c730e3368dc90',
        twilioNumber: '+17174837854');
    super.initState();
  }
  void sendSms() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection.where('email', isEqualTo: widget.email).get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      print('entered snap query');
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      // var name = data['name'];
      // var phone = data['phone'];
      print(data['EmergencyNumber']);
      twilioFlutter.sendSMS(
          toNumber: data['EmergencyNumber'],
          messageBody: 'Hi, the person: ${data['Name']} at ${widget.location} is an Emergency');
    }
  }
  void getSms() async {
    var data = await twilioFlutter.getSmsList();
    print(data);
    await twilioFlutter.getSMS('***************************');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text(widget.title),
        title:Text("Trek Pakistan"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Press the button to send Emergency message.',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sendSms();
        },
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}