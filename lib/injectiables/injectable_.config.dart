// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i10;

import 'package:chat_gpt_flutter/app/common/Helper/io_apis.dart' as _i12;
import 'package:chat_gpt_flutter/app/features/connectivity/Controller/connectivity_controller.dart'
    as _i7;
import 'package:chat_gpt_flutter/app/features/controllers/image_state_controller.dart'
    as _i14;
import 'package:chat_gpt_flutter/app/features/controllers/states_controller.dart'
    as _i15;
import 'package:chat_gpt_flutter/app/model/HiveModel/favorite_image_model.dart'
    as _i4;
import 'package:chat_gpt_flutter/app/Services/Apis/api_services.dart' as _i11;
import 'package:chat_gpt_flutter/app/Services/Connection/connection_service.dart'
    as _i5;
import 'package:chat_gpt_flutter/app/Services/Db/db_service.dart' as _i8;
import 'package:chat_gpt_flutter/app/Services/InternalApi/internal_api_service.dart'
    as _i13;
import 'package:chat_gpt_flutter/modules/modules.dart' as _i17;
import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i9;
import 'package:flutter_riverpod/flutter_riverpod.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModules = _$InjectableModules();
    await gh.factoryAsync<_i3.Box<_i4.FavoriteImageModel>>(
      () => injectableModules.hiveBox,
      preResolve: true,
    );
    gh.factory<_i5.ConnectionsService>(() => _i5.ConnectionsService());
    gh.singleton<_i6.Connectivity>(injectableModules.connectivity);
    gh.lazySingleton<_i7.ConnectivityStateController>(
        () => _i7.ConnectivityStateController());
    gh.factory<_i8.DbRepository>(() => _i8.DbRepository());
    gh.singleton<_i9.Dio>(injectableModules.deo);
    await gh.factoryAsync<_i10.Directory>(
      () => injectableModules.directory,
      preResolve: true,
    );
    gh.lazySingleton<_i11.IApiServices>(
        () => _i11.ApiServices(dio: gh<_i9.Dio>()));
    gh.factory<_i12.IOApi>(() => _i12.IOApi(
          dio: gh<_i9.Dio>(),
          directory: gh<_i10.Directory>(),
        ));
    gh.singleton<_i13.IinternaApi>(_i13.IntenalApis(gh<_i12.IOApi>()));
    gh.factory<_i14.ImageStateController>(
        () => _i14.ImageStateController(gh<_i13.IinternaApi>()));
    gh.factory<_i15.StateController>(() => _i15.StateController(
          gh<_i11.IApiServices>(),
          gh<_i16.Ref<Object?>>(),
        ));
    return this;
  }
}

class _$InjectableModules extends _i17.InjectableModules {}
