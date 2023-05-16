import 'package:get/get.dart';
import 'package:unipay/controllers/Student_Controller.dart';

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentController());
  }
}
