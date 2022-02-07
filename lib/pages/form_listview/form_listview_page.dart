import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_app_test/pages/form_listview/list_store/list_store.dart';
import 'package:mobx_app_test/pages/form_listview/widgets/form_list_register.dart';
import 'package:mobx_app_test/pages/form_listview/widgets/listview_widget.dart';

class FormListViewPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormListViewState();

}

class _FormListViewState extends State<FormListViewPage>{
  ListStore listStore = ListStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Obervable List with Form'),),
      body:  Column(
          children: [
            const Text('Testing Form inserting in List:'),
            SizedBox(
              child: FormListResgister(listStoreData: listStore)
            ),
            //SizedBox(child: Flexible(child: formRegister()),),

            Padding(
              padding: const EdgeInsets.all(20),
              child: ListViewWidget(listStoreData: listStore),
                //child: listViewWidgetLocal(context),
            ),
          ],
        ),
      );
  }

  Widget listViewWidgetLocal(var context1){
    return Flexible(
      child: Observer(
        builder: (context1) =>
          ListView.builder(
            itemCount: listStore.listData.length,
            itemBuilder: (_, index) => ListTile(title: Text('Data: ${listStore.listData[index]}')),
          ),
      )
    );
  }

  Widget formRegister(){
    final _key = GlobalKey<FormState>();
    String? valueListEntrance;
    return Form(
      key: _key,
      child: Column(
        children: [
          const Text('Insert a string'),
          TextFormField(
            onChanged: (value){
              valueListEntrance = value;
            },
            validator: (value){
              return (value == null) ? null : null;
            },
          ),
          MaterialButton(
            onPressed: (){
             if (_key.currentState!.validate()) {
               listStore.insertInDataList(valueListEntrance ?? '');
             }
            },
            child: const Text('Salvar'),
          )
        ],
      ),
    );
  }
  
}