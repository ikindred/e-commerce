import 'package:e_commerce/core/router.dart';
import 'package:e_commerce/src/features/dashboard/screens/dashboard_screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/src/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../common_widget/text_widget.dart';

class HeaderWidget extends StatelessWidget {
  final String? name;

  const HeaderWidget({
    super.key,
    this.name,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => {
            pageRouterPushReplace(context, const DashboardScreen()),
          },
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        ),
        TextWidget(
          stringData: 'Product Details',
          fontSize: 20,
          boldValue: true,
          color: accentColor,
          centerAlignment: false,
        ),
      ],
    );
  }
}
