import 'package:http/http.dart' as http;

class CatsApiHelper{
  static const apiUrlBase = 'https://api.thecatapi.com/v1/images/search';
  late final Uri uri;
  late final response;
  
  Future<String> getUrlCatImage() async{
    uri = Uri.parse(apiUrlBase);
    response = await http.get(uri);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Image not found';
    }
  }
}