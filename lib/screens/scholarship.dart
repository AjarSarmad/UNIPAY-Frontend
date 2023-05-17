//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unipay/screens/application.dart';

import 'HomeScreen.dart';

class ScholarshipID extends StatelessWidget {
  final String id;

  ScholarshipID(this.id);

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

List<String> ids = ["1", "2", "3", "4", "5"];

class Scholarship extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String t1 = "Merit Scholarship for Bachelor Students";
    String d1 =
        "Merit scholarship is awarded to the Top THREE position holders in each Group of each Examination Board. Scholarship is also offered to top three position holders in the merit list of NU admission merit list. This scholarship is for four years of un-interrupted studies with full course load and is equal to the full tuition fee. Continuation of merit scholarship is subject to maintaining semester GPA of 3.0 or higher.";
    String t2 = "Sindh Government Endowment Board Scholarships";
    String d2 =
        "The Sindh Government offers scholarships to students of Karachi campus on need-cum-merit for both under-graduate and graduate studies. The scholarship covers full tuition fee for entire duration of the program, renewable every year. The quota for students from rural sector is 60%, and the remaining 40% is for the students from urban sector. About 25 new scholarships are offered every year under this scheme.";
    String t3 = "OSAF Financial Assistance (Study Loan)";
    String d3 =
        "OSAF (Old Students Association of FAST) arranges financial assistance for those students who cannot afford to pay their full fee.";
    String t4 = "Other Scholarships";
    String d4 =
        "In addition to the above scholarships there are various community based scholarships offered by various committees and foundations such as, Memon Community Scholarships, Bohra Community Scholarships, INFAQ Foundation scholarships, Agha Khan Foundation Scholarships, etc. For Karachi campus, Alumni Association, Hindu Community, and Agha Khan Foundation also provides scholarships in limited numbers.";
    String t5 = "Study Loan";
    String d5 =
        "Realizing that the fees may not be affordable for some of its students, FAST arranges financial assistance in the form of interest-free study loans for bright indigent students. This assistance is subject to renewal every semester in light of the student’s academic performance. Financial assistance is limited to tuition fee only and is discontinued if the student’s CGPA falls below the minimum specified to avoid warning. Loan recipients MUST take full load of courses offered.";
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
        body: SingleChildScrollView(
            child: Column(
          children: [
            Scard(
              title: t1,
              desc: d1,
              nav: Application(
                id: ids[0],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Scard(
              title: t2,
              desc: d2,
              nav: Application(
                id: ids[1],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Scard(title: t3, desc: d3, nav: Application(id: ids[2])),
            SizedBox(
              height: 10,
            ),
            Scard(title: t4, desc: d4, nav: Application(id: ids[3])),
            SizedBox(
              height: 10,
            ),
            Scard(title: t5, desc: d5, nav: Application(id: ids[4]))
          ],
        )));
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
