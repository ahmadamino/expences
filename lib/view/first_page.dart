import 'package:expences_app/controller/drop_down_button.dart';
import 'package:expences_app/controller/expences_controller.dart';
import 'package:expences_app/model/expences.dart';
import 'package:expences_app/model/expences_tile.dart';
import 'package:expences_app/view/add_expences.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:expences_app/main.dart';

class FirstPage extends StatelessWidget {
  // DropdownController contoller = Get.put(DropdownController());
  HomeController homeController = HomeController();
  var newValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'مصروفات',
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
              icon: Icon(
                Icons.sunny,
              ))
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => DropdownButton<String>(
              isExpanded: true,
              elevation: 0,
              hint: Text(
                'فرز حسب', textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
              onChanged: (newValue) {
                homeController.setSelected(newValue!);

                if (newValue == "l") {}
              },
              value: homeController.selected.value,
              items: homeController.dropdownText.map((selectedType) {
                return DropdownMenuItem<String>(
                  child: Text(
                    selectedType,

                  ),
                  value: selectedType,
                );
              }).toList(),
            ),
          ), // DropdownButton(


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
          SizedBox(
            height: 5,
          ),
          ExpencesTile()
        ],
      ),
    );
  }
}
