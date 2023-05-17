//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
//import 'package:get/get.dart';
import 'package:unipay/screens/credit.dart';
//import 'package:unipay/models/transaction.dart';
import 'package:unipay/screens/loan.dart';
import 'package:unipay/screens/payments.dart';
import 'package:unipay/screens/scholarship.dart';
import 'package:unipay/screens/send.dart';
import 'package:unipay/widgets/transaction_item.dart';

import '../controllers/Transaction_Controller.dart';
import '../models/transaction.dart';
import '../screens/debit.dart';
import '../screens/paymentoptions.dart';
import 'date_total.dart';
import 'display_cards.dart';
//import 'transaction_item.dart';

class HomePageItem extends StatefulWidget {
  const HomePageItem({
    super.key,
  });

  @override
  State<HomePageItem> createState() => _HomePageItem();
}

class _HomePageItem extends State<HomePageItem>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TransactionController transactionController =
      Get.find<TransactionController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  Widget build(BuildContext context) {
    Widget _icon(IconData icon, String text, Widget route) {
      return Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => route)),
            child: Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xfff3f3f3),
                        offset: Offset(5, 5),
                        blurRadius: 10)
                  ]),
              child: Icon(icon),
            ),
          ),
          Text(
            text,
            //style: GoogleFonts.mulish(
            // textStyle: Theme.of(context).textTheme.headline4,
            // fontSize: 15,
            // fontWeight: FontWeight.w600,
            // color: Color(0xff76797e))
          ),
        ],
      );
    }

    Widget _operationsWidget() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _icon(Icons.transfer_within_a_station, "Transfer", SendMoney()),
          _icon(Icons.payment, "Payments", Payments()),
          _icon(Icons.school, "Scholarships", Scholarship()),
          _icon(Icons.attach_money, "Loan", Loan()),
        ],
      );
    }

    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 30),
      const DisplayCards(),
      const SizedBox(height: 10),
      _operationsWidget(),
      const SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20),
        child: Text(
          "Transactions",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Column(
            children: [
              DefaultTabController(
                length: 2,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.blue,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: 'Credit'),
                    Tab(text: 'Debit'),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: TabBarView(controller: _tabController, children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    child: ListView.builder(
                      itemCount: transactionController
                          .creditTransactions.length, // number of transactions
                      itemBuilder: (context, index) {
                        return TransactionItem(
                            onpressed: DebitInvoicePage(
                              id: transactionController
                                  .creditTransactions[index].id
                                  .toString(),
                              acc: transactionController
                                  .creditTransactions[index].senderAccount
                                  .toString(),
                              amount: transactionController
                                  .creditTransactions[index].amount
                                  .toString(),
                              name: transactionController
                                  .creditTransactions[index].senderName
                                  .toString(),
                              receiver: transactionController
                                  .creditTransactions[index].recieverName
                                  .toString(),
                              rec_acc: transactionController
                                  .creditTransactions[index].recieverAccount
                                  .toString(),
                              note: transactionController
                                  .creditTransactions[index].note
                                  .toString(),
                              dateTime: transactionController
                                  .creditTransactions[index].date
                                  .toString(),
                            ),
                            transaction: transactionController
                                .creditTransactions[index]);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: ListView.builder(
                      itemCount: transactionController
                          .debitTransactions.length, // number of transactions
                      itemBuilder: (context, index) {
                        return TransactionItem(
                            onpressed: CreditInvoicePage(
                              id: transactionController
                                  .debitTransactions[index].id
                                  .toString(),
                              acc: transactionController
                                  .debitTransactions[index].senderAccount
                                  .toString(),
                              amount: transactionController
                                  .debitTransactions[index].amount
                                  .toString(),
                              name: transactionController
                                  .debitTransactions[index].senderName
                                  .toString(),
                              receiver: transactionController
                                  .debitTransactions[index].recieverName
                                  .toString(),
                              rec_acc: transactionController
                                  .debitTransactions[index].recieverAccount
                                  .toString(),
                              note: transactionController
                                  .debitTransactions[index].note
                                  .toString(),
                              dateTime: transactionController
                                  .debitTransactions[index].date
                                  .toString(),
                            ),
                            transaction:
                                transactionController.debitTransactions[index]);
                      },
                    ),
                  )
                ]),
              )),
            ],

            // DefaultTabController(
            //     length: 2,
            //     child: TabBarView(
            //       children: [Icon(Icons.mail), Icon(Icons.man)],
            //     )),
            //_transectionList()
          ))
    ]));
  }
}
