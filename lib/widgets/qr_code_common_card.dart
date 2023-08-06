import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCommonDashBoard extends StatelessWidget {
  const QrCommonDashBoard(
      {super.key,
      required this.data,
      required this.backgroundColor,
      required this.version});

  final String data;
  final Color backgroundColor;
  final int version;
  @override
  Widget build(BuildContext context) {
    return QrImage(
      version: version,
      gapless: true,
      data: data,
      padding: EdgeInsets.all(8.0),
      size: 150,
      backgroundColor: backgroundColor,
    );
  }
}
