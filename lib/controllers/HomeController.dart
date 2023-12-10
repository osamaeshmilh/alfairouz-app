import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../repositories/specimen_repository.dart';
import '../routes/app_pages.dart';

class HomeController extends GetxController {
  final specimenRepository = Get.find<SpecimenRepository>();

  @override
  void onInit() {
    if (Get.find<GetStorage>().hasData('token')) {
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  logout() async {
    Get.find<GetStorage>().erase();
    Get.offAllNamed(Routes.LOGIN);
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
