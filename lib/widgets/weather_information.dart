import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        height: 600,
        child: Card(
            child: Column(
          children: [
            const SizedBox(height: 60),
            // Icon(Icons.wb_sunny, color: Colors.yellow, size: 80),
            Image.network(
              'http://openweathermap.org/img/w/${weatherModel.weather.first.icon}.png',
              width: 150,
              height: 90,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 40),
            Text('${weatherModel.main.temp} °C',
                style: TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            Text('${weatherModel.name}', style: TextStyle(fontSize: 22)),
            const SizedBox(height: 40),
            Text('Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('${weatherModel.weather.first.description}',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Humidity:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('${weatherModel.main.humidity} %',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Feels like:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('${weatherModel.main.feelsLike} °C',
                style: TextStyle(fontSize: 18)),
          ],
        )));
  }
}
