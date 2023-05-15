import 'package:flutter/material.dart';
import 'package:unipay/screens/deposit.dart';
import 'package:unipay/screens/payments.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            "Current Balance\n\n Rs 10000",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          //padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          width: 200,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              new BoxShadow(
                color: Color(0xFFD44C66),
                //offset: new Offset(6.0, 6.0),
                offset: const Offset(0, -10),
              ),
            ],
          ),
        ),
        Column(
          children: [
            InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "+",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  //padding: EdgeInsets.all(20.0),
                  //margin: EdgeInsets.fromLTRB(10, 20, 30, 20),
                  width: 120,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        color: Color(0xFFD44C66),
                        offset: new Offset(6.0, 6.0),
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Deposit()))),
            SizedBox(height: 10),
            InkWell(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "-",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),

                  //padding: EdgeInsets.all(30),
                  //margin: EdgeInsets.fromLTRB(10, 20, 30, 20),
                  width: 120,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        color: Color(0xFFD44C66),
                        offset: new Offset(6.0, 6.0),
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Payments()))),
          ],
        ),

        //  Container()
      ],
    ));
  }
}
