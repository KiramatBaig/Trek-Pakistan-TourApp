import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FrostedContainer extends StatelessWidget {

  final Widget child;
  const FrostedContainer({
    Key key, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.circular(15.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0,sigmaY:10.0 ),
        child: Container(
          height: MediaQuery.of(context).size.height/2.5,
          width: MediaQuery.of(context).size.width/3,
          color: Colors.green.withOpacity(0.3),
          child: child,
        ),
      ),
    );
  }
}
