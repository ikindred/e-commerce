// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/router.dart';
import 'package:e_commerce/src/features/product_info/screens/product_info_screen/product_info_screen.dart';
import 'package:flutter/material.dart';

import 'product_card_data_holder_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('products');

    return StreamBuilder<QuerySnapshot>(
      // stream: _usersStream,
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return GestureDetector(
              onTap: () => {
                pageRouterPushReplace(
                    context,
                    ProductInfoScreen(
                        id: '${data['id']}', name: '${data['name']}'))
              },
              child: ProductCardDataHolderWidget(
                desc: '${data['description']}',
                image: data['image_cover'],
                name: '${data['name']}',
                price: '${data['price']}',
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
