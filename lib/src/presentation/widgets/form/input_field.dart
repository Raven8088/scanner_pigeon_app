import 'package:flutter/material.dart';
import '../../style/labels/custom_colors.dart';
import '../../style/labels/custom_labels.dart';
import '../../style/theme.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isRequired;
  final Color? textColor;
  final Color? borderColor;
  final Color? background;
  final Color? hinTextColor;
  final bool enableBorder;
  final bool autoFocus;
  final String label;
  final String? hintext;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final bool readonly;
  final String? initialValue;
  final String? error;
  final double radio;
  final double? height;
  final int? minLine;
  final int? maxLine;
  final int? maxLenght;
  final TextInputType? type;
  final bool counterText;
  final double paddinSufix;
  final double paddinpreffix;
  final TextStyle? labelStyle;
  final Function(dynamic str)? onChanged;
  final Function(dynamic str)? subMit;
  final Function()? onTap;

  const InputField({
    Key? key,
    this.controller,
    this.focusNode,
    this.textColor,
    this.borderColor,
    this.background,
    this.label = "",
    this.onChanged,
    this.subMit,
    this.hintext = "",
    this.obscureText = false,
    this.isRequired = false,
    this.readonly = false,
    this.enableBorder = false,
    this.autoFocus = false,
    this.onTap,
    this.suffixIcon,
    this.preffixIcon,
    this.initialValue,
    this.radio = 6,
    this.minLine,
    this.maxLine,
    this.height,
    this.error,
    this.maxLenght = 255,
    this.type = TextInputType.text,
    this.counterText = false,
    this.hinTextColor,
    this.labelStyle,
    this.paddinSufix = 7,
    this.paddinpreffix = 7,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  OutlineInputBorder borderBoton = const OutlineInputBorder();
  UnderlineInputBorder noBorderBoton = const UnderlineInputBorder();

  double btnRadioDefault = 6;

  @override
  void initState() {
    super.initState();
  }

  double radioDefault = 15;

  @override
  Widget build(BuildContext context) {
    borderBoton = OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radio),
        borderSide: BorderSide(
          color: widget.error != null
              ? AppColors.error
              : widget.borderColor ??
                  CustomColors.onPrimary!.withValues(alpha: 0.30),
          width: 1.0,
        ));
    noBorderBoton = UnderlineInputBorder(
        borderSide: BorderSide(
      color: widget.error != null
          ? AppColors.error
          : widget.borderColor ??
              CustomColors.onPrimary!.withValues(alpha: 0.30),
      width: 1.0,
    ));

    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            focusNode: widget.focusNode,
            style: TextStyle(
              color: widget.textColor ?? CustomColors.onSegundary,
            ),
            keyboardType: widget.type,
            autofocus: widget.autoFocus,
            onFieldSubmitted: widget.subMit != null
                ? (text) {
                    widget.subMit!(text);
                  }
                : null,
            controller: widget.controller,
            initialValue: widget.initialValue,
            minLines: widget.minLine ?? 1,
            maxLines: widget.maxLine ?? 1,
            maxLength: widget.maxLenght,
            readOnly: widget.readonly,
            onChanged: (text) {
              widget.onChanged != null ? widget.onChanged!(text) : null;
            },
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              errorText: widget.error,
              counterStyle:
                  CustomLabels.caption!.copyWith(color: CustomColors.tertiary),
              counterText: widget.counterText ? null : "",
              hintStyle: CustomLabels.caption!.copyWith(
                color: widget.hinTextColor != null
                    ? widget.hinTextColor!.withValues(alpha: 0.50)
                    : CustomColors.onSegundary!.withValues(alpha: 0.50),
              ),
              labelStyle: widget.labelStyle ??
                  CustomLabels.caption!.copyWith(
                    color: CustomColors.onSegundary!.withValues(alpha: 0.50),
                  ),
              filled: widget.background != null ? true : false,
              fillColor: widget.background,
              label: widget.label != ""
                  ? Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        widget.label,
                      ),
                    )
                  : null,
              hintText: widget.label == "" && widget.hintext != ""
                  ? widget.hintext
                  : null,
              prefixIcon: widget.preffixIcon != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: widget.paddinpreffix,
                              bottom: widget.paddinpreffix),
                          child: widget.preffixIcon!,
                        ),
                      ],
                    )
                  /* Padding(
                      padding: EdgeInsets.only(
                          top: widget.paddinpreffix,
                          bottom: widget.paddinpreffix),
                      child: SizedBox(
                        width: 24, // Ajusta el tamaño del ancho aquí
                        height: 24, // Ajusta el tamaño del alto aquí
                        child: widget.preffixIcon,
                      ),
                    )*/
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: widget.paddinSufix,
                              bottom: widget.paddinSufix),
                          child: widget.suffixIcon!,
                        ),
                      ],
                    )
                  : null,
              enabledBorder: widget.enableBorder ? borderBoton : noBorderBoton,
              focusedBorder: widget.enableBorder ? borderBoton : noBorderBoton,
              errorBorder: widget.enableBorder ? borderBoton : noBorderBoton,
              focusedErrorBorder:
                  widget.enableBorder ? borderBoton : noBorderBoton,
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.height ?? 9,
                  horizontal: widget.enableBorder ? 10 : 10),
            ),
          )
        ],
      ),
    );
  }
}
