import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unipay/screens/HomeScreen.dart';
import 'package:unipay/screens/send.dart';
import 'package:getwidget/getwidget.dart';
import 'package:unipay/screens/transfer.dart';

import 'home.dart';

class SendMoney2 extends StatefulWidget {
  SendMoney2({Key? key}) : super(key: key);

  @override
  _SendMoney2 createState() => _SendMoney2();
}

class _SendMoney2 extends State<SendMoney2> {
  @override
  String? value;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFD44C66),
        title: Text(
          "Send Money",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SendMoney()))),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 129, 129),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      )
                    ]),
                child: GFListTile(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen())),
                    title: Text(
                      "New Transfer",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    icon: Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Quick Transfer",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [_transectionList()],
                  )))
        ],
      )),
    );
  }
}

Widget _transectionList() {
  return Column(
    children: <Widget>[
      _transaction("Ahmed", "23 Dec 2022"),
      _transaction("Cafe", "25 Dec 2022"),
      _transaction("Uni Fees", "03 Sep 2022"),
      _transaction("Uni Fees", "03 Sep 2022"),
    ],
  );
}

Widget _transaction(String text, String time) {
  return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          //color: LightColor.navyBlue1,
          borderRadius: BorderRadius.only(topLeft: Radius.zero),
        ),
        child: Icon(
          Icons.hd,
          color: Colors.white,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(),
      title: Text(
        "Transaction1",
      ),
      subtitle: Text(time),
      trailing: Container(
        height: 30,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //color: LightColor.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        // child: Text(
        //   'Amount',
        //   style: GoogleFonts.mulish(
        //        fontSize: 12,
        //        fontWeight: FontWeight.bold,
        //        color: LightColor.navyBlue2))
        // )),
      ));
}
