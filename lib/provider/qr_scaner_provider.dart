import 'package:flutter/cupertino.dart';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_camera_practice/camera_page.dart';

class QrScannerProvider extends ChangeNotifier {
  Future initCamera(CameraDescription cameraDescription) async {
    late CameraController _cameraController;
    bool isRearCameraSelected = true;

    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        //   if (!mounted) return;
        //   setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }
//   CameraController? _cameraController;
//   final List<CameraDescription>? cameras;
//   Future initCamera(CameraDescription cameraDescription) async {
//     final List<CameraDescription>? cameras;
// // create a CameraController
//     _cameraController =
//         CameraController(cameraDescription, ResolutionPreset.high);
// // Next, initialize the controller. This returns a Future.
//     try {
//       await _cameraController!.initialize().then((_) {
//         // if (!mounted) return;
//         // setState(() {});
//       });
//     } on CameraException catch (e) {
//       debugPrint("camera error $e");
//     }
//   }
}
