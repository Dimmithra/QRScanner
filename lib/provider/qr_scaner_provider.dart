import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/files.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscaner/utils/colors.dart';
import 'package:qrscaner/utils/common_message.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:share/share.dart';
import 'package:http/http.dart';
// import 'package:flutter_camera_practice/camera_page.dart';

class QrScannerProvider extends ChangeNotifier {
  TextEditingController produtDiscription = TextEditingController();
  TextEditingController get getprodutDiscription => produtDiscription;

  TextEditingController productSubNameController = TextEditingController();
  TextEditingController get getproductSubNameController =>
      productSubNameController;

  TextEditingController numberOfItemController = TextEditingController();
  TextEditingController get getnumberOfItemController => numberOfItemController;

  TextEditingController amountController = TextEditingController();
  TextEditingController get getamountController => amountController;

  Future<void> qrSocailMediaShareValidation(context) async {
    try {
      if (productSubNameController.text.isEmpty) {
        errorMessage(context, errorTxt: 'Product Name Cannot Blank').show();
      } else if (produtDiscription.text.isEmpty) {
        errorMessage(context, errorTxt: 'Product Discription Cannot blank')
            .show();
      } else if (numberOfItemController.text.isEmpty) {
        errorMessage(context, errorTxt: 'Item Count Cannot Blank').show();
      } else if (amountController.text.isEmpty) {
        errorMessage(context, errorTxt: 'Amount Cannot Blank').show();
      } else {
        print('Validation Success');
        await convertQrCodeImage();
      }
    } catch (e) {
      print(e);
    }
  }

  final GlobalKey globalKey = GlobalKey();
  Future<void> convertQrCodeImage() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = File("$directory/qrCode.png");
    await imgFile.writeAsBytes(pngBytes);
    await Share.shareFiles([imgFile.path], text: 'Your text share');
  }

  Future<void> qrGallerySaveValidation(context) async {
    try {
      if (productSubNameController.text.isEmpty) {
        errorMessage(context, errorTxt: 'Product Name Cannot Blank').show();
      } else if (produtDiscription.text.isEmpty) {
        errorMessage(context, errorTxt: 'Product Discription Cannot blank')
            .show();
      } else if (numberOfItemController.text.isEmpty) {
        errorMessage(context, errorTxt: 'Item Count Cannot Blank').show();
      } else if (amountController.text.isEmpty) {
        errorMessage(context, errorTxt: 'Amount Cannot Blank').show();
      } else {
        print('Validation Success');
        await qrSaveGallery(context);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> qrSaveGallery(context) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = File("$directory/qrCode.png");
    await imgFile.writeAsBytes(pngBytes);
    await GallerySaver.saveImage(imgFile.path, albumName: 'My Qr Generator');
    errorMessage(context,
        errorTxt: 'QR Save Success \n  ',
        btnType: 3,
        buttons: [
          DialogButton(
            child: Text(
              'Okay',
              style: TextStyle(
                color: kScafolderColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )
        ]).show();
  }
}
