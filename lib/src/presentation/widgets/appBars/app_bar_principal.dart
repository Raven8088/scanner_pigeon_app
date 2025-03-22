import '../../common/assetspath.dart';
import 'package:flutter/material.dart';
import '../../common/custom_paddings.dart';
import '../../style/labels/custom_labels.dart';
import '../../style/labels/custom_colors.dart';

class AppBarPrincipal extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String text;
  final String? aditionalText;
  final double fontSize;
  final bool back;
  final bool searchIcon;
  final bool location;
  final Color? colorText;
  final Color? background;
  final Widget? action;
  const AppBarPrincipal({
    super.key,
    this.fontSize = 18,
    required this.text,
    this.aditionalText,
    this.back = true,
    this.searchIcon = false,
    this.location = false,
    this.colorText,
    this.background,
    this.action,
  }) : preferredSize = const Size.fromHeight(70.0);

  @override
  State<AppBarPrincipal> createState() => _AppBarPrincipalState();
}

class _AppBarPrincipalState extends State<AppBarPrincipal> {
  _AppBarPrincipalState();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: CustomPadding.right,
      backgroundColor: widget.background ?? CustomColors.secundary,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: true, // Elimina el icono de retroceso
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: CustomLabels.h4,
          ),
          SizedBox(
            width: 40,
          ),
          Image.asset(
            assetsPngPath(
              image: "logo",
            ),
            color: CustomColors.primary,
            width: 30,
            height: 30,
          )
        ],
      ),
    );
  }
}
//
