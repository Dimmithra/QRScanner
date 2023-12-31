import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscaner/provider/qr_scaner_provider.dart';
import 'package:qrscaner/utils/colors.dart';
import 'package:qrscaner/utils/common_loader.dart';
import 'package:qrscaner/utils/main_body.dart';
import 'package:qrscaner/widgets/common_button.dart';
import 'package:qrscaner/widgets/common_input.dart';
import 'package:qrscaner/widgets/qr_code_common_card.dart';

class QRGeneratotScreen extends StatefulWidget {
  const QRGeneratotScreen({super.key});

  @override
  State<QRGeneratotScreen> createState() => _QRGeneratotScreenState();
}

class _QRGeneratotScreenState extends State<QRGeneratotScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QrScannerProvider>(context, listen: false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainBody(
        appbarTitleName: 'New QR Code Generator',
        content: SingleChildScrollView(
          child: Consumer<QrScannerProvider>(
            builder: (context, qrScannerProvider, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RepaintBoundary(
                          key: qrScannerProvider.globalKey,
                          child: QrCommonDashBoard(
                            version: QrVersions.auto,
                            data: 'Product Disctrption: ' +
                                qrScannerProvider.produtDiscription.text +
                                'Product Sub Name: ' +
                                qrScannerProvider
                                    .productSubNameController.text +
                                'Number of Items: ' +
                                qrScannerProvider.numberOfItemController.text +
                                'Amount: ' +
                                qrScannerProvider.amountController.text,
                            backgroundColor: kScafolderColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                qrScannerProvider
                                    .qrSocailMediaShareValidation(context);
                              });
                            },
                            icon: Icon(
                              Icons.share_outlined,
                              color: kErrorCollor,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonInput(
                        hintText: 'Product Name',
                        lableText: 'Product Name',
                        controllerl:
                            qrScannerProvider.getproductSubNameController,
                        onchanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonInput(
                        hintText: 'Product Discription',
                        lableText: 'Product Discription',
                        controllerl: qrScannerProvider.getprodutDiscription,
                        onchanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonInput(
                        hintText: 'Number Of Items',
                        lableText: 'Number Of Items',
                        controllerl:
                            qrScannerProvider.getnumberOfItemController,
                        onchanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonInput(
                        hintText: 'Rs.',
                        lableText: 'Amount',
                        controllerl: qrScannerProvider.getamountController,
                        onchanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CommonButton(
                          onPress: () {
                            setState(() {
                              qrScannerProvider
                                  .qrGallerySaveValidation(context);
                            });
                          },
                          btnCaption: 'Save',
                          color: kGreenColor),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
