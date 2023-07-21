// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CardDataHolderWidget extends StatelessWidget {
  final String imageLink;
  const CardDataHolderWidget({super.key, required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        //set border radius more than 50% of height and width to make circle
      ),
      child: Container(
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            imageLink,
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
    );
  }
}
