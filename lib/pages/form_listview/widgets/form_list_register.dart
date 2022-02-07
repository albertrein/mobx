import 'package:flutter/material.dart';

import '../list_store/list_store.dart';

class FormListResgister extends StatelessWidget{
  final _key = GlobalKey<FormState>();
  TextEditingController _valueListEntrance = TextEditingController();
  late ListStore listStoreData;

  FormListResgister({Key? key, required this.listStoreData}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          const Text('Insert a string'),
          TextFormField(
            onChanged: (value){
              _valueListEntrance.text = value;
            },
            validator: (value){
              return (value == null) ? 'Insert a text' : null;
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: _valueListEntrance.clear,
                icon: const Icon(Icons.clear),
              ),
            ),
          ),
          MaterialButton(
            onPressed: (){
             if (_key.currentState!.validate()) {
               listStoreData.insertInDataList(_valueListEntrance.text);
             }
            },
            child: const Text('Salvar'),
          )
        ],
      ),
    );
  }
  
}