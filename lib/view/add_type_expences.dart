import 'package:expences_app/controller/type_controller.dart';
import 'package:expences_app/model/type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTypeExpences extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child:
      AlertDialog(
        title: Center(child: Text('الصنف')),
        content: TextFormField(
            controller: _titleController,
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
                      .pop(TypeExpences(title: _titleController.text));
                }
              },
              child: Text('اضافة')),
          ElevatedButton(onPressed: () {
            Get.back();
          }, child: Text('الغاء')),
        ],
      ),
    );
  }
}
