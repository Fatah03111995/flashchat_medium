import 'package:flashchat_medium/ui/components/input_text.dart';
import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/logo.png'),
                height: 200,
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                key: _formkey,
                children: [
                  InputText(
                    icon: Icons.email_outlined,
                    controller: emailController,
                    label: 'e mail',
                    hint: 'input your e-mail',
                  ),
                  InputText(
                    icon: Icons.lock_outline_rounded,
                    controller: emailController,
                    label: 'password',
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
