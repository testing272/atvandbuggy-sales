import 'package:atvandbuggy_sales_app/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Locale? globalAppLocale;

// You can also add a method to set this variable
void setGlobalAppLocale(Locale locale) {
  globalAppLocale = locale;
}

void showCustomToast(BuildContext context, String message) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.sizeOf(context).height * 0.1,
      left: 10.0,
      right: 10.0,
      child: Material(
        elevation: 10.0,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Provider.of<AppTheme>(context).primaryColor,
              borderRadius: BorderRadius.circular(5)),
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );

  Overlay.of(context)!.insert(overlayEntry);

  // Remove the toast after 2 seconds
  Future.delayed(Duration(seconds: 4), () {
    overlayEntry.remove();
  });
}

void showLoader(BuildContext context, {bool? canPop}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        canPop: canPop ?? false,
        child: const Center(
          child: CupertinoActivityIndicator(color: Colors.white),
        ),
      );
    },
  );
}
