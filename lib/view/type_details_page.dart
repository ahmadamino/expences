import 'package:expences_app/controller/bottom_navigation_controller.dart';
import 'package:expences_app/controller/type_controller.dart';
import 'package:expences_app/model/type.dart';
import 'package:expences_app/view/new_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeDetailsPage extends StatelessWidget {
  final TypeExpences typeExpences;
  TypeController typeController = Get.put(TypeController());

  TypeDetailsPage({super.key, required this.typeExpences});

  @override
  Widget build(BuildContext context) {
    final cont = TextEditingController(text: typeExpences.title);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            typeExpences.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(child: const Text('هل انت متاكد من الحذف؟')),
                  content: Text(
                      'في حال الحذف سيتم حذف جميع المصاريف الموجودة داخل الصنف'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('لا'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        typeController.remove(typeExpences);
                        Get.to(NewType());
                      },
                      child: Text('نعم'),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              'حذف',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.edit),
        label: Text('تعديل'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('تعديل'),
                  content: TextField(
                    controller: cont,
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Get.to(TypeExpences(title: cont.text));
                          Get.put(TypeController())
                              .updateTask(typeExpences, cont.text);
                          BottomNavigationController
                              bottomNavigationController =
                              Get.put(BottomNavigationController());
                          bottomNavigationController.changeIndex(2);
                        },
                        child: Text('تعديل'))
                  ],
                );
              });
        },
      ),
    );
  }
}
// ExpencesController expencesController = Get.put(ExpencesController());
// expencesController.addTask(expences);
