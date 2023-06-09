import 'package:unipay/controllers/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:unipay/screens/Admin/admin_login.dart';
import 'package:unipay/screens/comp_profile.dart';
import 'package:unipay/screens/signup.dart';
import 'forget_password.dart';
import 'otp.dart';

class SignInScreen extends StatelessWidget {
  dbhelper db = new dbhelper();
  static String routeName = "/sign_in";
  static late String result;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  // final studentController = Get.put(StudentController());

  // late final emailController = TextEditingController();
  // late final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ＬＯＧＩＮ"),
        backgroundColor: Color(0xFFD44C66),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(height: 80),
                  const Text(
                    "ＷＥＬＣＯＭＥ ＢＡＣＫ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password ",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            //if(){return 'No such email exists. Kindly enter a valid email '}
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 20),
                              labelText: "Email",
                              hintText: "Enter your email",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10)),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: passcontroller,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }

                            if (value.trim().length < 8) {
                              return 'Password must be at least 8 characters in length';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 20),
                              labelText: "Password",
                              hintText: "Enter your password",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen())),
                        child: Text(
                          "Forgot Password",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () async {
                      Future s = db.AccountVerification(
                          emailcontroller.text.trim(),
                          passcontroller.text.trim());
                      s.then((value) {
                        if (value.statusCode == 200) {
                          if (_key.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OtpScreen()),
                            );
                          }
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      primary: Colors.white,
                      backgroundColor: Color(0xFFD44C66),
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                    ),
                    child: Text("ＬＯＧＩＮ"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompleteProfileScreen())),
                      child: Text(
                        "Sign Up",
                        style:
                            TextStyle(color: Color(0xFFD44C66), fontSize: 15),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminLogin())),
                        child: Text(
                          "Admin Login",
                          style:
                              TextStyle(color: Color(0xFFD44C66), fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 430,
        width: 327,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: [
              const SizedBox(height: 40),
              SizedBox(
                width: 180,
                height: 180,
                child: FittedBox(
                  child: Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                "No such email exists. Kindly enter a valid email",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen())),
                style: TextButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    primary: Colors.white,
                    backgroundColor: Color(0xFFD44C66),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
                child: Text("Ok, Thanks"),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
