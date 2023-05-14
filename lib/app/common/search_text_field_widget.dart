import 'package:flutter/material.dart';
import 'Constant/colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;
  final Color color;

  const SearchTextFieldWidget({
    Key? key,
    required this.color,
    this.textEditingController,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: color),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 60),
                        child: Scrollbar(
                          child: TextField(
                            style: TextStyle(fontSize: 14, color: color),
                            controller: textEditingController,
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: color),
                                hintText: "Open AI Waiting for your query..."),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                )),
            child: Icon(
              Icons.send,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 6)
      ],
    );
  }
}
