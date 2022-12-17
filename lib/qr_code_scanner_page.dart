import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({super.key});

  @override
  State<QRCodeScannerPage> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),
      body: QRView(
        key: qrKey,
        onQRViewCreated: (controller) {
          this.controller = controller;
          controller.scannedDataStream.listen((scanData) {
            if (result?.code == scanData.code) {
              setState(() {
                result = scanData;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Text('${result?.code} を検出しました'),
                      const Spacer(),
                      TextButton(
                        onPressed: () =>
                            ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                        child: const Text('close'),
                      )
                    ],
                  ),
                ),
              );
            }
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
