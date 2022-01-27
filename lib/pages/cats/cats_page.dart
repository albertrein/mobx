import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CatsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CatsPageState();
  
}

class _CatsPageState  extends State<CatsPage> {
  String _catImageUrl = 'https://d.newsweek.com/en/full/1920025/cat-its-mouth-open.jpg?w=1600&h=1200&q=88&f=e4241cd2c228c6e075a0ac0d54c8ef39';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:40, left: 20, right: 20, bottom: 50),
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return Image.network(_catImageUrl);
              }
            ),
            OutlinedButton(              
              onPressed: (){
                //carrega imagem
              },
              child: Text('Próxima imagem >'))
          ]
        ),
      ),
    );
  }

}