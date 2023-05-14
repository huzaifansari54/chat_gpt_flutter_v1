import 'dart:convert';
import 'package:chat_gpt_flutter/app/common/Constant/colors.dart';
import 'package:chat_gpt_flutter/app/features/controllers/image_state_controller.dart';
import 'package:chat_gpt_flutter/app/model/HiveModel/favorite_image_model.dart';
import 'package:chat_gpt_flutter/injectiables/injectable_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';

import '../../common/Widget/glass_widget.dart';
import '../chat_image/views/chat_image_view.dart';
import '../chat_image/views/widgets/show_image.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({super.key});

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  bool isShare = false;
  bool isDownlaod = false;
  bool isSetBackground = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    return ValueListenableBuilder(
        valueListenable: getIt<Box<FavoriteImageModel>>().listenable(),
        builder: (context, data, _) {
          if (data.values.isEmpty) {
            return const Center(
              child: Text(
                'No Favorite images',
                style: TextStyle(color: kpink),
              ),
            );
          }
          return ListView.builder(
              itemCount: data.values.length,
              itemBuilder: (context, index) {
                final fav = data.values.toList()[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                ShowImage(image: fav.image))));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.memory(base64.decode(fav.image))),
                        Positioned.fill(
                          top: null,
                          child: SizedBox(
                            height: 100,
                            child: Glass(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      BottomBottuns(
                                        name: 'Delete',
                                        iconData: Icons.delete,
                                        onTap: () {
                                          ref
                                              .read(imageStateNotifierProvider
                                                  .notifier)
                                              .delete(fav.id, fav.url);
                                        },
                                      ),
                                      isDownlaod
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                  backgroundColor:
                                                      primaryColor),
                                            )
                                          : BottomBottuns(
                                              name: 'Downloade',
                                              iconData: Icons.download,
                                              onTap: () async {
                                                setState(() {
                                                  isDownlaod = true;
                                                });
                                                await ImageGallerySaver
                                                    .saveImage(
                                                        base64
                                                            .decode(fav.image),
                                                        name: Uri.parse(fav.url)
                                                            .pathSegments
                                                            .last);
                                                setState(() {
                                                  isDownlaod = false;
                                                });
                                              },
                                            ),
                                      isShare
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                  backgroundColor:
                                                      primaryColor),
                                            )
                                          : BottomBottuns(
                                              name: 'Share',
                                              iconData: Icons.share_rounded,
                                              onTap: () async {
                                                setState(() {
                                                  isShare = true;
                                                });
                                                await Share.shareXFiles([
                                                  XFile.fromData(
                                                      base64.decode(fav.image),
                                                      mimeType: 'png')
                                                ]);
                                                setState(() {
                                                  isShare = false;
                                                });
                                              },
                                            ),
                                      isSetBackground
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                                  backgroundColor:
                                                      primaryColor),
                                            )
                                          : BottomBottuns(
                                              name: 'Set as Backround',
                                              iconData: Icons.wallpaper,
                                              onTap: () async {
                                                setState(() {
                                                  isDownlaod = true;
                                                });
                                                // await ImageGallerySaver
                                                //     .saveImage(
                                                //         base64
                                                //             .decode(fav.image),
                                                //         name: Uri.parse(fav.url)
                                                //             .pathSegments
                                                //             .last);
                                                setState(() {
                                                  isDownlaod = false;
                                                });
                                              },
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
