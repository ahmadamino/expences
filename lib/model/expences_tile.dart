import 'package:expences_app/controller/expences_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpencesTile extends StatelessWidget {
  ExpencesController expencesController = Get.put(ExpencesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExpencesController>(builder: (expencesController) {
      if (expencesController.expences.isEmpty) {
        return  Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                ),
                Text(
                  'لا يوجد اي ملاحظة انقر + للاضافة',
                  style: TextStyle(fontSize: 10, color: Colors.teal),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'images/docments.png',
                  height: 100,
                  color: Colors.teal,
                ),
              ],
            ),
          );

      } else
        return ListView.builder(
          shrinkWrap: true,
          itemCount: expencesController.expences.length,
          itemBuilder: (context, i) {
            final expences = expencesController.expences[i];
            return ListTile(
              title: Text(expences.title),
              leading: Text(expences.money as String),
              trailing: IconButton(
                onPressed: () {
                  expencesController.remove(expences);
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        );
    });
  }
}
