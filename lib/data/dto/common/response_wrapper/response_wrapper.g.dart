// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponceWrapperImpl<T> _$$ResponceWrapperImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ResponceWrapperImpl<T>(
      status: json['status'] as String? ?? "",
      code: json['code'] as String? ?? "",
      message: json['message'] as String? ?? "",
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$$ResponceWrapperImplToJson<T>(
  _$ResponceWrapperImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
