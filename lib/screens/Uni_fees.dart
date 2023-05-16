import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unipay/screens/payments.dart';

import 'HomeScreen.dart';

class Unifees extends StatefulWidget {
  const Unifees({key}) : super(key: key);

  @override
  State<Unifees> createState() => _Unifees();
}

class _Unifees extends State<Unifees> {
  final _formKey = GlobalKey<FormState>();
  final _coursesController = TextEditingController();
  final _creditHoursController = TextEditingController();
  int _totalFees = 0;

  void _calculateFees() {
    final numCourses = int.tryParse(_coursesController.text) ?? 0;
    final numCreditHours = int.tryParse(_creditHoursController.text) ?? 0;
    setState(() {
      _totalFees = numCourses * numCreditHours * 8500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFFD44C66),
          title: Text(
            "University Fees",
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
                    "Calculate University fee",
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
                          controller: _coursesController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Number Of Courses",
                            hintText:
                                "Enter number of courses you have registered",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              gapPadding: 10,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the number of courses';
                            }
                            final intValue = int.tryParse(value);
                            if (intValue == null || intValue <= 0) {
                              return 'Please enter a positive integer value';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _creditHoursController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 42, vertical: 20),
                            labelText: "Total Credit hours",
                            hintText: "Enter total number of credit hours",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              gapPadding: 10,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the total credit hours';
                            }
                            final intValue = int.tryParse(value);
                            if (intValue == null || intValue <= 0) {
                              return 'Please enter a positive integer value';
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
                          child: Text('Calculate fees'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _calculateFees();
                              _showConfimrationDialog(context, _totalFees);
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

_showConfimrationDialog(BuildContext context, int fee) {
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
                    Icons.school,
                  ),

                  //Image.asset('assets/red.png'),
                  //SvgPicture.asset('assets/images/sent_illustration.svg'),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                "Your total University fee is $fee",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InvoicePage(
                            name: "Ahmed",
                            amount: fee,
                            acc: '1234',
                            dateTime: DateTime.now()))),
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
