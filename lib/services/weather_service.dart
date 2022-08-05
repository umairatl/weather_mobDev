import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

//creating a class function for api
class WeatherService {
  Future<WeatherModel> fetchWeatherInformation(String cityName) async {
    const String apiKey = '9dc00f090453477095ce378c7210e2bf';

    final Uri url = Uri(
      scheme: 'https',
      host: 'api.openweathermap.org',
      path: 'data/2.5/weather',
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load weather information.');
    }
  }
}
