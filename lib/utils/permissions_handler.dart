import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static void requestPermission(
      List<Permission> permission, BuildContext context,
      {Function permissionGrant,
      Function permissionDenied,
      Function permissionNotAskAgain,}) {
    permission.request().then((statuses) {
      var allPermissionGranted = true;

      statuses.forEach((key, value) {
        debugPrint("Permission key $key value $value");
        if (value == PermissionStatus.granted) {
          allPermissionGranted = allPermissionGranted && true;
        } else {
          allPermissionGranted = allPermissionGranted && false;
        }
      });

      if (allPermissionGranted) {
        if (permissionGrant != null) {
          permissionGrant();
        }
      } else {
        if (permissionDenied != null) {
          permissionDenied();
        }
      }
    });
  }
}
