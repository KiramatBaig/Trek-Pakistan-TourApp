import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
class MyTwilioScreen extends StatefulWidget {
  // MyTwilioScreen({this.title});
  // final String title;
  @override
  _MyTwilioScreenState createState() => _MyTwilioScreenState();
}
class _MyTwilioScreenState extends State<MyTwilioScreen> {
  TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC8717780368ee0f71968604fef288f6ca',
        authToken: 'ae021a8d6e1786540b057bc56b9d47e5',
        twilioNumber: '+17174837854');
    super.initState();
  }
  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: ' +923460238115', messageBody: 'Hii everyone this is a demo of\nflutter twilio sms.');
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
        title:Text("new Message"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Press the button to send SMS.',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sendSms,
        tooltip: 'Send Sms',
        child: Icon(Icons.send),
      ),
    );
  }
}