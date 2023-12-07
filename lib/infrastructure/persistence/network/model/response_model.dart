// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:busenet/busenet.dart';
import 'package:injectable/injectable.dart';

/// ResponseModel class represents the response model used in the network layer.
/// It extends the BaseResponse class and contains properties such as entity, error, success, message, and status.
@singleton
class ResponseModel extends BaseResponse<ResponseModel> {
  dynamic entity;
  dynamic error;
  bool success;
  String? message;
  int? status;

  /// Constructs a new ResponseModel instance.
  ResponseModel({
    this.entity,
    this.error,
    this.success = true,
    this.message,
    this.status,
    super.statusCode,
    super.errorType,
  });

  @override
  void setData<R>(R entity) {
    this.entity = entity;
  }

  @override
  ResponseModel fromJson(Map<String, dynamic> json) {
    return ResponseModel.fromMap(json);
  }

  /// Converts the ResponseModel instance to a map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'entity': entity,
      'error': error,
      'success': success,
      'message': message,
      'status': status,
    };
  }

  /// Constructs a ResponseModel instance from a map.
  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    return ResponseModel(
      entity: map['entity'] as dynamic,
      error: map['error'] as dynamic,
      success: map['success'] != null ? map['success'] as bool : true,
      message: map['message'] != null ? map['message'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  /// Converts the ResponseModel instance to a JSON string.
  String toJson() => json.encode(toMap());

  /// Constructs a ResponseModel instance from a JSON string.
  factory ResponseModel.fromJson(String source) => ResponseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  /// Creates a copy of the ResponseModel instance with the specified properties overridden.
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
    success = true;
    message = null;
  }
}
