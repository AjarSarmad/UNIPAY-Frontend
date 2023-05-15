import 'package:flutter/material.dart';
import 'package:unipay/screens/HomeScreen.dart';
import 'package:unipay/screens/sendmoney.dart';
import 'package:unipay/screens/transfer.dart';

import '../widgets/numpad.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _myController = TextEditingController();
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen())),
                  ),
                  Container(
                    width: 295,
                    alignment: Alignment.center,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(children: [
                        TextSpan(
                          text: 'Current Balance',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '\nRs. 1000',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            SizedBox(
              height: 70,
              child: Center(
                child: TextFormField(
                  key: _formKey,
                  controller: _myController,
                  validator: (value) {
                    if (value == '' || value == 'Rs. ') {
                      return "Please enter an amount";
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  showCursor: false,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                  keyboardType: TextInputType.none,
                  decoration: const InputDecoration(border: InputBorder.none),
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
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 70),
                      backgroundColor: Colors.black45,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      //  if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoneyTransferPage(
                                  amount: _myController.text)));
                      // }
                    },
                    child: const Text(
                      'Send',
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
