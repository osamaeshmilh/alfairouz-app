
import 'package:alfairouz/models/Specimen.dart';
import 'package:alfairouz/repositories/specimen_repository.dart';
import 'package:get/get.dart';

class SpecimensController extends GetxController {
  final specimenRepository = Get.find<SpecimenRepository>();
  final loading = false.obs;
  final specimens = <Specimen>[].obs;

  final bool isMine = Get.arguments;

  @override
  void onInit() {
    findAllSpecimens();
    super.onInit();
  }

  Future<void> findAllSpecimens() async {
    try {
      loading.value = true;
      final response = await specimenRepository.findAllSpecimen();
      specimens.assignAll(response);
      update();
    } finally {
      loading.value = false;
    }
  }
}

class SpecimensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecimensController>(
      () => SpecimensController(),
    );
  }
}
