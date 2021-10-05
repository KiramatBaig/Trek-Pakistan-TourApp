import 'package:flutter/material.dart';
import 'package:flutter_auth/Payment/PaymentDetail.dart';


class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        titleSpacing: 50,
        elevation: 4,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: OrangeClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 500.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                ),
              ),
              ClipPath(
                clipper: BlackClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 500.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
              Positioned(
                top: 80.0,
                left: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'My Bills',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        'Total Bills Due',
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Rs.3710.00',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 210.0,
                left: 295.0,
                child: Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(40.0),
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.green,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print("Tap Functionality");
                      },
                      child: Center(
                        child: Icon(
                          Icons.more,
                          color: Colors.white,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                cardWidget(context, 'https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/Daewoo_Express_Pakistan_Logo.png/1200px-Daewoo_Express_Pakistan_Logo.png', 'Daewoo Express', 'ID: 123456789', '', '\Rs.1240.00', 'Due in 3 days', Colors.green),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                ),
                cardWidget(context, 'https://static.wixstatic.com/media/fd5743_ccaef47929724f2791b6dae63fa262cd~mv2_d_6016_3751_s_4_2.jpg/v1/fill/w_640,h_364,al_c,q_80,usm_0.66_1.00_0.01/fd5743_ccaef47929724f2791b6dae63fa262cd~mv2_d_6016_3751_s_4_2.webp', 'Luxus Resort', 'ID: 123456789', '', '\Rs. 1490.00', 'Due in 2 days', Colors.grey),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
            child: RaisedButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 5.0, bottom: 15.0),
                child: Text(
                  'Pay bills',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentDetailScreen(),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget cardWidget(BuildContext context, String image, String title, String subtitle, String desc, String amount, String days, Color color) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(18.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 30.0,
        height: 130.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        title,
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      leading: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.black, width: 1), image: DecorationImage(image: NetworkImage(image),fit: BoxFit.fill)),
                      ),
                      subtitle: Text(
                        subtitle,
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            desc,
                            style: TextStyle(decoration: TextDecoration.underline, color: color, fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                amount,
                                style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                days,
                                style: TextStyle(color: Colors.grey, fontSize: 13.0, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 5.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrangeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 2 + 85.0, size.height);

    var firstControlPoint = Offset(size.width / 2 + 140.0, size.height - 105.0);
    var firstEndPoint = Offset(size.width - 1.0, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BlackClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width / 2 - 30.0, size.height);

    var firstControlPoint = Offset(size.width / 2 + 175.0, size.height / 2 - 30.0);
    var firstEndPoint = Offset(size.width / 2, 0.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width / 2 + 75.0, size.height / 2 - 30.0);

    path.lineTo(size.width / 2, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}