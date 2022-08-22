import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void masag(BuildContext context,String masagName) {
  ScaffoldMessenger.of
    (context).showSnackBar(
    SnackBar(content:  Text(masagName  ,)
    ),);
}