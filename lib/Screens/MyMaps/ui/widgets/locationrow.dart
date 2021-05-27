import 'package:flutter/material.dart';


class LocationRow extends StatelessWidget {
  final Color color;
  final Border border;
  final Icon icon;
  final String location, time;
  const LocationRow({
    Key key,
    this.icon,
    @required this.location,
    @required this.time,
    @required this.color,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: border ?? Border(),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          SizedBox(width: 5.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$location",
                style: Theme.of(context)
                    .textTheme
                    .subhead
                    .apply(fontWeightDelta: 2, color: Colors.deepOrange),
              ),
              SizedBox(height: 2.0),
              Text(
                "$time",
                style:
                    Theme.of(context).textTheme.body1.apply(color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
