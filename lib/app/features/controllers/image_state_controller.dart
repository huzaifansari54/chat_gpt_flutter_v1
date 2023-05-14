import 'package:chat_gpt_flutter/app/Services/Db/db_service.dart';
import 'package:chat_gpt_flutter/app/Services/InternalApi/internal_api_service.dart';
import 'package:chat_gpt_flutter/app/common/Constant/colors.dart';
import 'package:chat_gpt_flutter/app/common/Exceptions/exception.dart';
import 'package:chat_gpt_flutter/app/features/controllers/states/image_state.dart';
import 'package:chat_gpt_flutter/app/model/HiveModel/favorite_image_model.dart';
import 'package:chat_gpt_flutter/app/model/image_generation_model.dart';
import 'package:chat_gpt_flutter/injectiables/injectable_.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:injectable/injectable.dart';

final imageStateNotifierProvider =
    StateNotifierProvider<ImageStateController, List<ImageState>>(((ref) {
  final iinternaApi = ref.read(internalServiceProvider);
  return ImageStateController(iinternaApi);
}));

@injectable
class ImageStateController extends StateNotifier<List<ImageState>> {
  ImageStateController(IinternaApi iinternaApi)
      : _iinternaApi = iinternaApi,
        super([ImageState.intial()]) {
    db = getIt<DbRepository>();
  }
  final IinternaApi _iinternaApi;
  late final IDbService db;
  List<ImageGenerationData> _data = [];

  void uploadData(List<ImageGenerationData> data) {
    _data = data;

    state = [
      for (final event in data)
        ImageState(
            failure: const Failure.noExcption(error: ''),
            url: event.url,
            isImageDownload: const Tuple2(true, false),
            downloadprogress: '0',
            isImageShared: true,
            isImageSetAsBackground: true,
            isFavorite: tuple2(true, false))
    ];

    // state = state
    //     .copyWith(isImageDownload: {for (var data in _data) data.url: true});
    // state.isImageDownload.addAll({for (var data in _data) data.url: true});
    // state.isImageSetAsBackground
    //     .addAll({for (var data in _data) data.url: true});
    // state.isImageShared.addAll({for (var data in _data) data.url: true});
  }

  Future<List<FavoriteImageModel>> get favoriteList async => db.favoriteList;
  void updateToggle(String url) {
    state = [
      for (final event in state)
        if (event.url == url)
          ImageState(
            failure: event.failure,
            url: event.url,
            isImageDownload: Tuple2(event.isImageDownload.value1, false),
            downloadprogress: event.downloadprogress,
            isImageShared: event.isImageShared,
            isImageSetAsBackground: event.isImageSetAsBackground,
            isFavorite: event.isFavorite,
          )
        else
          event
    ];
  }

  void delete(String id, String url) async {
    await db.delete(id: id);
    state = [
      for (final event in state)
        if (event.url == url)
          ImageState(
            failure: event.failure,
            url: url,
            isImageDownload: event.isImageDownload,
            downloadprogress: event.downloadprogress,
            isImageShared: event.isImageShared,
            isImageSetAsBackground: event.isImageSetAsBackground,
            isFavorite: const Tuple2(true, false),
          )
        else
          event
    ];
    // state = state.copyWith(isImageDownload: false, downloadprogress: '0');

    // state = state.copyWith(isImageDownload: true, downloadprogress: '0');
  }

