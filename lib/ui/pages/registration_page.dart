import 'package:flashchat_medium/ui/components/input_text.dart';
import 'package:flashchat_medium/ui/pages/login_page.dart';
import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  static String id = 'registrationpage/';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassNotVisible = true;
  bool isLoading = false;

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
                'REGISTRATION',
                style: TextStyles.mlBold,
              ),
              const SizedBox(
                height: 15,
              ),
              isLoading
                  ? CircularProgressIndicator(
                      strokeWidth: 7,
                      color: Colors.lightBlue[700],
                    )
                  : const SizedBox(
                      height: 15,
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
                        isNotVisible: isPassNotVisible,
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'your password must contain min 6 character';
                          } else {
                            return null;
                          }
                        },
                        suffix: RawMaterialButton(
                          elevation: 3,
                          constraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                          // minWidth: double.minPositive,
                          // height: double.minPositive,
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
                          setState(() {
                            isLoading = true;
                          });
                          if (_formkey.currentState!.validate()) {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: emailController.value.text,
                                    password: passwordController.value.text);

                            print(newUser);
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushNamed(context, LoginPage.id);
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
