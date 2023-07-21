import 'package:e_commerce/core/provider/public_provider.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'text_widget.dart';

class ButtonIconCartWidget extends ConsumerWidget {
  final Function onPressed;
  final IconData icon;
  const ButtonIconCartWidget(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cartCount = ref.watch(userCartFire).length;

    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        width: 70,
        height: 45,
        decoration: BoxDecoration(
          color: orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FaIcon(
                size: 20,
                icon,
                color: Colors.white,
              ),
            ),
            TextWidget(
              stringData: '$cartCount',
              fontSize: 20,
              boldValue: true,
              color: Colors.white,
              centerAlignment: false,
            ),
          ],
        ),
      ),
    );
  }
}
