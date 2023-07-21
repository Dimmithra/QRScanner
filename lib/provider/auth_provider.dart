import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrscaner/pages/dashboard/main_dashboard.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscaner/utils/common_message.dart';
import 'package:safe_device/safe_device.dart';

class AuthProvider extends ChangeNotifier {
  pageNavigator(context) async {
    Future.delayed(Duration(seconds: 5)).then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const MainDashBoard(),
          ),
        );
      },
    );
  }
}
