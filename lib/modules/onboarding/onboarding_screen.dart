import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../login/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const SizedBox(
                height: double.infinity,
                width: 400,
                child: Image(
                  image: AssetImage(
                    'assets/Images/shop_task_onboard2.jpg',
                  ),
                  fit: BoxFit.cover,
                  alignment: AlignmentDirectional.center,
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  FaIcon(
                    FontAwesomeIcons.carrot,
                    size: 50,
                    color: HexColor('#FFFFFF'),
                  ),
                  SizedBox(
                    height: 55,
                    child: Text(
                      'Welcome ',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 40, color: HexColor('#FFFFFF')),
                    ),
                  ),
                  Text(
                    'to our store',
                    style: TextStyle(fontSize: 40, color: HexColor('#FFFFFF')),
                  ),
                  Text(
                    'Get your groceries in as fast as one hour ',
                    style: TextStyle(fontSize: 15, color: HexColor('#FCFCFC')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: HexColor('#53B175'),
                        borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreenTask(),
                            ),
                            (route) => false);
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: HexColor('#FFF9FF'),
                        ),
                      ),
                    ),
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
