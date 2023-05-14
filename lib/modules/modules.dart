import 'dart:io';
import 'package:chat_gpt_flutter/app/model/HiveModel/favorite_image_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

@module
abstract class InjectableModules {
  @singleton
  Connectivity get connectivity => Connectivity();
  @singleton
  Dio get deo => Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! <= 500;
        },
      ));
  @preResolve
  Future<Directory> get directory async => await getTemporaryDirectory();
  @preResolve
  Future<Box<FavoriteImageModel>> get hiveBox async =>
      await Hive.openBox<FavoriteImageModel>('favorite');
}
