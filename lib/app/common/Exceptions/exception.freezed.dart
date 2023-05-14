// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel errorModel) apiError,
    required TResult Function(String error) socketException,
    required TResult Function(String error) fileException,
    required TResult Function(String error) allExcption,
    required TResult Function(String error) noExcption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel errorModel)? apiError,
    TResult? Function(String error)? socketException,
    TResult? Function(String error)? fileException,
    TResult? Function(String error)? allExcption,
    TResult? Function(String error)? noExcption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel errorModel)? apiError,
    TResult Function(String error)? socketException,
    TResult Function(String error)? fileException,
    TResult Function(String error)? allExcption,
    TResult Function(String error)? noExcption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_Socket value) socketException,
    required TResult Function(_File value) fileException,
    required TResult Function(_All value) allExcption,
    required TResult Function(_NoExcption value) noExcption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_Socket value)? socketException,
    TResult? Function(_File value)? fileException,
    TResult? Function(_All value)? allExcption,
    TResult? Function(_NoExcption value)? noExcption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiError value)? apiError,
    TResult Function(_Socket value)? socketException,
    TResult Function(_File value)? fileException,
    TResult Function(_All value)? allExcption,
    TResult Function(_NoExcption value)? noExcption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ApiErrorCopyWith<$Res> {
  factory _$$_ApiErrorCopyWith(
          _$_ApiError value, $Res Function(_$_ApiError) then) =
      __$$_ApiErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorModel errorModel});
}

/// @nodoc
class __$$_ApiErrorCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_ApiError>
    implements _$$_ApiErrorCopyWith<$Res> {
  __$$_ApiErrorCopyWithImpl(
      _$_ApiError _value, $Res Function(_$_ApiError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorModel = null,
  }) {
    return _then(_$_ApiError(
      errorModel: null == errorModel
          ? _value.errorModel
          : errorModel // ignore: cast_nullable_to_non_nullable
              as ErrorModel,
    ));
  }
}

/// @nodoc

class _$_ApiError implements _ApiError {
  const _$_ApiError({required this.errorModel});

  @override
  final ErrorModel errorModel;

  @override
  String toString() {
    return 'Failure.apiError(errorModel: $errorModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiError &&
            (identical(other.errorModel, errorModel) ||
                other.errorModel == errorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiErrorCopyWith<_$_ApiError> get copyWith =>
      __$$_ApiErrorCopyWithImpl<_$_ApiError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel errorModel) apiError,
    required TResult Function(String error) socketException,
    required TResult Function(String error) fileException,
    required TResult Function(String error) allExcption,
    required TResult Function(String error) noExcption,
  }) {
    return apiError(errorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel errorModel)? apiError,
    TResult? Function(String error)? socketException,
    TResult? Function(String error)? fileException,
    TResult? Function(String error)? allExcption,
    TResult? Function(String error)? noExcption,
  }) {
    return apiError?.call(errorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel errorModel)? apiError,
    TResult Function(String error)? socketException,
    TResult Function(String error)? fileException,
    TResult Function(String error)? allExcption,
    TResult Function(String error)? noExcption,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(errorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_Socket value) socketException,
    required TResult Function(_File value) fileException,
    required TResult Function(_All value) allExcption,
    required TResult Function(_NoExcption value) noExcption,
  }) {
    return apiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_Socket value)? socketException,
    TResult? Function(_File value)? fileException,
    TResult? Function(_All value)? allExcption,
    TResult? Function(_NoExcption value)? noExcption,
  }) {
    return apiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiError value)? apiError,
    TResult Function(_Socket value)? socketException,
    TResult Function(_File value)? fileException,
    TResult Function(_All value)? allExcption,
    TResult Function(_NoExcption value)? noExcption,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(this);
    }
    return orElse();
  }
}

abstract class _ApiError implements Failure {
  const factory _ApiError({required final ErrorModel errorModel}) = _$_ApiError;

