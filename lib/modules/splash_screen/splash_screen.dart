import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const OnBoardingScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#53B175'),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.carrot,
              size: 50,
              color: HexColor('#FFFFFF'),
            ),
            const SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 80,
                    child: Text(
                      'nectar',
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 60, color: HexColor('#FFFFFF')),
                    ),
                  ),
                  Text(
                    'O n l i n e  g r o c e r i e t ',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14, color: HexColor('#FFFFFF')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
