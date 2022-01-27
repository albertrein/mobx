import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'cats_store/cats_store_images.dart';

class CatsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CatsPageState();
  
}

class _CatsPageState  extends State<CatsPage> {
  CatsStoreImages catsStoreImages = CatsStoreImages();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:40, left: 20, right: 20, bottom: 50),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return Image.network(
                  catsStoreImages.urlImage,
                  loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                );
              }
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: 
                OutlinedButton(              
                onPressed: (){
                  catsStoreImages.getUrlImage();
                },
                child: const Text('Próxima imagem ...'),                
              ),
            )
          ]
        ),
      ),
    );
  }

}