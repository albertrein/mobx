import 'package:http/http.dart' as http;
import 'dart:convert';

class CatsApiService{
  static const apiUrlBase = 'https://api.thecatapi.com/v1/images/search';
  late final Uri uri;
  

  CatsApiService(){
    uri = Uri.parse(apiUrlBase);
  }
  
  Future<String> getUrlCatImage() async{    
    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      Iterable dataConverted = convertStringBodyToIterable(response.body);
      return getUrlFromIterable(dataConverted);
    } else {
      return '';
    }
  }

  Iterable convertStringBodyToIterable(String responseBody){
    return jsonDecode(responseBody);
  }

  String getUrlFromIterable(Iterable dataConverted){
    try{
      Map<String, dynamic> dataMap = dataConverted.first;
      if(dataMap.containsKey('url')){
        return dataMap['url'];
      }
      return '';
    }catch(e){
      return '';
    }
  }

}