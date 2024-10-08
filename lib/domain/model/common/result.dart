import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/util/error/error_response.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result {
  const factory Result.Success(T data) = Success;

  const factory Result.Failure(ErrorResponse error) = Error;
}
