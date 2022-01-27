import 'package:mobx/mobx.dart';
import '../helper/cats_api.dart';
part 'cats_store_images.g.dart';

class CatsStoreImages = _CatsStoreImages with _$CatsStoreImages;

abstract class _CatsStoreImages with Store{
  static const baseUrl = 'https://d.newsweek.com/en/full/1920025/cat-its-mouth-open.jpg?w=1600&h=1200&q=88&f=e4241cd2c228c6e075a0ac0d54c8ef39';

  @observable
  String urlImage = baseUrl;
  
  CatsApiService catsApi = CatsApiService();

  @action
  Future<void> getUrlImage() async {
    urlImage = await catsApi.getUrlCatImage();
    if(!isValidUrl(urlImage)){
      urlImage = baseUrl;
    }
  }

  bool isValidUrl(String stringUrlConverted){
    if(stringUrlConverted == ''){
      return false;
    }
    return true;
  }
  
}