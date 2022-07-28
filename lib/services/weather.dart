import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
const apiKey='09d8b7d11f0945da9a2df0dd44885b5d';
const openMapUrl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel{
 
 Future<dynamic> getCityWeather(String cityname) async{
  var url='$openMapUrl?q=$cityname&appid=$apiKey&units=metric';
  NetworkHelper helper=NetworkHelper(url);
  var weatherData=await helper.getData();
  return weatherData;
 }

Future<dynamic> getlocationWeather() async {
  Location loc=Location();
    await loc.getCurrentPosition();
   
    NetworkHelper help=NetworkHelper("$openMapUrl?lat=${loc.latitude}t&lon=${loc.longitude}&appid=$apiKey&units=metric");
    var weatherData=await help.getData();
     return weatherData;
}
String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}