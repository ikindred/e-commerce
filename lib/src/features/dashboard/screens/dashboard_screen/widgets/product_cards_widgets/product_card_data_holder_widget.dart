// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:e_commerce/src/common_widget/text_widget.dart';
import 'package:e_commerce/src/constants/colors.dart';

class ProductCardDataHolderWidget extends StatelessWidget {
  final String? name;
  final String? desc;
  final Map? image;
  final String? price;

  const ProductCardDataHolderWidget({
    super.key,
    required this.name,
    required this.desc,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      color: transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Container(
        height: 190,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.03,
        ),
        decoration: BoxDecoration(
          color: darkPurple,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  image!['full'].toString(),
                  height: 500,
                  width: 500,
                  fit: BoxFit.cover,
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
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        stringData: name!,
                        fontSize: 25,
                        boldValue: true,
                        color: accentColor,
                        centerAlignment: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        stringData: desc!,
                        fontSize: 12,
                        boldValue: false,
                        color: accentColor,
                        centerAlignment: false,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextWidget(
                      stringData: price!,
                      fontSize: 15,
                      boldValue: true,
                      color: accentColor,
                      centerAlignment: true,
                    ),
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
