import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_gpt_flutter/app/common/Constant/colors.dart';
import 'package:chat_gpt_flutter/app/model/image_generation_model.dart';

import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.images}) : super(key: key);

  final ImageGenerationData images;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: images.url,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 10,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: downloadProgress.progress,
                    color: primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    gradient:
                        const LinearGradient(colors: [primaryColor, kpurpul]),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          );
        },
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
