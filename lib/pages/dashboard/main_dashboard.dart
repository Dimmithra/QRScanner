import 'package:botton_nav_bar/botton_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
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
  Widget build(BuildContext context) {
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
                    onPress: () {},
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
                  child: CommonButton(onPress: () {}, btnCaption: 'Sign Out'),
                )
              ],
            )
          ],
        ),
      ),
      appbarTitleName: 'Main DashBoard',
      content: SingleChildScrollView(),
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
        onPressed: () {},
      ),
    );
  }
}
