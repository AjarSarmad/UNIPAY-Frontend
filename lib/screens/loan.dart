import 'package:flutter/material.dart';
import 'package:unipay/controllers/dbhelper.dart';
import 'package:unipay/screens/HomeScreen.dart';

class Loan extends StatelessWidget {
  Loan({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dbhelper db = new dbhelper();

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          title: Text("Loan"),
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
                      "REQUEST FOR LOAN",
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
                            controller: idController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter NU ID';
                              } else if (!RegExp(r'^\d{2}[a-zA-Z]-\d{4}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid NU ID (e.g. 19k-1234)';
                              }

                              return null;
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
                            controller: amountController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter amount';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 42, vertical: 20),
                              labelText: "Loan amount",
                              hintText: "Enter loan amount",
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
                              controller: reasonController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a reason";
                                }
                                return null;
                              },
                              maxLines: 5,
                              minLines: 5,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 42, vertical: 20),
                                labelText: "Add a reason for loan",
                                hintText: "Reason for loan",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(28),
                                  gapPadding: 10,
                                ),
                              ))
                        ]))
                  ]))))),
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
              if (_formKey.currentState!.validate()) {
                var res = await db.postLoan(
                  idController.text,
                  amountController.text,
                  reasonController.text,
                );
                if (res.statusCode == 201) _showConfimrationDialog(context);
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
                    "Request For Loan",
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
                  width: 180,
                  height: 180,
                  child: FittedBox(
                    child: Icon(Icons.timer),
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  "Your Request for loan has been sent successfully!\n You'll be notified when you will receive the loan",
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
                  child: Text("Ok, Thanks"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
