import 'dart:convert';
// import 'dart:ffi';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:unipay/models/student.dart';

import 'Student_Controller.dart';
import 'Transaction_Controller.dart';

class dbhelper {
  static const String url = 'http://192.168.18.11:80/api';
  static late String email;
  late String name;
  static late String balance;
  final StudentController studentController = Get.put(StudentController());
  final TransactionController transactionController =
      Get.put(TransactionController());

  Future<http.Response> getStudentbyId(String id) async {
    var response =
        await http.get(Uri.parse(url + '/Student/getstudentbyId?id=' + id));
    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> AccountVerification(
      String emailController, String passwordController) async {
    Map data = {
      'email': '$emailController',
      'password': '$passwordController',
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
      Uri.parse(url + '/Login/AccountVerification'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      var res = await studentController
          .getStudentbyId(json.decode(response.body)['loginId'].toString());
      var res1 = await transactionController.getCreditTransactions(
          json.decode(response.body)['loginId'].toString());

      var res2 = await transactionController.getDebitTransactions(
          json.decode(response.body)['loginId'].toString());
      //email = emailController;
      //Future s =
      //getStudentbyId(json.decode(response.body)['loginId'].toString());

      // s.then((value) => {
      //       if (value.statusCode == 200)
      //         {
      // student.setAccountNo(json.decode(value.body)['accountNo']),
      // student.setBalance(json.decode(value.body)['balance']),
      // student.setContact(json.decode(value.body)['contact']),
      // student.setEmail(json.decode(value.body)['email']),
      // student.setFirstName(json.decode(value.body)['firstName']),
      // student.setLastName(json.decode(value.body)['lastName']),
      // student.setGuardianContact(
      //     json.decode(value.body)['guardianContact']),
      // student.setGuardianFullName(
      //     json.decode(value.body)['guardianFullName']),
      // student.setAddress(json.decode(value.body)['address']),
      // student.setNu_id(json.decode(value.body)['nu_id']),
      // studentController.setStudent(student),
      // Get.lazyPut<StudentController>(() => StudentController())

      // name = json.decode(value.body)['firstName'] +
      //     " " +
      //     json.decode(value.body)['lastName'],
      // balance = json.decode(value.body)['balance']
      // }
      // }
      // )
      ;
      return response;
    }
    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> depositMoney(String id, String amount) async {
    var response = await http.post(
      Uri.parse("${url}/Transactions/depositMoney?id=$id&amount=$amount"),
    );
    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> payments(
      String amount, String receiverId, String note) async {
    String senderId = studentController.student.value.nu_id.toString();
    late String type;
    switch (receiverId) {
      case "1":
        type = "CAFE";
        break;
      case "2":
        type = "STATIONARY SHOP";
        break;
      case "3":
        type = "PIZZA FAST";
        break;
      case "4":
        type = "JADOON TRANSPORT";
        break;
      case "5":
        type = "SEMESTER FEES NUCES KHI";
        break;
      case "6":
        type = "DHAABA";
        break;
      case "7":
        type = "SHAWARMA SHOP";
        break;
    }
    Map data = {
      'amount': '$amount',
      'senderId': '$senderId',
      'recieverId': '$receiverId',
      'note': '$note',
      'type': '$type'
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
      Uri.parse("${url}/Transactions/payments"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    print("${response.statusCode}");
    //print(body);
    return response;
  }

  Future<http.Response> sendMoney(
      String amount, String receiverId, String note) async {
    String senderId = studentController.student.value.nu_id.toString();
    Map data = {
      'amount': '$amount',
      'senderId': '$senderId',
      'recieverId': '$receiverId',
      'note': '$note',
      'type': 'debit'
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
      Uri.parse("${url}/Transactions/sendMoney"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );

    print("${response.statusCode}");
    //print(body);
    return response;
  }

  Future<http.Response> postOtp(String otp) async {
    //String otp = pin1 + pin2 + pin3 + pin4 + pin5;

    var response = await http.post(
      Uri.parse(
          url + '/Login/OTPVerification?email=' + email + '&OTP=' + '$otp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> postLogin(Student obj) async {
    Map data = {
      'loginId': '${obj.nu_id}',
      'email': '${obj.email}',
      'password': '${obj.password}',
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
      Uri.parse(url + '/Login/postlogin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      email = obj.email;
    }
    print("${response.statusCode}");
    return response;
  }

  Future<http.Response> postStudent(Student obj) async {
    Map data = {
      'nu_id': '${obj.nu_id}',
      'firstName': '${obj.firstName}',
      'lastName': '${obj.lastName}',
      'contact': '${obj.contact}',
      'email': '${obj.email}',
      'guardianFullName': '${obj.guardianFullName}',
      'guardianContact': '${obj.guardianContact}',
      'address': '${obj.address}',
      'accountNo': '${obj.accountNo}',
      'balance': '${obj.balance}',
    };
    //encode Map to JSON
    var body = json.encode(data);
    var response = await http.post(
      Uri.parse(url + '/Student/poststudent'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 201) {
      Future s = postLogin(obj);
      s.then((value) => {
            if (value.statusCode == 201)
              {
                email = obj.email,
                print("Login Successfull"),
              }
          });
    }
    print("${response.statusCode}");
    return response;
  }
}
