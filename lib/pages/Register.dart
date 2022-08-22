import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:chat_app/helper/Show_Snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import 'chat_page.dart';

class Register extends StatefulWidget {
  static String id = "register";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? emile, password;
  bool islode = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: islode,
      child: Scaffold(
        backgroundColor: kprimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.lightBlueAccent,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'pacifico'),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Custom_TextFormfield(
                  onChanged: (data) {
                    emile = data;
                  },
                  hint_Text: 'EMAIL',
                ),
                SizedBox(
                  height: 15,
                ),
                Custom_TextFormfield(
                  onChanged: (data) {
                    password = data;
                  },
                  hint_Text: 'PASSWORD',
                ),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  ontap: () async {
                    if (formKey.currentState!.validate()) {
                      islode = true;
                      setState(() {});
                      try {
                        await registerUser();
                        Navigator.pushNamed(context, Chat.id ,arguments: emile);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          masag(context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          masag(context,
                              'The account already exists for that email.');
                        }
                      } catch (e) {
                        masag(context, e.toString());
                      }
                      islode = false;
                      setState(() {});
                    }
                  },
                  name: 'Register',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 20,
                          ),
                        )),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emile!, password: password!);
  }
}
