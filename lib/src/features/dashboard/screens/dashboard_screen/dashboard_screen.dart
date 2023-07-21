// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:e_commerce/src/features/dashboard/screens/dashboard_screen/widgets/header_widget.dart';

import 'widgets/product_cards_widgets/product_list_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
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
                    HeaderWidget(),
                    const SizedBox(height: 15),
                    const ProductListWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
