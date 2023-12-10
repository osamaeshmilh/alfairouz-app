
import 'package:alfairouz/repositories/specimen_repository.dart';
import 'package:alfairouz/utils/token_injecter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../repositories/auth_repository.dart';
import 'consts.dart';

class DependencyInjection {
  static void init() {
    Get.put<GetStorage>(GetStorage());
    Get.put<Dio>(Dio(BaseOptions(
      baseUrl: Const.baseURL,
    )))
      ..interceptors.addAll([LogInterceptor(request: true, responseBody: true, requestBody: true), TokenInjecter()]);
    Get.put<AuthRepository>(AuthRepository());
    Get.put<SpecimenRepository>(SpecimenRepository());

  }
}
