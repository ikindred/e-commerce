import 'package:e_commerce/core/provider/public_provider.dart';
import 'package:e_commerce/src/common_widget/alert_dialog_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/common_widget/text_widget.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderWidget extends ConsumerStatefulWidget {
  HeaderWidget({
    super.key,
  });

  @override
  ConsumerState<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends ConsumerState<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              stringData: 'Hello 👋🏻 ',
              fontSize: 13,
              boldValue: false,
              color: accentColor,
              centerAlignment: false,
            ),
            TextWidget(
              stringData: ref.watch(userNameFire),
              fontSize: 20,
              boldValue: true,
              color: accentColor,
              centerAlignment: false,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialogButtonsWidget(
                    title: "Signing out",
                    message: "You're about to sign out",
                    buttonText: "Try again",
                    emoji: "😢 😢 😢");
              },
            );
          },
          child: Center(
            child: SizedBox(
              width: 45,
              height: 45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/e-commerce-87fc8.appspot.com/o/profile.webp?alt=media&token=db75a451-aa28-4998-b39a-7a1fc9452719',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Error loading image');
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
