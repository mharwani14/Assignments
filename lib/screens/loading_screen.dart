import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/services/weather.dart';
class LoadingScreen extends StatefulWidget {
  

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    
  }
  void getLocation() async {
    WeatherModel weatherModel=new WeatherModel();
 var weatherData= await weatherModel.getlocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);
    }));
  }
  
   

  
  @override
  Widget build(BuildContext context) {
    // String myMargin='15';
    // late double newMargin;
    // try{
    //  newMargin=double.parse(myMargin);
    // return Scaffold(
    //   body: Container(
    //     margin: EdgeInsets.all(newMargin),
    //     color: Colors.red[400]
    //   )
      
    // );
    // }
    // catch(e){
    //   print(e);
    // }
    
      return Scaffold(
        body: Center(child: 
        SpinKitCircle(
          color: Colors.white,
          size: 100.0,
        ),
        )
        
        ,
      
      );
    }
  }
