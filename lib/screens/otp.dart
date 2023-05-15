import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unipay/screens/HomeScreen.dart';
import 'package:unipay/screens/home.dart';
import 'package:unipay/screens/login.dart';

import '../controllers/dbhelper.dart';
import 'comp_profile.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  dbhelper db = new dbhelper();
  final TextEditingController pin1 = new TextEditingController();
  final TextEditingController pin2 = new TextEditingController();
  final TextEditingController pin3 = new TextEditingController();
  final TextEditingController pin4 = new TextEditingController();
  final TextEditingController pin5 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()))),

          // () => Navigator.pushReplacement(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => CompleteProfileScreen()))),

          centerTitle: true,
          backgroundColor: Color(0xFFD44C66),
          title: Text("OTP Verification"),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "OTP Verification",
                  ),
                  Text("We sent your code to 000 000 ***"),
                  //Timer(),
                  Form(
                    child: Column(
                      children: [
                        SizedBox(height: 200),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 40,
                              child: TextFormField(
                                controller: pin1,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                autofocus: true,
                                obscureText: true,
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: TextFormField(
                                controller: pin2,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                autofocus: true,
                                obscureText: true,
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: TextFormField(
                                controller: pin3,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                autofocus: true,
                                obscureText: true,
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: TextFormField(
                                controller: pin4,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                autofocus: true,
                                obscureText: true,
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: TextFormField(
                                controller: pin5,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                onSaved: (pin1) {},
                                autofocus: true,
                                obscureText: true,
                                style: Theme.of(context).textTheme.headline6,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60),
                        TextButton(
                          onPressed: () {
                            // Future s = db.postOtp(pin1.text.trim() +
                            //     pin2.text.trim() +
                            //     pin3.text.trim() +
                            //     pin4.text.trim() +
                            //     pin5.text.trim());
                            // s.then((value) => {
                            //       if (value.statusCode == 200)
                            //         {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          //  }

                          style: TextButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              primary: Colors.white,
                              backgroundColor: Color(0xFFD44C66),
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)))),
                          child: Text("CONTINUE"),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      // OTP code resend
                    },
                    child: Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
