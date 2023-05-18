import 'package:get/get.dart';
import 'package:unipay/models/Scholarship.dart';
import 'package:unipay/models/transaction.dart';
import '/models/student.dart';
import 'Student_Controller.dart';
import 'dbhelper.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ScholarshipController extends GetxController {
  static const String url = 'http://192.168.18.11:80/api';
  late RxList<Scholarship> scholarship;
  final StudentController studentController = Get.find<StudentController>();

  @override
  void onInit() {
    super.onInit();
    scholarship = <Scholarship>[].obs;
  }

  Future<http.Response> getAllScholarships() async {
    var response =
        await http.get(Uri.parse('$url/Scholarship/getAllScholarships'));

    var jsonList = json.decode(response.body);
    for (var temp in jsonList) {
      Scholarship scholarship1 = Scholarship(temp['id'].toString(),
          temp['name'].toString(), temp['description'].toString());

      scholarship.add(scholarship1);
    }
    print("${response.statusCode}");
    return response;
  }
}

class StudentBinding2 implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScholarshipController>(() => ScholarshipController());
  }
}
