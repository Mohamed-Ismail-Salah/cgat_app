import 'package:chat_app/modle/masag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  const chatbubble({

    Key? key,
    required this.masasg
  }) : super(key: key);
   final MasageModle masasg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20)),
          color: Colors.indigo,
        ),

        child: Text(
          masasg.masagemodel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

}







class chatbubbleResv extends StatelessWidget {
  const chatbubbleResv({

    Key? key,
    required this.masasg
  }) : super(key: key);
  final MasageModle masasg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
          color: Colors.lightBlueAccent,
        ),

        child: Text(
          masasg.masagemodel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

}
