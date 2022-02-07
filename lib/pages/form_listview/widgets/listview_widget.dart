import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../list_store/list_store.dart';

class ListViewWidget extends StatefulWidget{
  late ListStore listStoreData;

  ListViewWidget({Key? key, required this.listStoreData}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _ListViewWidgetState();
  
}

class _ListViewWidgetState extends State<ListViewWidget>{
    
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) =>
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.listStoreData.listData.length,
          itemBuilder: (_, index) => ListTile(title: Text(widget.listStoreData.listData[index])),
        ),
      );
  }
  
}