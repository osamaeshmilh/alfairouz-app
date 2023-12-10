import 'package:flutter/material.dart';

class Specimen {
  int? id;
  String? labQr;
  double? total;
  String? notes;
  String? createdBy;
  dynamic createdDate;
  String? lastModifiedBy;
  String? lastModifiedDate;

  Specimen();

  Specimen.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'] ?? '';
    createdDate = json['createdDate'] ?? '';
    lastModifiedBy = json['lastModifiedBy'] ?? '';
    lastModifiedDate = json['lastModifiedDate'] ?? '';
    id = json['id'] ?? null;
    total = json['total'] ?? 0.0;
    notes = json['notes'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['id'] = this.id;
    data['total'] = this.total;
    data['notes'] = this.notes;
    // if (this.size != null) {
    //   data['size'] = this.size!.toJson();
    // }
    return data;
  }

}
