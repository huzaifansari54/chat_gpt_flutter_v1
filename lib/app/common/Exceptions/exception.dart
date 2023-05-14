import 'package:chat_gpt_flutter/app/model/error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'exception.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.apiError({required ErrorModel errorModel}) = _ApiError;
  const factory Failure.socketException({required String error}) = _Socket;
  const factory Failure.fileException({required String error}) = _File;
  const factory Failure.allExcption({required String error}) = _All;
  const factory Failure.noExcption({required String error}) = _NoExcption;
}
