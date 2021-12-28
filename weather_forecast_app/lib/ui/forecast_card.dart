
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/convert_icon.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  var dayOfTime = "";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[Tuesday, Dec 28, 2021, 12:00:AM] => Saturday
  dayOfTime = fullDate.split(",")[3];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(child: Text(dayOfWeek+dayOfTime)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList.elementAt(index).weather[0].main, color: Colors.pinkAccent, size: 45),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("${(forecastList[index].main.temp - 273.15).toStringAsFixed(0)}°C"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white, size: 17,),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("${(forecastList[index].main.tempMax - 273.15).toStringAsFixed(0)}°C"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white, size: 17,),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Hum: ${(forecastList[index].main.humidity).toStringAsFixed(0)}%"),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white, size: 17,),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Win: ${(forecastList[index].wind.speed).toStringAsFixed(1)}mi/h"),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white, size: 17,),

                  ],
                ),
              )

            ],
          )
        ],
      )

    ],
  );
}