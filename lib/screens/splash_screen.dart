import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFD44C66),
        child: Image(
          image: AssetImage('assets/UNIPAY.jpg'),
        ));
  }
}

// class SplashScreen extends StatelessWidget {
//   late BuildContext context;

//   SplashScreen({super.key});
//   void initState() {
//     initState();
//     navigatetohome();
//   }

//   navigatetohome() async {
//     await Future.delayed(const Duration(milliseconds: 1500), () {});

//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => Home()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: Color.fromARGB(0, 35, 55, 73),
//       body: Center(
//           child: Image(
//         image: AssetImage('assets/UNIPAY.png'),
//       )),
//     );
//   }
// }
