import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestGalleryPermission() async {
  PermissionStatus status = Platform.isAndroid
      ? await Permission.mediaLibrary.status
      : await Permission.photos.status;
  print('Status $status');
  if (status.isGranted) {
    return true;
  }
  if (status.isDenied || status.isRestricted || status.isLimited) {
    status = await Permission.photos.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

Future<bool> requestCameraPermission() async {
  var status = await Permission.camera.status;
  if (status.isGranted) {
    return true;
  }
  if (status.isDenied || status.isRestricted || status.isLimited) {
    status = await Permission.camera.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }
  return false;
}

openSettings(BuildContext context, String error, bool isDismissible,
    VoidCallback onTap) {
  showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: CupertinoAlertDialog(
            title: Text(error.toString()),
            actions: [
              TextButton(onPressed: onTap, child: Text('Open Settings')),
            ],
          ),
        );
      });
}
