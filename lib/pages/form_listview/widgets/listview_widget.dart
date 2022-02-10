import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../list_store/list_store.dart';

class ListViewWidget extends StatelessWidget{
  late ListStore listStoreData;

  ListViewWidget({Key? key, required this.listStoreData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) =>
        ListView.builder(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          itemCount: listStoreData.listData.length,
          itemBuilder: (_, index) => ListTile(title: Text(listStoreData.listData[index])),
        ),
      );
  }
}