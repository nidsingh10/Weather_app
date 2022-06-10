import 'Data service.dart';
import 'models.dart';
import 'package:flutter/material.dart';

import 'models.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather",
        theme: ThemeData.dark(),
        home: Scaffold(
          backgroundColor: Colors.black38,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_response != null)
                  Column(
                    children: [
                      Text(
                        'Temperature - ${_response!.tempInfo.temperature} °F',
                        style: TextStyle(fontSize: 40,color: Colors.black),
                      ),
                      Text(_response!.weatherInfo.description.toUpperCase(),style: TextStyle(color: Colors.black87,fontSize: 30),)
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
                    child: Text('Search..'))
              ],
            ),
          ),
        ));
  }

  void _search() async {
    var response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}

