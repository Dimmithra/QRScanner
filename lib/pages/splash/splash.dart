import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qrscaner/provider/auth_provider.dart';
import 'package:qrscaner/utils/common_message.dart';
import 'package:qrscaner/utils/main_body.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:safe_device/safe_device.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    initConnectivity();
    initPlatformState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<AuthProvider>(context, listen: false)
    //       .pageNavigator(context)
    //       .then((value) {});
    // });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        print('Connection Success');
      } else if (result == ConnectivityResult.none) {
        errorMessage(
          context,
          errorTxt: 'Internet Connection Issuse',
          btnType: 1,
          buttons: [
            DialogButton(
              child: Text('Try Again'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(),
                    ));
              },
            )
          ],
        ).show();
      }
    } on PlatformException catch (e) {
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> initPlatformState() async {
    bool isJailBroken = false;
    bool isRealDevice = true;
    bool isSafeDevice = false;
    bool isDevelopmentModeEnable = false;
    // await Permission.location.request();
    // if (await Permission.location.isPermanentlyDenied) {
    //   openAppSettings();
    // }

    if (!mounted) return;
    try {
      isJailBroken = await SafeDevice.isJailBroken;
      isRealDevice = await SafeDevice.isRealDevice;
      isSafeDevice = await SafeDevice.isSafeDevice;
      isDevelopmentModeEnable = await SafeDevice.isDevelopmentModeEnable;
    } on PlatformException {
      isJailBroken = true;
      isRealDevice = false;
      isSafeDevice = true;
      isDevelopmentModeEnable = true;
    }
    if (!(isJailBroken ||
        isRealDevice ||
        isSafeDevice ||
        isDevelopmentModeEnable)) {
      errorMessage(
        context,
        errorTxt: 'Your Device has security issue',
        buttons: [
          DialogButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SplashScreen(),
                ),
              );
            },
          )
        ],
      ).show();
      print('not secure');
    } else {
      Provider.of<AuthProvider>(context, listen: false).pageNavigator(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/qr_scanner_image.GIF",
            fit: BoxFit.cover,
          )
        ],
      ),
    ));
  }
}