  ErrorModel get errorModel;
  @JsonKey(ignore: true)
  _$$_ApiErrorCopyWith<_$_ApiError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SocketCopyWith<$Res> {
  factory _$$_SocketCopyWith(_$_Socket value, $Res Function(_$_Socket) then) =
      __$$_SocketCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_SocketCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_Socket>
    implements _$$_SocketCopyWith<$Res> {
  __$$_SocketCopyWithImpl(_$_Socket _value, $Res Function(_$_Socket) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Socket(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Socket implements _Socket {
  const _$_Socket({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'Failure.socketException(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Socket &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocketCopyWith<_$_Socket> get copyWith =>
      __$$_SocketCopyWithImpl<_$_Socket>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel errorModel) apiError,
    required TResult Function(String error) socketException,
    required TResult Function(String error) fileException,
    required TResult Function(String error) allExcption,
    required TResult Function(String error) noExcption,
  }) {
    return socketException(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel errorModel)? apiError,
    TResult? Function(String error)? socketException,
    TResult? Function(String error)? fileException,
    TResult? Function(String error)? allExcption,
    TResult? Function(String error)? noExcption,
  }) {
    return socketException?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel errorModel)? apiError,
    TResult Function(String error)? socketException,
    TResult Function(String error)? fileException,
    TResult Function(String error)? allExcption,
    TResult Function(String error)? noExcption,
    required TResult orElse(),
  }) {
    if (socketException != null) {
      return socketException(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_Socket value) socketException,
    required TResult Function(_File value) fileException,
    required TResult Function(_All value) allExcption,
    required TResult Function(_NoExcption value) noExcption,
  }) {
    return socketException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_Socket value)? socketException,
    TResult? Function(_File value)? fileException,
    TResult? Function(_All value)? allExcption,
    TResult? Function(_NoExcption value)? noExcption,
  }) {
    return socketException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiError value)? apiError,
    TResult Function(_Socket value)? socketException,
    TResult Function(_File value)? fileException,
    TResult Function(_All value)? allExcption,
    TResult Function(_NoExcption value)? noExcption,
    required TResult orElse(),
  }) {
    if (socketException != null) {
      return socketException(this);
    }
    return orElse();
  }
}

abstract class _Socket implements Failure {
  const factory _Socket({required final String error}) = _$_Socket;

  String get error;
  @JsonKey(ignore: true)
  _$$_SocketCopyWith<_$_Socket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FileCopyWith<$Res> {
  factory _$$_FileCopyWith(_$_File value, $Res Function(_$_File) then) =
      __$$_FileCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_FileCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res, _$_File>
    implements _$$_FileCopyWith<$Res> {
  __$$_FileCopyWithImpl(_$_File _value, $Res Function(_$_File) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_File(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_File implements _File {
  const _$_File({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'Failure.fileException(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_File &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileCopyWith<_$_File> get copyWith =>
      __$$_FileCopyWithImpl<_$_File>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel errorModel) apiError,
    required TResult Function(String error) socketException,
    required TResult Function(String error) fileException,
    required TResult Function(String error) allExcption,
    required TResult Function(String error) noExcption,
  }) {
    return fileException(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel errorModel)? apiError,
    TResult? Function(String error)? socketException,
    TResult? Function(String error)? fileException,
    TResult? Function(String error)? allExcption,
    TResult? Function(String error)? noExcption,
  }) {
    return fileException?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel errorModel)? apiError,
    TResult Function(String error)? socketException,
    TResult Function(String error)? fileException,
    TResult Function(String error)? allExcption,
    TResult Function(String error)? noExcption,
    required TResult orElse(),
  }) {
    if (fileException != null) {
      return fileException(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_Socket value) socketException,
    required TResult Function(_File value) fileException,
    required TResult Function(_All value) allExcption,
    required TResult Function(_NoExcption value) noExcption,
  }) {
    return fileException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_Socket value)? socketException,
    TResult? Function(_File value)? fileException,
    TResult? Function(_All value)? allExcption,
    TResult? Function(_NoExcption value)? noExcption,
  }) {
    return fileException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiError value)? apiError,
    TResult Function(_Socket value)? socketException,
    TResult Function(_File value)? fileException,
    TResult Function(_All value)? allExcption,
    TResult Function(_NoExcption value)? noExcption,
    required TResult orElse(),
  }) {
    if (fileException != null) {
      return fileException(this);
    }
    return orElse();
  }
}

abstract class _File implements Failure {
  const factory _File({required final String error}) = _$_File;

