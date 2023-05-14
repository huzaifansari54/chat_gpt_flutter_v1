import 'dart:convert';
import 'dart:io';
import 'package:chat_gpt_flutter/app/model/error_model.dart';
import 'package:chat_gpt_flutter/injectiables/injectable_.dart';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:chat_gpt_flutter/app/common/Exceptions/exception.dart';
import 'package:chat_gpt_flutter/app/model/image_generation_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart';
import 'package:injectable/injectable.dart';
import '../../common/headers.dart';
import '../../model/text_completion_model.dart';
import 'package:path/path.dart';

final apiServicesProvider = Provider<ApiServices>((ref) {
  return getIt<ApiServices>();
});

abstract class IApiServices {
  Future<Either<ImageGenerationModel, Failure>> imageCreation(
      String query, String size);
  Future<Either<TextCompletionModel, Failure>> textCompletion(
      String query, String size);
  Future<Either<ImageGenerationModel, Failure>> imageEdit(
    File imageFile,
    String size,
  );
}

@LazySingleton(as: IApiServices)
class ApiServices implements IApiServices {
  ApiServices({required Dio dio}) : _dio = dio;
  final Dio _dio;

  @override
  Future<Either<ImageGenerationModel, Failure>> imageCreation(
      String query, String size) async {
    Map<String, dynamic> rowParams = {
      "n": int.parse(size),
      "size": "512x512",
      "prompt": query,
    };
    try {
      final response = await _dio.post(endPoint("images/generations"),
          data: rowParams,
          options: Options(
            receiveDataWhenStatusError: true,
            headers: headerBearerOption(OPEN_AI_KEY),
          ));
      if (response.statusCode == 200) {
        final imgs = ImageGenerationModel.fromJson(response.data);
        return left(imgs);
      } else {
        return right(
            Failure.apiError(errorModel: ErrorModel.fromJson(response.data)));
      }
    } on DioError catch (error) {
      return right(Failure.socketException(error: error.toString()));
    } on Exception catch (error) {
      return right(Failure.allExcption(error: error.toString()));
    }
  }

  @override
  Future<Either<TextCompletionModel, Failure>> textCompletion(
      String query, String size) async {
    Map<String, String> rowParams = {
      "model": "text-davinci-003",
      "prompt": query,
    };
    try {
      final response = await _dio.post(endPoint("completions"),
          data: rowParams,
          options: Options(
            headers: headerBearerOption(OPEN_AI_KEY),
          ));

      if (response.statusCode == 200) {
        final text = TextCompletionModel.fromJson(response.data);
        return left(text);
      } else {
        return right(
            Failure.apiError(errorModel: ErrorModel.fromJson(response.data)));
      }
    } on DioError catch (error) {
      return right(Failure.socketException(error: error.toString()));
    } on Exception catch (error) {
      return right(Failure.allExcption(error: error.toString()));
    }
  }

  @override
  Future<Either<ImageGenerationModel, Failure>> imageEdit(
    File imageFile,
    String size,
  ) async {
    try {
      final file = await imageFile.readAsBytes();
      img.Image? image = decodeImage(file);
      img.Image thumbnail = copyResize(image!, width: 120, height: 120);
      final pngImage = File(imageFile.path)
        ..writeAsBytesSync(img.encodePng(thumbnail));
      Map<String, dynamic> rowParams = {
        "n": int.parse(size),
        "size": "512x512",
        'image': await MultipartFile.fromFile(
          pngImage.path,
          filename: basename(imageFile.path),
        )
      };
      final data = FormData.fromMap(
        rowParams,
      );
      final response = await _dio.post(
        endPoint("images/variations"),
        data: data,
        options: Options(
          headers: headerBearerOption(OPEN_AI_KEY),
        ),
      );
      if (response.isOk) {
        final imgs = ImageGenerationModel.fromJson(response.data);
        return left(imgs);
      } else {
        return right(
            Failure.apiError(errorModel: ErrorModel.fromJson(response.data)));
      }
    } on DioError catch (error) {
      return right(Failure.socketException(error: error.toString()));
    } on Exception catch (error) {
      return right(Failure.allExcption(error: error.toString()));
    }
  }
}

extension ResponseX on Response {
  bool get isOk => statusCode == 200;
}
