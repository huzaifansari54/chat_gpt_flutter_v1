import 'dart:io';
import 'package:chat_gpt_flutter/app/Services/Apis/api_services.dart';
import 'package:chat_gpt_flutter/app/common/Exceptions/exception.dart';
import 'package:chat_gpt_flutter/app/features/controllers/image_state_controller.dart';
import 'package:chat_gpt_flutter/app/features/controllers/states/states.dart';
import 'package:chat_gpt_flutter/app/model/text_completion_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

final stateControllerNotifier =
    StateNotifierProvider<StateController, ImageCreationResultStates>((ref) {
  final services = ref.watch(apiServicesProvider);
  return StateController(services, ref);
});

@injectable
class StateController extends StateNotifier<ImageCreationResultStates> {
  final IApiServices _apiServices;
  List<TextCompletionData> chats = [];
  final Ref _ref;

  StateController(IApiServices apiServices, this._ref)
      : _apiServices = apiServices,
        super(const ImageCreationResultStates.intial());

  void imageCreations(String query, String size) async {
    state = const ImageCreationResultStates.loading();
    final imgs = await _apiServices.imageCreation(query, size);
    imgs.fold((img) {
      _ref.read(imageStateNotifierProvider.notifier).uploadData(img.data);

      state = ImageCreationResultStates.resultLoaded(images: img);
    }, (failure) {
      state = ImageCreationResultStates.erorr(erorr: failure);
    });
  }

  void imageEdit(String size) async {
    final img =
        await ImagePicker.platform.getImage(source: ImageSource.gallery);
    state = const ImageCreationResultStates.loading();

    if (img == null) {
      state = const ImageCreationResultStates.erorr(
          erorr: Failure.allExcption(error: 'Please first select image'));
      return;
    }
    final file = File(img.path);
    final imgs = await _apiServices.imageEdit(file, size);
    imgs.fold((img) {
      _ref.read(imageStateNotifierProvider.notifier).uploadData(img.data);
      state = ImageCreationResultStates.resultLoaded(images: img);
    }, (failure) {
      state = ImageCreationResultStates.erorr(erorr: failure);
    });
  }

  void textCompletion(String query, String size) async {
    state = const ImageCreationResultStates.loading();
    final text = await _apiServices.textCompletion(query, size);
    text.fold((text) {
      state = ImageCreationResultStates.textCompletionLoaded(
          textCompletionModel: text);
      chats.add(text.choices.first);
    }, (failure) {
      state = ImageCreationResultStates.erorr(erorr: failure);
    });
  }
}
