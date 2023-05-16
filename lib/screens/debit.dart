import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class DebitInvoicePage extends StatefulWidget {
  final String name;
  final String acc;
  final String amount;
  final String receiver;
  final String rec_acc;
  final String note;
  final String dateTime;

  const DebitInvoicePage({
    Key? key,
    required this.name,
    required this.acc,
    required this.amount,
    required this.receiver,
    required this.rec_acc,
    required this.note,
    required this.dateTime,
  }) : super(key: key);

  State<DebitInvoicePage> createState() => _DebitInvoicePage();
}

class _DebitInvoicePage extends State<DebitInvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen()))),
        title: Text("Money Received"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 600,
              height: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                  //right: Radius.circular(30),
                ),
                color: Colors.green,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: SizedBox(
                    width: 200,
                    height: 180,
                    child: FittedBox(
                      child: Icon(
                        Icons.arrow_circle_down,
                        color: Colors.white,
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    " + Rs. 700",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Row(children: [
                      SizedBox(
                        width: 140,
                      ),
                      Text("From", style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.name, style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 5,
                      ),
                      Text("to", style: TextStyle(color: Colors.white)),
                      SizedBox(
                        width: 5,
                      ),
                      Text(widget.receiver,
                          style: TextStyle(color: Colors.white))
                    ]),
                  ),
                  Text(
                    widget.dateTime,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 360,
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
                        //Heder
                        Row(
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
                              widget.dateTime,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'BebasNeue',
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        //Details
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Note',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.note,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'From',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.acc,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'To',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.rec_acc,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Transaction no',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.acc,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'BebasNeue',
                                ),
                              ),
                            ],
                          ),
                        ),
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
