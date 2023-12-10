
import 'package:alfairouz/repositories/specimen_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/Specimen.dart';

class SpecimenSearchController extends GetxController {
  final specimenRepository = Get.find<SpecimenRepository>();
  final loading = false.obs;
  final labQr = TextEditingController();

  final Rx<Specimen> _specimen = Specimen().obs;

  Specimen get specimen => _specimen.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  findSpecimenByLabQr() async {
    try {
      loading.value = true;
      _specimen.value = await specimenRepository.findBySpecimenLabQr(labQr.text);
      update();
    } catch (e) {
      loading.value = false;
      print(e.toString());
    } finally {
      loading.value = false;
    }
  }
}

class SpecimenSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpecimenSearchController>(
      () => SpecimenSearchController(),
    );
  }
}
