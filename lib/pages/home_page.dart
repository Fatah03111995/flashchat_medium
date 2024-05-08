import 'package:flashchat_medium/constants/textstyles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                const Image(
                  image: AssetImage('images/logo.png'),
                  height: 60,
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
                onPressed: () {},
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
                onPressed: () {},
                minWidth: 200,
                height: 50,
                child: Text(
                  'Register',
                  style: TextStyles.button,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
