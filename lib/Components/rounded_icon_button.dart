import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundedIconButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const RoundedIconButton({
    Key key, this.text, this.onTap,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.green
      ),
      margin: EdgeInsets.symmetric(vertical: 2.0),
      height: 40,
      width: 200,


      child: GestureDetector(
        onTap: onTap,
        child: Container(

          decoration: BoxDecoration(
              
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20.0)
          ),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(FontAwesomeIcons.google,color: Colors.amber,),

              SizedBox(width: 10.0),
              Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,color: Colors.white
                  ),
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}

