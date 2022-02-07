import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  ObservableList<String> listData = ObservableList<String>();

  @action
  void insertInDataList(String newData){
    listData.add(newData);
  }
}