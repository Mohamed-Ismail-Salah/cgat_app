import 'package:chat_app/components/chatbubble.dart';
import 'package:chat_app/modle/masag.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Chat extends StatefulWidget {
  static String id = "cat";

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final controllerl=ScrollController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference masages =
      FirebaseFirestore.instance.collection(KeyMessage_Collectin);

  TextEditingController controller = TextEditingController();

  String? data;

  @override
  Widget build(BuildContext context) {
    var emil=ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder <QuerySnapshot>(
      stream: masages.orderBy(kcreatAt,descending: true).snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          List<MasageModle> masagelist=[] ;
          for(int i=0;i<snapshot.data!.docs.length;i++){
              masagelist.add(MasageModle.formjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.indigo,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.lightBlueAccent,
                        child: Image.asset('images/logo.png'),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                        fontFamily: 'pacifico',
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller:controllerl,
                        itemCount: masagelist.length,
                        itemBuilder: (context, index) {
                      return masagelist[index].id==emil?
                      chatbubble(masasg: masagelist[index],)
                          :chatbubbleResv(masasg: masagelist[index]);
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Expanded(
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          masages.add({
                            'masages': data
                          ,'creatat':DateTime.now()
                            ,'id':emil
                          });
                          controller.clear();

                            controllerl.animateTo(

                                0,
                              duration: Duration(seconds:1)
                                ,curve: Curves.easeIn
                            );

                        },
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: 'Enter the message',
                            fillColor: Colors.black12,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffixIcon: IconButton(
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.send,
                                color: Colors.indigo,
                                size: 28,
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ));
        }else return Text('cvbhjmk,');
      },
    );
  }
}
