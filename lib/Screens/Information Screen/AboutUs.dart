
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
    onPressed: onClicked,
    color: Theme.of(context).primaryColor,
    shape: StadiumBorder(),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'No matter where you are',
          body: 'Get access to important information about your destination before and during your travel...',
          image: buildImage('assets/images/tourist.jpg'),
          decoration: getPageDecoration(),
        ),

        PageViewModel(
          title: 'Explore Nearby Stuff',
          body: 'Travel Advisory will provide you information about the nearby restaurants and attractions with the easiest way...',
          image: buildImage('assets/images/nearbystuff.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Realtime Travel Guide',

          body: 'Get directions, distance and other related stuff in one place...',
          image: buildImage('assets/images/travelguide.jpg'),
          decoration: getPageDecoration(),
        ),
        
      ],
      showDoneButton: false,
      next: Icon(Icons.arrow_forward_ios,color: Colors.green,),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Colors.transparent,
      skipFlex: 0,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
      // freeze: true,
      // animationDuration: 1000,
    ),
  );



  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 300,height: 200,));

  DotsDecorator getDotDecoration() => DotsDecorator(

    color: Colors.green,
    activeColor: Colors.green,
    size: Size(5, 5),
    activeSize: Size(12, 12),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: "Times New Roman"),
    bodyTextStyle: TextStyle(fontSize: 15,fontFamily: "Times New Roman",fontWeight: FontWeight.normal),
    imageFlex: 1,
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
  );
}