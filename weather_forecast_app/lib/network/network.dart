import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

class Network {
  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
    // change to metric or imperial
    var finalUrl = "https://api.openweathermap.org/data/2.5/forecast?q=${cityName}&appid=${Util.appId}";

    final response = await get(Uri.parse(Uri.encodeFull((finalUrl))));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      // we get the actual mapped model ( dart object)
      // print("Weather data: ${response.body}");
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else {
      throw Exception("Error getting weather forecast");
    }
  }
}