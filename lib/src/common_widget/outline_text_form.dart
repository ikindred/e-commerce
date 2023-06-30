import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/src/constants/colors.dart';

class OutlineTextForm extends ConsumerWidget {
  final String hintText;
  final String text;
  final String label;
  final TextEditingController textController;

  OutlineTextForm({
    super.key,
    required this.textController,
    required this.hintText,
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accentColor, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: textController,
              textInputAction: TextInputAction.next,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    color: accentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
