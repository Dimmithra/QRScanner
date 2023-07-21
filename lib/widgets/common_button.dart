import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qrscaner/utils/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key, required this.onPress, required this.btnCaption});

  final Function() onPress;
  final String btnCaption;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(200, 30),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(10.0),
        ),
        backgroundColor: kButtonColor,
      ),
      onPressed: onPress,
      child: Text(
        btnCaption,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
