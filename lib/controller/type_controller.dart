import 'package:expences_app/model/type.dart';
import 'package:get/get.dart';

class TypeController extends GetxController {
  final List<TypeExpences> _typeExpences = [
    TypeExpences(title: 'الصحة'),
    TypeExpences(title: "التغذية"),
    TypeExpences(title: "الاشخاص"),
  ];

  List<TypeExpences> get typesExpences => _typeExpences;

  void addTask(TypeExpences typeExpences) {
    _typeExpences.add(typeExpences);
    update();
  }

  void remove(TypeExpences typeExpences) {
    _typeExpences.remove(typeExpences);
    update();
  }
}
