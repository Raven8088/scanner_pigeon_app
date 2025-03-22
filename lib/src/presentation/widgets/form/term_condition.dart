import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../style/labels/custom_colors.dart';
import '../../style/labels/custom_labels.dart';

Widget termAndPrivacity() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'I accept Minhoo’s ',
              style: CustomLabels.caption!
                  .copyWith(color: CustomColors.onPrimary!.withOpacity(0.50)),
            ),
            _buildClickableTextSpan(
              text: 'Terms of Service',
              color: CustomColors.onPrimary,
              onTap: () {
                // Agrega la lógica para el evento de "Terms of Service"
                print('Tapped on Terms of Service');
              },
            ),
            TextSpan(
              text:
                  ', and authorize for my personal data to be collect and processed for the purposes and according to the rights described in its ',
              style: CustomLabels.caption!
                  .copyWith(color: CustomColors.onPrimary!.withOpacity(0.50)),
            ),
            _buildClickableTextSpan(
              text: 'Privacy Policy',
              color: CustomColors.onPrimary,
              onTap: () {
                // Agrega la lógica para el evento de "Privacy Policy"
                print('Tapped on Privacy Policy');
              },
            ),
            TextSpan(
              text: '.',
              style: CustomLabels.caption!
                  .copyWith(color: CustomColors.onPrimary!.withOpacity(0.50)),
            ),
          ],
        )),
      ],
    ),
  );
}

TextSpan _buildClickableTextSpan(
    {required String text, required VoidCallback onTap, required color}) {
  return TextSpan(
    text: text,
    style: CustomLabels.caption!
        .copyWith(color: color)
        .copyWith(fontWeight: FontWeight.bold),
    recognizer: TapGestureRecognizer()..onTap = onTap,
  );
}
