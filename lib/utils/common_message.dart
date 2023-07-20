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
                      ? Ionicons.warning
                      : Ionicons.information_circle,
              color: btnType == 1
                  ? kErrorCollor
                  : btnType == 2
                      ? kWarningCollor
                      : kPrimaryBlue,
              size: 50,
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
                        : kPrimaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          // if (showIcon) ,
          Text(
            errorTxt,
            style: TextStyle(
              fontSize: 20,
              height: 1.5,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
      buttons: buttons ?? [],
    );
