import 'package:expences_app/controller/type_controller.dart';
import 'package:expences_app/model/type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpDateType extends StatelessWidget {
  final TypeExpences typeExpences;
  TypeController typeController = Get.put(TypeController());
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

   UpDateType({super.key, required this.typeExpences});

  @override
  Widget build(BuildContext context) {
    final cont = TextEditingController(text: typeExpences.title);

    return Form(
      key: formstate,
      child:
      AlertDialog(
        title: Center(child: Text('الصنف')),
        content:  TextFormField(
            controller: cont,
            validator: (value) {
              if (value!.length < 4) {
                return 'لايمكن ان يكون النص اقل من اربع احرف';
              }
            }),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (formstate.currentState!.validate()) {
                  Navigator.of(context)
                      .pop(TypeExpences(title: cont.text));
                }
              },
              child: Text('تعديل')),
          ElevatedButton(onPressed: () {
            Get.back();
          }, child: Text('الغاء')),
        ],
      ),
    );
  }
}
