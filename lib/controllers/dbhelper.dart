import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:unipay/models/student.dart';

class dbhelper {
  static const String url = 'http://192.168.18.11:80/api';
  static late String email;
  late String name;
  static late String balance;

  String getName() {
    return name;
  }

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
      email = emailController;
      Future s =
          getStudentbyId(json.decode(response.body)['loginId'].toString());

      s.then((value) => {
            if (value.statusCode == 200)
              {
                name = json.decode(value.body)['firstName'] +
                    " " +
                    json.decode(value.body)['lastName'],
                balance = json.decode(value.body)['balance']
              }
          });
    }
    print("${response.statusCode}");
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
