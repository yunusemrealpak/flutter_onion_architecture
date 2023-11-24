// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:busenet/busenet.dart';

class ResponseModel extends BaseResponse<ResponseModel> {
  dynamic entity;
  dynamic error;
  bool? success;
  String? message;
  int? status;

  ResponseModel({
    this.entity,
    this.error,
    this.success,
    this.message,
    this.status,
  });

  @override
  void setData<R>(R entity) {
    this.entity = entity;
  }

  @override
  ResponseModel fromJson(Map<String, dynamic> json) {
    return ResponseModel.fromMap(json);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'entity': entity,
      'error': error,
      'success': success,
      'message': message,
      'status': status,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      entity: map['entity'] as dynamic,
      error: map['error'] as dynamic,
      success: map['success'] != null ? map['success'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) => ResponseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  ResponseModel copyWith({
    dynamic entity,
    dynamic error,
    bool? success,
    String? message,
    int? status,
  }) {
    return ResponseModel(
      entity: entity ?? this.entity,
      error: error ?? this.error,
      success: success ?? this.success,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  void clearEntity() {
    entity = null;
    error = null;
    status = null;
    success = null;
    message = null;
  }
}
