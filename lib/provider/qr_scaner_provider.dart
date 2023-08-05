import 'package:flutter/cupertino.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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
}
