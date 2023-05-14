import 'dart:io';

import 'package:chat_gpt_flutter/app/common/Helper/io_apis.dart';
import 'package:chat_gpt_flutter/injectiables/injectable_.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import '../../common/Exceptions/exception.dart';

final internalServiceProvider =
    Provider<IntenalApis>(((ref) => IntenalApis(getIt.get())));

abstract class IinternaApi {
  Map<String, Tuple2<Uint8List, File>> get cache;
  Future<Either<String, Failure>> imageDownload(
      String url, void Function(int, int)? onReceiveProgress);
  Future<Either<String, Failure>> addFavorites(
      String url, void Function(int, int)? onReceiveProgress);
  Future<Either<String, Failure>> shareImage(
      String url, void Function(int, int)? onRecieved);
  Future<Either<String, Failure>> setInBackground(
      String url, void Function(int, int)? onRecieved);
}

@Singleton(as: IinternaApi)
class IntenalApis extends IinternaApi {
  final IOApi ioApi;

  IntenalApis(this.ioApi);
  @override
  Future<Either<String, Failure>> imageDownload(
      String url, void Function(int, int)? onReceiveProgress) async {
    return await ioApi.imageDownload(url, onReceiveProgress);
  }

  @override
  Future<Either<String, Failure>> setInBackground(
      String url, void Function(int, int)? onRecieved) async {
    await Future.delayed(const Duration(seconds: 1));
    return await ioApi.saveAsBackground(url, onRecieved);
  }

  @override
  Future<Either<String, Failure>> shareImage(
      String url, void Function(int, int)? onRevcieved) async {
    return await ioApi.shareImage(url, onRevcieved);
  }

  @override
  Map<String, Tuple2<Uint8List, File>> get cache => ioApi.cache;

  @override
  Future<Either<String, Failure>> addFavorites(
      String url, void Function(int p1, int p2)? onReceiveProgress) async {
    return await ioApi.favoriteImageAdd(url, onReceiveProgress);
  }
}
