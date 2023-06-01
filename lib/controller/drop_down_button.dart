import 'package:get/get.dart';

class HomeController extends GetxController {
  List dropdownText = ["جميع المصروفات","مصروفات اليوم",'مصروفات الشهر'];

  // It is mandatory initialize with one value from listType
  final selected = "جميع المصروفات".obs;

  void setSelected(String value){
    selected.value = value;
  }

}


// [ 1 , 2 , 3 ,4]


// "جميع المصروفات","مصروفات اليوم",'مصروفات الشهر'