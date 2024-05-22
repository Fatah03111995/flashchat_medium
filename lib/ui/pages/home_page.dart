import 'package:flashchat_medium/ui/pages/login_page.dart';
import 'package:flashchat_medium/ui/pages/registration_page.dart';
import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String id = 'homepage/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double value = 0;
  late double ticker;

  @override
  void initState() {
    super.initState();
    AnimationController controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    Animation animation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(value),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                children: [
                  const Hero(
                    tag: 'logo',
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      height: 60,
                    ),
                  ),
                  Text(
                    'Flash Chat',
                    style: TextStyles.lBold,
                  )
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: MaterialButton(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                  minWidth: 200,
                  height: 50,
                  child: Text(
                    'Log In',
                    style: TextStyles.button,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: MaterialButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationPage.id);
                  },
                  minWidth: 200,
                  height: 50,
                  child: Text(
                    'Register',
                    style: TextStyles.button,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (controller != null) controller!.dispose();
  }
}
