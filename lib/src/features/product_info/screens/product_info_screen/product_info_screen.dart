// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce/core/product_info_provider.dart';
import 'package:e_commerce/src/common_widget/gradient_text_widget.dart';
import 'package:e_commerce/src/common_widget/primary_button_widget.dart';
import 'package:e_commerce/src/common_widget/secondary_button_widget.dart';
import 'package:e_commerce/src/common_widget/text_widget.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:e_commerce/src/features/product_info/screens/product_info_screen/widgets/card_data_holder_widget.dart';
import 'package:e_commerce/src/features/product_info/screens/product_info_screen/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/card_swiper_widget.dart';

class ProductInfoScreen extends ConsumerStatefulWidget {
  final String id;
  final String name;
  const ProductInfoScreen({super.key, required this.id, required this.name});

  @override
  ConsumerState<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends ConsumerState<ProductInfoScreen> {
  @override
  void initState() {
    super.initState();

    ProductInfoProvider.querySingleSnapShot(pid: widget.id, ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(name: widget.name),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardSwiperWidget(
                          itemCount: ref.watch(image_cover).length,
                          itemBuilder: (BuildContext context, int index) {
                            return CardDataHolderWidget(
                              imageLink: ref
                                  .watch(image_cover)
                                  .values
                                  .elementAt(index),
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GradientTextWidget(
                          stringData: ref.watch(name),
                          heightValue: 1.3,
                          fontSize: 28,
                          boldValue: true,
                          centerAlignment: false,
                        ),
                        const SizedBox(height: 10),
                        TextWidget(
                          stringData: ref.watch(price),
                          fontSize: 25,
                          boldValue: true,
                          color: secondaryColor,
                          centerAlignment: false,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidStar,
                                  size: 15,
                                  color: orange,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                TextWidget(
                                  stringData: ref.watch(rating),
                                  fontSize: 15,
                                  boldValue: true,
                                  color: accentColor,
                                  centerAlignment: false,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextWidget(
                                  stringData: '86 Reviews',
                                  fontSize: 15,
                                  boldValue: true,
                                  color: accentColor,
                                  centerAlignment: false,
                                ),
                              ],
                            ),
                            Container(
                              width: 140,
                              height: 25,
                              decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: Center(
                                child: TextWidget(
                                  stringData: 'Total Sold : 250',
                                  fontSize: 15,
                                  boldValue: true,
                                  color: secondaryColor,
                                  centerAlignment: false,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              stringData: 'Product Description',
                              fontSize: 20,
                              boldValue: true,
                              color: accentColor,
                              centerAlignment: false,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextWidget(
                              stringData: ref.watch(description),
                              fontSize: 15,
                              boldValue: false,
                              color: accentColor,
                              centerAlignment: false,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(top: 30),
              width: size.width,
              height: size.height * 0.15,
              decoration: BoxDecoration(
                color: darkPurple,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SecondaryButtonWidget(
                    stringData: "Add to cart",
                    height: 60,
                    iconPath: '',
                    width: size.width * 1,
                    iconSize: 35,
                    fontSize: 16,
                    boldValue: true,
                    color: Colors.white,
                    buttonColor: secondaryColor,
                    onPressed: () => {},
                    centerAlignment: false,
                  ),
                  PrimaryButtonWidget(
                    stringData: "Buy Now",
                    height: 60,
                    iconPath: '',
                    width: size.width * 1,
                    iconSize: 35,
                    fontSize: 16,
                    boldValue: true,
                    color: darkPurple,
                    buttonColor: lightGray,
                    onPressed: () => {},
                    centerAlignment: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
