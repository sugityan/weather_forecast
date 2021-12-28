import 'package:flutter/material.dart';
import 'package:weather_forecast_app/model/weather_forecast_model.dart';
import 'package:weather_forecast_app/network/network.dart';
import 'package:weather_forecast_app/ui/bottom_view.dart';
import 'package:weather_forecast_app/ui/mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Tokyo";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
/*    forecastObject.then((weather) => {
      //[timezone] => not list type
      print("cod:" + weather.cod),
      // [minutely] => list type
      print(weather.list[0].dt)
    });*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecasts"),
      ),
      body: ListView(
          children: [
            textFieldView(),
            Container(
              child: FutureBuilder<WeatherForecastModel>(
                  future: forecastObject,
                  builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Press button to start.');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Text('Awaiting result...');
                      case ConnectionState.done:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        return Column(
                          children: [
                            MidView(snapshot: snapshot),
                            BottomView(snapshot: snapshot),
                            // bottomView(snapshot, context)
                          ],
                        );
                    // You can reach your snapshot.data['url'] in here
                    }
                  }

                  /*{
                    if(snapshot.hasData) {
                      return Column(
                        children: [
                          midView(snapshot),
                        ],
                      );
                    }else {
                      return Container(
                        child: CircularProgressIndicator(),);
                    }
                  }*/
                  ),
            )
          ],
    )
    ,
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter City Name",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.all(10)
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      new Network().getWeatherForecast(cityName: _cityName);

}
