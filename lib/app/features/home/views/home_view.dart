import 'dart:ui';

import 'package:chat_gpt_flutter/app/common/Constant/colors.dart';
import 'package:chat_gpt_flutter/app/common/Widget/glass_widget.dart';
import 'package:chat_gpt_flutter/app/features/Favorites/favorites.dart';
import 'package:chat_gpt_flutter/app/features/chat_image/views/chat_image_view.dart';
import 'package:chat_gpt_flutter/app/features/chat_text/views/chat_text_view.dart';
import 'package:chat_gpt_flutter/app/features/connectivity/Controller/connectivity_controller.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late final PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final connectivity = ref.watch(connectivityProvider);
    return Scaffold(
      extendBody: true,
      backgroundColor: kWhite,
      body: PageView(
        controller: pageController,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: kblack, borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  !connectivity.isNetworkActive
                      ? Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            'Plaese check your internet',
                            style: TextStyle(color: kWhite),
                          ),
                        )
                      : const SizedBox(),
                  makeCard(Icons.image, "Image generation",
                      Colors.orange.withOpacity(0.5), () {
                    Navigator.pushNamed(context, Routes.imageScreen);
                  }, 'assets/ai-art.webp'),
                  makeCard(Icons.text_fields_sharp, "Text completion",
                      Colors.green.withOpacity(0.5), () async {
                    await Navigator.pushNamed(context, Routes.chatScreen);
                  }, 'assets/lensa_ai_1-one_one.jpg'),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: kblack, borderRadius: BorderRadius.circular(20)),
              child: const FavoritePage()),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Glass(
          child: Container(
            height: 70,
            width: 100,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.home,
                        color: kpink,
                      ),
                      Text('Home', style: TextStyle(color: kpink)),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(1);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.favorite,
                        color: kpink,
                      ),
                      Text('Favorites', style: TextStyle(color: kpink)),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     pageController.jumpToPage(2);
                //   },
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: const [
                //       Icon(
                //         Icons.rocket,
                //         color: kpink,
                //       ),
                //       Text(
                //         'Image Genration',
                //         style: TextStyle(color: kpink),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget makeCard(var image, var text, var color, var callback, var url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: callback,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              top: null,
              bottom: 0,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(30),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                                colors: [Colors.purple, primaryColor],
                                begin: Alignment.bottomLeft,
                                end: Alignment.bottomRight)
                            .createShader(bounds);
                      },
                      child: Text(
                        text.toString().toUpperCase(),
                        style: const TextStyle(
                            color: primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
