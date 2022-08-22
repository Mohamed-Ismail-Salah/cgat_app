import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custom_TextFormfield extends StatelessWidget {
  String? hint_Text;
  bool? scure;
  Function(String)? onChanged;
  Custom_TextFormfield({this.scure=false,this.hint_Text, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:scure! ,
      validator: (data) {
        if (data!.isEmpty) {
          return 'opsss';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint_Text,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      ),
    );
  }
}
