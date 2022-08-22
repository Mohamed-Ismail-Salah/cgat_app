import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? name;
  VoidCallback ontap;
  CustomButton({this.name, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 40,
          width: 450,
          child: Center(
              child: Text(
            name!,
            style: TextStyle(fontSize: 20, color: Colors.indigo),
          ))),
    );
  }
}
