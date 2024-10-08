// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_wrapper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseWrapper<T> _$ResponseWrapperFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ResponceWrapper<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResponseWrapper<T> {
  String get status => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseWrapperCopyWith<T, ResponseWrapper<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseWrapperCopyWith<T, $Res> {
  factory $ResponseWrapperCopyWith(
          ResponseWrapper<T> value, $Res Function(ResponseWrapper<T>) then) =
      _$ResponseWrapperCopyWithImpl<T, $Res, ResponseWrapper<T>>;
  @useResult
  $Res call({String status, String code, String message, T? data});
}

/// @nodoc
class _$ResponseWrapperCopyWithImpl<T, $Res, $Val extends ResponseWrapper<T>>
    implements $ResponseWrapperCopyWith<T, $Res> {
  _$ResponseWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponceWrapperImplCopyWith<T, $Res>
    implements $ResponseWrapperCopyWith<T, $Res> {
  factory _$$ResponceWrapperImplCopyWith(_$ResponceWrapperImpl<T> value,
          $Res Function(_$ResponceWrapperImpl<T>) then) =
      __$$ResponceWrapperImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({String status, String code, String message, T? data});
}

/// @nodoc
class __$$ResponceWrapperImplCopyWithImpl<T, $Res>
    extends _$ResponseWrapperCopyWithImpl<T, $Res, _$ResponceWrapperImpl<T>>
    implements _$$ResponceWrapperImplCopyWith<T, $Res> {
  __$$ResponceWrapperImplCopyWithImpl(_$ResponceWrapperImpl<T> _value,
      $Res Function(_$ResponceWrapperImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ResponceWrapperImpl<T>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ResponceWrapperImpl<T>
    with DiagnosticableTreeMixin
    implements _ResponceWrapper<T> {
  const _$ResponceWrapperImpl(
      {this.status = "", this.code = "", this.message = "", this.data});

  factory _$ResponceWrapperImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ResponceWrapperImplFromJson(json, fromJsonT);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String message;
  @override
  final T? data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResponseWrapper<$T>(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResponseWrapper<$T>'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponceWrapperImpl<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponceWrapperImplCopyWith<T, _$ResponceWrapperImpl<T>> get copyWith =>
      __$$ResponceWrapperImplCopyWithImpl<T, _$ResponceWrapperImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResponceWrapperImplToJson<T>(this, toJsonT);
  }
}

abstract class _ResponceWrapper<T> implements ResponseWrapper<T> {
  const factory _ResponceWrapper(
      {final String status,
      final String code,
      final String message,
      final T? data}) = _$ResponceWrapperImpl<T>;

  factory _ResponceWrapper.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ResponceWrapperImpl<T>.fromJson;

  @override
  String get status;
  @override
  String get code;
  @override
  String get message;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$ResponceWrapperImplCopyWith<T, _$ResponceWrapperImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
