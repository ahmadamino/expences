import 'package:expences_app/controller/bottom_navigation_controller.dart';
import 'package:expences_app/view/add_expences.dart';
import 'package:expences_app/view/first_page.dart';
import 'package:expences_app/view/new_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationPage extends StatelessWidget {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  NavigationPage({Key? key}) : super(key: key);
  final screen = [
    AddExpences(),
    NewType(),
    FirstPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavigationController.selectedIndex.value,
          children: screen,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) {
            bottomNavigationController.changeIndex(index);
          },
          currentIndex: bottomNavigationController.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.type_specimen_outlined,
              ),
              label: 'الاصناف',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'المصروفات',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: 'مصروف جديد'),
          ],
        ),
      ),
    );
  }
}
