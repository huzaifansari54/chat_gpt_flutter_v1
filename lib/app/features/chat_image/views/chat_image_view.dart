import 'dart:math';
import 'package:chat_gpt_flutter/app/common/Constant/colors.dart';
import 'package:chat_gpt_flutter/app/common/Exceptions/exception.dart';
import 'package:chat_gpt_flutter/app/common/Widget/glass_widget.dart';
import 'package:chat_gpt_flutter/app/features/chat_image/views/widgets/show_image.dart';
import 'package:chat_gpt_flutter/app/features/controllers/image_state_controller.dart';
import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common/search_text_field_widget.dart';
import '../../../model/error_model.dart';
import '../../controllers/states_controller.dart';
import 'widgets/image_card.dart';

class ChatImageView extends ConsumerStatefulWidget {
  const ChatImageView({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatImageView> createState() => _ChatImageViewState();
}

class _ChatImageViewState extends ConsumerState<ChatImageView> {
  late final TextEditingController searchTextController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  String value = '1';
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(stateControllerNotifier);
    final utils = ref.watch(imageStateNotifierProvider);
    ref.listen(
      imageStateNotifierProvider,
      (previous, next) {
        for (var element in next) {
          if (element.isImageDownload.value2) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(20),
                content: Text('Downloaded is Completed')));
            ref
                .read(imageStateNotifierProvider.notifier)
                .updateToggle(element.url);
          }

          element.failure.when(
              apiError: (apiError) {},
              socketException: (socketException) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(20),
                    content: Text('please try Internet connection')));
              },
              fileException: (fileException) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(20),
                    content: Text('some thing went wrong please try again ')));
              },
              allExcption: (allExcption) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(20),
                    content: Text('some thing went wrong please try again ')));
              },
              noExcption: (noExcption) {});
        }
      },
      onError: (error, stackTrace) {},
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black87,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
              floating: true,
              delegate: CustomPersistHeader(
                searchTextController: searchTextController,
                onTap: () {
                  if (searchTextController.text.trim().isNotEmpty) {
                    ref
                        .read(stateControllerNotifier.notifier)
                        .imageCreations(searchTextController.text, value);
                    FocusScope.of(context).unfocus();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(20),
                        content: Text('please write query')));
                  }
                },
                dropdownvalue: value,
                items: ['1', '2', '3', '4', '5'],
                onImageSelect: () {
                  ref.read(stateControllerNotifier.notifier).imageEdit(
                        value,
                      );
                },
                onNumberSelect: () {},
                valueChanged: (String? valu) {
                  setState(() {
                    value = valu!;
                  });
                },
              )),

          data.maybeWhen(
            intial: () {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.keyboard_alt_outlined,
                        color: primaryColor,
                        size: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Writte your query'.toUpperCase(),
                          style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: (() => SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                )),
            erorr: ((erorr) => SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          (erorr as Failure).when(noExcption: (error) {
                            return '';
                          }, socketException: (s) {
                            return 'please check your internet';
                          }, fileException: (fileException) {
                            return 'Try Again Latrer';
                          }, allExcption: (allExcption) {
                            return 'Try Again Latrer $allExcption';
                          }, apiError: (ErrorModel errorModel) {
                            return 'Try Again Latrer ${errorModel.error!.message}';
                          }),
                          style: const TextStyle(fontSize: 16, color: kWhite),
                        ),
                      ),
                    ],
                  ),
                )),
            resultLoaded: ((images) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: images.data.length, (context, index) {
                  final isDownload = utils[index].isImageDownload;
                  final isShare = utils[index].isImageShared;
                  final isSetAsBg = utils[index].isImageSetAsBackground;
                  final isFav = utils[index].isFavorite;

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: ImageCard(
                            images: images.data[index],
                          ),
                        ),
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      isDownload.value1
                                          ? BottomBottuns(
                                              name: 'Downloade',
                                              iconData: Icons.download,
                                              onTap: () {
                                                ref
                                                    .read(
                                                        imageStateNotifierProvider
                                                            .notifier)
                                                    .imageDownload(
                                                        images.data[index].url);
                                              },
                                            )
                                          : utils[index].downloadprogress ==
                                                  '1.0'
                                              ? BottomBottuns(
                                                  name: 'Downloaded',
                                                  iconData: Icons.download_done,
                                                  onTap: () {},
                                                )
                                              : SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: Center(
                                                    child:
                                                        CircularPercentIndicator(
                                                            progressColor:
                                                                primaryColor,
                                                            center: const Icon(
                                                                Icons.download),
                                                            percent:
                                                                double.parse(
                                                              utils[index]
                                                                  .downloadprogress,
                                                            ),
                                                            radius: 20),
                                                  )),
                                      isShare
                                          ? BottomBottuns(
                                              name: 'Shared',
                                              iconData: Icons.share,
                                              onTap: () {
                                                ref
                                                    .read(
                                                        imageStateNotifierProvider
                                                            .notifier)
                                                    .shareImage(
                                                        images.data[index].url);
                                              },
                                            )
                                          : const SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Center(
                                                child:
                                                    CupertinoActivityIndicator(),
                                              )),
                                      isSetAsBg
                                          ? BottomBottuns(
                                              name: 'SetAsWallpaper',
                                              iconData: Icons.wallpaper,
                                              onTap: () {
                                                ref
                                                    .read(
                                                        imageStateNotifierProvider
                                                            .notifier)
                                                    .setImageAsBackground(
                                                        images.data[index].url);
                                              },
                                            )
                                          : const SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Center(
                                                child:
                                                    CupertinoActivityIndicator(),
                                              )),
                                      isFav.value1
                                          ? BottomBottuns(
                                              name: 'Favorite',
                                              iconData: Icons.favorite_border,
                                              onTap: () {
                                                ref
                                                    .read(
                                                        imageStateNotifierProvider
                                                            .notifier)
                                                    .addInFavoriteList(
                                                        url: images
                                                            .data[index].url,
                                                        prompt:
                                                            searchTextController
                                                                .text,
                                                        createdAt:
                                                            images.created);
                                              },
                                            )
                                          : isFav.value2
                                              ? BottomBottuns(
                                                  name: 'Favorite',
                                                  iconData: Icons.favorite,
                                                  onTap: () {
                                                    // ref
                                                    //     .read(
                                                    //         imageStateNotifierProvider
                                                    //             .notifier)
                                                    //     .addInFavoriteList(
                                                    //         url: images
                                                    //             .data[index].url,
                                                    //         prompt:
                                                    //             searchTextController
                                                    //                 .text,
                                                    //         createdAt:
                                                    //             images.created);
                                                  },
                                                )
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    backgroundColor:
                                                        primaryColor,
                                                  ),
                                                )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            }),
            orElse: () {
              return const Center(child: Text('Unknown Erorr'));
            },
          ),

          // const Spacer(),
        ],
      ),
    );
  }
}

