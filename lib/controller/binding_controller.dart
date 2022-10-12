

import 'package:faccinate_demo/controller/main_controller.dart';
import 'package:get/get.dart';

class BindingController implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<dynamic>(() => MainController(),fenix:true);

  }

}