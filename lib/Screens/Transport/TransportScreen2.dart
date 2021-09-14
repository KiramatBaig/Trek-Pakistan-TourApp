import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
import 'package:flutter_auth/Components/rounded_button.dart';
import 'package:flutter_auth/Screens/Destination/Global/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Transport2 extends StatefulWidget{
  @override
  _Transport2State createState() => _Transport2State ();

}
class _Transport2State extends State<Transport2> {

  String _CNIC;
  String _Departure;
  String _Arrival;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildCNIC() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "CNIC", hintText: "61101-5866674-2"),
      keyboardType: TextInputType.number,
      inputFormatters: [
        WhitelistingTextInputFormatter.digitsOnly,
        new LengthLimitingTextInputFormatter(13),
        new NumberFormatter()
      ],
      validator: (String Value) {
        if (Value.isEmpty) {
          return "Please enter your CNIC";
        }

      },

      onSaved: (String Value) {
        _CNIC = Value;
      },
    );
  }

  Widget _buildDeparture() {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text("Select Departure City "),
          Icon(Icons.arrow_forward_ios,),
        ],
      ),
      onTap: (){
        print("Select City");
      },
    );


  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children:[ Form(

          key: _formKey,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildCNIC(),
              SizedBox(height: 4,),
              Text("Please remember that CNIC will be checked at Departure",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 10,),),
              Divider(color: Colors.black,),
              SizedBox(height: 5.0,),
              _buildDeparture(),
              Divider(color: Colors.black,),
              Text("${selectedDate.toLocal()}".split(' ')[0],style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 5.0,),
              RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date'),
              ),
              Divider(color: Colors.black,),
              SizedBox(height: 5.0,),

              // _buildDate(),
              // _buildTime(),
              SizedBox(height: 50,),
              RoundedButton(
                text: "Next",
                press: (){
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();
                  print(_CNIC);
                },
              ),
            ],
          ),
        ),
      ]
      ),
    );
  }
}
class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      print(text.length);
      if (nonZeroIndex <= 5) {
        print("non");
        print(nonZeroIndex);
        if (nonZeroIndex % 5 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 12 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}