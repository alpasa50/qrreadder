import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qrreaderapp/providers/scan_list_provider.dart';


class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async{
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('3D8BEF', 'Cancelar', false, ScanMode.QR);
        final barcodeScanRes = 'https://google.com';
        
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false); 
        
        scanListProvider.newScan(barcodeScanRes);
        scanListProvider.newScan('geo:15.44,45.43');
      },
    );
  }
}