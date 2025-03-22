import 'package:flutter/material.dart';

import '../../style/labels/custom_labels.dart';

// ignore: must_be_immutable
class DropDownButtonWidget extends StatefulWidget {
  final List<Map<String, String>> items;
  final String? label;
  final Color? textColor;
  String initialValue;
  final Function(dynamic str) onChange;
  DropDownButtonWidget(
      {Key? key,
      this.label,
      required this.items,
      required this.initialValue,
      required this.onChange,
      this.textColor})
      : super(key: key);

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(widget.label!, style: CustomLabels.caption),
              )
            : Container(),
        SizedBox(
          height: 52,
          child: Center(
            child: DropdownButtonFormField(
              dropdownColor: Theme.of(context).colorScheme.secondary,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 8),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: .50),
                        width: 1),
                    borderRadius: BorderRadius.circular(4)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: .50),
                        width: 1),
                    borderRadius: BorderRadius.circular(4)),
                filled: true,
                fillColor: Colors.white,
              ),
              value: widget.initialValue,
              items: widget.items.map((map) {
                return DropdownMenuItem(
                  value: map['key'],
                  child: Text(
                    map['text']!,
                    style: CustomLabels.overline!.copyWith(
                        color: widget.textColor ??
                            Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                widget.onChange(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
