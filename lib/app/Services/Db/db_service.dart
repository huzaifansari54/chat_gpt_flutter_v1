import 'package:chat_gpt_flutter/app/model/HiveModel/favorite_image_model.dart';
import 'package:chat_gpt_flutter/injectiables/injectable_.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class IDbService {
  Future<void> add({required FavoriteImageModel favoriteImageModel});
  Future<void> delete({required String id});
  Future<void> update({required FavoriteImageModel favoriteImageModel});
  Future<List<FavoriteImageModel>> get favoriteList;
}

@injectable
@LazySingleton(as: IDbService)
class DbRepository extends IDbService {
  DbRepository() {
    db = getIt<Box<FavoriteImageModel>>();
  }
  late final Box<FavoriteImageModel> db;
  @override
  Future<void> add({required FavoriteImageModel favoriteImageModel}) async {
    await db.put(favoriteImageModel.id, favoriteImageModel);
  }

  @override
  Future<void> delete({required String id}) async {
    await db.delete(id);
  }

  @override
  Future<List<FavoriteImageModel>> get favoriteList async => db.values.toList();

  @override
  Future<void> update({required FavoriteImageModel favoriteImageModel}) async {
    await db.put(favoriteImageModel.id, favoriteImageModel);
  }
}
