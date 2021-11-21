import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;


class WeatherScreen extends StatefulWidget {
  static const String id = 'Weather';
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  var temp ;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var visibility;
  var icon;

  Future getWeatherInfo (String city)async {
    http.Response response = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=20a657d8e093eb8d8b9f25258ce18a5c'));
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently= results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
      this.visibility = results['visibility'];
      this.icon=results['weather'][0]['icon'];


    });
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

              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Container(
                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        image: NetworkImage("https://cdn.dribbble.com/users/224485/screenshots/1953696/weathernew.gif"),
                      ),
                    ),
                  ),
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

                              padding: const EdgeInsets.only(left: 35,right: 35,top: 0),
                              child: Column(
                                children: [
                                  TextField(
                                    style: TextStyle(color: Colors.white),
                                    cursorColor: Colors.white,

                                    autofocus: false,
                                    onChanged: (value){
                                      setState(() {
                                        city=value.toString();
                                        this.getWeatherInfo(city);
                                      });

                                    },

                                    decoration: InputDecoration(
                                      hoverColor: Colors.white,
                                        focusColor: Colors.white,
                                        fillColor: Colors.white,
                                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                                        hintText: "Enter City",hintStyle: TextStyle(color:Colors.white),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 5,),

                                ],
                              ),
                            ),

                          ],


                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 90.0),
                        child: Text(
                          temp != null ? temp.toString()+"\u00B0": "",
                          style:TextStyle(
                            color: Colors.white,
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
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,

                          )
                          ,),

                      ),

                    ],
                  ),
                ),]
              ),

              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListView(
                      children:<Widget> [

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.thermometerHalf) ,
                          title: Text("Temperature"),
                          trailing: Text(temp != null ? temp.toString()+"\u00B0": "0",),
                        ),

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.cloud) ,
                          title: Text("Weather"),
                          trailing: Text(description != null ? description.toString():"none",),
                        ),

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.sun) ,
                          title: Text("Humidity"),
                          trailing: Text(humidity != null ? humidity.toString():"0",),
                        ),

                        ListTile(
                          leading:FaIcon(FontAwesomeIcons.wind) ,
                          title: Text("Wind Speed"),
                          trailing: Text(windSpeed != null ? windSpeed.toString():"0",),
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