  void addInFavoriteList(
      {required String url,
      required String prompt,
      required num createdAt}) async {
    state = [
      for (final event in state)
        if (event.url == url)
          ImageState(
            failure: event.failure,
            url: url,
            isImageDownload: event.isImageDownload,
            downloadprogress: event.downloadprogress,
            isImageShared: event.isImageShared,
            isImageSetAsBackground: event.isImageSetAsBackground,
            isFavorite: const Tuple2(false, false),
          )
        else
          event
    ];
    // state = state.copyWith(isImageDownload: false, downloadprogress: '0');

    final img = await _iinternaApi.addFavorites(url, ((p0, p1) {
      final downloadProgress = (p0 / p1);
      state = [
        for (final event in state)
          if (event.url == url)
            ImageState(
              failure: event.failure,
              url: event.url,
              isImageDownload: event.isImageDownload,
              downloadprogress: downloadProgress.toString(),
              isImageShared: event.isImageShared,
              isImageSetAsBackground: event.isImageSetAsBackground,
              isFavorite: const Tuple2(false, false),
            )
          else
            event
      ];
      // state = state.copyWith(downloadprogress: downloadProgress.toString());
    }));

    // state = state.copyWith(isImageDownload: true, downloadprogress: '0');

    img.fold(
      (l) async {
        await db.add(
            favoriteImageModel: FavoriteImageModel(
                url: url,
                image: l,
                prompt: prompt,
                createdAt: createdAt,
                id: Uid.id.v4()));
        state = [
          for (final event in state)
            if (event.url == url)
              ImageState(
                failure: event.failure,
                url: event.url,
                isImageDownload: event.isImageDownload,
                downloadprogress: event.downloadprogress,
                isImageShared: event.isImageShared,
                isImageSetAsBackground: event.isImageSetAsBackground,
                isFavorite: const Tuple2(false, true),
              )
            else
              event
        ];
        // state = state.copyWith(isImageDownload: false, downloadprogress: '0');
      },
      (r) {
        state = [
          for (final event in state)
            if (event.url == url)
              ImageState(
                failure: r,
                url: event.url,
                isImageDownload: event.isImageDownload,
                downloadprogress: event.downloadprogress,
                isImageShared: event.isImageShared,
                isImageSetAsBackground: event.isImageSetAsBackground,
                isFavorite: const Tuple2(true, false),
              )
            else
              event
        ];
        // state = state.copyWith(
        //     failure: r, isImageDownload: false, downloadprogress: '0');
      },
    );
  }

  void imageDownload(String url) async {
    state = [
      for (final event in state)
        if (event.url == url)
          ImageState(
            failure: const Failure.noExcption(error: ''),
            url: url,
            isImageDownload: const Tuple2(false, false),
            downloadprogress: event.downloadprogress,
            isImageShared: event.isImageShared,
            isImageSetAsBackground: event.isImageSetAsBackground,
            isFavorite: event.isFavorite,
          )
        else
          event
    ];
    // state = state.copyWith(isImageDownload: false, downloadprogress: '0');

    final img = await _iinternaApi.imageDownload(url, ((p0, p1) {
      final downloadProgress = (p0 / p1);
      state = [
        for (final event in state)
          if (event.url == url)
            ImageState(
              failure: event.failure,
              url: event.url,
              isImageDownload: const Tuple2(false, false),
              downloadprogress: downloadProgress.toString(),
              isImageShared: event.isImageShared,
              isImageSetAsBackground: event.isImageSetAsBackground,
              isFavorite: event.isFavorite,
            )
          else
            event
      ];
      // state = state.copyWith(downloadprogress: downloadProgress.toString());
    }));

    // state = state.copyWith(isImageDownload: true, downloadprogress: '0');

    img.fold(
      (l) {
        state = [
          for (final event in state)
            if (event.url == url)
              ImageState(
                failure: event.failure,
                url: event.url,
                isImageDownload: const Tuple2(false, true),
                downloadprogress: event.downloadprogress,
                isImageShared: event.isImageShared,
                isImageSetAsBackground: event.isImageSetAsBackground,
                isFavorite: event.isFavorite,
              )
            else
              event
        ];
        // state = state.copyWith(isImageDownload: false, downloadprogress: '0');
      },
      (r) {
        state = [
          for (final event in state)
            if (event.url == url)
              ImageState(
                failure: r,
                url: event.url,
                isImageDownload: const Tuple2(true, false),
                downloadprogress: event.downloadprogress,
                isImageShared: event.isImageShared,
                isImageSetAsBackground: event.isImageSetAsBackground,
                isFavorite: event.isFavorite,
              )
            else
              event
        ];
        // state = state.copyWith(
        //     failure: r, isImageDownload: false, downloadprogress: '0');
      },
    );
  }

