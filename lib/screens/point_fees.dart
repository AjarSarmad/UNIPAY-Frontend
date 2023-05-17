import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unipay/screens/payments.dart';

import '../controllers/Student_Controller.dart';
import '../controllers/Transaction_Controller.dart';
import '../controllers/dbhelper.dart';
import '../models/transaction.dart';
import 'HomeScreen.dart';

class Pointfees extends StatefulWidget {
  const Pointfees({key}) : super(key: key);

  @override
  State<Pointfees> createState() => _Pointfees();
}

class _Pointfees extends State<Pointfees> {
  final _formKey = GlobalKey<FormState>();
  final _routenoController = TextEditingController();
  final _nuidController = TextEditingController();
  int _totalFees = 21500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFD44C66),
          title: Text(
            "Point Fees",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Payments())),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Pay Point Fee",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 50),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _nuidController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Nu ID",
                            hintText: "Enter NU ID",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              gapPadding: 10,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter NU ID';
                            } else if (!RegExp(r'^\d{2}[a-zA-Z]-\d{4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid NU ID (e.g. 19k-1234)';
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _routenoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Point Route number",
                            hintText: "Enter your point no (1-10) ",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              gapPadding: 10,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your route #';
                            }
                            final intValue = int.tryParse(value);
                            if (intValue == null ||
                                intValue <= 0 && intValue >= 10) {
                              return 'Please enter valid point route number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 32.0),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              primary: Colors.white,
                              backgroundColor: Color(0xFFD44C66),
                              shape: const BeveledRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)))),
                          child: Text('Next'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _showConfimrationDialog(context, _totalFees,
                                  _routenoController.text.toString());
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

_showConfimrationDialog(BuildContext context, int fee, String routeno) {
  dbhelper db = new dbhelper();
  final StudentController studentController = Get.find<StudentController>();
  final TransactionController transactionController =
      Get.find<TransactionController>();
  String driverName = "Hassan Ali Khan";
  String driverContact = '0300-2798725';
  String Route = "Gulshan To FAST";
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
                width: 200,
                height: 180,
                child: FittedBox(
                  child: Icon(
                    Icons.bus_alert,
                  ),

                  //Image.asset('assets/red.png'),
                  //SvgPicture.asset('assets/images/sent_illustration.svg'),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Driver Name= $driverName",
              ),
              Text(
                "Driver Contact= $driverContact",
              ),
              Text(
                "Route= $Route",
              ),
              const SizedBox(height: 10),
              Text(
                "Your total Point fee is $fee",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () async {
                  String note = "Point Fees paid for Route no. $routeno";
                  var res = await db.payments(fee.toString(), '4', note);
                  if (res.statusCode == 200) {
                    String temp =
                        (int.parse(studentController.student.value.balance) -
                                fee)
                            .toString();
                    studentController.student.value.setBalance(temp);

                    transactionController.debitTransactions.insert(
                        0,
                        Transaction(
                            json.decode(res.body)['id'].toString(),
                            json.decode(res.body)['amount'].toString(),
                            json.decode(res.body)['senderName'],
                            json.decode(res.body)['recieverName'],
                            json.decode(res.body)['senderId'],
                            json.decode(res.body)['recieverId'],
                            json.decode(res.body)['senderAccount'],
                            json.decode(res.body)['recieverAccount'],
                            json.decode(res.body)['date'],
                            json.decode(res.body)['time'],
                            json.decode(res.body)['note'],
                            json.decode(res.body)['type']));

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InvoicePage(
                                name: studentController.student.value.firstName
                                        .toString() +
                                    " " +
                                    studentController.student.value.lastName
                                        .toString(),
                                amount: fee,
                                acc: studentController.student.value.accountNo
                                    .toString(),
                                dateTime: DateTime.now())));
                  }
                  ;
                },
                style: TextButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    primary: Colors.white,
                    backgroundColor: Color(0xFFD44C66),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
                child: Text("PAY"),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class InvoicePage extends StatelessWidget {
  final String name;
  final int amount;
  final String acc;

  final DateTime dateTime;

  const InvoicePage({
    Key? key,
    required this.name,
    required this.amount,
    required this.acc,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen())),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Header
                  Container(
                    height: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      color: const Color.fromARGB(255, 255, 129, 129),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'INVOICE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        Text(
                          DateFormat('MMM d, yyyy').format(dateTime),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  //Details
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Student Name:',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Acc number:',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          acc,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fee:',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BebasNeue',
                              ),
                            ),
                            Text(
                              amount.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BebasNeue',
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: SizedBox(
                              width: 100,
                              height: 100,
                              child: FittedBox(
                                child: Icon(
                                  Icons.check_circle,
                                  color:
                                      const Color.fromARGB(255, 255, 129, 129),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
