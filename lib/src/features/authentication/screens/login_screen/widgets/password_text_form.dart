import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:e_commerce/src/constants/colors.dart';

import '../../../provider/fire_auth_provider.dart';

class PasswordTextForm extends ConsumerWidget {
  final String hintText;
  final String text;
  final String label;

  PasswordTextForm({
    super.key,
    required this.hintText,
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var showPasswordValue = ref.watch(showPassword);
    return Container(
      decoration: BoxDecoration(
        color: transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: accentColor, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              obscureText: !showPasswordValue,
              controller: passwordTEC,
              textInputAction: TextInputAction.next,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelText: label.isEmpty ? null : label,
                labelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    color: accentColor),
              ),
            ),
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.solidEye,
              color: showPasswordValue ? accentColor : fadedLightPurple,
            ),
            onPressed: () =>
                ref.read(showPassword.notifier).state = !showPasswordValue,
          ),
        ],
      ),
    );
  }
}
