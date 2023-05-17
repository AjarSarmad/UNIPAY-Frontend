import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Widget onpressed;
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => onpressed)),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF3D538F),
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 129, 129),
                  borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                width: 35,
                height: 35,
                child: Center(
                  child: Text(
                    transaction.senderName
                        .split(" ")
                        .map((e) => e.substring(0, 1))
                        .toList()
                        .join(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Image.network(
                //   this.image,
                // ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      transaction.senderName,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    transaction.date,
                    style:
                        const TextStyle(color: Color(0xFF3D538F), fontSize: 14),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    " Rs. ${transaction.amount}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFA6D6D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  transaction.note,
                  style:
                      const TextStyle(color: Color(0xFF3D538F), fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
