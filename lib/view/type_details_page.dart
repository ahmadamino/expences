import 'package:expences_app/model/type.dart';
import 'package:flutter/material.dart';
class TypeDetailsPage extends StatelessWidget {
final TypeExpences typeExpences;

  const TypeDetailsPage({super.key, required this.typeExpences});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          typeExpences.title,
          textAlign: TextAlign.center
          ,
        ),

      ),
    );
  }
}
