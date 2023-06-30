import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:e_commerce/src/constants/colors.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
//-----------------

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
      content: SizedBox(
        width: size.width * 0.1,
        height: size.height * 0.15,
        child: const SpinKitRing(
          color: accentColor,
          size: 60,
        ),
      ),
      backgroundColor: darkPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
