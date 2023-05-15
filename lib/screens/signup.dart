import 'package:flutter/material.dart';

import 'comp_profile.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/sign_up";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nuIdController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()))),
          centerTitle: true,
          title: Text("SIGN UP"),
          backgroundColor: Color(0xFFD44C66),
        ),
        body: SafeArea(
            child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 40), // 4%
                Text(
                  "REGISTER ACCOUNT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Enter your details ",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your NU ID';
                          } else if (!RegExp(r'^\d{2}[a-zA-Z]-\d{4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid NU ID (e.g. 19k-1234)';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 42, vertical: 20),
                          labelText: "NU ID",
                          hintText: "Enter your NU ID",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
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
                            gapPadding: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 42, vertical: 20),
                          labelText: "Password",
                          hintText: "Enter your password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please re-enter your password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 42, vertical: 20),
                          labelText: "Confirm Password",
                          hintText: "Re-enter your password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextButton(
                        onPressed: () {
                          //if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CompleteProfileScreen()));
                          // }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          primary: Colors.white,
                          backgroundColor: Color(0xFFD44C66),
                          shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                        ),
                        child: Text("CONTINUE"),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        )));
  }
}
