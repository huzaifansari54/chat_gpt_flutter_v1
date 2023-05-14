import 'package:chat_gpt_flutter/app/features/Favorites/favorites.dart';
import 'package:chat_gpt_flutter/app/features/chat_image/views/widgets/show_image.dart';
import 'package:chat_gpt_flutter/app/features/chat_text/views/chat_text_view.dart';
import 'package:flutter/material.dart';

import '../features/chat_image/views/chat_image_view.dart';
import '../features/home/views/home_view.dart';

class Routes {
  static const String chatScreen = '/chatScreen';
  static const String imageScreen = '/imageScreen';
  static const String favoriteScreen = '/favoriteScreen';
  static const String showScreen = '/showScreen';
  static Map<String, Widget Function(BuildContext)> routes(
      [String image = "assets/ai-art.webp"]) {
    return {
      '/': (p0) {
        return const HomeView();
      },
      Routes.chatScreen: (p0) {
        return const ChatTextView();
      },
      Routes.imageScreen: (p0) {
        return const ChatImageView();
      },
      Routes.favoriteScreen: (p0) {
        return const FavoritePage();
      },
      Routes.showScreen: (p0) {
        return ShowImage(image: image);
      },
    };
  }
}
