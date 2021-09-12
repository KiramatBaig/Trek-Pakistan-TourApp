import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/MyNavigationBar.dart';
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

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  Widget _buildCNIC(){
    return TextFormField(
      decoration: InputDecoration(labelText: "CNIC"),
      validator: (String Value){
        if(Value.isEmpty){
          return "Please enter your CNIC";
        }
      },
      onSaved: (String Value){
        _CNIC=Value;
      },
    );
  }
  Widget _buildDeparture(){
    return null;
  }
  Widget _buildDate(){
    return null;
  }
  Widget _buildTime(){
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        title: const Text('Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        titleSpacing: 50,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:Form(
          
          key: _formKey,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              _buildCNIC(),
              // _buildDeparture(),
              // _buildDate(),
              // _buildTime(),
              SizedBox(height: 100,),
              TextButton(onPressed: (){
                if(!_formKey.currentState.validate()){
                  return;
                }
                _formKey.currentState.save();
                print(_CNIC);
              }, child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}