import 'package:flutter/material.dart';
import 'package:flutter_auth/Components/textfield_container.dart';
import 'package:flutter_auth/Constants.dart';
class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child:TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(

          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: (){
              
            }
            ,
            icon: Icon(Icons.visibility),
          ),


          border: InputBorder.none,
        ),

      ),
    );
  }
}
