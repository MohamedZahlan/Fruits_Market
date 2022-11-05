import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../login/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor('#FCFCFC'),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                      child: Image(
                          image: AssetImage(
                              'assets/Images/icons8-carrot-48.png'))),
                  const SizedBox(
                    height: 110,
                  ),
                  Text(
                    "Sign Up",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: HexColor('#181725'), fontSize: 30),
                  ),
                  Text(
                    "Enter your credentials to continue",
                    style: TextStyle(color: HexColor('#7C7C7C'), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Username",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: "Email",
                        suffixIcon: Icon(Icons.check)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Password",
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "By continuing you agree to our ",
                        style:
                            TextStyle(color: HexColor('#7C7C7C'), fontSize: 13),
                      ),
                      Text(
                        "Terms of service ",
                        style:
                            TextStyle(color: HexColor('#53B175'), fontSize: 13),
                      ),
                      Text(
                        "and ",
                        style:
                            TextStyle(color: HexColor('#7C7C7C'), fontSize: 13),
                      ),
                    ],
                  ),
                  Text(
                    "Privacy policy",
                    style: TextStyle(color: HexColor('#53B175'), fontSize: 13),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: HexColor('#53B175'),
                        borderRadius: BorderRadius.circular(15)),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 16,
                          color: HexColor('#FFF9FF'),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: HexColor('#181725')),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenTask(),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          "Log In ",
                          style: TextStyle(color: HexColor('#53B175')),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
