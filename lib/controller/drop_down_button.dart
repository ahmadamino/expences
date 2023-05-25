import 'package:get/get.dart';

class DropdownController extends GetxController {
  String? selectedValue;

  var expences = <String>["جميع المصروفات","مصروفات اليوم",'مصروفات الشهر'];

  void onSelected(String value) {
    selectedValue = value;
    update();
  }
}
