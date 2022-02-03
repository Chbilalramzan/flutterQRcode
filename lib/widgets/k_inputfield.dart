
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:qrcode/utils/constants/size_constants.dart';

class KInputField extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool obscureText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final TextStyle hintTextStyle;
  final TextStyle textStyle;
  final bool hasFocus;
  final int maxLines;
  final String suffixText;
  final double width;

  KInputField({
    required this.width,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    this.obscureText = false,
    required this.textInputType,
    required this.controller,
    required this.hintTextStyle,
    this.hasFocus = false,
    required this.textStyle,
    this.maxLines = 1,
    required this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: Sizes.dimen_56,
      alignment: Alignment.center,
      child: Center(
        child: TextField(
          maxLines: maxLines,
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText,
          textAlignVertical: TextAlignVertical.center,
          style: textStyle,
          decoration: InputDecoration(
              contentPadding: prefixIcon == null
                  ? const EdgeInsets.symmetric(horizontal: 10, vertical: 8)
                  : EdgeInsets.zero,
              hintText: hintText,
              hintStyle: hintTextStyle,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              suffixText: suffixText,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Sizes.dimen_20),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.dimen_20),
                  borderSide: BorderSide(color: AppColors.borderColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.dimen_20),
                  borderSide: BorderSide(color: AppColors.borderColor))),
        ),
      ),
    );
  }
}
