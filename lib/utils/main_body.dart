import 'package:botton_nav_bar/botton_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainBody extends StatefulWidget {
  const MainBody({
    Key? key,
    required this.appbarTitleName,
    required this.content,
    this.drawer,
    this.floatingActionButton,
    this.bottomNavigationBar,
  }) : super(key: key);

  final String appbarTitleName;
  final Widget content;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.appbarTitleName,
        ),
      ),
      body: widget.content,
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
