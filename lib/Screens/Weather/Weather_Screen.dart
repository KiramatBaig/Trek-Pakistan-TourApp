import 'package:flutter_auth/Screens/Weather/Models.dart';
import 'package:flutter_auth/Screens/Weather/data_service.dart';
import 'package:flutter/material.dart';


class Weather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: sdk_version_ui_as_code
                if (_response != null)
                  Column(
                    children: [
                      Image.network(_response.iconUrl),
                      Text(
                        '${_response.tempInfo.temperature}°',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text(_response.weatherInfo.description)
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: SizedBox(
                    width: 150,
                    child: TextField(
                        controller: _cityTextController,
                        decoration: InputDecoration(labelText: 'City'),
                        textAlign: TextAlign.center),
                  ),
                ),
                ElevatedButton(onPressed: _search,
                  child: Text('Search'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18))),
                )
              ],
            ),
          ),
        ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}