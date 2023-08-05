import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCommonDashBoard extends StatelessWidget {
  const QrCommonDashBoard({super.key, required this.data});

  final String data;
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: data,
      padding: EdgeInsets.all(8.0),
      size: 150,
      backgroundColor: Colors.red,
    );
  }
}
