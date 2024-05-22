// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchat_medium/ui/components/input_text.dart';
import 'package:flashchat_medium/ui/pages/chat_page.dart';
import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = 'loginpage/';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassNotVisible = true;

  void showSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  void getCurrentUser() {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Navigator.pushNamed(context, ChatPage.id);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Hero(
                tag: 'logo',
                child: Image(
                  image: AssetImage('images/logo.png'),
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'LOGIN',
                style: TextStyles.mlBold,
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      InputText(
                        icon: Icons.email_outlined,
                        controller: emailController,
                        label: 'e mail',
                        hint: 'input your e-mail',
                        validator: InputText.validatorIsRequired,
                      ),
                      InputText(
                        icon: Icons.lock_outline_rounded,
                        controller: passwordController,
                        label: 'password',
                        hint: 'input your password',
                        validator: InputText.validatorIsRequired,
                        isNotVisible: isPassNotVisible,
                        suffix: RawMaterialButton(
                          elevation: 3,
                          constraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                          padding: const EdgeInsets.all(5),
                          shape: const CircleBorder(),
                          onPressed: () => setState(() {
                            isPassNotVisible = !isPassNotVisible;
                          }),
                          child: isPassNotVisible
                              ? const Icon(Icons.disabled_visible)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                      const SizedBox(height: 40),
                      RawMaterialButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        fillColor: Colors.blue,
                        splashColor: Colors.lightBlue,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.value.text,
                                      password: passwordController.value.text);
                              print(credential);
                              Navigator.pushNamed(context, ChatPage.id);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackBar('user not found');
                                print('no user found');
                              } else if (e.code == 'wrong-password') {
                                showSnackBar('Wrong Password');
                                print('wrong pass');
                              } else {
                                showSnackBar('Something Wrong');
                                print(e);
                              }
                            } catch (e) {
                              showSnackBar('Error');
                              print(e);
                            }
                          }
                        },
                        child: Text(
                          'Submit',
                          style: TextStyles.m,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
