import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unipay/controllers/Transaction_Controller.dart';
import 'package:unipay/screens/HomeScreen.dart';
import 'package:unipay/screens/InvoicePage.dart';
import 'package:unipay/screens/sendmoney.dart';
import 'package:unipay/screens/transfer.dart';

import '../controllers/Student_Controller.dart';
import '../controllers/dbhelper.dart';
import '../models/transaction.dart';
import '../widgets/numpad.dart';

class Paynum extends StatefulWidget {
  final int receiverId;
  const Paynum({key, required this.receiverId}) : super(key: key);

  @override
  State<Paynum> createState() => _PaynumState();
}

class _PaynumState extends State<Paynum> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _myController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();

  dbhelper db = new dbhelper();
  final StudentController studentController = Get.find<StudentController>();
  final TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  void initState() {
    super.initState();
    _myController.text = 'Rs. ';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 129, 129),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 75),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the items';
                  }
                },
                controller: _itemController,
                decoration: InputDecoration(
                  hintText: 'Enter the items',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Center(
                child: TextField(
                  controller: _myController,
                  textAlign: TextAlign.center,
                  showCursor: false,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  enabled: false,
                ),
              ),
            ),
            NumPad(
              controller: _myController,
              delete: () {
                if (_myController.text.length > 3) {
                  // check if Rs needed any space, change the `3` based on your need
                  _myController.text = _myController.text
                      .substring(0, _myController.text.length - 1);
                }
              },
              onSubmit: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 70),
                      backgroundColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      //if (_key.currentState!.validate()) {
                      var res = await db.payments(
                          _myController.text.trim().toString().substring(4),
                          widget.receiverId.toString(),
                          _itemController.text.trim().toString());
                      if (res.statusCode == 200) {
                        String temp = (int.parse(
                                    studentController.student.value.balance) -
                                int.parse(_myController.text
                                    .trim()
                                    .toString()
                                    .substring(4)))
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

                        _showConfimrationDialog(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InvoicePage(
                                      name:
                                          jsonDecode(res.body)['recieverName'],
                                      acc: jsonDecode(
                                          res.body)['recieverAccount'],
                                      amount: _myController.text,
                                      items: _itemController.text,
                                      dateTime: jsonDecode(res.body)['date'] +
                                          jsonDecode(res.body)['time'],
                                    )));
                      } else {
                        _ErrorConfimrationDialog(context);
                      }

                      //  }
                    },
                    //=> _showConfimrationDialog(context),
                    child: const Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
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
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                "Your amount has been paid succesfully!!",
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

_ErrorConfimrationDialog(BuildContext context) {
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
                    Icons.close_rounded,
                    color: Colors.red,
                  ),

                  //Image.asset('assets/red.png'),
                  //SvgPicture.asset('assets/images/sent_illustration.svg'),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                "Transaction has been failed!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
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
                child: Text("Try Again"),
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
  final String amount;
  final String items;
  final String acc;
  final String dateTime;

  const InvoicePage({
    Key? key,
    required this.name,
    required this.amount,
    required this.items,
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
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen())))),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 500,
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
                          dateTime,
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
                          'Name:',
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
                        SizedBox(
                          height: 20,
                        ),
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
                        Text(
                          'Item(s):',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          items,
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
                              'Total:',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BebasNeue',
                              ),
                            ),
                            Text(
                              amount,
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
