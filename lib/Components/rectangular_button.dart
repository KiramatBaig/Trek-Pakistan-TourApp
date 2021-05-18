import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class RectangluarButton extends StatelessWidget {
  final Function press;
  final String text;
  final Color color;
  final Icon icon;


  const RectangluarButton({
    Key key, this.text, this.color, this.press, this.icon,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Container(


      height: size.height/8,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
          style: BorderStyle.solid,
        ),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),

        child: RaisedButton.icon(

          color: color,
          label: Text(
            text,
            style: TextStyle(fontSize: 15.0,color: Colors.white),
          ),
          icon: icon,
          onPressed: press,
        ),
      ),
    );
  }
}

