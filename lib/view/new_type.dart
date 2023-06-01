import 'package:expences_app/controller/type_controller.dart';
import 'package:expences_app/view/add_type_expences.dart';
import 'package:expences_app/view/type_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expences_app/model/type.dart';
import 'package:expences_app/main.dart';

class NewType extends StatelessWidget {
  TypeController typeController = Get.put(TypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'الاصناف',
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
      body: GetBuilder<TypeController>(
        builder: (typeController) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: typeController.typesExpences.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemBuilder: (context, index) {
                  final typeEx = typeController.typesExpences[index];
                  return InkWell(
                    onTap: () {
                      _openTypeDetialsPage(typeEx);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        typeEx.title,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('صنف جديد'),
        icon: Icon(Icons.add),
        onPressed: () {
          return _openAddExoencesPage();
        },
      ),
    );
  }

  void _openAddExoencesPage() async {
    TypeController typeController = Get.put(TypeController());
    final result = await Get.to(AddTypeExpences());
    if (result != null) {
      typeController.addTask(result as TypeExpences);
    }
  }

  void _openTypeDetialsPage(TypeExpences typeExpences) async {
    Get.to(TypeDetailsPage(
      typeExpences: typeExpences,
    ));
  }
}
