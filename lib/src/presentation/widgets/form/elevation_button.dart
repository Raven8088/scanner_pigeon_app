import 'package:flutter/material.dart';

import '../../style/labels/custom_colors.dart';
import '../../style/labels/custom_labels.dart';

class ElevationButton extends StatefulWidget {
  final double? radio;
  final int typeLarge;
  final double? elevation;
  final double? width;
  final double? height;
  final String text;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final double fontSize;
  final FontWeight fontWeight;
  final Function()? ontap;
  final double multiploWidth;

  const ElevationButton({
    super.key,
    this.radio = 18,
    required this.typeLarge,
    this.elevation,
    required this.text,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.prefixIcon,
    this.sufixIcon,
    this.ontap,
    this.width,
    this.height,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.multiploWidth = 15.5,
  });

  @override
  State<ElevationButton> createState() => _ElevationButtonState();
}

class _ElevationButtonState extends State<ElevationButton> {
  double widthButton = 0;
  double heightButton = 0;
  late Size size;
  bool disable = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    Color shadowBtn(Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return disable
            ? widget.backgroundColor?.withValues(alpha: 0.3) ??
                CustomColors.primary!.withValues(alpha: 0.3)
            : widget.backgroundColor ?? CustomColors.primary!;
      } else if (states.contains(WidgetState.disabled)) {
        disable = true;
        return widget.backgroundColor?.withValues(alpha: 0.3) ??
            CustomColors.primary!.withValues(alpha: 0.3);
      }
      return widget.backgroundColor ?? CustomColors.primary!;
    }

    WidgetStateProperty<OutlinedBorder?> shapeBtn =
        WidgetStateProperty.resolveWith<OutlinedBorder>((_) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radio ?? 18));
    });

    WidgetStateProperty<BorderSide?> borderSideBtn =
        WidgetStateProperty.resolveWith((_) {
      return BorderSide(
        width: 1.0,
        color: disable
            ? Colors.transparent
            : widget.borderColor ?? Colors.transparent,
      );
    });

    TextStyle btnStyle = CustomLabels.h6!.copyWith(
      fontSize: widget.fontSize,
      fontWeight: widget.fontWeight,
      color: widget.textColor ??
          CustomColors.onSegundary!
              .withValues(alpha: widget.ontap != null ? 1 : 0.5),
    );

    switch (widget.typeLarge) {
      case 100:
        widthButton = widget.width ?? widget.text.length * widget.multiploWidth;
        heightButton = widget.height ?? 46;
        break;
      case 1:
        widthButton = widget.width ?? 130;
        heightButton = widget.height ?? 32;
        break;
      case 2:
        widthButton = widget.width ?? 233;
        heightButton = widget.height ?? 46;
        break;
      case 3:
        widthButton = widget.width ?? MediaQuery.of(context).size.width;
        heightButton = widget.height ?? 56;
        break;
    }

    return SizedBox(
      width: widthButton,
      height: heightButton,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(widget.elevation ?? 0),
          shape: shapeBtn,
          shadowColor: WidgetStateProperty.resolveWith(shadowBtn),
          backgroundColor: WidgetStateProperty.resolveWith(shadowBtn),
          side: borderSideBtn,
        ),
        onPressed: widget.ontap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: widget.prefixIcon,
              ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: btnStyle,
                ),
              ),
            ),
            if (widget.sufixIcon != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: widget.sufixIcon,
              ),
          ],
        ),
      ),
    );
  }
}
