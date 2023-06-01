import 'package:expences_app/controller/bottom_navigation_controller.dart';
import 'package:expences_app/controller/expences_controller.dart';
import 'package:expences_app/model/expences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expences_app/main.dart';

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
        elevation: 0,
        title: Text(
          'مصروف جديد',
          style: Theme.of(context).textTheme.headline6,
        ),
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
                  Get.changeTheme(Themes.customLightTheme);
                } else {
                  Get.changeTheme(Themes.customDarkTheme);
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        if (val!.length < 1) {
                          return 'لايمكن ان يكون النص اقل من رقم';
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
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formstate.currentState!.validate()) {
                          final exp = Expences(
                            title: _titleController.text,
                            money:
                                double.tryParse(_descriptionController.text) ??
                                    0.0,
                            date: dateInputController.text,
                          );
                          _openAddTaskPage(exp);

                          // Navigator.of(context).pop(
                          //   Expences(
                          //     title: _titleController.text,
                          //     money: _descriptionController.text,
                          //     date: dateInputController.text,
                          //   ),
                          // );
                        } else {
                          return null;
                        }
                      },
                      child: const Text(
                        'اضافة المصروف',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openAddTaskPage(Expences expences) async {
    ExpencesController expencesController = Get.put(ExpencesController());
    expencesController.addTask(expences);
    BottomNavigationController bottomNavigationController =
        Get.put(BottomNavigationController());
    bottomNavigationController.changeIndex(0);
    // final result = await Get.to(AddExpences());
    // if (result != null) {
    //   expencesController.addTask(result as Expences);
    // }
  }
}
