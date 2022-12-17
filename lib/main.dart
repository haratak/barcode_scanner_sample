import 'package:barcode_scanner_sample/mobile_scanner_page.dart';
import 'package:flutter/material.dart';

import 'qr_code_scanner_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARCODE SCANNER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BARCODE SCANNER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text('qr_code_scanner'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRCodeScannerPage(),
                ),
              ),
            ),
            TextButton(
              child: const Text('mobile_scanner'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MobileScannerPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
