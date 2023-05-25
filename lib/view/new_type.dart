import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NewType extends StatelessWidget {
  const NewType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاصناف'),
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
    );
  }
}
