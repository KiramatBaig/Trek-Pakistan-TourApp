import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlowExample extends StatefulWidget {

  @override
  _FlowExampleState createState() => _FlowExampleState();
}

class _FlowExampleState extends State<FlowExample>
    with SingleTickerProviderStateMixin {

  AnimationController _myAnimation;

  final List<IconData> _icons = <IconData>[
    Icons.menu,
    Icons.email,
    Icons.settings,
    Icons.notifications,
    Icons.bus_alert,
  ];

  @override
  void initState() {
    super.initState();

    _myAnimation = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  Widget _buildItem(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: RawMaterialButton(
        fillColor: Color(0xFF66BB6A),
        splashColor: Colors.grey,
        shape: CircleBorder(),
        constraints: BoxConstraints.tight(Size.square(50.0)),
        onPressed: () {
          _myAnimation.status == AnimationStatus.completed
              ? _myAnimation.reverse()
              : _myAnimation.forward();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Colors.white60),
        Flow(
          delegate: FlowExampleDelegate(myAnimation: _myAnimation),
          children: _icons
              .map<Widget>((IconData icon) => _buildItem(icon))
              .toList(),
        ),
      ],
    );
  }
}

class FlowExampleDelegate extends FlowDelegate {

  FlowExampleDelegate({this.myAnimation}) : super(repaint: myAnimation);

  final Animation<double> myAnimation;

  // Put overridden methods here
  @override
  bool shouldRepaint(FlowExampleDelegate oldDelegate) {
    return myAnimation != oldDelegate.myAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = context.childCount - 1; i >= 0; i--) {
      double dx = (context.getChildSize(i).height + 5) * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(dx * myAnimation.value + 10, 5, 0),
      );
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(300.0, 60);
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return i == 0 ? constraints : BoxConstraints.tight(const Size(70.0, 50.0));
  }
}