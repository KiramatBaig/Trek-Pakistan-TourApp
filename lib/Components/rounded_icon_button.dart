import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final String text;
  const RoundedIconButton({
    Key key, this.text,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      height: size.height*0.06,
      width: size.width*0.8,
      color: Colors.transparent,
      child: Container(

        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0
            ),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(29.0)
        ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ImageIcon(NetworkImage('https://image.flaticon.com/icons/png/128/2111/2111392.png')),
            ),
            SizedBox(width: 10.0),
            Center(
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}

