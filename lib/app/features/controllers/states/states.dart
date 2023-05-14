import 'package:chat_gpt_flutter/app/model/text_completion_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/image_generation_model.dart';

part 'states.freezed.dart';

@freezed
class ImageCreationResultStates with _$ImageCreationResultStates {
  const factory ImageCreationResultStates.loading() = _Loading;
  const factory ImageCreationResultStates.intial() = _Intial;
  const factory ImageCreationResultStates.erorr({required Object erorr}) =
      _Erorr;
  const factory ImageCreationResultStates.resultLoaded(
      {required ImageGenerationModel images}) = _ResultLoaded;
  const factory ImageCreationResultStates.textCompletionLoaded(
          {required TextCompletionModel textCompletionModel}) =
      _TextCompletionLoaded;
}