  void shareImage(String url) async {
    state = [
      for (final event in state)
        if (event.url == url)
          ImageState(
            failure: event.failure,
            url: url,
            isImageDownload: event.isImageDownload,
            downloadprogress: event.downloadprogress,
            isImageShared: false,
            isImageSetAsBackground: event.isImageSetAsBackground,
            isFavorite: event.isFavorite,
          )
        else
          event
    ];
    // state = state.copyWith(isImageDownload: false, downloadprogress: '0');

    final img = await _iinternaApi.shareImage(url, ((p0, p1) {
      final downloadProgress = (p0 / p1);
      state = [
        for (final event in state)
          if (event.url == url)
            ImageState(
              failure: event.failure,
              url: event.url,
              isImageDownload: event.isImageDownload,
              downloadprogress: event.downloadprogress,
              isImageShared: false,
              isImageSetAsBackground: event.isImageSetAsBackground,
              isFavorite: event.isFavorite,
            )
          else
            event
      ];
      // state = state.copyWith(downloadprogress: downloadProgress.toString());
    }));

    // state = state.copyWith(isImageDownload: true, downloadprogress: '0');

    img.fold(
      (l) {
        state = [
          for (final event in state)
            if (event.url == url)
              ImageState(
                failure: const Failure.noExcption(error: ''),
                url: event.url,
                isImageDownload: event.isImageDownload,
                downloadprogress: event.downloadprogress,
                isImageShared: true,
                isImageSetAsBackground: event.isImageSetAsBackground,
                isFavorite: event.isFavorite,
              )
            else
              event
        ];
        // state = state.copyWith(isImageDownload: false, downloadprogress: '0');
      },
      (r) {
        state = [
          for (final event in state)
            if (event.url == url)
              ImageState(
                failure: r,
                url: event.url,
                isImageDownload: event.isImageDownload,
                downloadprogress: event.downloadprogress,
                isImageShared: event.isImageShared,
                isImageSetAsBackground: event.isImageSetAsBackground,
                isFavorite: event.isFavorite,
              )
            else
              event
        ];
        // state = state.copyWith(
        //     failure: r, isImageDownload: false, downloadprogress: '0');
      },
    );
    // state = state.copyWith(isImageShared: false, url: url);
    // final img = await _iinternaApi.shareImage(url);
    // img.fold((l) {
    //   state = state = state.copyWith(isImageShared: true);
    // }, (r) {
    //   state = state.copyWith(isImageShared: false, failure: r);
    // });
  }

  void setImageAsBackground(String url) async {
    state = [
      for (final event in state)
        if (event.url == url)
          ImageState(
            failure: event.failure,
            url: url,
            isImageDownload: event.isImageDownload,
            downloadprogress: event.downloadprogress,
            isImageShared: event.isImageShared,
            isImageSetAsBackground: false,
            isFavorite: event.isFavorite,
          )
        else
          event
    ];
    // state = state.copyWith(isImageDownload: false, downloadprogress: '0');

    final img = await _iinternaApi.setInBackground(url, ((p0, p1) {
      final downloadProgress = (p0 / p1);
      state = [
        for (final event in state)
          if (event.url == url)
            ImageState(
              failure: event.failure,
              url: event.url,
              isImageDownload: event.isImageDownload,
              downloadprogress: event.downloadprogress,
              isImageShared: event.isImageShared,
              isImageSetAsBackground: false,
              isFavorite: event.isFavorite,
            )
          else
            event
      ];
      // state = state.copyWith(downloadprogress: downloadProgress.toString());
    }));

    // state = state.copyWith(isImageDownload: true, downloadprogress: '0');

    img.fold(
      (l) {
        state = [
          for (final event in state)
            if (event.url == url)
              ImageState(
                failure: const Failure.allExcption(error: ''),
                url: event.url,
                isImageDownload: event.isImageDownload,
                downloadprogress: event.downloadprogress,
                isImageShared: event.isImageShared,
                isImageSetAsBackground: true,
                isFavorite: event.isFavorite,
              )
            else
              event
        ];
        // state = state.copyWith(isImageDownload: false, downloadprogress: '0');
      },
      (r) {
        state = [
          for (final event in state)
            if (event.url == url)
              ImageState(
                failure: r,
                url: event.url,
                isImageDownload: event.isImageDownload,
                downloadprogress: event.downloadprogress,
                isImageShared: event.isImageShared,
                isImageSetAsBackground: event.isImageSetAsBackground,
                isFavorite: event.isFavorite,
              )
            else
              event
        ];
        // state = state.copyWith(
        //     failure: r, isImageDownload: false, downloadprogress: '0');
      },
    );

    //   state = state = state.copyWith(isImageSetAsBackground: false);

    //   final img = await _iinternaApi.setInBackground(url);
    //   img.fold((l) {
    //     state = state = state.copyWith(isImageSetAsBackground: true);
    //   }, (r) {
    //     state = state.copyWith(isImageDownload: false, failure: r);
    //   });
  }
}
