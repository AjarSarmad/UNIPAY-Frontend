import 'package:flutter/material.dart';
import 'package:unipay/screens/signup.dart';

import 'login.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  final _formKey = GlobalKey<FormState>();
  final _eController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignInScreen()))),
        centerTitle: true,
        backgroundColor: Color(0xFFD44C66),
        title: Text("Forgot Password"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please enter your email and we will send \nyou a link to return to your account",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _eController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Email",
                            hintText: "Enter your email",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      ),
                      SizedBox(height: 100),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        style: TextButton.styleFrom(
                            minimumSize: const Size(200, 50),
                            primary: Colors.white,
                            backgroundColor: Color(0xFFD44C66),
                            shape: const BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)))),
                        child: Text("CONTINUE"),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don’t have an account? ",
                              style: TextStyle(fontSize: 15),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen())),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Color(0xFFD44C66), fontSize: 15),
                              ),
                            ),
                          ]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
