import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey='09d8b7d11f0945da9a2df0dd44885b5d';
class LoadingScreen extends StatefulWidget {
  

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 late double lat;
 late double long;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    
  }
  void getLocation() async {
    Location loc=Location();
    await loc.getCurrentPosition();
    lat=loc.latitude;
    long=loc.longitude;
    NetworkHelper help=NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey");
    var weatherData=await help.getData();
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
        
      
      );
    }
  }
