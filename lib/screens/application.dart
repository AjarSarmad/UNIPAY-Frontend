//import 'dart:html';
//import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unipay/screens/HomeScreen.dart';

import 'package:unipay/screens/scholarship.dart';

class Application extends StatefulWidget {
  final String id;
  Application({Key? key, required this.id}) : super(key: key);

  State<Application> createState() => _Application();
}

class _Application extends State<Application> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final idcontroller = TextEditingController();
  final gcontroller = TextEditingController();
  final gncontroller = TextEditingController();
  final deptController = TextEditingController();
  final cgpaController = TextEditingController();
  final semController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Scholarship())),
          ),
          title: Text("Scholarship Application"),
          centerTitle: true,
          backgroundColor: Color(0xFFD44C66)),
      body: SafeArea(
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    SizedBox(height: 20),
                    Text(
                      "ENTER THE DETAILS BELOW",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    Form(
                        key: _formkey,
                        child: Column(children: [
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 20),
                              labelText: "NU ID",
                              hintText: "Enter NU ID of reciever",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                gapPadding: 10,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "Please enter your dept";
                                }
                                return null;
                              }),
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                labelText: "Department",
                                hintText: "Enter Department Name",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10,
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "Please enter your semester";
                                }
                                return null;
                              }),
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                labelText: "Semester",
                                hintText: "Enter Semester",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10,
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "Please enter your CGPA";
                                }
                                return null;
                              }),
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                labelText: "CGPA",
                                hintText: "Enter CGPA",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10,
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "Please enter your guardian's name";
                                }
                                return null;
                              }),
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                labelText: "Guardians Name",
                                hintText: "Enter Guardians Name",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10,
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              validator: ((value) {
                                if (value!.isEmpty) {
                                  return "Please enter your guardian's contact number";
                                }
                                return null;
                              }),
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                labelText: "Guardians contact number",
                                hintText: "Enter Guardians Contact Number",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10,
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Attach required documents:",
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFFD44C66))),
                            //foregroundColor: MaterialStateProperty.all<Color>(Colors.white),),
                            icon: Icon(Icons.add),
                            onPressed: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf', 'doc', 'docx'],
                              );
                              if (result != null) {
                                // File document = File(result.files.first);
                                // do something with the document file
                              }
                            },
                            label: Text('Attach Document'),
                          ),
                        ]))
                  ]))))),
      bottomNavigationBar: Container(
        height: 81,
        width: 375,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(0, -10),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: InkWell(
            onTap: () {
              if (_formkey.currentState!.validate()) {
                _showConfimrationDialog(context);
              }
            },
            child: Container(
              height: 49,
              width: 345,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFD44C66),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 4),
                  Text(
                    "Request For Scholarship",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showConfimrationDialog(BuildContext context) {
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
                  width: 240,
                  height: 180,
                  child: FittedBox(
                    child:
                        SvgPicture.asset('assets/images/sent_illustration.svg'),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  "Your Request for Scholarship has been submitted successfully!\n You'll be notified when you your application will be verified",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                  style: TextButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      primary: Colors.white,
                      backgroundColor: Color(0xFFD44C66),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)))),
                  child: Text("Ok"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
