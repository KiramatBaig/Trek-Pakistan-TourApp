import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
class WebWeather extends StatefulWidget {
  @override
  _WebWeatherState createState() => _WebWeatherState();
}

class _WebWeatherState extends State<WebWeather> {
  // Strings to store the extracted Article titles
  String currentTemp = 'Result 1';
  String result2 = 'Result 2';
  String result3 = 'Result 3';

  // boolean to show CircularProgressIndication
  // while Web Scraping awaits
  bool isLoading = false;
  String city='';
  Future<List<String>> extractData(String city) async {

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




        // Converting the extracted titles into
        // string and returning a list of Strings
        return [
          responseString1.text.trim(),

        ];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text('Trek Pakistan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        centerTitle: true,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35,right: 35,top: 0),
                  child: Column(
                    children: [
                      TextField(
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,

                        autofocus: false,
                        onChanged: (value){
                          city=value;
                        },

                        decoration: InputDecoration(
                            hoverColor: Colors.black,
                            focusColor: Colors.black,
                            fillColor: Colors.black,
                            prefixIcon: Icon(Icons.search,color: Colors.black,),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),

                            hintText: "Enter City",hintStyle: TextStyle(color:Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                      SizedBox(height: 5,),

                    ],
                  ),
                ),
                // if isLoading is true show loader
                // else show Column of Texts
                isLoading
                    ? CircularProgressIndicator()
                    : MaterialButton(
                  onPressed: () async {

                    // Setting isLoading true to show the loader
                    setState(() {
                      isLoading = true;
                    });

                    // Awaiting for web scraping function
                    // to return list of strings
                    final response = await extractData(city);

                    // Setting the received strings to be
                    // displayed and making isLoading false
                    // to hide the loader
                    setState(() {
                      currentTemp = response[0];


                      isLoading = false;
                    });
                  },
                  child: Text(
                    'Scrap Data',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                ),
                Column(
                  children: [
                    Text(currentTemp,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),

              ],
            ),
    );
  }
}
