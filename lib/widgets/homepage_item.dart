import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unipay/models/transaction.dart';
import 'package:unipay/screens/loan.dart';
import 'package:unipay/screens/payments.dart';
import 'package:unipay/screens/scholarship.dart';
import 'package:unipay/screens/send.dart';

import '../controllers/Student_Controller.dart';
import '../screens/paymentoptions.dart';
import 'date_total.dart';
import 'display_cards.dart';
import 'transaction_item.dart';

class HomePageItem extends StatefulWidget {
  const HomePageItem({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
  final studentController = Get.find<StudentController>();
  @override
  Widget build(BuildContext context) {
    Widget _icon(IconData icon, String text, Widget route) {
      return Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => route)),
            child: Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xfff3f3f3),
                        offset: Offset(5, 5),
                        blurRadius: 10)
                  ]),
              child: Icon(icon),
            ),
          ),
          Text(
            text,
            //style: GoogleFonts.mulish(
            // textStyle: Theme.of(context).textTheme.headline4,
            // fontSize: 15,
            // fontWeight: FontWeight.w600,
            // color: Color(0xff76797e))
          ),
        ],
      );
    }

    Widget _operationsWidget() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _icon(Icons.transfer_within_a_station, "Transfer", SendMoney()),
          _icon(Icons.payment, "Payments", Payments()),
          _icon(Icons.school, "Scholarships", Scholarship()),
          _icon(Icons.attach_money, "Loan", Loan()),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 30),
        const DisplayCards(),
        const SizedBox(height: 10),
        _operationsWidget(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20),
          child: Text(
            "Transactions",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              children: [_transectionList()],

              // TransactionItem(
              //   url: 'assets/logos/mr.png',
              //   text: 'RIDA MALIK',
              //   time: '12:30 PM',
              //   price: 1350,
              //   pmflag: true,
              //   option: 'rec',
              //   transaction: Transaction()
              // ),
              // DateTotal(date: 'Jan 9', tprice: 3190, p: true),
              // TransactionItem(
              //   url: 'assets/logos/tc.png',
              //   text: 'Kfc Rawalpindi Pak',
              //   time: '12:30 PM',
              //   price: 1530,
              //   pmflag: false,
              //   option: 'com',
              // ),
              // TransactionItem(
              //   url: 'assets/logos/tc.png',
              //   text: 'Rev- Kfc Rawalpindi',
              //   time: '12:28 PM',
              //   price: 1530,
              //   pmflag: true,
              //   option: 'com',
              // ),
              // TransactionItem(
              //   url: 'assets/logos/tc.png',
              //   text: 'Kfc Rawalpindi Pak',
              //   time: '12:30 PM',
              //   price: 1530,
              //   pmflag: false,
              //   option: 'com',
              // ),
              // TransactionItem(
              //   url: 'assets/logos/ms.png',
              //   text: 'FIAZ AHMED',
              //   time: '12:30 AM',
              //   price: 2460,
              //   pmflag: false,
              //   option: 'send',
              // ),
              // TransactionItem(
              //   url: 'assets/logos/mr.png',
              //   text: 'Danyaal Mahmood',
              //   time: '12:26 AM',
              //   price: 800,
              //   pmflag: true,
              //   option: 'rec',
              // ),
            ))
      ]),
    );
  }
}

Widget _transectionList() {
  return Column(
    children: <Widget>[
      _transaction("Ahmed", "23 Dec 2022"),
      _transaction("Cafe", "25 Dec 2022"),
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
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Icon(Icons.hd, color: Colors.white),
      ),
      contentPadding: EdgeInsets.symmetric(),
      title: Text(
        "Ahmed Ali",
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
