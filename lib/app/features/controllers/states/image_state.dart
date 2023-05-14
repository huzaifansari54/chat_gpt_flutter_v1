import 'package:chat_gpt_flutter/app/common/Exceptions/exception.dart';
import 'package:chat_gpt_flutter/app/model/image_generation_model.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_state.freezed.dart';

enum ApiState { loading, success, error, notFound }

@freezed
class ImageState with _$ImageState {
  const factory ImageState(
      {required Failure failure,
      required String url,
      required Tuple2<bool, bool> isFavorite,
      required Tuple2<bool, bool> isImageDownload,
      required String downloadprogress,
      required bool isImageShared,
      required bool isImageSetAsBackground}) = _ImageState;
  const ImageState._();

  factory ImageState.intial() {
    return ImageState(
        isFavorite: tuple2(true, false),
        url: '',
        downloadprogress: '0',
        failure: const Failure.noExcption(error: ''),
        isImageDownload: tuple2(true, false),
        isImageShared: false,
        isImageSetAsBackground: false);
  }
}
