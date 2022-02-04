import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeautyChat extends StatefulWidget{
  const BeautyChat({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BeatutyChatPageContent();
}

class _BeatutyChatPageContent extends State<BeautyChat>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beauty Bar Chat'),
      ),
      body: Center(
        child: Container(child: Text('Dados'),),
      ),
    );
  }
  
}