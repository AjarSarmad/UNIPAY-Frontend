import 'package:unipay/controllers/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:unipay/screens/Admin/Admin_Home.dart';

import '../login.dart';

class AdminLogin extends StatelessWidget {
  dbhelper db = new dbhelper();
  static String routeName = "/sign_in";
  static late String result;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()))),
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
                            "ADMIN LOGIN",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
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
                                      return 'Please enter admin email';
                                    }

                                    if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
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
                                          borderRadius:
                                              BorderRadius.circular(28),
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
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          gapPadding: 10)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              // Future s = db.AccountVerification(
                              //     emailController.text.trim(),
                              //     passwordController.text.trim());
                              // s.then((value) => {
                              //       if (value.statusCode == 200)
                              //         {
                              // if (_key.currentState!.validate()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminHome()));
                              //}
                            },
                            style: TextButton.styleFrom(
                                minimumSize: const Size(200, 50),
                                primary: Colors.white,
                                backgroundColor: Color(0xFFD44C66),
                                shape: const BeveledRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)))),
                            child: Text("ＬＯＧＩＮ"),
                          ),
                        ]))))));
  }
}
