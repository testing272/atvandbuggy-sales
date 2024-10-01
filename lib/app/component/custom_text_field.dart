import 'package:atvandbuggy_sales_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final String? suffixIconPath;
  final TextEditingController controller;
  final VoidCallback? tapOnObscureText;
  final dynamic validation;
  final bool readOnly;
  final VoidCallback? onTap;
  const CustomTextField(
      {super.key,
      this.onTap,
      this.readOnly = false,
      this.validation,
      required this.controller,
      this.tapOnObscureText,
      required this.hint,
      this.obscureText = false,
      this.suffixIconPath});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return TextFormField(
        readOnly: readOnly,
        onTap: onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          hintStyle:
              const TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
          suffixIconConstraints:
              const BoxConstraints(minHeight: 5, minWidth: 5),
          suffixIcon: suffixIconPath != null
              ? InkWell(
                  onTap: tapOnObscureText,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset(
                      suffixIconPath!,
                      height: 25,
                    ),
                  ),
                )
              : null,
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.red[900]!)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Colors.red[900]!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: theme.primaryColor)),
        ),
        validator: validation,
      );
    });
  }
}
