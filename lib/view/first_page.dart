import 'package:expences_app/controller/drop_down_button.dart';
import 'package:expences_app/model/expences_tile.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  // DropdownController contoller = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مصروفات'),
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
      body: Column(
        children: [
          // DropdownButton(
          //     items: [
          //       DropdownMenuItem(
          //         child: Text("مصروفات الشهر"),
          //         value: controller.selectedValue,
          //       ),
          //       DropdownMenuItem(
          //         child: Text("مصروفات اليوم"),
          //         value: controller.selectedValue,
          //       ),
          //       DropdownMenuItem(
          //         child: Text("جميع المصروفات"),
          //         value: controller.selectedValue,
          //       ),
          //     ],
          //     hint: Text('فرز حسب'),
          //     value: contoller.selectedValue,
          //     onChanged: (newValue) {
          //       contoller.selectedValue;
          //     }
          //     )
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 50,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('0.0'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(': اجمالي جميع المصروفات'),
                  ),


                ],
              ),
            ),
          ),
           ExpencesTile()
        ],
      ),
    );
  }
}
