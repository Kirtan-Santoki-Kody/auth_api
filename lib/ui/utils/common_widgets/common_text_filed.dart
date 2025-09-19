import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final bool? obscureText;
  final String? obscuringCharacter;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CommonTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.obscuringCharacter,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon, this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        helperMaxLines: 4,
        errorMaxLines: 2,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      obscuringCharacter: obscuringCharacter ?? '*',
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      maxLength: maxLength,
      focusNode: focusNode,
      textInputAction: textInputAction,
    );
  }
}
