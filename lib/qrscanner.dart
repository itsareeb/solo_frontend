import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:trial_project_1/bookingChoice.dart';
// import 'package:trial_project_1/sride.dart';
import 'app-colors.dart' as app_color;
import 'unlock.dart';

class QRscanner extends StatefulWidget {
  const QRscanner({super.key});

  @override
  State<QRscanner> createState() => _QRscannerState();
}

class _QRscannerState extends State<QRscanner> {
  final qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    // if (barcode != null) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => test()));
    //   barcode = null;
    // }
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Color.fromARGB(245, 109, 229, 250),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // alignment: Alignment.,
        children: <Widget>[
          buildQRview(context),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      await controller?.toggleFlash();
                    },
                    icon: Icon(
                      Icons.flash_on,
                      size: 50,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                  onPressed: () async {
                    await controller?.flipCamera();
                  },
                  icon: Icon(
                    Icons.flip_camera_android,
                    size: 50,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
          // Text(barcode != null ? 'Scan complete' : 'Scanning')
        ],
      ),
    ));
  }

  Widget buildQRview(BuildContext context) {
    return QRView(
      key: qrkey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.7,
          borderWidth: 10,
          borderLength: 40,
          borderColor: app_color.white,
          borderRadius: 10),
    );
    // return Container();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      setState(
        () {
          this.barcode = barcode;
          controller.pauseCamera();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Unlock()));
          controller.resumeCamera();
          this.barcode = null;
        },
      );
    });
  }
}
