import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:unipay/controllers/dbhelper.dart';
import 'package:unipay/models/student.dart';
import 'package:unipay/screens/HomeScreen.dart';
import 'package:unipay/screens/login.dart';
import 'otp.dart';
import 'signup.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  Student student = new Student();
  dbhelper db = new dbhelper();
  final TextEditingController nu_id = new TextEditingController();
  final TextEditingController firstName = new TextEditingController();
  final TextEditingController lastName = new TextEditingController();
  final TextEditingController contact = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController guardianFullName = new TextEditingController();
  final TextEditingController guardianContact = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  final TextEditingController accountNo = new TextEditingController();
  final TextEditingController balance = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()))),
        centerTitle: true,
        title: Text('SIGNUP'),
        backgroundColor: Color(0xFFD44C66),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "REGISTER ACCOUNT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                        controller: firstName,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "First",
                            hintText: "Enter your First name",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                        controller: lastName,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Last Name",
                            hintText: "Enter your last name",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your nu id';
                          }
                          return null;
                        },
                        controller: nu_id,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "NU ID",
                            hintText: "Enter your 20k-xxxx ID",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your nu email';
                          }
                          return null;
                        },
                        controller: email,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "NU EMAIL",
                            hintText: "Enter your NU email",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        controller: password,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Password",
                            hintText: "Enter your password",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your contact number';
                          }
                          return null;
                        },
                        controller: contact,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Phone number",
                            hintText: "Enter your contact number",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your guardian name';
                          }
                          return null;
                        },
                        controller: guardianFullName,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Guardian Name",
                            hintText: "Enter your guardian full name",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your guardian contact';
                          }
                          return null;
                        },
                        controller: guardianContact,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Guardian contact",
                            hintText: "Enter your guardians contact number",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                        controller: address,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Address",
                            hintText: "Enter your address",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your jazz cash acc number';
                          }
                          return null;
                        },
                        controller: accountNo,
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "JazzCash Acc Number",
                            hintText: "Enter your JazzCash Acc Number",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10)),
                      )
                    ],
                  )),
                  SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      //if (_formKey.currentState!.validate()){
                      student.setFirstName(firstName.text.trim());
                      student.setLastName(lastName.text.trim());
                      student.setNu_id(nu_id.text.trim());
                      student.setEmail(email.text.trim());
                      student.setPassword(password.text.trim());
                      student.setContact(contact.text.trim());
                      student.setGuardianFullName(guardianFullName.text.trim());
                      student.setGuardianContact(guardianContact.text.trim());
                      student.setAddress(address.text.trim());
                      student.setAccountNo(accountNo.text.trim());

                      Future s = db.postStudent(student);
                      s.then((value) => {
                            if (value.statusCode == 201)
                              {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()))
                              }
                          });
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
                  SizedBox(height: 30),
                  Text(
                    "By continuing your confirm that you agree \nwith our Term and Condition",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption,
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
