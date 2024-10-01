import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool includeOpacity;
  final bool includeBorder;
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.includeOpacity = false,
      this.includeBorder = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 55.h,
          decoration: BoxDecoration(
            border:
                includeBorder ? Border.all(color: theme.primaryColor) : null,
            color: includeOpacity
                ? theme.primaryColor.withOpacity(0.27)
                : theme.primaryColor,
            borderRadius: BorderRadius.circular(27),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.5.sp),
          ),
        ),
      );
    });
  }
}
