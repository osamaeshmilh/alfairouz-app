import 'package:alfairouz/models/Specimen.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SpecimenRepository {
  final _dio = Get.find<Dio>();

  Future<Specimen> findBySpecimenLabQr(String labQr) async {
    try {
      final response = await _dio.get('public/specimen/by-qr/$labQr');
      return Specimen.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Specimen>> findAllSpecimen() async {
    try {
      Map<String, dynamic> queryParam = {};
      queryParam['size'] = 100;
      queryParam['sort'] = 'id,desc';
      final response = await _dio.get('specimen', queryParameters: queryParam);
      final data = response.data as List;
      return List<Specimen>.from(data.map((e) => Specimen.fromJson(e)));
    } catch (e) {
      rethrow;
    }
  }

  Future<Specimen> findBySpecimenId(int specimenId) async {
    try {
      final response = await _dio.get('specimen/$specimenId');
      return Specimen.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}