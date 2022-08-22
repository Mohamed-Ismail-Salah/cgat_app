import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:chat_app/helper/Show_Snackbar.dart';
import 'package:chat_app/pages/Register.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';

class Login extends StatefulWidget {
  static String id = 'login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? emile;
  String? password;
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
                    'LOGIN',
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
                  scure: true,
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
                        await loginUser();

                        Navigator.pushNamed(context, Chat.id ,arguments: emile);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          masag(context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          masag(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        masag(context, e.toString());
                      }
                      islode = false;
                      setState(() {});
                    }
                  },
                  name: 'Login',
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'dont have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Register.id);
                        },
                        child: Text(
                          'Register',
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

  Future<void> loginUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emile!, password: password!);
  }
}