class BottomBottuns extends StatelessWidget {
  const BottomBottuns(
      {required this.iconData,
      super.key,
      required this.name,
      required this.onTap});
  final String name;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor,
                )),
            child: Icon(
              iconData,
              color: primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: textTheme.caption!
                .copyWith(color: kblack, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CustomPersistHeader extends SliverPersistentHeaderDelegate {
  CustomPersistHeader({
    required this.onNumberSelect,
    required this.onImageSelect,
    required this.valueChanged,
    required this.dropdownvalue,
    required this.items,
    required this.searchTextController,
    required this.onTap,
  });
  final VoidCallback onTap;
  final TextEditingController searchTextController;
  final String dropdownvalue;
  final List<String> items;
  final VoidCallback onNumberSelect;
  final VoidCallback onImageSelect;
  final void Function(String? value) valueChanged;

  // List of items in our dropdown menu

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/lensa_ai_1-one_one.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        const Positioned.fill(
            child: Glass(
          child: SizedBox(),
        )),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // boxShadow: [BoxShadow(color: primaryColor)],
            // gradient: const LinearGradient(colors: [kpink, kred]),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchTextFieldWidget(
                color: primaryColor,
                textEditingController: searchTextController,
                onTap: onTap,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: onImageSelect,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: primaryColor,
                          )),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.photo_size_select_actual,
                            color: primaryColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Select Image',
                            style: TextStyle(color: primaryColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: onNumberSelect,
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: primaryColor,
                          )),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.numbers,
                            color: primaryColor,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Select number',
                            style: TextStyle(color: primaryColor),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(10),
                                  value: dropdownvalue,
                                  dropdownColor: kpink,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: primaryColor,
                                  ),
                                  items: items
                                      .map((e) => DropdownMenuItem(
                                          alignment: Alignment.center,
                                          value: e,
                                          child: Text(
                                            e,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(color: primaryColor),
                                          )))
                                      .toList(),
                                  onChanged: valueChanged),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => kToolbarHeight + 150;

  @override
  double get minExtent => kToolbarHeight + 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
