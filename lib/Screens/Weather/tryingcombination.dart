import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class WeatherTry extends StatefulWidget {
  static const String id = 'Weather';
  @override
  _WeatherTryState createState() => _WeatherTryState();
}

class _WeatherTryState extends State<WeatherTry> {

  var currentTemp ;
  var description;
  var currently;
  var humidity;
  var dewpoint;
  var visibility;
  var icon;

  Future<List<String>> getWeatherInfo(String city) async {

    // Getting the response from the targeted url
    final response =
    await http.Client().get(Uri.parse('https://www.timeanddate.com/weather/pakistan/${city}'));

    // Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {

      // Getting the html document from the response
      var document = parser.parse(response.body);
      try {

        // Scraping the first article title
        var responseString1 = document
            .getElementsByClassName('h2')[0];
        print(responseString1.text);
        var responseString2 = document.getElementById('cur-weather');
        print(responseString2.parent.className);
        var responseString3 = document.getElementsByTagName("p")[0];
        print(responseString3.text);
        var responseString4 = document.getElementsByClassName('bk-focus__info')[0].children[0].children[0].children[0].children[1];
        print(responseString4.text);
        var responseString5 = document.getElementsByClassName('bk-focus__info')[0].children[0].children[0].children[5].children[1];
        print(responseString5.text);
        var responseString6 = document.getElementsByClassName('bk-focus__info')[0].children[0].children[0].children[6].children[1];
        print(responseString6.text);
        var responseString7 = document.getElementsByClassName('bk-focus__info')[0].children[0].children[0].children[3].children[1];
        print(responseString7.text);

        // Converting the extracted titles into
        // string and returning a list of Strings
        return [
          responseString1.text.trim(),
          responseString2.text.trim(),
          responseString3.text.trim(),
          responseString4.text,
          responseString5.text,
          responseString6.text,
          responseString7.text,

        ];
      } catch (e) {
        return ['0', '', 'N/A','N/A','0','0','0'];

      }
    } else {
      return ['0', '', 'N/A','N/A','0','0','0'];
    }
  }
  String city;





  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 0,
            title: const Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            titleSpacing: 50,
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
          body: Column(
            children: [

                    Container(

                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Column(
                            children: [
                              Padding(

                                padding: const EdgeInsets.only(left: 35,right: 35,top: 5),
                                child: Column(
                                  children: [
                                    TextField(
                                      style: TextStyle(color: Colors.black),
                                      cursorColor: Colors.black,

                                      autofocus: false,
                                      onChanged: (value){
                                          this.city = value;
                                      },

                                      decoration: InputDecoration(
                                          hoverColor: Colors.black,
                                          focusColor: Colors.black,
                                          fillColor: Colors.black,
                                          prefixIcon: Icon(Icons.search,color: Colors.green,),
                                          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                                          hintText: "Enter City",hintStyle: TextStyle(color:Colors.black),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          )
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    MaterialButton(
                                      onPressed: () async {

                                        // Awaiting for web scraping function
                                        // to return list of strings
                                        final response = await getWeatherInfo(city);

                                        // Setting the received strings to be
                                        // displayed and making isLoading false
                                        // to hide the loader

                                        setState(() {
                                          if(response[0]=='0'){
                                            Fluttertoast.showToast(msg: "Could Not Find Location");
                                          }
                                          currentTemp = response[0];
                                          icon = response[1];
                                          currently = response[2];
                                          description = response[3];
                                          humidity = response[4];
                                          dewpoint = response[5];
                                          visibility = response[6];


                                        });
                                      },
                                      child: Text(
                                        'Search',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),

                            ],


                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child:
                                Text(
                                  currentTemp != null ? currentTemp.toString(): "",
                                  style:TextStyle(
                                    color: Colors.black,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w600,

                                  ) ,
                                ),

                          ),

                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              currently != null ? currently.toString():"",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,

                              )
                              ,),

                          ),

                        ],
                      ),
                    ),


              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListView(
                      children:<Widget> [

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.thermometerHalf) ,
                          title: Text("Temperature"),
                          trailing: Text(currentTemp != null ? currentTemp.toString()+"\u00B0": "0",),
                        ),

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.locationArrow) ,
                          title: Text("Station Location"),
                          trailing: Text(description != null ? description.toString():"none",),
                        ),

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.sun) ,
                          title: Text("Humidity"),
                          trailing: Text(humidity != null ? humidity.toString():"0",),
                        ),

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.water) ,
                          title: Text("Dew Point"),
                          trailing: Text(dewpoint != null ? dewpoint.toString():"0",),
                        ),

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.eye) ,
                          title: Text("Visibility"),
                          trailing: Text(visibility != null ? visibility.toString():"0",),
                        ),




                      ],
                    ),
                  )
              )
            ],
          ),
        )

    );
  }
}