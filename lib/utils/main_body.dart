import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    super.key,
    required this.appbarTitleName,
    required this.content,
  });
  final String appbarTitleName;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appbarTitleName,
        ),
      ),
      body: content,
    );
  }
}
