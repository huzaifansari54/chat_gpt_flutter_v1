import 'dart:convert';
import 'dart:io';
import 'package:chat_gpt_flutter/app/common/Exceptions/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

@injectable
class IOApi {
  IOApi({required Dio dio, required Directory directory})
      : _dio = dio,
        _directory = directory;
  final Dio _dio;
  Map<String, Tuple2<Uint8List, File>> get cache => _cacheMap;
  final Directory _directory;
  final Map<String, Tuple2<Uint8List, File>> _cacheMap = {};
  Future<Either<String, Failure>> imageDownload(
      String url, void Function(int, int)? onReceiveProgress) async {
    final permissio = await Permission.storage.request();
    if (permissio.isGranted) {
      try {
        if (!_cacheMap.containsKey(url)) {
          final file =
              File('${_directory.path}${Uri.parse(url).pathSegments.last}');
          final body = await _dio.get(url,
              onReceiveProgress: onReceiveProgress,
              options: Options(responseType: ResponseType.bytes));

          final data = body.data;
          file.writeAsBytesSync(data);
          _cacheMap[url] = Tuple2(data, file);

          final datas = await ImageGallerySaver.saveImage(
              _cacheMap[url]!.value1,
              name: Uri.parse(url).pathSegments.last);
          return left(datas.toString());
        } else {
          await ImageGallerySaver.saveImage(_cacheMap[url]!.value1,
              name: Uri.parse(url).pathSegments.last);

          return left('image Already Exist');
        }
      } on FileSystemException catch (error) {
        return right(Failure.fileException(error: error.toString()));
      } on DioError catch (error) {
        return right(Failure.socketException(error: error.toString()));
      } on Exception catch (error) {
        return right(Failure.allExcption(error: error.toString()));
      }
    } else {
      await openAppSettings();
      return left('Please give permission first');
    }
  }

  Future<Either<String, Failure>> shareImage(
      String url, void Function(int, int)? onRecieved) async {
    try {
      if (!_cacheMap.containsKey(url)) {
        final file =
            File('${_directory.path}${Uri.parse(url).pathSegments.last}');
        final body = await _dio.get(url,
            options: Options(responseType: ResponseType.bytes),
            onReceiveProgress: onRecieved);
        final data = body.data;
        file.writeAsBytesSync(data);
        _cacheMap[url] = Tuple2(data, file);
        await Share.shareXFiles([XFile(_cacheMap[url]!.value2.path)],
            text: 'i created from AI');
        return left('share...');
      } else {
        await Share.shareXFiles([XFile(_cacheMap[url]!.value2.path)],
            text: 'i created from AI');
        return left('share...');
      }
    } on FileSystemException catch (error) {
      return right(Failure.fileException(error: error.toString()));
    } on SocketException catch (error) {
      return right(Failure.socketException(error: error.toString()));
    } on Exception catch (error) {
      return right(Failure.allExcption(error: error.toString()));
    }
  }

  Future<Either<String, Failure>> favoriteImageAdd(
      String url, void Function(int, int)? onRecieved) async {
    try {
      if (!_cacheMap.containsKey(url)) {
        final file =
            File('${_directory.path}${Uri.parse(url).pathSegments.last}');
        final body = await _dio.get(url,
            options: Options(responseType: ResponseType.bytes),
            onReceiveProgress: onRecieved);
        final data = body.data;
        file.writeAsBytesSync(data);
        _cacheMap[url] = Tuple2(data, file);

        return left(base64.encode(data));
      } else {
        return left(base64.encode(_cacheMap[url]!.value1));
      }
    } on FileSystemException catch (error) {
      return right(Failure.fileException(error: error.toString()));
    } on SocketException catch (error) {
      return right(Failure.socketException(error: error.toString()));
    } on Exception catch (error) {
      return right(Failure.allExcption(error: error.toString()));
    }
  }

  Future<Either<String, Failure>> saveAsBackground(
      String url, void Function(int, int)? onRecieved) async {
    try {
      if (!_cacheMap.containsKey(url)) {
        final file =
            File('${_directory.path}${Uri.parse(url).pathSegments.last}');
        final body = await _dio.get(url,
            options: Options(responseType: ResponseType.bytes),
            onReceiveProgress: onRecieved);
        final data = body.data;
        file.writeAsBytesSync(data);
        _cacheMap[url] = Tuple2(data, file);
        await WallpaperManagerFlutter().setwallpaperfromFile(
            _cacheMap[url]?.value2, WallpaperManagerFlutter.BOTH_SCREENS);
        return left('set As Wallpaper');
      } else {
        await WallpaperManagerFlutter().setwallpaperfromFile(
            _cacheMap[url]?.value2, WallpaperManagerFlutter.BOTH_SCREENS);
        return left('Already Set as Wallpaper');
      }
    } on FileSystemException catch (error) {
      return right(Failure.fileException(error: error.toString()));
    } on SocketException catch (error) {
      return right(Failure.socketException(error: error.toString()));
    } on Exception catch (error) {
      return right(Failure.allExcption(error: error.toString()));
    }
  }
}
