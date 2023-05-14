import 'package:hive/hive.dart';
part 'favorite_image_model.g.dart';

@HiveType(typeId: 0)
class FavoriteImageModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String prompt;
  @HiveField(3)
  final num createdAt;
  @HiveField(4)
  final String url;
  FavoriteImageModel(
      {required this.url,
      required this.image,
      required this.prompt,
      required this.createdAt,
      required this.id});
}
