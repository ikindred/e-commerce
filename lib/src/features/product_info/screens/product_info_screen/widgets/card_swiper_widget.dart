// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/src/constants/colors.dart';
import 'package:e_commerce/src/features/product_info/screens/product_info_screen/widgets/button_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardSwiperWidget extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const CardSwiperWidget(
      {super.key, required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: primaryColor,
      height: 245,
      width: size.width,
      child: Stack(
        children: [
          Positioned.fill(
            child: Swiper(
                itemBuilder: itemBuilder,
                itemCount: itemCount,
                loop: false,
                pagination: const SwiperPagination(),
                axisDirection: AxisDirection.right,
                itemWidth: size.width * 0.9,
                allowImplicitScrolling: true,
                containerWidth: size.width,
                layout: SwiperLayout.DEFAULT),
          ),
          Positioned(
              bottom: 10,
              right: 20,
              child: Row(
                children: [
                  ButtonIconWidget(
                    onPressed: () => {},
                    icon: FontAwesomeIcons.solidHeart,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ButtonIconWidget(
                    onPressed: () => {},
                    icon: FontAwesomeIcons.share,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
