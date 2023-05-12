import 'package:get/get.dart';
import 'package:online_test/data/modules/blog/controller/controller.dart';
import 'package:online_test/data/modules/candidates/controller/controller.dart';
import 'package:online_test/data/modules/homescreen/controller/controller.dart';

class ControllersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => CandidateController());
    Get.lazyPut(() => BlogController());
  }
}
