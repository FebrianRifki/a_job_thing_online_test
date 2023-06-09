import 'package:get/get.dart';
import 'package:online_test/data/modules/blog/controller.dart';
import 'package:online_test/data/modules/candidates/controller.dart';
import 'package:online_test/data/modules/homescreen/controller.dart';

class ControllersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => CandidateController());
    Get.lazyPut(() => BlogController());
  }
}
