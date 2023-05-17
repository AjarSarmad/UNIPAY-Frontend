import 'package:get/get.dart';
import 'package:unipay/models/transaction.dart';
import '/models/student.dart';
import 'dbhelper.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class TransactionController extends GetxController {
  static const String url = 'http://192.168.18.67:80/api';
  late RxList<Transaction> debitTransactions;
  late RxList<Transaction> creditTransactions;

  @override
  void onInit() {
    super.onInit();
    debitTransactions = <Transaction>[].obs;
    creditTransactions = <Transaction>[].obs;
  }

  Future<http.Response> getCreditTransactions(String id) async {
    var response = await http
        .get(Uri.parse('$url/Transactions/getCreditTransactions?id=$id'));

    var jsonList = json.decode(response.body);
    for (var temp in jsonList) {
      Transaction transaction = Transaction(
          temp['id'].toString(),
          temp['amount'].toString(),
          temp['senderName'].toString(),
          temp['recieverName'].toString(),
          temp['senderId'].toString(),
          temp['recieverId'].toString(),
          temp['senderAccount'].toString(),
          temp['recieverAccount'].toString(),
          temp['date'],
          temp['time'],
          temp['note'],
          temp['type']);
      creditTransactions.add(transaction);
    }
    creditTransactions.sort((a, b) => b.date.compareTo(a.date));

    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> getDebitTransactions(String id) async {
    var response = await http
        .get(Uri.parse('$url/Transactions/getDebitTransactions?id=$id'));

    var jsonList = json.decode(response.body);
    for (var temp in jsonList) {
      Transaction transaction = Transaction(
          temp['id'].toString(),
          temp['amount'].toString(),
          temp['senderName'].toString(),
          temp['recieverName'].toString(),
          temp['senderId'].toString(),
          temp['recieverId'].toString(),
          temp['senderAccount'].toString(),
          temp['recieverAccount'].toString(),
          temp['date'],
          temp['time'],
          temp['note'],
          temp['type']);
      debitTransactions.add(transaction);
    }
    debitTransactions.sort((a, b) => b.date.compareTo(a.date));
    print("${response.statusCode}");
    return response;
  }
}

class StudentBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
