import 'package:get/get.dart';
import '/models/student.dart';
import 'dbhelper.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class StudentController extends GetxController {
  static const String url = 'http://192.168.18.11:80/api';
  static late String email;
  late String name;
  static late String balance;
  late Rx<Student> student;

  @override
  void onInit() {
    super.onInit();
    student = Student().obs;
    //print(student.value.accountNo);

    // fetchProducts();
  }

  late Student student2 = new Student();

  Future<http.Response> getStudentbyId(String id) async {
    var response =
        await http.get(Uri.parse(url + '/Student/getstudentbyId?id=' + id));
    student2.setNu_id(json.decode(response.body)['nu_id']);
    student2.setAccountNo(json.decode(response.body)['accountNo']);
    student2.setBalance(json.decode(response.body)['balance'].toString());
    student2.setContact(json.decode(response.body)['contact']);
    student2.setEmail(json.decode(response.body)['email']);
    student2.setFirstName(json.decode(response.body)['firstName']);
    student2.setLastName(json.decode(response.body)['lastName']);
    student2.setGuardianContact(json.decode(response.body)['guardianContact']);
    student2
        .setGuardianFullName(json.decode(response.body)['guardianFullName']);
    student2.setAddress(json.decode(response.body)['address']);
    student.value = student2;
    print("${response.statusCode}");
    return response;
  }
  // student = Student(id: '1', name: 'John Doe', age: 20);
}

class StudentBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentController>(() => StudentController());
  }
}
