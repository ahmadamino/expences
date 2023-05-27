import 'package:date_time_field/date_time_field.dart';
import 'package:expences_app/controller/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpences extends StatelessWidget {
  AddExpences({Key? key}) : super(key: key);
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController dateInputController = TextEditingController();

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مصروف جديد'),
        leading: Container(
          height: 50,
          width: 50,
          child: Image.asset('images/bady.png'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }
              },
              icon: Icon(Icons.sunny))
        ],
      ),
      body: Form(
        key: formstate,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    'العنوان',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        hintText: 'أدخل عنوان المصروف',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return 'لايمكن ان يكون النص اقل من اربع احرف';
                        }
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          'المبلغ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'أدخل المبلغ المصروف',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (val) {
                        if (val!.length < 4) {
                          return 'لايمكن ان يكون النص اقل من اربع احرف';
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        'التاريخ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'التاريخ',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      controller: dateInputController,
                      textAlign: TextAlign.end,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));

                        if (pickedDate != null) {
                          dateInputController.text = pickedDate.toString();
                        }
                      },
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (formstate.currentState!.validate()) {
              //         Navigator.of(context).pop(
              //           Task(
              //             title: _titleController.text,
              //             description: _descriptionController.text,
              //           ),
              //         );
              //       } else {
              //         return null;
              //       }
              //     },
              //     child: const Text(
              //       'Save',
              //       style: TextStyle(fontSize: 25),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
