// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageState {
  Failure get failure => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  Tuple2<bool, bool> get isFavorite => throw _privateConstructorUsedError;
  Tuple2<bool, bool> get isImageDownload => throw _privateConstructorUsedError;
  String get downloadprogress => throw _privateConstructorUsedError;
  bool get isImageShared => throw _privateConstructorUsedError;
  bool get isImageSetAsBackground => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageStateCopyWith<ImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageStateCopyWith<$Res> {
  factory $ImageStateCopyWith(
          ImageState value, $Res Function(ImageState) then) =
      _$ImageStateCopyWithImpl<$Res, ImageState>;
  @useResult
  $Res call(
      {Failure failure,
      String url,
      Tuple2<bool, bool> isFavorite,
      Tuple2<bool, bool> isImageDownload,
      String downloadprogress,
      bool isImageShared,
      bool isImageSetAsBackground});

  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$ImageStateCopyWithImpl<$Res, $Val extends ImageState>
    implements $ImageStateCopyWith<$Res> {
  _$ImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? url = null,
    Object? isFavorite = null,
    Object? isImageDownload = null,
    Object? downloadprogress = null,
    Object? isImageShared = null,
    Object? isImageSetAsBackground = null,
  }) {
    return _then(_value.copyWith(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as Tuple2<bool, bool>,
      isImageDownload: null == isImageDownload
          ? _value.isImageDownload
          : isImageDownload // ignore: cast_nullable_to_non_nullable
              as Tuple2<bool, bool>,
      downloadprogress: null == downloadprogress
          ? _value.downloadprogress
          : downloadprogress // ignore: cast_nullable_to_non_nullable
              as String,
      isImageShared: null == isImageShared
          ? _value.isImageShared
          : isImageShared // ignore: cast_nullable_to_non_nullable
              as bool,
      isImageSetAsBackground: null == isImageSetAsBackground
          ? _value.isImageSetAsBackground
          : isImageSetAsBackground // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res> get failure {
    return $FailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ImageStateCopyWith<$Res>
    implements $ImageStateCopyWith<$Res> {
  factory _$$_ImageStateCopyWith(
          _$_ImageState value, $Res Function(_$_ImageState) then) =
      __$$_ImageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Failure failure,
      String url,
      Tuple2<bool, bool> isFavorite,
      Tuple2<bool, bool> isImageDownload,
      String downloadprogress,
      bool isImageShared,
      bool isImageSetAsBackground});

  @override
  $FailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_ImageStateCopyWithImpl<$Res>
    extends _$ImageStateCopyWithImpl<$Res, _$_ImageState>
    implements _$$_ImageStateCopyWith<$Res> {
  __$$_ImageStateCopyWithImpl(
      _$_ImageState _value, $Res Function(_$_ImageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? url = null,
    Object? isFavorite = null,
    Object? isImageDownload = null,
    Object? downloadprogress = null,
    Object? isImageShared = null,
    Object? isImageSetAsBackground = null,
  }) {
    return _then(_$_ImageState(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as Tuple2<bool, bool>,
      isImageDownload: null == isImageDownload
          ? _value.isImageDownload
          : isImageDownload // ignore: cast_nullable_to_non_nullable
              as Tuple2<bool, bool>,
      downloadprogress: null == downloadprogress
          ? _value.downloadprogress
          : downloadprogress // ignore: cast_nullable_to_non_nullable
              as String,
      isImageShared: null == isImageShared
          ? _value.isImageShared
          : isImageShared // ignore: cast_nullable_to_non_nullable
              as bool,
      isImageSetAsBackground: null == isImageSetAsBackground
          ? _value.isImageSetAsBackground
          : isImageSetAsBackground // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ImageState extends _ImageState {
  const _$_ImageState(
      {required this.failure,
      required this.url,
      required this.isFavorite,
      required this.isImageDownload,
      required this.downloadprogress,
      required this.isImageShared,
      required this.isImageSetAsBackground})
      : super._();

  @override
  final Failure failure;
  @override
  final String url;
  @override
  final Tuple2<bool, bool> isFavorite;
  @override
  final Tuple2<bool, bool> isImageDownload;
  @override
  final String downloadprogress;
  @override
  final bool isImageShared;
  @override
  final bool isImageSetAsBackground;

  @override
  String toString() {
    return 'ImageState(failure: $failure, url: $url, isFavorite: $isFavorite, isImageDownload: $isImageDownload, downloadprogress: $downloadprogress, isImageShared: $isImageShared, isImageSetAsBackground: $isImageSetAsBackground)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageState &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isImageDownload, isImageDownload) ||
                other.isImageDownload == isImageDownload) &&
            (identical(other.downloadprogress, downloadprogress) ||
                other.downloadprogress == downloadprogress) &&
            (identical(other.isImageShared, isImageShared) ||
                other.isImageShared == isImageShared) &&
            (identical(other.isImageSetAsBackground, isImageSetAsBackground) ||
                other.isImageSetAsBackground == isImageSetAsBackground));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure, url, isFavorite,
      isImageDownload, downloadprogress, isImageShared, isImageSetAsBackground);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageStateCopyWith<_$_ImageState> get copyWith =>
      __$$_ImageStateCopyWithImpl<_$_ImageState>(this, _$identity);
}

abstract class _ImageState extends ImageState {
  const factory _ImageState(
      {required final Failure failure,
      required final String url,
      required final Tuple2<bool, bool> isFavorite,
      required final Tuple2<bool, bool> isImageDownload,
      required final String downloadprogress,
      required final bool isImageShared,
      required final bool isImageSetAsBackground}) = _$_ImageState;
  const _ImageState._() : super._();

  @override
  Failure get failure;
  @override
  String get url;
  @override
  Tuple2<bool, bool> get isFavorite;
  @override
  Tuple2<bool, bool> get isImageDownload;
  @override
  String get downloadprogress;
  @override
  bool get isImageShared;
  @override
  bool get isImageSetAsBackground;
  @override
  @JsonKey(ignore: true)
  _$$_ImageStateCopyWith<_$_ImageState> get copyWith =>
      throw _privateConstructorUsedError;
}
