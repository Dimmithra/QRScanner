import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscaner/utils/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

Alert errorMessage(
  context, {
  required String errorTxt,
  bool showIcon = true,
  int btnType = 1,
  List<DialogButton>? buttons,
}) =>
    Alert(
      onWillPopActive: buttons != null,
      context: context,
      style: const AlertStyle(
        backgroundColor: Colors.grey,
      ),
      closeIcon: Container(),
      content: Column(
        children: [
          if (showIcon)
            Icon(
              btnType == 1
                  ? Ionicons.alert_circle
                  : btnType == 2
                      ? Ionicons.warning_sharp
                      : Ionicons.information_circle,
              color: btnType == 1
                  ? kErrorCollor
                  : btnType == 2
                      ? kWarningCollor
                      : kSuccessColor,
              size: 45,
            ),
          if (showIcon)
            Text(
              btnType == 1
                  ? 'Error'
                  : btnType == 2
                      ? "Warning"
                      : "Information",
              style: TextStyle(
                  color: btnType == 1
                      ? kErrorCollor
                      : btnType == 2
                          ? kWarningCollor
                          : kSuccessColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          SizedBox(
            height: 25,
          ),
          Text(
            errorTxt,
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      buttons: buttons ?? [],
    );
