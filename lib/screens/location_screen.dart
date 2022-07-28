import 'package:flutter/material.dart';
import 'package:weather/screens/city_screen.dart';
import '../utilities/constants.dart';
import 'package:weather/services/weather.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationWeather);
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temperature;
  late String city;
  late int condition;
  late String weatherIcon;
  late String message;
  WeatherModel weather=new WeatherModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);

  }
  void updateUI(dynamic weatherdata){
    if(weatherdata==null){
      temperature=0;
      weatherIcon='error';
    city='';
    message='unable to get weather data';
    return ;
    }
    setState(() {
      
   
     double temp=weatherdata['main']['temp'];
     temperature=temp.toInt();
     condition=weatherdata['weather'][0]['id'];
     city=weatherdata['name'];
     weatherIcon=weather.getWeatherIcon(condition);
     message=weather.getMessage(temperature);
     print(temperature); 
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      var weatherD=await weather.getlocationWeather();
                      updateUI(weatherD);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var typedName=await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      
                      },
                      ),
                      );
                      if(typedName!=null){
                       var weatherData=await   weather.getCityWeather(typedName);
                      updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $city!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}