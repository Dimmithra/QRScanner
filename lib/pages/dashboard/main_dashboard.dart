import 'dart:developer';

import 'package:botton_nav_bar/botton_nav_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrscaner/pages/dashboard/QR_Generator/qr_generator.dart';
import 'package:qrscaner/pages/dashboard/my%20login/login.dart';
import 'package:qrscaner/pages/dashboard/qrcode_scanner/qrcode_scanner.dart';
import 'package:qrscaner/provider/qr_scaner_provider.dart';
import 'package:qrscaner/utils/colors.dart';
import 'package:qrscaner/utils/main_body.dart';
import 'package:qrscaner/widgets/common_bottomnavbar.dart';
import 'package:qrscaner/widgets/common_button.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QrScannerProvider>(context, listen: false);
      // initializeCamera();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Barcode? result;
    QRViewController? controller;
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    return Consumer<QrScannerProvider>(
      builder: (context, qrScannerProvider, child) {
        return MainBody(
          drawer: Drawer(
            backgroundColor: kPrimaryBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: UserAccountsDrawerHeader(
                    currentAccountPicture: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/images/login_icon.jpeg"),
                          )),
                    ),
                    currentAccountPictureSize: Size.fromRadius(50),
                    accountName: Text(''),
                    accountEmail: Column(),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        btnCaption: 'My Login',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonButton(
                        onPress: () {},
                        btnCaption: 'Registration',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          CommonButton(onPress: () {}, btnCaption: 'Sign Out'),
                    )
                  ],
                )
              ],
            ),
          ),
          appbarTitleName: 'Main DashBoard',
          content: SingleChildScrollView(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRGeneratotScreen(),
                      ),
                    );
                  },
                  child: Text('QR Generatore'))),
          floatingActionButton: FloatingActionButton.large(
            child: CircleAvatar(
              maxRadius: 75,
              backgroundColor: kGreenColor,
              child: Icon(
                Icons.qr_code_scanner,
                size: 50,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QrCodeScannerPage(),
                  ));
            },
          ),
        );
      },
    );
  }
}
