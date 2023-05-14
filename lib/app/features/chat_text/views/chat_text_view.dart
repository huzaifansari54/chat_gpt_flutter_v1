import 'dart:io';

import 'package:chat_gpt_flutter/app/model/text_completion_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:share_plus/share_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/Exceptions/exception.dart';
import '../../../common/headers.dart';
import '../../../common/search_text_field_widget.dart';
import '../../controllers/states_controller.dart';

class ChatTextView extends ConsumerStatefulWidget {
  const ChatTextView({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatTextView> createState() => _ChatTextViewState();
}

class _ChatTextViewState extends ConsumerState<ChatTextView> {
  late final TextEditingController searchTextController;
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final data = ref.watch(stateControllerNotifier);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.withOpacity(0.8),
          title: const Text('ChatTextView'),
          centerTitle: true,
        ),
        body: Column(children: [
          data.maybeWhen(
            textCompletionLoaded: (textCompletionModel) {
              final dataList =
                  ref.watch(stateControllerNotifier.notifier).chats;

              return Expanded(
                child: ListView.builder(
                    reverse: true,
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        constraints: const BoxConstraints(minHeight: 60),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment:
                              dataList[index].finish_reason.isEmpty
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                          children: [
                            dataList[index].finish_reason.isEmpty
                                ? const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Text('Me'),
                                  )
                                : const SizedBox(),
                            const SizedBox(width: 8),
                            Flexible(
                              child: SizedBox(
                                  child: Text(
                                dataList[index].text.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white),
                              )),
                            ),
                            const SizedBox(width: 8),
                            dataList[index].finish_reason.isNotEmpty
                                ? const CircleAvatar(
                                    child: Text('Bot'),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      );
                    }),
              );
            },
            loading: (() => Flexible(
                  child: Container(
                      alignment: Alignment.center,
                      height: 500,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      )),
                )),
            erorr: ((erorr) => const Center(
                  child: Text(('Error')),
                )),
            orElse: () {
              return Flexible(
                child: Container(
                    alignment: Alignment.center,
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Please Writte your query',
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.image,
                          size: 50,
                        )
                      ],
                    )),
              );
            },
          ),
          SearchTextFieldWidget(
              color: Colors.green.withOpacity(0.8),
              textEditingController: searchTextController,
              onTap: () {
                ref
                    .read(stateControllerNotifier.notifier)
                    .textCompletion(searchTextController.text, '1');
                ref.read(stateControllerNotifier.notifier).chats.add(
                    TextCompletionData(
                        text: searchTextController.text,
                        index: 0,
                        finish_reason: ''));
                searchTextController.clear();
              }),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
