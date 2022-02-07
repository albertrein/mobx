import 'dart:io';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx_app_test/pages/beauty_chat/beauty_chat_page.dart';
import 'package:mobx_app_test/pages/cats/cats_page.dart';
import 'package:mobx_app_test/pages/form_listview/form_listview_page.dart';
import 'package:mobx_app_test/store/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterStore counterStore = CounterStore();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
                builder: (_) => Text(
                '${counterStore.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterStore.incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_sharp),
            label: 'Cats Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_sharp),
            label: 'Beauty Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Form & ListView',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (index)=>{_changePage(index)},
      ),
    );
  }

  _changePage(int index) async {
    switch(index){
      case 0:
        if(await _validateNetworkConnection() == true){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CatsPage()));
        }else{
          ScaffoldMessenger.of(context).showSnackBar(_snackBarMessage('Sem acesso à internet'));
        }
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => BeautyChat()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => FormListViewPage()));
        break;
    }    
  }

  Future<bool> _validateNetworkConnection()async{
    try{
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    }on SocketException catch (_){
      return false;
    }catch(e){
      return false;
    }
  }

  SnackBar _snackBarMessage(String messageOfSnack){
    return SnackBar(content: Text(messageOfSnack));
  }
}
