import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:qrscaner/utils/main_body.dart';

class QrScannerResult extends StatefulWidget {
  const QrScannerResult({
    super.key,
    required this.qrResult,
  });

  final String qrResult;
  @override
  State<QrScannerResult> createState() => _QrScannerResultState();
}

class _QrScannerResultState extends State<QrScannerResult> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
        appbarTitleName: 'Result',
        content: SingleChildScrollView(
          child: Card(child: Text(widget.qrResult)),
        ));
  }
}
