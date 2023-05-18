//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unipay/screens/application.dart';

import '../controllers/ScholarshipController.dart';
import 'HomeScreen.dart';

class ScholarshipID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

final ScholarshipController scholarshipController =
    Get.find<ScholarshipController>();

class Scholarship extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ImageProvider a1 = ImageProvider.asset('assets/hi.png');
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen())),
            ),
            title: Text("Scholarships"),
            centerTitle: true,
            backgroundColor: Color(0xFFD44C66)),
        body: ListView.builder(
            itemCount: scholarshipController.scholarship.length,
            itemBuilder: (context, index) {
              return Scard(
                  title: scholarshipController.scholarship[index].name,
                  desc: scholarshipController.scholarship[index].description,
                  nav: Application(
                      id: scholarshipController.scholarship[index].id));
            }));
  }
}

class Scard extends StatelessWidget {
  const Scard({
    Key? key,
    required this.title,
    required this.desc,
    required this.nav,
    //  required this.image
  }) : super(key: key);
  final String title, desc;
  //final ImageProvider image;
  final Widget nav;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => nav)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 6.0, 0.0, 0.0),
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, 1.0),
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      desc,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    )
                  ],
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
