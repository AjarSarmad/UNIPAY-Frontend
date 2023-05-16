import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unipay/screens/deposit.dart';
import 'package:unipay/screens/sendmoney.dart';

import '../controllers/Student_Controller.dart';
import '../screens/send.dart';
import '../screens/transfer.dart';

class DisplayCards extends StatefulWidget {
  const DisplayCards({Key? key}) : super(key: key);
  @override
  _DisplayCardsState createState() => _DisplayCardsState();
}

class _DisplayCardsState extends State<DisplayCards> {
  final StudentController studentController = Get.find<StudentController>();
  // @override
  // void initState() {
  //   super.initState();
  //   fetchBalance();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          InkWell(
            child: Container(
              height: 260,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 0, 255, 204),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 17, left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Current Balance',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Rs. ${studentController.student.value.balance.toString()}',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Deposit(),
                    ),
                  );
                },
                child: Container(
                  height: 125,
                  width: 152.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 0, 174, 255),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.arrow_downward,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      SingleChildScrollView(
                          child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Deposit Money',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendMoney(),
                    ),
                  );
                },
                child: Container(
                  height: 125,
                  width: 152.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 255, 129, 129),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Transform.rotate(
                            angle: 44.75, //set the angle
                            child: const Icon(
                              Icons.arrow_upward,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Send Money',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
