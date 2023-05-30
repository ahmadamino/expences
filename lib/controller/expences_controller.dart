import 'package:expences_app/model/expences.dart';
import 'package:get/get.dart';

class ExpencesController extends GetxController{
  final List <Expences> _expences=[];
  List<Expences> get expences => _expences;

  void addTask(Expences expences) {
    _expences.add(expences);
    update();
  }

  int get count {
    return _expences.length;
  }

  void remove(Expences expences) {
    _expences.remove(expences);
    update();
  }

  // void updateTask(Expences expences) {
  //   expences.doneChange();
  //   update();
  // }



}