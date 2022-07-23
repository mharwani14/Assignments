import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getData() async{
    http.Response response= await http.get(Uri.parse("url"));
   int code=response.statusCode;
   
   if(code==200){
    String data=response.body;
    
    // var longitude =jsonDecode(data)['coord']['lon'];
    // var weatherdesc=jsonDecode(data)['weather'][0]['id'];
    var decodedData=jsonDecode(data);
    return decodedData;
    
   }
   else {
    print('error $code occured ');
   }
  }
  }
