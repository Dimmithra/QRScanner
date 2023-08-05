import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qrscaner/utils/colors.dart';

class CommonInput extends StatelessWidget {
  const CommonInput({
    super.key,
    required this.hintText,
    required this.lableText,
    this.outlineInputBoader = true,
    this.controllerl,
    this.filled,
    this.backgroundcolor,
    this.suffix,
    this.isValidate = false,
    this.onchanged,
  });
  final String hintText;
  final String lableText;
  final bool outlineInputBoader;
  final TextEditingController? controllerl;
  final bool? filled;
  final Color? backgroundcolor;
  final Widget? suffix;
  final bool isValidate;
  final Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerl,
      onChanged: onchanged,
      validator: (text) {
        if (isValidate) {
          if (text == null || text.isEmpty) {
            return '$hintText is Required';
          }
          return null;
        }
        return null;
      },
      decoration: outlineInputBoader
          ? InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              labelText: lableText,
              filled: filled,
              fillColor: backgroundcolor,
              suffixIcon: suffix,
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: kErrorCollor,
                ),
              ))
          : InputDecoration(
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              labelText: lableText,
              suffixIcon: suffix,
            ),
    );
  }
}
