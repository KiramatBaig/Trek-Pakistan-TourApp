import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class EarningsTimeline {
  final String year;
  final double earning;
  charts.Color color;

  EarningsTimeline({
    @required this.year,
    @required this.earning,
    @required this.color,
  });
}