  String get error;
  @JsonKey(ignore: true)
  _$$_FileCopyWith<_$_File> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AllCopyWith<$Res> {
  factory _$$_AllCopyWith(_$_All value, $Res Function(_$_All) then) =
      __$$_AllCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_AllCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res, _$_All>
    implements _$$_AllCopyWith<$Res> {
  __$$_AllCopyWithImpl(_$_All _value, $Res Function(_$_All) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_All(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_All implements _All {
  const _$_All({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'Failure.allExcption(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_All &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllCopyWith<_$_All> get copyWith =>
      __$$_AllCopyWithImpl<_$_All>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel errorModel) apiError,
    required TResult Function(String error) socketException,
    required TResult Function(String error) fileException,
    required TResult Function(String error) allExcption,
    required TResult Function(String error) noExcption,
  }) {
    return allExcption(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel errorModel)? apiError,
    TResult? Function(String error)? socketException,
    TResult? Function(String error)? fileException,
    TResult? Function(String error)? allExcption,
    TResult? Function(String error)? noExcption,
  }) {
    return allExcption?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel errorModel)? apiError,
    TResult Function(String error)? socketException,
    TResult Function(String error)? fileException,
    TResult Function(String error)? allExcption,
    TResult Function(String error)? noExcption,
    required TResult orElse(),
  }) {
    if (allExcption != null) {
      return allExcption(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_Socket value) socketException,
    required TResult Function(_File value) fileException,
    required TResult Function(_All value) allExcption,
    required TResult Function(_NoExcption value) noExcption,
  }) {
    return allExcption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_Socket value)? socketException,
    TResult? Function(_File value)? fileException,
    TResult? Function(_All value)? allExcption,
    TResult? Function(_NoExcption value)? noExcption,
  }) {
    return allExcption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiError value)? apiError,
    TResult Function(_Socket value)? socketException,
    TResult Function(_File value)? fileException,
    TResult Function(_All value)? allExcption,
    TResult Function(_NoExcption value)? noExcption,
    required TResult orElse(),
  }) {
    if (allExcption != null) {
      return allExcption(this);
    }
    return orElse();
  }
}

abstract class _All implements Failure {
  const factory _All({required final String error}) = _$_All;

  String get error;
  @JsonKey(ignore: true)
  _$$_AllCopyWith<_$_All> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NoExcptionCopyWith<$Res> {
  factory _$$_NoExcptionCopyWith(
          _$_NoExcption value, $Res Function(_$_NoExcption) then) =
      __$$_NoExcptionCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_NoExcptionCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$_NoExcption>
    implements _$$_NoExcptionCopyWith<$Res> {
  __$$_NoExcptionCopyWithImpl(
      _$_NoExcption _value, $Res Function(_$_NoExcption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_NoExcption(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NoExcption implements _NoExcption {
  const _$_NoExcption({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'Failure.noExcption(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoExcption &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoExcptionCopyWith<_$_NoExcption> get copyWith =>
      __$$_NoExcptionCopyWithImpl<_$_NoExcption>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorModel errorModel) apiError,
    required TResult Function(String error) socketException,
    required TResult Function(String error) fileException,
    required TResult Function(String error) allExcption,
    required TResult Function(String error) noExcption,
  }) {
    return noExcption(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorModel errorModel)? apiError,
    TResult? Function(String error)? socketException,
    TResult? Function(String error)? fileException,
    TResult? Function(String error)? allExcption,
    TResult? Function(String error)? noExcption,
  }) {
    return noExcption?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorModel errorModel)? apiError,
    TResult Function(String error)? socketException,
    TResult Function(String error)? fileException,
    TResult Function(String error)? allExcption,
    TResult Function(String error)? noExcption,
    required TResult orElse(),
  }) {
    if (noExcption != null) {
      return noExcption(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_Socket value) socketException,
    required TResult Function(_File value) fileException,
    required TResult Function(_All value) allExcption,
    required TResult Function(_NoExcption value) noExcption,
  }) {
    return noExcption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_Socket value)? socketException,
    TResult? Function(_File value)? fileException,
    TResult? Function(_All value)? allExcption,
    TResult? Function(_NoExcption value)? noExcption,
  }) {
    return noExcption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiError value)? apiError,
    TResult Function(_Socket value)? socketException,
    TResult Function(_File value)? fileException,
    TResult Function(_All value)? allExcption,
    TResult Function(_NoExcption value)? noExcption,
    required TResult orElse(),
  }) {
    if (noExcption != null) {
      return noExcption(this);
    }
    return orElse();
  }
}

abstract class _NoExcption implements Failure {
  const factory _NoExcption({required final String error}) = _$_NoExcption;

  String get error;
  @JsonKey(ignore: true)
  _$$_NoExcptionCopyWith<_$_NoExcption> get copyWith =>
      throw _privateConstructorUsedError;
}
