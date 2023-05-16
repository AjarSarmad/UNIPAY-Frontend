import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unipay/screens/HomeScreen.dart';
import 'package:unipay/screens/InvoicePage.dart';

import '../controllers/Student_Controller.dart';
import '../controllers/dbhelper.dart';
import '../models/Invoice.dart';
import 'home.dart';

class MoneyTransferPage extends StatefulWidget {
  final String amount;
  MoneyTransferPage({required this.amount, Key? key}) : super(key: key);

  @override
  _MoneyTransferPageState createState() => _MoneyTransferPageState();
}

class _MoneyTransferPageState extends State<MoneyTransferPage> {
  final invoice obj = new invoice();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  dbhelper db = new dbhelper();
  final StudentController studentController = Get.find<StudentController>();
  String _id = '';
  String _note = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          title: Text("Send Money"),
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
                      "SEND MONEY",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter recievers NU ID';
                              } else if (!RegExp(r'^\d{2}[a-zA-Z]-\d{4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid NU ID (e.g. 19k-1234)';
                              }

                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _id = value;
                              });
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a note';
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  _note = value;
                                });
                              },
                              controller: noteController,
                              maxLines: 5,
                              minLines: 5,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                labelText: "Note",
                                hintText: "Enter note",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10,
                                ),
                              ))
                        ]))
                  ]))))),
      //  SizedBox(height: 30) ,
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
            onTap: () async {
              var res =
                  await db.sendMoney(widget.amount.substring(4), _id, _note);
              if (res.statusCode == 200) {
                String temp = (int.parse(studentController.student.value.balance
                            .toString()) -
                        int.parse(widget.amount.substring(4)))
                    .toString();
                studentController.student.value.setBalance(temp);
                obj.setreceiver(json.decode(res.body)['recieverId']);
                obj.setamount(widget.amount.toString());
                obj.setaccount(json.decode(res.body)['recieverAccount']);
                obj.setname(json.decode(res.body)['recieverName']);
                obj.setnote(json.decode(res.body)['note']);
                obj.setdate(json.decode(res.body)['date']);

                if (_formKey.currentState!.validate()) {
                  _showConfimrationDialog(context);
                }
              } else {
                _ErrorConfimrationDialog(context);
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
                    "Confirm Send",
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
                  width: 200,
                  height: 180,
                  child: FittedBox(
                    child: Icon(Icons.check_circle, color: Colors.green),

                    //Image.asset('assets/red.png'),
                    //SvgPicture.asset('assets/images/sent_illustration.svg'),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  "The amount has been sent successfully!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InvoicePage(
                                name: obj.getname(),
                                amount: widget.amount,
                                acc: obj.getaccount(),
                                receiver: obj.getreceiver(),
                                note: obj.getnote(),
                                dateTime: obj.getdate())));
                  },
                  style: TextButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      primary: Colors.white,
                      backgroundColor: Color(0xFFD44C66),
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)))),
                  child: Text("Ok, Thanks"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
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
  final String acc;
  final String amount;
  final String receiver;
  final String note;
  final String dateTime;

  const InvoicePage({
    Key? key,
    required this.name,
    required this.acc,
    required this.amount,
    required this.receiver,
    required this.note,
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
              height: 550,
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
                  //Heder
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
                          //DateFormat('MMM d, yyyy').format(dateTime),
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
                          height: 10,
                        ),
                        Text(
                          'Acc Number:',
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
                        const SizedBox(height: 10),
                        Text(
                          'Receiver:',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          receiver,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Note:',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          note,
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
