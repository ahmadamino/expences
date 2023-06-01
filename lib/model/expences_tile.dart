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
                  'لا يوجد اي مصروف حاليا',
                  style: TextStyle(fontSize: 10, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'images/docments.png',
                  height: 100,
                  color: Colors.blue,
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
            return Card(
              child: ListTile(

                title: Text(expences.title,style: TextStyle(fontWeight: FontWeight.bold),),
                leading:IconButton(
                  onPressed: () {
                    expencesController.remove(expences);
                  },
                  icon: Icon(Icons.delete),
                ),
                trailing:Container(
                  padding: EdgeInsets.all(15),
                    color: Colors.blue,
                    child: Text("${expences.money}")),
              ),
            );
          },
        );
    });
  }
}
