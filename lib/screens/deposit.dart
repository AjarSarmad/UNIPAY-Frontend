import 'package:flutter/material.dart';
import 'package:unipay/screens/HomeScreen.dart';

import '../widgets/container_with_heading.dart';

class Deposit extends StatelessWidget {
  const Deposit({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _amountController = TextEditingController();
    int amount = 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 75),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen())),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: Text(
                'Deposit money',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: 30),
            const ContainerHeading(
              title: 'Account Number',
              desc: 'My Acc number',
              number: '123456',
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _amountController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter amount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 38, vertical: 20),
                  labelText: "Deposit Amount",
                  hintText: "Enter amount",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    gapPadding: 10,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showConfimrationDialog(context, _amountController.text);
                  }
                },
                style: TextButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    primary: Colors.white,
                    backgroundColor: Color(0xFFD44C66),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)))),
                child: Text("Deposit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_showConfimrationDialog(BuildContext context, String n) {
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
                    Icons.arrow_circle_down,
                    color: Colors.green,
                  ),

                  //Image.asset('assets/red.png'),
                  //SvgPicture.asset('assets/images/sent_illustration.svg'),
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 35),
              Text(
                "Rs $n has been successfully deposited in your account",
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
                child: Text("OK"),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
