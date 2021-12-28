import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/util/convert_icon.dart';
import 'package:weather_forecast_app/util/forecast_util.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  const MidView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city_name = snapshot.data?.city.country;
    var country = snapshot.data?.city.country;
    var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
    var temperature = (forecastList[0].main.temp - 273.15).toStringAsFixed(0);
    var max_temperature = (forecastList[0].main.tempMax - 273.15).toStringAsFixed(0);

    return Container(
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$city_name, $country", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black
            ),),
            Text("${Util.getFormattedDate(formattedDate)}", style: TextStyle(
              fontSize: 15,
            ),),
            SizedBox(height: 10,),
            getWeatherIcon(weatherDescription: forecastList[0].weather[0].main, color: Colors.pinkAccent, size: 198),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("${temperature}°C",
                      style: TextStyle(
                          fontSize: 34
                      ),),
                  ),
                  Text("${forecastList[0].weather[0].description.toUpperCase()}",),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${forecastList[0].wind.speed.toStringAsFixed(1)} mi/h", style: TextStyle(fontSize: 18),),
                          Icon(FontAwesomeIcons.wind, size: 30, color: Colors.brown,),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecastList[0].main.humidity.toStringAsFixed(0)} %", style: TextStyle(fontSize: 18)),
                        Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 30, color: Colors.brown,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${max_temperature}°C",  style: TextStyle(fontSize: 18)),
                        Icon(FontAwesomeIcons.temperatureHigh, size: 30, color: Colors.brown,),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


// Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
//   var forecastList = snapshot.data?.list;
//   var city_name = snapshot.data?.city.country;
//   var country = snapshot.data?.city.country;
//   var formattedDate = new DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
//   var temperature = (forecastList[0].main.temp - 273.15).toStringAsFixed(0);
//   var max_temperature = (forecastList[0].main.tempMax - 273.15).toStringAsFixed(0);
//
//   Container midView = Container(
//     child: Padding(
//       padding: EdgeInsets.all(18.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("$city_name, $country", style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//             color: Colors.black
//           ),),
//           Text("${Util.getFormattedDate(formattedDate)}", style: TextStyle(
//             fontSize: 15,
//           ),),
//           SizedBox(height: 10,),
//           getWeatherIcon(weatherDescription: forecastList[0].weather[0].main, color: Colors.pinkAccent, size: 198),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("${temperature}°C",
//                 style: TextStyle(
//                   fontSize: 34
//                 ),),
//                 Text("${forecastList[0].weather[0].description.toUpperCase()}",),
//               ],
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("${forecastList[0].wind.speed.toStringAsFixed(1)} mi/h", style: TextStyle(fontSize: 18),),
//                         Icon(FontAwesomeIcons.wind, size: 30, color: Colors.brown,),
//                       ]),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${forecastList[0].main.humidity.toStringAsFixed(0)} %", style: TextStyle(fontSize: 18)),
//                       Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 30, color: Colors.brown,),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("${max_temperature}°C",  style: TextStyle(fontSize: 18)),
//                       Icon(FontAwesomeIcons.temperatureHigh, size: 30, color: Colors.brown,),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     ),
//   );
//   return midView;
// }