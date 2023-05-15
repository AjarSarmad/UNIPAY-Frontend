import 'package:flutter/material.dart';
import 'package:unipay/screens/payments.dart';

import '../component/balance_card.dart';
import 'transfer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  Widget _appBar() {
    return Row(
      children: <Widget>[
        // Text("Hello *Ahmed*")
        // style: GoogleFonts.mulish(
        //     fontSize: 18,
        //     fontWeight: FontWeight.w600,
        //     color: LightColor.navyBlue2)

        Expanded(
          child: SizedBox(),
        )
      ],
    );
  }

  Widget _operationsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // _icon(Icons.transfer_within_a_station, "Transfer", MoneyTransferPage()),
        _icon(Icons.payment, "Payments", Payments()),
        _icon(Icons.school, "Scholarships", Payments()),
        _icon(Icons.attach_money, "Loan", Payments()),
      ],
    );
  }

  Widget _icon(IconData icon, String text, Widget route) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => route)),
          child: Container(
            height: 80,
            width: 80,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.short_text,
                      size: 26.0,
                    )))
          ],
          centerTitle: true,
          title: Text(
            "ＵＮＩＰＡＹ",
            style: TextStyle(fontSize: 28),
          ),
          backgroundColor: Color(0xFFD44C66),
        ),
        // bottomNavigationBar: BottomNavigation(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 35),
                  _appBar(),
                  BalanceCard(),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Operations",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _operationsWidget(),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Transactions",
                  ),
                  _transectionList(),
                ],
              )),
        )));
  }
}
